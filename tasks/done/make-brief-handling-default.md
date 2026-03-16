# Task

title: Make brief-driven work the default behavior in generated projects

## Goal

Reduce the need for users to provide long meta-prompts when creating a new task, bug, or complex task.

## Context

The generated projects already include the right workflows and prompts, but the default guidance should be more explicit that a plain brief is enough. The scaffold should tell agents to automatically create tasks, specs, plans, and compliance checks when the user provides only the work context.

## Requirements

- update generated project guidance to make brief-driven behavior the default
- make the expectation visible in AGENTS, PLAYBOOK, and generated context
- reduce reliance on a long manual prompt

## Acceptance Criteria

- generated projects clearly instruct agents to handle new work from a plain brief
- users do not need to restate the full meta-workflow for stories, bugs, or complex tasks
