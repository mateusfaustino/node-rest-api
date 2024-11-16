import { prisma } from "@/lib/prisma"
import {FastifyRequest, FastifyReply} from 'fastify'
import {z} from 'zod'
import {hash} from 'bcryptjs';
import { registerUserUseCase } from "@/use-cases/user-use-cases/register-user-use-case";

export async function registerUser(request:FastifyRequest, reply:FastifyReply){
    const registerBodySchema = z.object({
        name:z.string(),
        email:z.string().email(),
        password:z.string().min(6),

    })

    const {name, email, password} = registerBodySchema.parse(request.body)
    
    try{
      registerUserUseCase({name, email, password})
    }catch(error){
      reply.status(409).send()
    }
      return reply.status(201).send()
}