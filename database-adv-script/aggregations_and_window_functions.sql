-- 1. Aggregation: Total number of bookings made by each user
SELECT u.id AS user_id, u.username, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.username;

-- 2. Window function: Rank properties based on total number of bookings (using RANK)
SELECT p.id AS property_id, p.name, COUNT(b.id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name;

-- 3. Window function: Number properties sequentially (using ROW_NUMBER)
SELECT p.id AS property_id, p.name, COUNT(b.id) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS row_num
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name;
