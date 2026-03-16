import { provideHttpClient } from "@angular/common/http";
import { provideRouter } from "@angular/router";
import type { ApplicationConfig } from "@angular/core";
import { routes } from "./app.routes";

export const appConfig: ApplicationConfig = {
  providers: [provideRouter(routes), provideHttpClient()]
};
