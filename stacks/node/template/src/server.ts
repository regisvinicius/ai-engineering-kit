import { env } from "../config/env";
import { buildApp } from "./app";

const server = buildApp();

const start = async () => {
  try {
    await server.listen({ port: env.port, host: env.host });
    server.log.info(`Server running on port ${env.port}`);
  } catch (error) {
    server.log.error(error);
    process.exit(1);
  }
};

void start();
