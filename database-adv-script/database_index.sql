-- Index on bookings.user_id for faster joins with users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for faster joins with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.date for faster filtering by date
CREATE INDEX idx_bookings_date ON bookings(date);

-- Index on properties.name for faster searching/sorting by property name
CREATE INDEX idx_properties_name ON properties(name);

-----------------------------------------------------------
-- Measure query performance BEFORE and AFTER indexing
-----------------------------------------------------------

-- Example query: count bookings per property
EXPLAIN ANALYZE
SELECT p.id, p.name, COUNT(b.id) AS total_bookings
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name;

-- Example query: filter bookings by date
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE date BETWEEN '2023-01-01' AND '2023-06-30';

-- Example query: search properties by name
EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE name LIKE 'Beach%';
