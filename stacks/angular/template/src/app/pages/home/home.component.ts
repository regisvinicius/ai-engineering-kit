import { Component, signal } from "@angular/core";
import { FormBuilder, ReactiveFormsModule, Validators } from "@angular/forms";

@Component({
  selector: "app-home",
  standalone: true,
  imports: [ReactiveFormsModule],
  template: `
    <h1>Angular App Ready</h1>
    <p>Angular 19 with Router, Reactive Forms, HttpClient, Signals.</p>

    <section class="form-demo">
      <h2>Signals + Reactive Form</h2>
      <form [formGroup]="form" (ngSubmit)="onSubmit()">
        <div>
          <label for="name">Name</label>
          <input id="name" formControlName="name" type="text" />
        </div>
        <button type="submit" [disabled]="form.invalid">Submit</button>
      </form>
      <p>Submissions: {{ submissionCount() }}</p>
    </section>
  `,
  styles: `
    .form-demo {
      margin-top: 1.5rem;
      padding: 1rem;
      border: 1px solid #e2e8f0;
      border-radius: 0.5rem;
    }
    .form-demo label {
      display: block;
      margin-bottom: 0.25rem;
      font-weight: 500;
    }
    .form-demo input {
      padding: 0.5rem;
      border: 1px solid #cbd5e1;
      border-radius: 0.25rem;
      margin-bottom: 0.75rem;
    }
    .form-demo button {
      padding: 0.5rem 1rem;
      background: #3b82f6;
      color: white;
      border: none;
      border-radius: 0.25rem;
      cursor: pointer;
    }
    .form-demo button:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
  `
})
export class HomeComponent {
  submissionCount = signal(0);
  form = this.fb.group({
    name: ["", Validators.required]
  });

  constructor(private fb: FormBuilder) {}

  onSubmit() {
    if (this.form.valid) {
      this.submissionCount.update((n) => n + 1);
    }
  }
}
