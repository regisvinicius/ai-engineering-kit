import { defineConfig } from "drizzle-kit";
import { env } from "./config/env";

export default defineConfig({
  schema: "./src/db/schema.ts",
  out: "./drizzle",
  dialect: "mysql",
  dbCredentials: {
    url: env.databaseUrl
  }
});
