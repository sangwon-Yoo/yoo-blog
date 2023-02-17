const { PrismaClient } = require('@prisma/client');
//import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    const user = await prisma.contentCategory.create({
        data : {
            order : 1,
            name : '리엑트'
        },
    })
    console.log(user);
}

main()
    .then(async () => {
        await prisma.$disconnect()
    })
    .catch(async (e) => {
        console.error(e)
        await prisma.$disconnect()
        process.exit(1)
    });

