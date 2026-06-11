# Deployment Guide

This guide covers deploying the Site Expense Tracker backend to **Vercel**
with a **Neon PostgreSQL** database and **Cloudinary** for file storage, and
building the **Flutter** mobile app to point at that backend.

## 1. Database — Neon PostgreSQL

1. Create a free account at [neon.tech](https://neon.tech) and create a new project.
2. Copy the connection string (it looks like
   `postgresql://user:password@ep-xxx.region.aws.neon.tech/dbname?sslmode=require`).
3. Save it — this becomes `DATABASE_URL`.

## 2. File Storage — Cloudinary

1. Create a free account at [cloudinary.com](https://cloudinary.com).
2. From the dashboard, copy:
   - `Cloud name` → `CLOUDINARY_CLOUD_NAME`
   - `API Key` → `CLOUDINARY_API_KEY`
   - `API Secret` → `CLOUDINARY_API_SECRET`

No bucket/folder setup is needed — the backend creates folders
(`site-expense-tracker/{userId}/bills`, `.../reports`) automatically on
upload.

## 3. Backend — Vercel

1. Push the `backend/` directory to a Git repository (or deploy the monorepo
   with Vercel's "Root Directory" set to `backend`).
2. In the Vercel dashboard, create a new project from the repo.
3. Set **Root Directory** to `backend`.
4. Add environment variables (Project Settings → Environment Variables):

   | Variable | Value |
   |---|---|
   | `DATABASE_URL` | Neon connection string |
   | `JWT_SECRET` | a long random string |
   | `JWT_EXPIRES_IN` | `7d` |
   | `CLOUDINARY_CLOUD_NAME` | from Cloudinary |
   | `CLOUDINARY_API_KEY` | from Cloudinary |
   | `CLOUDINARY_API_SECRET` | from Cloudinary |
   | `CORS_ORIGIN` | `*` (mobile app has no browser origin) |
   | `NODE_ENV` | `production` |

5. Run the Prisma migration against the Neon database **before or during**
   first deploy:
   ```bash
   cd backend
   npx prisma migrate deploy
   ```
   (Run this locally with `DATABASE_URL` pointed at Neon, or as a Vercel
   build step.)

6. Deploy. Vercel will use `vercel.json` to route all requests to
   `api/index.js`, which exports the Express app as a serverless handler.

7. Verify the deployment:
   ```bash
   curl https://your-project.vercel.app/api/health
   ```
   Expected: `{"success":true,"message":"Service is healthy","data":{"status":"ok", ...}}`

### Notes
- `prisma/schema.prisma` includes `binaryTargets = ["native", "rhel-openssl-3.0.x"]`
  so the generated Prisma client works on Vercel's Node runtime.
- The `forgot-password` endpoint currently generates a reset token but does
  **not** send an email (no email provider is configured in the MVP). Before
  production use, integrate an email service (e.g. Resend, SendGrid, AWS SES)
  in `auth.service.js`'s `forgotPassword` function to email the reset link.

## 4. Mobile App — Flutter

1. Install dependencies and generate code:
   ```bash
   cd mobile
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

2. Point the app at your deployed backend using `--dart-define`:
   ```bash
   flutter run --dart-define=API_BASE_URL=https://your-project.vercel.app/api
   ```

3. Build a release APK:
   ```bash
   flutter build apk --release --dart-define=API_BASE_URL=https://your-project.vercel.app/api
   ```
   The APK will be at `build/app/outputs/flutter-apk/app-release.apk`.

4. (Optional) For an App Bundle (Play Store):
   ```bash
   flutter build appbundle --release --dart-define=API_BASE_URL=https://your-project.vercel.app/api
   ```

## 5. Post-Deployment Checklist
- [ ] `/api/health` returns 200
- [ ] Register a test user via `/api/auth/register`
- [ ] Login and confirm a JWT is returned
- [ ] Create a project, expense (with bill image), and daily report (with
      site photos) and confirm Cloudinary URLs are returned
- [ ] Confirm `/api/dashboard` returns aggregated stats
- [ ] Build and install the Flutter APK on a device, confirm login → dashboard
      → CRUD flows work end-to-end against the deployed API
