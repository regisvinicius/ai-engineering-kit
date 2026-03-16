using Api.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddScoped<HealthService>();

var app = builder.Build();

app.MapControllers();

app.Run();
