# Task

title: Improve brief-driven requirement coverage in generated projects

## Goal

Strengthen prompts and workflows so generated projects better handle complex tasks and requirement-heavy user stories.

## Context

Users can create new repositories successfully, but complex task execution may still miss some requirements or behaviors from the source brief. The scaffold should push agents toward extracting requirements first, distinguishing required versus optional items, mapping validation, and finishing with a compliance review against the brief.

## Requirements

- add a brief-driven implementation prompt
- add requirement extraction and compliance workflows
- fix the testing workflow
- improve the execution flow for requirement-heavy tasks
- improve templates or examples used for tasks/specs

## Acceptance Criteria

- generated projects guide agents through requirement extraction before implementation
- generated projects support required versus optional classification
- generated projects encourage explicit validation coverage for each required item
- final reporting includes compliance against the source brief
