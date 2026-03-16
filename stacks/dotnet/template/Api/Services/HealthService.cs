using Api.Models;

namespace Api.Services;

public class HealthService
{
    public HealthResponse GetStatus()
    {
        return new HealthResponse();
    }
}
