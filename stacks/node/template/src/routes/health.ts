import type { FastifyPluginAsync } from "fastify";
import { getHealthStatus } from "../services/health-service";

export const healthRoutes: FastifyPluginAsync = async (app) => {
  app.get("/health", async () => {
    return getHealthStatus();
  });
};
