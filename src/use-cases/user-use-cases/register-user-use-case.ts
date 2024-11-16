import { prisma } from "@/lib/prisma"
import { hash } from "bcryptjs"
import { error } from "console"

interface  registerUserCaseRequest{
    name: string,
    email: string,
    password: string
}

export async function registerUserUseCase({name,email,password}:registerUserCaseRequest) {
    const password_hash = await hash(password,6)
    const userWithSameEmail = await prisma.user.findUnique({
      where:{
        email
      }
    })
    
    if(userWithSameEmail){
      throw new Error("E-mail aready exists!")
    }

    await prisma.user.create({
        data: {
          name,
          email,
          password: password_hash,
        },
    })
}