# Engineering Playbook

This repository follows an AI-assisted development workflow designed for both human developers and coding agents.

The goal is to maintain a clear and consistent process for implementing features and improving the codebase.

---

# Project Structure

Key directories in this repository:

/tasks  
Contains tasks that define work to be implemented.

tasks/backlog  
Tasks that are ready to be worked on.

tasks/in-progress  
Tasks currently being implemented.

tasks/done  
Completed tasks.

/specs  
Feature specifications and design requirements.

/workflows  
Guidelines that define how development steps should be executed.

/src  
Application source code.

---

# Development Workflow

Work should follow this sequence:

1. init  
2. design  
3. plan  
4. implement  
5. test  
6. review  
7. polish

Each step has a corresponding workflow document in `/workflows`.

---

# Working with Tasks

Tasks represent units of work.

Typical lifecycle:

backlog → in-progress → done

When implementing a task:

1. read the task description
2. analyze the repository context
3. design a solution
4. create an implementation plan
5. implement the feature
6. validate with tests
7. review and polish the implementation

---

# Implementation Principles

Follow these principles during development:

- prefer simple and maintainable solutions
- reuse existing components when possible
- maintain consistency with project architecture
- avoid unnecessary complexity

---

# Code Quality

Before marking work as complete:

- ensure the implementation satisfies the task requirements
- verify integration with the existing system
- ensure the code is readable and maintainable

---

# Notes for AI Agents

Agents should:

- understand the repository before modifying code
- follow the workflows defined in `/workflows`
- implement tasks incrementally
- avoid large refactors unless required