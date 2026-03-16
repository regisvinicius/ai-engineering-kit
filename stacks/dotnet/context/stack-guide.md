# Stack Guide

## Purpose

This stack is a minimal ASP.NET Core Web API project.

## Structure

- `Api/Program.cs` configures services and the HTTP pipeline
- `Api/Controllers/` contains HTTP controllers
- `Api/Services/` contains application or domain services
- `Api/Models/` contains DTOs and response models
- `appsettings.json` stores environment-independent configuration

## Working Style

- Keep controllers focused on HTTP concerns
- Move business logic into services
- Use models to keep request and response shapes explicit
- Keep `Program.cs` readable and minimal as the app evolves

## Commands

- `dotnet run --project Api.csproj` to run the API
- `dotnet build Api.csproj` to build the project
