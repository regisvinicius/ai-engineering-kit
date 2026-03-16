using Api.Models;
using FluentValidation;

namespace Api.Validators;

public class CreateUserRequestValidator : AbstractValidator<CreateUserRequest>
{
    public CreateUserRequestValidator()
    {
        RuleFor(x => x.Email).NotEmpty().EmailAddress().MaximumLength(255);
        RuleFor(x => x.Name).MaximumLength(255).When(x => x.Name is not null);
    }
}
