# Stack Guide

## Purpose

This stack is an Angular 19 application with Router, Reactive Forms, HttpClient, and Signals.

## Structure

- `src/main.ts` bootstraps the app with `appConfig`
- `src/app/app.config.ts` provides Router and HttpClient
- `src/app/app.routes.ts` defines routes (lazy-loaded components)
- `src/app/app.component.*` is the root shell with nav + router-outlet
- `src/app/pages/` contains page components (home, about)
- `src/app/services/` contains injectable services (HttpClient usage, signals)

## Working Style

- Use `inject()` for dependency injection in standalone components
- Prefer Signals for component state; use `computed()` for derived values
- Use Reactive Forms with `FormBuilder` and `Validators` at boundaries
- Add new routes in `app.routes.ts` with lazy `loadComponent`
- Keep route handlers thin; move HTTP and business logic to services
- Use `RouterLink` and `routerLinkActive` for navigation

## Commands

- `npm start` to run the Angular dev server
- `npm run build` to build the application
