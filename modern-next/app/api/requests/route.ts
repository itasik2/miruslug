import { NextResponse } from 'next/server';

const API_URL = (process.env.MIRUSLUG_API_URL || 'http://127.0.0.1:4000').replace(/\/$/, '');

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const response = await fetch(`${API_URL}/v1/inbox/messages`, {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ ...body, channel: 'WEB' }),
      cache: 'no-store',
    });

    const payload = await response.json().catch(() => ({ message: 'API returned an invalid response' }));
    if (!response.ok) {
      return NextResponse.json(payload, { status: response.status });
    }

    return NextResponse.json(payload, { status: 201 });
  } catch (error) {
    console.error('Failed to forward MirUslug request', error);
    return NextResponse.json(
      { message: 'Сервис заявок временно недоступен' },
      { status: 502 },
    );
  }
}
