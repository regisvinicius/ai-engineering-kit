# Dotnet Architecture

Stack

- ASP.NET Core Web API
- .NET 10
- EF Core (SQLite by default; swap to MySQL/Postgres for production)
- Swagger / OpenAPI
- FluentValidation
- Health Checks (built-in + EF DbContext)

Structure

- Api/Program.cs
- Api/Controllers/HealthController.cs, UsersController.cs
- Api/Services/HealthService.cs
- Api/Models/HealthResponse.cs, CreateUserRequest.cs
- Api/Data/AppDbContext.cs
- Api/Data/Entities/User.cs
- Api/Validators/CreateUserRequestValidator.cs
- appsettings.json
- Api.csproj

API

- GET /health – health check
- GET /status – app status
- GET /users – list users
- GET /users/{id} – get user
- POST /users – create user (validated via FluentValidation)
