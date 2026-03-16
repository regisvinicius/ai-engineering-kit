#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

AI_KIT_PROGRAM_NAME="create-ai-container-project" \
AI_KIT_DEVCONTAINER_MODE=include \
bash "$SCRIPT_DIR/create-ai-project-from-template.sh" "$@"
