# Stack Guide

## Purpose

This stack is a modular Fastify backend built with TypeScript.

## Structure

- `src/server.ts` starts the HTTP server
- `src/app.ts` wires routes and shared plugins
- `src/routes/` contains HTTP route registration
- `src/services/` contains domain or application services
- `src/plugins/` contains Fastify plugins and hooks
- `config/` contains runtime configuration helpers

## Working Style

- Keep route handlers thin and move business logic into services
- Add new endpoints under `src/routes`
- Keep runtime configuration centralized in `config`
- Prefer small, composable modules over large service files

## Commands

- `npm run dev` for local development
- `npm run build` to compile TypeScript
- `npm run start` to run the compiled server
- `npm run lint` to validate TypeScript
