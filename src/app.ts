import fastify from "fastify";
import { appRoutes } from "./http/routes/web";

export const app = fastify()

app.register(appRoutes)