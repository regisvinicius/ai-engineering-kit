import { HttpClient } from "@angular/common/http";
import { Injectable, inject, signal } from "@angular/core";

export type DemoPost = { id: number; title: string };

@Injectable({ providedIn: "root" })
export class HealthService {
  private http = inject(HttpClient);
  loaded = signal<DemoPost | null>(null);

  load() {
    this.http
      .get<DemoPost>("https://jsonplaceholder.typicode.com/posts/1")
      .subscribe((data) => this.loaded.set(data));
  }
}
