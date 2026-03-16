import type { FastifyInstance } from "fastify";

export const registerPlugins = (app: FastifyInstance) => {
  app.addHook("onReady", async () => {
    app.log.info("Fastify application ready");
  });
};
