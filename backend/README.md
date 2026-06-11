# Site Expense Tracker — Backend API

Node.js + Express + Prisma + PostgreSQL backend for the Site Expense Tracker mobile app.

## Tech Stack
- Node.js + Express.js
- Prisma ORM + PostgreSQL (Neon)
- JWT Authentication
- Cloudinary (image/PDF storage)
- Multer (file uploads)
- Zod (validation)
- Deployable on Vercel

## Folder Structure
```
backend/
├── api/index.js          # Vercel serverless entrypoint
├── src/
│   ├── app.js             # Express app (middleware + routes)
│   ├── server.js          # Local dev server
│   ├── config/            # env, prisma client, cloudinary
│   ├── routes/             # Express routers
│   ├── controllers/        # Request/response handlers
│   ├── services/           # Business logic
│   ├── repositories/       # Prisma data access
│   ├── middleware/          # auth, error, upload, validate
│   ├── validators/          # Zod schemas
│   └── utils/                # ApiError, ApiResponse, jwt, password, etc.
├── prisma/schema.prisma
├── vercel.json
└── .env.example
```

## Local Setup

1. Install dependencies:
   ```bash
   npm install
   ```

2. Copy `.env.example` to `.env` and fill in:
   - `DATABASE_URL` — Neon (or any) PostgreSQL connection string
   - `JWT_SECRET` — long random string
   - Cloudinary credentials

3. Generate Prisma client and run migrations:
   ```bash
   npx prisma generate
   npx prisma migrate dev --name init
   ```

4. Start the dev server:
   ```bash
   npm run dev
   ```

   API available at `http://localhost:5000/api`.

## API Overview

| Method | Endpoint                       | Auth | Description                |
|--------|---------------------------------|------|-----------------------------|
| POST   | /api/auth/register               | No   | Register new user            |
| POST   | /api/auth/login                  | No   | Login with email/mobile      |
| POST   | /api/auth/forgot-password         | No   | Request password reset token |
| POST   | /api/auth/reset-password           | No   | Reset password with token    |
| GET    | /api/auth/me                     | Yes  | Get current user profile     |
| GET    | /api/projects                    | Yes  | List projects (filter: status) |
| POST   | /api/projects                    | Yes  | Create project               |
| GET    | /api/projects/:id                 | Yes  | Project details + summary    |
| PUT    | /api/projects/:id                 | Yes  | Update project               |
| DELETE | /api/projects/:id                 | Yes  | Delete project               |
| GET    | /api/expenses                    | Yes  | List expenses (filters)      |
| POST   | /api/expenses                    | Yes  | Create expense (multipart, billImage) |
| GET    | /api/expenses/:id                  | Yes  | Expense details              |
| PUT    | /api/expenses/:id                  | Yes  | Update expense (multipart)   |
| DELETE | /api/expenses/:id                  | Yes  | Delete expense               |
| GET    | /api/reports                     | Yes  | List daily reports (filters) |
| POST   | /api/reports                     | Yes  | Create report (multipart, sitePhotos[]) |
| GET    | /api/reports/:id                   | Yes  | Report details               |
| PUT    | /api/reports/:id                   | Yes  | Update report (multipart)    |
| DELETE | /api/reports/:id                   | Yes  | Delete report                |
| GET    | /api/dashboard                    | Yes  | Dashboard stats & charts      |

All authenticated routes require `Authorization: Bearer <token>` header.

See `../docs/API_DESIGN.md` for full request/response shapes.

## Deployment (Vercel + Neon)

See `../docs/DEPLOYMENT.md` for the full step-by-step guide.

Quick summary:
1. Create a Neon Postgres database, copy the connection string.
2. Set environment variables in Vercel project settings (same as `.env.example`).
3. Deploy: `vercel --prod`. The `vercel-build` script runs `prisma generate && prisma migrate deploy`.
