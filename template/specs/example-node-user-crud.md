# Example Node User CRUD

## Goal

Add a basic User CRUD to a Node + Fastify + TypeScript service.

## Context

The project currently exposes only a health endpoint. We want a small but realistic feature that demonstrates how to open a user story, structure the work, and implement a minimal API feature in the Node stack.

This example uses in-memory storage to keep the first iteration simple.

## Requirements

- Add a `User` model with:
  - `id`
  - `name`
  - `email`
- Implement the following endpoints:
  - `POST /users`
  - `GET /users`
  - `GET /users/:id`
  - `PUT /users/:id`
  - `DELETE /users/:id`
- Validate required fields for create and update
- Return `404` when a user does not exist
- Keep route handlers thin and move business logic into `src/services`

## Suggested File Changes

- `src/routes/users.ts`
- `src/services/user-service.ts`
- `src/app.ts`
- optionally `src/models/user.ts` if the project introduces models later

## Acceptance Criteria

- `POST /users` creates a user and returns the created record
- `GET /users` returns all users
- `GET /users/:id` returns a single user or `404`
- `PUT /users/:id` updates an existing user or returns `404`
- `DELETE /users/:id` removes an existing user and returns a successful response
- The project still starts with `npm run dev`
- The implementation follows the modular Fastify structure

## Notes

- Start with in-memory storage before introducing a database
- If a database or ORM is later added, run `bash scripts/sync-project-context.sh` to refresh the generated project context
