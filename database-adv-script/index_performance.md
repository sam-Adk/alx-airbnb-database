# Index Optimization in Database

This document describes how indexes were applied to improve query performance in the `alx-airbnb-database` project.

## Identifying High-Usage Columns
Indexes were created on columns frequently used in:
- **JOIN conditions**
- **WHERE filters**
- **ORDER BY sorting**

The following tables and columns were identified:
- **users**: `id` (used in joins with bookings)
- **bookings**: `user_id`, `property_id`, `date`
- **properties**: `id`, `name`

## Index Creation
```sql
-- Index on bookings.user_id for faster joins with users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for faster joins with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.date for faster filtering by date
CREATE INDEX idx_bookings_date ON bookings(date);

-- Index on properties.name for faster searching/sorting by property name
CREATE INDEX idx_properties_name ON properties(name);


EXPLAIN
SELECT u.username, p.name, b.date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.date >= '2023-01-01'
ORDER BY p.name;

---

## 🔹 Step 3: Update your `README.md`
Add a new section so it’s clear what the new file is:

```markdown
### Index Optimization
- **index_performance.md**: Documents the use of indexes for query optimization and includes performance measurements with `EXPLAIN`.
