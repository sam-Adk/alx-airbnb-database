# Partitioning Performance Report

## Context
The `bookings` table grew very large, causing slow queries when filtering by `start_date`.  
To optimize, the table was **partitioned by year** using the `start_date` column.

## Implementation
The `partitioning.sql` script:
- Creates a partitioned `bookings` table.
- Defines partitions for 2022, 2023, and 2024.
- Runs a test query to fetch bookings in June 2023.

## Performance Testing

### Query Before Partitioning
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
