# API Design

Base URL: `https://<your-deployment>.vercel.app/api` (local: `http://localhost:5000/api`)

All responses follow a consistent envelope:

```json
{
  "success": true,
  "message": "Human-readable message",
  "data": { }
}
```

Errors:

```json
{
  "success": false,
  "message": "Error message",
  "errors": [ { "field": "email", "message": "Invalid email" } ]
}
```

All endpoints except `/auth/register`, `/auth/login`, `/auth/forgot-password`, and
`/auth/reset-password` require an `Authorization: Bearer <token>` header.

---

## Auth

### POST `/auth/register`
Request:
```json
{
  "fullName": "Ramesh Kumar",
  "mobile": "9876543210",
  "email": "ramesh@example.com",
  "password": "secret123"
}
```
Response `201`:
```json
{
  "success": true,
  "message": "Registered successfully",
  "data": {
    "user": { "id": "uuid", "fullName": "Ramesh Kumar", "mobile": "9876543210", "email": "ramesh@example.com", "createdAt": "...", "updatedAt": "..." },
    "token": "jwt-token"
  }
}
```

### POST `/auth/login`
Request:
```json
{ "emailOrMobile": "ramesh@example.com", "password": "secret123" }
```
Response `200`: same shape as register (`user` + `token`).

### POST `/auth/forgot-password`
Request:
```json
{ "email": "ramesh@example.com" }
```
Response `200`: `{ "data": { "message": "..." } }` (MVP: does not send email; see DEPLOYMENT.md for TODO).

### POST `/auth/reset-password`
Request:
```json
{ "token": "reset-token", "newPassword": "newSecret123" }
```
Response `200`: `{ "data": { "message": "Password reset successfully" } }`

### GET `/auth/me`
Response `200`: `{ "data": { "id": "...", "fullName": "...", "mobile": "...", "email": "...", "createdAt": "...", "updatedAt": "..." } }`

---

## Projects

### GET `/projects?status=ACTIVE`
Query params: `status` (optional: `ACTIVE` | `COMPLETED` | `ON_HOLD`)

Response `200`:
```json
{ "data": [ { "id": "...", "projectName": "...", "clientName": "...", "siteAddress": "...", "startDate": "...", "estimatedBudget": "150000.00", "description": "...", "status": "ACTIVE", "createdAt": "...", "updatedAt": "..." } ] }
```

### GET `/projects/:id`
Response `200`: project object plus aggregates:
```json
{
  "data": {
    "id": "...", "projectName": "...", "...": "...",
    "totalExpenses": "45000.00",
    "_count": { "expenses": 12, "dailyReports": 5 }
  }
}
```

### POST `/projects`
Request:
```json
{
  "projectName": "Skyline Apartments",
  "clientName": "Skyline Builders",
  "siteAddress": "Plot 12, Sector 5",
  "startDate": "2026-01-15",
  "estimatedBudget": 2500000,
  "description": "G+4 residential building",
  "status": "ACTIVE"
}
```
Response `201`: created project object.

### PUT `/projects/:id`
Request: any subset of the create fields. Response `200`: updated project.

### DELETE `/projects/:id`
Response `200`: `{ "data": { "message": "Project deleted successfully" } }`
(cascades to delete its expenses and daily reports)

---

## Expenses

### GET `/expenses`
Query params: `projectId`, `category`, `startDate`, `endDate`, `search` (matches vendor/description), `page` (default 1), `limit` (default 20, max 100)

Response `200`:
```json
{
  "data": {
    "expenses": [
      {
        "id": "...", "projectId": "...", "userId": "...", "date": "...",
        "category": "MATERIAL", "amount": "12500.00", "description": "Cement bags",
        "vendorName": "ABC Traders", "paymentMode": "UPI",
        "billImageUrl": "https://res.cloudinary.com/.../bill.jpg",
        "createdAt": "...", "updatedAt": "...",
        "project": { "projectName": "Skyline Apartments" }
      }
    ],
    "pagination": { "page": 1, "limit": 20, "total": 42, "totalPages": 3 }
  }
}
```

### GET `/expenses/:id`
Response `200`: single expense object (with `project`).

### POST `/expenses`
**multipart/form-data**:
- `projectId` (uuid, required)
- `date` (ISO date, required)
- `category` (enum, required)
- `amount` (number, required)
- `description` (string, optional)
- `vendorName` (string, optional)
- `paymentMode` (enum, required)
- `billImage` (file: jpg/png/pdf, optional, max 10MB)

Response `201`: created expense object.

### PUT `/expenses/:id`
Same fields as create (all optional), multipart/form-data. If `billImage` is
provided, replaces the existing bill image.

### DELETE `/expenses/:id`
Response `200`: `{ "data": { "message": "Expense deleted successfully" } }`

---

## Daily Reports

### GET `/reports`
Query params: `projectId`, `startDate`, `endDate`, `page`, `limit`

Response `200`:
```json
{
  "data": {
    "reports": [
      {
        "id": "...", "projectId": "...", "userId": "...", "date": "...",
        "workersCount": 18, "workCompleted": "Slab shuttering for 2nd floor",
        "materialsUsed": "Cement, Steel, Sand", "issuesFaced": "Rain delay",
        "notes": "On schedule", "sitePhotoUrls": ["https://res.cloudinary.com/.../photo1.jpg"],
        "createdAt": "...", "updatedAt": "...",
        "project": { "projectName": "Skyline Apartments" }
      }
    ],
    "pagination": { "page": 1, "limit": 20, "total": 10, "totalPages": 1 }
  }
}
```

### GET `/reports/:id`
Response `200`: single report object (with `project`).

### POST `/reports`
**multipart/form-data**:
- `projectId` (uuid, required)
- `date` (ISO date, required)
- `workersCount` (integer >= 0, required)
- `workCompleted`, `materialsUsed`, `issuesFaced`, `notes` (strings, optional)
- `sitePhotos` (files: up to 10 images, optional)

Response `201`: created report object.

### PUT `/reports/:id`
Same fields, multipart/form-data. Any new `sitePhotos` are **appended** to the
existing `sitePhotoUrls` array (not replaced).

### DELETE `/reports/:id`
Response `200`: `{ "data": { "message": "Report deleted successfully" } }`

---

## Dashboard

### GET `/dashboard`
Response `200`:
```json
{
  "data": {
    "totalProjects": 5,
    "activeProjects": 3,
    "totalExpenses": "1250000.00",
    "monthlyExpenses": "85000.00",
    "todaysExpenses": "5000.00",
    "expenseByCategory": [
      { "category": "MATERIAL", "total": "600000.00" },
      { "category": "LABOUR", "total": "400000.00" }
    ],
    "expenseByMonth": [
      { "month": "2026-01", "total": 80000 },
      { "month": "2026-02", "total": 95000 },
      { "month": "2026-03", "total": 70000 },
      { "month": "2026-04", "total": 110000 },
      { "month": "2026-05", "total": 90000 },
      { "month": "2026-06", "total": 85000 }
    ],
    "recentExpenses": [
      { "id": "...", "amount": "12500.00", "category": "MATERIAL", "date": "...", "project": { "projectName": "Skyline Apartments" } }
    ],
    "recentReports": [
      { "id": "...", "date": "...", "workersCount": 18, "project": { "projectName": "Skyline Apartments" } }
    ]
  }
}
```

- `expenseByMonth` always contains exactly 6 entries (the current month and
  the 5 preceding months), even if a month has zero expenses.
- `recentExpenses` and `recentReports` are each limited to the 5 most recent
  records, ordered by `date` descending.
