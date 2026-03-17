#!/usr/bin/env bash

set -euo pipefail

usage() {
  echo "Usage: ${AI_KIT_PROGRAM_NAME:-$(basename "$0")} <stack> <project-name>"
}

copy_stack_markdown_assets() {
  local stack_dir="$1"
  local target_dir="$2"

  if [ -f "$stack_dir/architecture.md" ]; then
    mkdir -p "$target_dir/docs"
    cp "$stack_dir/architecture.md" "$target_dir/docs/architecture.md"
  fi

  while IFS= read -r source_file; do
    local relative_path="${source_file#"$stack_dir"/}"
    local destination_file="$target_dir/docs/stack/$relative_path"

    case "$relative_path" in
      architecture.md|template/*|context/*)
        continue
        ;;
    esac

    mkdir -p "$(dirname "$destination_file")"
    cp "$source_file" "$destination_file"
  done < <(find "$stack_dir" -type f -name "*.md" | sort)
}

copy_stack_context_assets() {
  local stack_dir="$1"
  local target_dir="$2"

  if [ ! -d "$stack_dir/context" ]; then
    return
  fi

  mkdir -p "$target_dir/.ai-kit/context/stack"
  cp -R "$stack_dir/context"/. "$target_dir/.ai-kit/context/stack"
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_BASE_DIR="${AI_PROJECTS_BASE_DIR:-$HOME/development}"
DEVCONTAINER_MODE="${AI_KIT_DEVCONTAINER_MODE:-exclude}"

if [ "$#" -ne 2 ]; then
  usage
  exit 1
fi

if [ "$DEVCONTAINER_MODE" != "include" ] && [ "$DEVCONTAINER_MODE" != "exclude" ]; then
  echo "Invalid AI_KIT_DEVCONTAINER_MODE: $DEVCONTAINER_MODE"
  echo "Expected: include or exclude"
  exit 1
fi

STACK="$1"
PROJECT_NAME="$2"
STACK_DIR="$REPO_ROOT/stacks/$STACK"
TARGET_DIR="$TARGET_BASE_DIR/$PROJECT_NAME"

if [ ! -d "$STACK_DIR/template" ]; then
  echo "Unknown stack: $STACK"
  echo "Available stacks:"
  find "$REPO_ROOT/stacks" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort
  exit 1
fi

if [ -e "$TARGET_DIR" ]; then
  echo "Project directory already exists: $TARGET_DIR"
  exit 1
fi

mkdir -p "$TARGET_BASE_DIR"
mkdir -p "$TARGET_DIR"

cp "$REPO_ROOT/AGENTS.md" "$TARGET_DIR/AGENTS.md"
cp "$REPO_ROOT/PLAYBOOK.md" "$TARGET_DIR/PLAYBOOK.md"
cp -R "$REPO_ROOT/template"/. "$TARGET_DIR"

if [ "$DEVCONTAINER_MODE" = "exclude" ]; then
  rm -rf "$TARGET_DIR/.devcontainer"
fi

cp -R "$STACK_DIR/template"/. "$TARGET_DIR"
copy_stack_context_assets "$STACK_DIR" "$TARGET_DIR"
copy_stack_markdown_assets "$STACK_DIR" "$TARGET_DIR"

if [ -f "$STACK_DIR/setup.sh" ]; then
  (
    cd "$TARGET_DIR"
    bash "$STACK_DIR/setup.sh"
  )
fi

if [ -f "$TARGET_DIR/scripts/sync-project-context.sh" ]; then
  (
    cd "$TARGET_DIR"
    bash scripts/sync-project-context.sh
  )
fi

(
  cd "$TARGET_DIR"
  git init
)

echo "Project $PROJECT_NAME created using stack $STACK in $TARGET_DIR"
