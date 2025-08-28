# Seeding the Database

This folder contains SQL scripts to populate the Airbnb-like database with sample data.

- **seed.sql**: Inserts Users, Properties, Bookings, Payments, and Reviews.

## How to Run
First create the schema, then run the seed file:

```sql
\i database-script-0x01/schema.sql
\i database-script-0x02/seed.sql
