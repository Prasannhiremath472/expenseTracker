# Development Roadmap

This roadmap reflects the order the MVP was built in and is a useful guide
for onboarding new contributors or planning future iterations.

## Phase 1 — Backend Foundation
- Project scaffolding, `package.json`, environment config
- Prisma schema (User, Project, Expense, DailyReport) + enums
- Core utilities: `ApiError`, `ApiResponse`, `asyncHandler`, JWT helpers,
  password hashing, Cloudinary upload helper

## Phase 2 — Backend Middleware & Validation
- Auth middleware (JWT verification)
- Central error-handling middleware
- Multer upload middleware (memory storage, mime/size limits)
- Zod validators for auth, project, expense, report payloads

## Phase 3 — Backend Business Logic
- Repositories (Prisma data access) for users, projects, expenses, reports
- Services (business rules, ownership checks, Cloudinary uploads)
- Controllers + routes for all 5 resource groups
- Dashboard aggregation service

## Phase 4 — Backend Deployment Readiness
- Express app entrypoint, local dev server
- Vercel serverless entrypoint + `vercel.json`
- `.env.example`, README, manual smoke tests (`/api/health`, register validation)

## Phase 5 — Flutter Foundation
- `pubspec.yaml` dependencies
- Core layer: theme, network (Dio + interceptors), storage (Hive +
  Secure Storage), error/Result types, formatters/validators

## Phase 6 — Flutter Auth & Navigation Skeleton
- Splash, login, register, forgot password screens
- Auth repository + Riverpod `AuthNotifier`
- Route names and initial GoRouter skeleton

## Phase 7 — Flutter Project Feature (full CRUD)
- Project model, datasources (remote + Hive cache), offline-first repository
- Project list (status filters), details (with stats), add/edit screens

## Phase 8 — Flutter Dashboard
- Dashboard model + repository
- Stat cards, category pie chart, monthly bar chart, recent activity lists

## Phase 9 — Flutter Expense Feature (full CRUD)
- Expense model (with bill image upload via multipart)
- Search, category filter, project filter
- Add/edit screen with image picker for bill photos

## Phase 10 — Flutter Daily Report Feature (full CRUD)
- Report model (multiple site photos)
- List with project filter, add/edit screen with multi-image picker

## Phase 11 — Flutter Profile, Routing, and Wiring
- Profile screen (user info + logout)
- Full `GoRouter` config: auth-based redirects, bottom-nav shell, edit-by-id
  loaders for project/expense/report
- `main.dart`: Hive init, `ProviderScope`, theme, 401 → logout wiring
- `ConnectivityService`: refresh cached lists on reconnect

## Phase 12 — Documentation & Deployment
- ER diagram, API design reference, screen flow diagram
- Deployment guide (Neon + Cloudinary + Vercel + Flutter release build)

---

## Future Enhancements (post-MVP)
- Real email delivery for forgot-password (currently returns a token/message
  only — see DEPLOYMENT.md)
- True offline write queue (currently offline mode is read-only from cache;
  creates/updates require connectivity)
- Push notifications for budget overruns
- Multi-currency support
- Export expense/report data to PDF/Excel
- Role-based access if multi-user/team support is added later
