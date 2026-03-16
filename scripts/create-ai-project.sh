#!/bin/bash

STACK=$1
PROJECT_NAME=$2

TEMPLATE_REPO="https://github.com/regisvinicius/ai-engineering-kit"
BASE_DIR="$HOME/development"

if [ -z "$STACK" ] || [ -z "$PROJECT_NAME" ]; then
  echo "Usage: create-ai-project <stack> <project-name>"
  exit 1
fi

mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit

git clone "$TEMPLATE_REPO" temp-template

mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

# base framework
cp ../temp-template/AGENTS.md .
cp ../temp-template/PLAYBOOK.md .
cp -r ../temp-template/base/. .

# stack template
cp -r ../temp-template/stacks/$STACK/template/. .

# stack setup
if [ -f "../temp-template/stacks/$STACK/setup.sh" ]; then
  bash ../temp-template/stacks/$STACK/setup.sh
fi

rm -rf ../temp-template

git init

echo "Project $PROJECT_NAME created using stack $STACK 🚀"