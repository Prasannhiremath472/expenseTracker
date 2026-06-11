# Entity-Relationship Diagram

The Site Expense Tracker uses a single-tenant (per-user) data model. Every
`Project`, `Expense`, and `DailyReport` belongs to exactly one `User`, and
`Expense`/`DailyReport` also belong to a `Project`. All child records cascade
delete when their parent is deleted.

```mermaid
erDiagram
    USER ||--o{ PROJECT : owns
    USER ||--o{ EXPENSE : owns
    USER ||--o{ DAILY_REPORT : owns
    PROJECT ||--o{ EXPENSE : has
    PROJECT ||--o{ DAILY_REPORT : has

    USER {
        uuid id PK
        string fullName
        string mobile UK
        string email UK
        string password
        string resetToken
        datetime resetTokenExpiry
        datetime createdAt
        datetime updatedAt
    }

    PROJECT {
        uuid id PK
        uuid userId FK
        string projectName
        string clientName
        string siteAddress
        datetime startDate
        decimal estimatedBudget
        string description
        enum status "ACTIVE | COMPLETED | ON_HOLD"
        datetime createdAt
        datetime updatedAt
    }

    EXPENSE {
        uuid id PK
        uuid projectId FK
        uuid userId FK
        datetime date
        enum category "MATERIAL | LABOUR | TRANSPORT | MACHINERY | DIESEL | ELECTRICITY | FOOD | MISCELLANEOUS"
        decimal amount
        string description
        string vendorName
        enum paymentMode "CASH | UPI | BANK_TRANSFER | CHEQUE | CARD"
        string billImageUrl
        datetime createdAt
        datetime updatedAt
    }

    DAILY_REPORT {
        uuid id PK
        uuid projectId FK
        uuid userId FK
        datetime date
        int workersCount
        string workCompleted
        string materialsUsed
        string issuesFaced
        string notes
        string_array sitePhotoUrls
        datetime createdAt
        datetime updatedAt
    }
```

## Notes
- `User.mobile` and `User.email` are unique — used as login identifiers.
- `Expense` and `DailyReport` both index `userId`, `projectId`, and `date` for
  efficient dashboard aggregation and filtered list queries.
- `Expense` additionally indexes `category` to speed up category filters and
  the dashboard's expense-by-category breakdown.
- `Project.estimatedBudget` and `Expense.amount` are stored as
  `Decimal(14,2)` and serialized as strings/numbers over JSON (handled by
  custom Freezed converters on the Flutter side).
- `DailyReport.sitePhotoUrls` is a Postgres string array of Cloudinary URLs.
- Deleting a `Project` cascades to delete its `Expense` and `DailyReport`
  records; deleting a `User` cascades to all of their data.
