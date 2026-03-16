# Task

title: Implement basic user CRUD for the Node API

## Goal

Add a simple User CRUD to the Fastify API as an example of how to execute a feature from task creation through implementation.

## Context

The starter Node project includes only `GET /health`. We want a practical example user story that shows how to structure a feature using routes plus services without introducing unnecessary complexity.

This is meant to be a reference task for future user stories.

## Requirements

- Add routes for create, list, get by id, update, and delete
- Use a service layer to keep route handlers focused on HTTP concerns
- Validate required fields for create and update
- Return `404` for unknown user ids
- Keep the first version in memory instead of adding a database

## Acceptance Criteria

- User CRUD endpoints are available under `/users`
- The service runs with `npm run dev`
- The route and service structure stays consistent with the Node stack guidance
- The feature can be used as a practical reference for future tasks
