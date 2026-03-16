import Fastify from "fastify";
import { registerPlugins } from "./plugins/register";
import { healthRoutes } from "./routes/health";

export const buildApp = () => {
  const app = Fastify({
    logger: true
  });

  registerPlugins(app);
  app.register(healthRoutes);

  return app;
};
