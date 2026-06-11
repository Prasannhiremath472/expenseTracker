# Site Expense Tracker — Mobile App

Flutter mobile app for Civil Engineers, Site Supervisors, Contractors, and Small Builders to track
construction site expenses, daily reports, and bills.

## Tech Stack
- Flutter 3.x (Material 3)
- Riverpod (state management)
- GoRouter (navigation)
- Dio (networking)
- Hive (offline cache)
- Flutter Secure Storage (JWT persistence)
- Freezed + json_serializable (immutable models)
- fl_chart (dashboard charts)
- image_picker / file_picker (bill & site photo uploads)
- connectivity_plus (online/offline detection)

## Folder Structure
```
mobile/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── constants/      # API endpoints, app constants, Hive box names
│   │   ├── theme/           # Material 3 theme, colors, text styles
│   │   ├── network/          # Dio client, interceptors, connectivity
│   │   ├── storage/           # Secure storage, Hive cache service
│   │   ├── error/              # Exceptions and Failure types
│   │   ├── utils/                # Validators, formatters, Result type
│   │   └── providers/             # Shared Riverpod providers
│   ├── routes/                     # GoRouter config and route names
│   ├── shared/widgets/              # Reusable UI components
│   ├── services/                     # Connectivity sync service
│   └── features/
│       ├── auth/        # Splash, login, register, forgot password
│       ├── project/     # Project list, details, add/edit
│       ├── expense/     # Expense list (search/filter), add/edit
│       ├── report/      # Daily report list, add/edit
│       ├── dashboard/   # Stats, charts, recent activity
│       └── profile/     # User profile + logout
├── pubspec.yaml
└── analysis_options.yaml
```

## Architecture

Each feature follows a clean, layered structure:
- `data/models` — Freezed DTOs with JSON (de)serialization
- `data/datasources` — remote (Dio/API) and local (Hive) data sources
- `data/repositories` — offline-first repositories returning `Result<T>`
- `presentation/providers` — Riverpod `StateNotifier`/`FutureProvider`s
- `presentation/screens` and `presentation/widgets` — UI

### Offline support
- Project, Expense, and Report lists are cached in Hive on every successful fetch.
- If the device is offline, repositories serve cached data (with local filtering for
  expense/report queries).
- `ConnectivityService` listens for connectivity changes and refreshes cached lists
  automatically when the device comes back online.

### Authentication
- JWT is stored via `flutter_secure_storage` and attached to all API requests by
  `ApiInterceptor`.
- A 401 response triggers automatic logout and redirect to the login screen.
- `GoRouter` redirects based on `AuthState` (splash → login/register or dashboard).

## Local Setup

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Generate Freezed/JSON/Riverpod code:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. Run the app, pointing at your backend API:
   ```bash
   flutter run --dart-define=API_BASE_URL=http://10.0.2.2:5000/api
   ```

   - `10.0.2.2` is the Android emulator's alias for the host machine's `localhost`.
   - For a physical device or production, point this to your deployed backend
     (e.g. `https://your-api.vercel.app/api`).

## Build for Release

```bash
flutter build apk --release --dart-define=API_BASE_URL=https://your-api.vercel.app/api
```

## Backend

This app expects the companion backend in `../backend`. See `../backend/README.md` for
setup, environment variables, and deployment instructions.
