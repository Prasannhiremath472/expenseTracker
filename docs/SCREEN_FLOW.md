# Screen Flow

```mermaid
flowchart TD
    Splash[Splash Screen] -->|has valid session| Dashboard
    Splash -->|no session / invalid| Login

    Login -->|register link| Register
    Login -->|forgot password link| ForgotPassword
    Login -->|login success| Dashboard
    Register -->|register success| Dashboard
    ForgotPassword -->|back| Login

    subgraph MainShell["Main Shell (bottom navigation)"]
        Dashboard[Dashboard]
        Projects[Project List]
        Expenses[Expense List]
        Reports[Daily Report List]
        Profile[Profile]
    end

    Dashboard --> Projects
    Dashboard --> Expenses
    Dashboard --> Reports
    Dashboard --> Profile

    Projects -->|tap project| ProjectDetails[Project Details]
    Projects -->|FAB| AddProject[Add Project]
    ProjectDetails -->|edit| EditProject[Edit Project]
    ProjectDetails -->|delete + confirm| Projects
    AddProject -->|save| Projects
    EditProject -->|save| ProjectDetails

    Expenses -->|FAB| AddExpense[Add Expense]
    Expenses -->|tap expense| EditExpense[Edit Expense]
    AddExpense -->|save| Expenses
    EditExpense -->|save| Expenses

    Reports -->|FAB| AddReport[Add Daily Report]
    Reports -->|tap report| EditReport[Edit Daily Report]
    AddReport -->|save| Reports
    EditReport -->|save| Reports

    Profile -->|logout| Login
```

## Notes
- The **Main Shell** wraps Dashboard, Projects, Expenses, Reports, and Profile
  behind a `NavigationBar` (bottom tabs). Switching tabs refreshes that tab's
  data.
- **Add/Edit** screens for Project, Expense, and Daily Report are pushed as
  full-screen routes outside the shell (no bottom nav), and pop back to the
  originating list/details screen on save.
- **Edit** routes (`/expenses/:id/edit`, `/reports/:id/edit`,
  `/projects/:id/edit`) fetch the entity by id via its `*DetailsProvider`
  before rendering the form, showing a loading/error state while fetching.
- `GoRouter`'s `redirect` callback enforces:
  - Unauthenticated users are redirected to `/login` from any protected route.
  - Authenticated users are redirected away from `/splash`, `/login`,
    `/register`, and `/forgot-password` to `/dashboard`.
  - A 401 response from the API triggers logout and redirect to `/login`.
