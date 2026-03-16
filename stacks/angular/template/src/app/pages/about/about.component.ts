import { Component, inject } from "@angular/core";
import { HealthService } from "../../services/health.service";

@Component({
  selector: "app-about",
  standalone: true,
  imports: [],
  template: `
    <h1>About</h1>
    <p>Example route with HttpClient and Signals.</p>
    <button (click)="health.load()">Load demo data</button>
    @if (health.loaded(); as post) {
      <p>Loaded: {{ post.title }}</p>
    }
  `
})
export class AboutComponent {
  health = inject(HealthService);
}
