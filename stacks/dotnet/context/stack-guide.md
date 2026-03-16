# Stack Guide

## Purpose

This stack is an ASP.NET Core Web API with EF Core (SQLite), Swagger, FluentValidation, and built-in health checks.

## Structure

- `Api/Program.cs` configures services and the HTTP pipeline
- `Api/Controllers/` contains HTTP controllers
- `Api/Services/` contains application or domain services
- `Api/Models/` contains DTOs and response models
- `Api/Data/` contains DbContext and entity configuration
- `Api/Validators/` contains FluentValidation rules
- `appsettings.json` stores configuration (including `ConnectionStrings:DefaultConnection`)
- `appsettings.Example.json` documents connection string formats (SQLite + MySQL)

## Working Style

- Keep controllers thin; move business logic into services
- Validate request DTOs with FluentValidation at controller boundaries
- Use EF Core migrations for schema changes: `dotnet ef migrations add <Name>`
- Use `AddDbContextCheck` for readiness; keep `/health` for health probes
- Swagger runs in Development by default

## Commands

- `dotnet run` to run the API
- `dotnet build` to build
- `dotnet ef migrations add Initial` to create the first migration (after model changes)
- `dotnet ef database update` to apply migrations

## Endpoints

- `GET /health` – health check (EF Core DB check)
- `GET /status` – app status (custom)
- `GET /swagger` – Swagger UI (Development)
- `GET/POST /users` – CRUD example
