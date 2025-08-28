# Database Normalization

## 1NF (First Normal Form)
- All attributes are atomic (no multi-valued attributes).
- Example: `first_name` and `last_name` are stored separately, not combined.
- Each booking has one start_date and one end_date.

## 2NF (Second Normal Form)
- Every non-key attribute depends on the entire primary key.
- Example: In Bookings, `start_date` depends only on `booking_id` (the PK), not on part of it.

## 3NF (Third Normal Form)
- No transitive dependencies.
- Example: Host details are stored in the Users table, not duplicated in Properties.
- Payment details depend only on Booking, not indirectly on User or Property.

✅ The schema is normalized up to **3NF**.
