import { FastifyInstance } from "fastify";
import { registerUser } from "../controllers/userControllers/registerUserController";

export async function appRoutes(app:FastifyInstance){
    app.post('/users', registerUser)
}