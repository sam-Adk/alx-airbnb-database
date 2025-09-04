-- Drop the table if it already exists
DROP TABLE IF EXISTS bookings CASCADE;

-- Create partitioned bookings table by start_date
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);

-- Create yearly partitions
CREATE TABLE bookings_2022 PARTITION OF bookings
FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Test query performance on a date range (uses partition pruning)
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
