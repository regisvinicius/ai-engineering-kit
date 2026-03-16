import type { Db } from "../db";

declare module "fastify" {
  interface FastifyInstance {
    db: Db;
  }
}
