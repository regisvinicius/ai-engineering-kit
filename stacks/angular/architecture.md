# Angular Architecture

Stack

- Angular 19
- TypeScript
- Router (lazy-loaded routes)
- Reactive Forms
- HttpClient
- Signals

Structure

- src/main.ts
- src/app/app.config.ts
- src/app/app.routes.ts
- src/app/app.component.ts
- src/app/pages/home/home.component.ts
- src/app/pages/about/about.component.ts
- src/app/services/health.service.ts

UI

- Home: form demo with Signals + ReactiveForms
- About: HttpClient demo (loads from public API)
- Nav with RouterLink, routerLinkActive
