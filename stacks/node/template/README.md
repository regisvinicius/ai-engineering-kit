# Node API Template

This template provides a modular Fastify + TypeScript backend that is ready to extend.

## Structure

- `src/server.ts` starts the HTTP server
- `src/app.ts` wires Fastify plugins and routes
- `src/routes/health.ts` exposes `GET /health`
- `src/services/health-service.ts` contains health response logic
- `src/plugins/register.ts` registers shared Fastify behavior
- `config/env.ts` centralizes runtime configuration

## Commands

- `npm run dev` starts the development server with `tsx`
- `npm run build` compiles TypeScript to `dist`
- `npm run start` runs the compiled server
- `npm run lint` validates the TypeScript codebase

The server listens on port `3000` by default.
