namespace Api.Models;

public class HealthResponse
{
    public string Status { get; init; } = "ok";

    public DateTimeOffset Timestamp { get; init; } = DateTimeOffset.UtcNow;
}
