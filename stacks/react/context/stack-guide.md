# Stack Guide

## Purpose

This stack is a React application built with Vite and TypeScript.

## Structure

- `src/main.tsx` boots the React application
- `src/App.tsx` composes the top-level UI
- `src/pages/` contains page-level components
- `src/components/` contains reusable UI building blocks
- `public/` contains static assets

## Working Style

- Keep page components focused on composition and flow
- Move reusable UI into `src/components`
- Keep app-level concerns near `src/App.tsx`
- Prefer clear component boundaries over deeply nested page files

## Commands

- `npm run dev` for local development
- `npm run build` to produce the production bundle
- `npm run preview` to preview the built application
