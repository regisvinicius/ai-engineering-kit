#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
STACK_CONTEXT_DIR="$PROJECT_ROOT/.ai-kit/context/stack"
STACK_ENV_FILE="$STACK_CONTEXT_DIR/stack.env"
STACK_GUIDE_SOURCE="$STACK_CONTEXT_DIR/stack-guide.md"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

append_unique() {
  local value="$1"

  if [ -z "$value" ]; then
    return
  fi

  for existing in "${DETECTED_FRAMEWORKS[@]:-}"; do
    if [ "$existing" = "$value" ]; then
      return
    fi
  done

  DETECTED_FRAMEWORKS+=("$value")
}

package_script_value() {
  local script_name="$1"

  if [ ! -f "$PROJECT_ROOT/package.json" ]; then
    return
  fi

  if command_exists python3; then
    python3 - "$PROJECT_ROOT/package.json" "$script_name" <<'PY'
import json
import sys

package_path, script_name = sys.argv[1], sys.argv[2]

with open(package_path, "r", encoding="utf-8") as handle:
    data = json.load(handle)

value = data.get("scripts", {}).get(script_name, "")
if value:
    print(value)
PY
    return
  fi

  if command_exists node; then
    node -e 'const fs = require("fs"); const path = process.argv[1]; const name = process.argv[2]; const data = JSON.parse(fs.readFileSync(path, "utf8")); const value = (data.scripts || {})[name]; if (value) console.log(value);' "$PROJECT_ROOT/package.json" "$script_name"
  fi
}

package_script_lines() {
  if [ ! -f "$PROJECT_ROOT/package.json" ]; then
    return
  fi

  if command_exists python3; then
    python3 - "$PROJECT_ROOT/package.json" <<'PY'
import json
import sys

with open(sys.argv[1], "r", encoding="utf-8") as handle:
    data = json.load(handle)

for name, command in sorted((data.get("scripts") or {}).items()):
    print(f"- `{name}`: `{command}`")
PY
    return
  fi

  if command_exists node; then
    node -e 'const fs = require("fs"); const data = JSON.parse(fs.readFileSync(process.argv[1], "utf8")); const scripts = data.scripts || {}; Object.keys(scripts).sort().forEach((name) => console.log(`- \`${name}\`: \`${scripts[name]}\``));' "$PROJECT_ROOT/package.json"
  fi
}

dependency_lines() {
  local scope="$1"

  if [ ! -f "$PROJECT_ROOT/package.json" ]; then
    return
  fi

  if command_exists python3; then
    python3 - "$PROJECT_ROOT/package.json" "$scope" <<'PY'
import json
import sys

package_path, scope = sys.argv[1], sys.argv[2]

with open(package_path, "r", encoding="utf-8") as handle:
    data = json.load(handle)

dependencies = data.get(scope, {}) or {}
for name in sorted(dependencies):
    print(f"- `{name}`: `{dependencies[name]}`")
PY
    return
  fi

  if command_exists node; then
    node -e 'const fs = require("fs"); const data = JSON.parse(fs.readFileSync(process.argv[1], "utf8")); const scope = process.argv[2]; const deps = data[scope] || {}; Object.keys(deps).sort().forEach((name) => console.log(`- \`${name}\`: \`${deps[name]}\``));' "$PROJECT_ROOT/package.json" "$scope"
  fi
}

package_has_dependency() {
  local dependency_name="$1"

  if [ ! -f "$PROJECT_ROOT/package.json" ]; then
    return 1
  fi

  if command_exists python3; then
    python3 - "$PROJECT_ROOT/package.json" "$dependency_name" <<'PY'
import json
import sys

package_path, dependency_name = sys.argv[1], sys.argv[2]

with open(package_path, "r", encoding="utf-8") as handle:
    data = json.load(handle)

all_dependencies = {}
for group in ("dependencies", "devDependencies", "peerDependencies", "optionalDependencies"):
    all_dependencies.update(data.get(group, {}) or {})

raise SystemExit(0 if dependency_name in all_dependencies else 1)
PY
    return
  fi

  if command_exists node; then
    node -e 'const fs = require("fs"); const data = JSON.parse(fs.readFileSync(process.argv[1], "utf8")); const dependency = process.argv[2]; const groups = ["dependencies", "devDependencies", "peerDependencies", "optionalDependencies"]; const found = groups.some((group) => data[group] && Object.prototype.hasOwnProperty.call(data[group], dependency)); process.exit(found ? 0 : 1);' "$PROJECT_ROOT/package.json" "$dependency_name"
    return
  fi

  grep -q "\"$dependency_name\"" "$PROJECT_ROOT/package.json"
}

package_reference_lines() {
  local csproj_file="$1"

  if [ ! -f "$csproj_file" ]; then
    return
  fi

  local references
  references="$(grep -o 'PackageReference Include="[^"]*" Version="[^"]*"' "$csproj_file" || true)"

  if [ -z "$references" ]; then
    return
  fi

  while IFS= read -r line; do
    local include
    local version

    include="$(printf '%s' "$line" | sed -E 's/.*Include="([^"]*)".*/\1/')"
    version="$(printf '%s' "$line" | sed -E 's/.*Version="([^"]*)".*/\1/')"
    printf -- '- `%s`: `%s`\n' "$include" "$version"
  done <<< "$references"
}

detect_additional_frameworks() {
  if [ -f "$PROJECT_ROOT/vite.config.ts" ] || package_has_dependency "vite"; then
    append_unique "Vite"
  fi

  if package_has_dependency "react" || [ -f "$PROJECT_ROOT/src/App.tsx" ]; then
    append_unique "React"
  fi

  if package_has_dependency "@angular/core" || [ -f "$PROJECT_ROOT/angular.json" ]; then
    append_unique "Angular"
  fi

  if package_has_dependency "fastify"; then
    append_unique "Fastify"
  fi

  if [ -f "$PROJECT_ROOT/tsconfig.json" ] || package_has_dependency "typescript"; then
    append_unique "TypeScript"
  fi

  if [ -f "$PROJECT_ROOT/Dockerfile" ]; then
    append_unique "Docker"
  fi

  if [ -f "$PROJECT_ROOT/docker-compose.yml" ] || [ -f "$PROJECT_ROOT/docker-compose.yaml" ] || [ -f "$PROJECT_ROOT/compose.yml" ] || [ -f "$PROJECT_ROOT/compose.yaml" ]; then
    append_unique "Docker Compose"
  fi

  if [ -f "$PROJECT_ROOT/prisma/schema.prisma" ] || package_has_dependency "prisma"; then
    append_unique "Prisma"
  fi

  if [ -f "$PROJECT_ROOT/drizzle.config.ts" ] || [ -f "$PROJECT_ROOT/drizzle.config.js" ] || package_has_dependency "drizzle-orm"; then
    append_unique "Drizzle"
  fi

  if package_has_dependency "zod"; then
    append_unique "Zod"
  fi

  if [ -f "$PROJECT_ROOT/tailwind.config.js" ] || [ -f "$PROJECT_ROOT/tailwind.config.cjs" ] || [ -f "$PROJECT_ROOT/tailwind.config.ts" ] || package_has_dependency "tailwindcss"; then
    append_unique "Tailwind CSS"
  fi

  if [ -f "$PROJECT_ROOT/eslint.config.js" ] || [ -f "$PROJECT_ROOT/eslint.config.mjs" ] || [ -f "$PROJECT_ROOT/.eslintrc" ] || [ -f "$PROJECT_ROOT/.eslintrc.json" ] || package_has_dependency "eslint"; then
    append_unique "ESLint"
  fi

  if package_has_dependency "vitest"; then
    append_unique "Vitest"
  fi

  if package_has_dependency "jest"; then
    append_unique "Jest"
  fi
}

render_list_from_array() {
  local items=("$@")

  if [ "${#items[@]}" -eq 0 ]; then
    printf -- '- None detected.\n'
    return
  fi

  for item in "${items[@]}"; do
    printf -- '- `%s`\n' "$item"
  done
}

render_pipe_list() {
  local raw_items="${1:-}"
  local fallback="${2:-"- None provided."}"
  local IFS='|'
  local items=()

  if [ -n "$raw_items" ]; then
    read -r -a items <<< "$raw_items"
  fi

  if [ "${#items[@]}" -eq 0 ]; then
    printf -- '%s\n' "$fallback"
    return
  fi

  for item in "${items[@]}"; do
    if [ -n "$item" ]; then
      printf -- '- %s\n' "$item"
    fi
  done
}

render_quick_start_steps() {
  local primary_run_command="${DEFAULT_DEV_COMMAND:-}"

  if [ -z "$primary_run_command" ]; then
    primary_run_command="${DEFAULT_START_COMMAND:-}"
  fi

  if [ -n "${DEFAULT_SETUP_COMMAND:-}" ]; then
    printf '1. Install dependencies if needed: `%s`\n' "$DEFAULT_SETUP_COMMAND"
  else
    printf '1. Install the required dependencies for this stack if they are not available yet.\n'
  fi

  if [ -n "$primary_run_command" ]; then
    printf '2. Start the project with `%s`.\n' "$primary_run_command"
  else
    printf '2. Use the stack-specific run command from the Commands section below.\n'
  fi

  printf '3. Review `docs/project-context.md` and `prompts/current-project.md` before implementing changes.\n'
  printf '4. Re-run `bash scripts/sync-project-context.sh` after changing dependencies, frameworks, or top-level structure.\n'
}

render_environment_notes() {
  if [ -d "$PROJECT_ROOT/.devcontainer" ]; then
    printf -- '- This project includes `.devcontainer/` and can be opened inside the shared development container.\n'
    printf -- '- The devcontainer post-create step installs supported dependencies and refreshes the generated context files.\n'
    printf -- '- After the container is ready, run the main application command from the Commands section.\n'
    return
  fi

  printf -- '- This project was generated without `.devcontainer`, so commands run directly on your local environment.\n'
  printf -- '- If you later add or restore `.devcontainer`, re-run `bash scripts/sync-project-context.sh` to refresh the project context.\n'
}

render_task_workflow_lines() {
  printf -- '- Create new work in `tasks/backlog` using `tasks/TASK_TEMPLATE.md`.\n'
  printf -- '- Move a task to `tasks/in-progress` when implementation starts.\n'
  printf -- '- Move the task to `tasks/done` after validation and review are complete.\n'

  if [ -f "$PROJECT_ROOT/tasks/backlog/example-task.md" ]; then
    printf -- '- Use `tasks/backlog/example-task.md` as a reference for formatting and scope.\n'
  fi

  if [ -f "$PROJECT_ROOT/tasks/backlog/example-node-user-crud.md" ]; then
    printf -- '- Use `tasks/backlog/example-node-user-crud.md` with `specs/example-node-user-crud.md` as a practical feature example.\n'
  fi
}

render_ai_workflow_lines() {
  printf -- '- Read `AGENTS.md` and `PLAYBOOK.md` for the repository workflow and conventions.\n'
  printf -- '- Use `workflows/execute-work-item.md` as the practical checklist for new user stories, bugs, and enhancements.\n'
  printf -- '- Use `prompts/implement-from-brief.md` when the user provides a complex task brief or requirement-heavy story.\n'
  printf -- '- When the user provides only the work context, create the task, spec, plan, and validation flow automatically instead of waiting for a long meta-prompt.\n'
  printf -- '- Follow the workflow files in `workflows/`, including requirement extraction and compliance review when a source brief exists.\n'
  printf -- '- Use `prompts/current-project.md` as the current AI-facing summary of the project.\n'
  printf -- '- Use `prompts/refresh-context.md` when the repository has evolved and the generated guidance may be stale.\n'
  printf -- '- Treat `docs/project-context.md`, `docs/dependencies.md`, and `docs/stack-guide.md` as managed context files.\n'
}

render_key_paths() {
  local rendered=0
  local IFS='|'
  read -r -a key_paths <<< "${KEY_PATHS:-}"

  if [ "${#key_paths[@]}" -eq 0 ]; then
    printf -- '- Review the repository root to identify the main implementation files.\n'
    return
  fi

  for key_path in "${key_paths[@]}"; do
    if [ -e "$PROJECT_ROOT/$key_path" ]; then
      printf -- '- `%s`\n' "$key_path"
      rendered=1
    fi
  done

  if [ "$rendered" -eq 0 ]; then
    printf -- '- Review the repository root to identify the main implementation files.\n'
  fi
}

render_command_lines() {
  printf -- '- Sync context: `bash scripts/sync-project-context.sh`\n'

  if [ -n "${DEFAULT_DEV_COMMAND:-}" ]; then
    printf -- '- Dev: `%s`\n' "$DEFAULT_DEV_COMMAND"
  fi

  if [ -n "${DEFAULT_BUILD_COMMAND:-}" ]; then
    printf -- '- Build: `%s`\n' "$DEFAULT_BUILD_COMMAND"
  fi

  if [ -n "${DEFAULT_START_COMMAND:-}" ]; then
    printf -- '- Start/Run: `%s`\n' "$DEFAULT_START_COMMAND"
  fi

  if [ -n "${DEFAULT_PREVIEW_COMMAND:-}" ]; then
    printf -- '- Preview: `%s`\n' "$DEFAULT_PREVIEW_COMMAND"
  fi

  if [ -n "${DEFAULT_LINT_COMMAND:-}" ]; then
    printf -- '- Lint: `%s`\n' "$DEFAULT_LINT_COMMAND"
  fi

  if [ -n "${DEFAULT_TEST_COMMAND:-}" ]; then
    printf -- '- Test: `%s`\n' "$DEFAULT_TEST_COMMAND"
  fi
}

if [ ! -f "$STACK_ENV_FILE" ]; then
  echo "Missing stack context file: $STACK_ENV_FILE" >&2
  exit 1
fi

# shellcheck disable=SC1090
source "$STACK_ENV_FILE"

mkdir -p "$PROJECT_ROOT/docs" "$PROJECT_ROOT/prompts"

DETECTED_FRAMEWORKS=()
IFS='|' read -r -a core_frameworks <<< "${CORE_FRAMEWORKS:-}"
for framework in "${core_frameworks[@]}"; do
  append_unique "$framework"
done

detect_additional_frameworks

PACKAGE_SCRIPTS="$(package_script_lines || true)"
RUNTIME_DEPENDENCIES="$(dependency_lines dependencies || true)"
DEV_DEPENDENCIES="$(dependency_lines devDependencies || true)"
PACKAGE_REFERENCES=""

if [ -n "${CSPROJ_PATH:-}" ] && [ -f "$PROJECT_ROOT/$CSPROJ_PATH" ]; then
  PACKAGE_REFERENCES="$(package_reference_lines "$PROJECT_ROOT/$CSPROJ_PATH" || true)"
fi

if [ -f "$STACK_GUIDE_SOURCE" ]; then
  cp "$STACK_GUIDE_SOURCE" "$PROJECT_ROOT/docs/stack-guide.md"
fi

cat > "$PROJECT_ROOT/docs/project-context.md" <<EOF
# Project Context

_Generated by \`scripts/sync-project-context.sh\`. Re-run this command after adding frameworks, dependencies, or major structural changes._

## Snapshot

- Stack: \`${STACK_NAME}\`
- Application type: ${APPLICATION_TYPE}
- Primary language: \`${PRIMARY_LANGUAGE}\`

## Recommended Commands

$(render_command_lines)

## Key Paths

$(render_key_paths)

## Stack-Specific Guidance

$(render_pipe_list "${STACK_GUIDANCE:-}" "- Review \`docs/stack-guide.md\` for stack-specific implementation guidance.")

## Detected Frameworks And Tools

$(render_list_from_array "${DETECTED_FRAMEWORKS[@]}")

## Keep Context Fresh

- Re-run \`bash scripts/sync-project-context.sh\` after adding frameworks, SDK packages, or infrastructure tools.
- Re-run the sync after changing top-level folders, runtime commands, or deployment assets such as Docker files.
- Treat this file, \`docs/dependencies.md\`, and \`prompts/current-project.md\` as generated snapshots of the current codebase.

## Package Scripts

${PACKAGE_SCRIPTS:-"- No package scripts detected."}
EOF

cat > "$PROJECT_ROOT/docs/dependencies.md" <<EOF
# Dependencies

_Generated by \`scripts/sync-project-context.sh\` from the current project files._

## Runtime Dependencies

${RUNTIME_DEPENDENCIES:-"- No runtime package dependencies detected."}

## Development Dependencies

${DEV_DEPENDENCIES:-"- No development package dependencies detected."}

## .NET Package References

${PACKAGE_REFERENCES:-"- No explicit .NET package references detected."}
EOF

cat > "$PROJECT_ROOT/prompts/current-project.md" <<EOF
# Current Project Prompt

Use this file before planning or implementing changes in this project.

## Project Snapshot

- Stack: \`${STACK_NAME}\`
- Application type: ${APPLICATION_TYPE}
- Primary language: \`${PRIMARY_LANGUAGE}\`

## Working Guidance

- Read \`README.md\` for the current project overview and workflow summary.
- If the user provides only a story, bug, feature request, or complex task brief, treat that as enough context to begin the workflow.
- Read \`docs/project-context.md\` for the current commands, key paths, and detected tooling.
- Read \`docs/dependencies.md\` before adding new packages or frameworks.
- Read \`docs/stack-guide.md\` for stack-specific architectural guidance when it exists.
- Re-run \`bash scripts/sync-project-context.sh\` after changing dependencies, frameworks, infrastructure, or major folder structure.
- If the generated docs disagree with the repository, refresh context before planning implementation work.
- Automatically create the task, spec, and plan when the user gives work context but those artifacts do not exist yet.

## Stack-Specific Guidance

$(render_pipe_list "${STACK_GUIDANCE:-}" "- Review \`docs/stack-guide.md\` before changing architecture or framework conventions.")

## Current Commands

$(render_command_lines)

## Current Frameworks And Tools

$(render_list_from_array "${DETECTED_FRAMEWORKS[@]}")
EOF

PROJECT_NAME="$(basename "$PROJECT_ROOT")"

cat > "$PROJECT_ROOT/README.md" <<EOF
# ${PROJECT_NAME}

${README_OVERVIEW:-"Generated from AI Engineering Kit."}

_This README is managed by \`scripts/sync-project-context.sh\`. Re-run that command after changing frameworks, dependencies, or major project structure._

## Quick Start

$(render_quick_start_steps)

## Development Environment

$(render_environment_notes)

## Stack Snapshot

- Stack: \`${STACK_NAME}\`
- Application type: ${APPLICATION_TYPE}
- Primary language: \`${PRIMARY_LANGUAGE}\`

## Runtime Notes

$(render_pipe_list "${README_RUNTIME_NOTES:-${STACK_GUIDANCE:-}}" "- Review \`docs/stack-guide.md\` for runtime and architecture notes.")

## Commands

$(render_command_lines)

## Current Tooling

$(render_list_from_array "${DETECTED_FRAMEWORKS[@]}")

## Project Structure

$(render_key_paths)

## AI Workflow

$(render_ai_workflow_lines)

## Task Workflow

$(render_task_workflow_lines)

## Helpful Files

- \`docs/project-context.md\` for the latest stack-aware project summary
- \`docs/dependencies.md\` for runtime and development dependency snapshots
- \`docs/stack-guide.md\` for stack-specific architecture guidance
- \`workflows/execute-work-item.md\` for the practical flow to execute a new story or bug
- \`workflows/extract-requirements.md\` for requirement extraction and classification
- \`workflows/compliance-check.md\` for final brief compliance review
- \`specs/example-node-user-crud.md\` for a concrete Node feature example
- \`tasks/backlog/example-node-user-crud.md\` for the matching example task
- \`prompts/implement-from-brief.md\` for complex or brief-driven execution
- \`prompts/current-project.md\` for AI-ready implementation context
- \`prompts/refresh-context.md\` for the context refresh workflow
EOF

echo "Project context refreshed."
