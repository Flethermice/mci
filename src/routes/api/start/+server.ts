import prisma from '$lib/prisma';
import { json } from '@sveltejs/kit';

export async function POST({ request, cookies }) {
    try {
        const requestBody = await request.json();
        const { name, age, gender } = requestBody;

        const session = await prisma.session.create({
            data: {
                name: name,
                age: age,
                gender: gender
            }
        });

        cookies.set('sessionId', session.id,
            {
                path: '/',
                maxAge: 60 * 60 * 24 * 365,
                httpOnly: false,
            });


        return json({ sessionId: session.id }, { status: 200 });
    } catch (error) {
        return json({}, { status: 500 });
    }
}