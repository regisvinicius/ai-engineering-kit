# Stack Guide

## Purpose

This stack is an Angular application with a lightweight starter structure.

## Structure

- `src/main.ts` bootstraps the Angular app
- `src/app/app.component.ts` defines the root component
- `src/app/app.component.html` contains the root template
- `src/styles.css` contains the global styles

## Working Style

- Add new UI features under `src/app` with clear component boundaries
- Keep reusable presentation logic in dedicated components
- Treat `angular.json` and TypeScript config files as part of the runtime contract
- Keep root component responsibilities small as the app grows

## Commands

- `npm start` to run the Angular dev server
- `npm run build` to build the application
