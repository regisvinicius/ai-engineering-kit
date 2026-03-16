# Stack Guide

## Purpose

This stack is a React 19 application with Vite, Tailwind, and TanStack (Router, Query).

## Structure

- `src/main.tsx` – boots React with QueryClientProvider and RouterProvider
- `src/router.tsx` – TanStack Router setup (manual route tree)
- `src/pages/` – route-level page components
- `src/components/` – reusable UI building blocks
- `src/lib/queryClient.ts` – TanStack Query client config
- `src/index.css` – Tailwind directives

## Routing (TanStack Router)

- Add routes in `src/router.tsx` with `createRoute({ getParentRoute, path, component })`
- Use `rootRoute.addChildren([...])` to nest routes
- Navigation: `<Link to="/path" activeProps={{ className: "..." }} />` for active styling

## Data

- TanStack Query: `useQuery`, `useMutation` for server state
- Prefer `queryClient` from `src/lib/queryClient` for programmatic invalidation
- Add `@tanstack/react-form` and `@radix-ui/*` when needed

## UI & Styling

- Tailwind for layout and styling
- Use `className` over inline styles

## Commands

- `npm run dev` – local development
- `npm run build` – production bundle
- `npm run preview` – preview build
