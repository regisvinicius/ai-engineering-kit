namespace Api.Data.Entities;

public class User
{
    public int Id { get; set; }
    public required string Email { get; set; }
    public string? Name { get; set; }
}
