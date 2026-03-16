using Api.Data;
using Api.Data.Entities;
using Api.Models;
using Api.Validators;
using FluentValidation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.Controllers;

[ApiController]
[Route("users")]
public class UsersController : ControllerBase
{
    private readonly AppDbContext _db;
    private readonly IValidator<CreateUserRequest> _validator;

    public UsersController(AppDbContext db, IValidator<CreateUserRequest> validator)
    {
        _db = db;
        _validator = validator;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<User>>> GetAll(CancellationToken ct)
    {
        return Ok(await _db.Users.ToListAsync(ct));
    }

    [HttpGet("{id:int}")]
    public async Task<ActionResult<User>> GetById(int id, CancellationToken ct)
    {
        var user = await _db.Users.FindAsync([id], ct);
        return user is null ? NotFound() : Ok(user);
    }

    [HttpPost]
    public async Task<ActionResult<User>> Create([FromBody] CreateUserRequest req, CancellationToken ct)
    {
        var result = await _validator.ValidateAsync(req, ct);
        if (!result.IsValid)
        {
            return BadRequest(result.Errors.Select(e => new { e.PropertyName, e.ErrorMessage }));
        }
        var user = new User { Email = req.Email, Name = req.Name };
        _db.Users.Add(user);
        await _db.SaveChangesAsync(ct);
        return CreatedAtAction(nameof(GetById), new { id = user.Id }, user);
    }
}
