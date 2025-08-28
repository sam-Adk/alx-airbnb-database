# Database Normalization

This document explains how the Airbnb-like database schema is normalized up to **Third Normal Form (3NF)**.

---

## 1NF (First Normal Form)
- Each table has a **primary key**.
- All columns hold **atomic values** (no repeating groups or multivalued attributes).
- Example:
  - `Users` table has `user_id` as PK, attributes like `first_name`, `last_name`, `email` are atomic.
  - `Bookings` table has separate `start_date` and `end_date` (not combined).

✅ Our design satisfies 1NF.

---

## 2NF (Second Normal Form)
- Requires the database to be in 1NF.
- No **partial dependencies** (non-key attributes must depend on the whole PK).
- Since all our tables use a **single-column primary key** (`user_id`, `property_id`, etc.), no partial dependency is possible.

✅ Our design satisfies 2NF.

---

## 3NF (Third Normal Form)
- Requires the database to be in 2NF.
- No **transitive dependencies** (non-key attributes must not depend on other non-key attributes).
- Example checks:
  - `Properties`: host details are not stored here (they belong to `Users`).
  - `Bookings`: only references guest and property IDs, no guest/property details duplicated.
  - `Payments`: depends only on `Bookings`, not on unrelated attributes.
  - `Reviews`: depends only on `Bookings` and `Users`.

✅ Our design satisfies 3NF.

---

## Conclusion
The database schema is normalized up to **3NF**:
- No redundant data.
- Strong referential integrity.
- Ready for efficient queries and scalability.

