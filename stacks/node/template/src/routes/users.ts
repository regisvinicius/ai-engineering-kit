import type { FastifyPluginAsync } from "fastify";
import { eq } from "drizzle-orm";
import { z } from "zod";
import { users } from "../db/schema";

const createUserSchema = z.object({
  email: z.string().email(),
  name: z.string().max(255).optional()
});

export const usersRoutes: FastifyPluginAsync = async (app) => {
  app.get("/", async () => {
    const rows = await app.db.select().from(users);
    return rows;
  });

  app.get<{ Params: { id: string } }>("/:id", async (req, reply) => {
    const id = Number.parseInt(req.params.id, 10);
    if (Number.isNaN(id)) {
      return reply.status(400).send({ error: "Invalid id" });
    }
    const [row] = await app.db.select().from(users).where(eq(users.id, id));
    if (!row) {
      return reply.status(404).send({ error: "Not found" });
    }
    return row;
  });

  app.post<{ Body: unknown }>("/", async (req, reply) => {
    const parsed = createUserSchema.safeParse(req.body);
    if (!parsed.success) {
      return reply.status(400).send({ error: parsed.error.flatten() });
    }
    await app.db.insert(users).values(parsed.data);
    const [created] = await app.db
      .select()
      .from(users)
      .where(eq(users.email, parsed.data.email));
    return reply.status(201).send(created);
  });
};
