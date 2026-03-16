import Fastify from "fastify";
import { env } from "../config/env";
import { createDb } from "./db";
import { registerPlugins } from "./plugins/register";
import { healthRoutes } from "./routes/health";
import { usersRoutes } from "./routes/users";

export const buildApp = () => {
  const app = Fastify({
    logger: true
  });

  registerPlugins(app);
  app.register(healthRoutes);

  if (env.databaseUrl) {
    app.decorate("db", createDb(env.databaseUrl));
    app.register(usersRoutes, { prefix: "/users" });
  }

  return app;
};
