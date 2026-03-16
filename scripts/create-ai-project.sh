#!/bin/bash

STACK=$1
PROJECT_NAME=$2

if [ -z "$STACK" ] || [ -z "$PROJECT_NAME" ]; then
  echo "Usage: create-ai-project <stack> <project-name>"
  exit 1
fi

git clone https://github.com/YOURUSER/ai-engineering-kit temp-template

mkdir $PROJECT_NAME
cd $PROJECT_NAME

cp -r ../temp-template/base/* .
cp -r ../temp-template/stacks/$STACK/* .

rm -rf ../temp-template

git init

echo "Project $PROJECT_NAME created with stack $STACK"