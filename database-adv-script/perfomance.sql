-- Initial complex query: retrieve bookings with user, property, and payment details
-- Includes WHERE and AND to filter by booking date and payment method
SELECT b.id AS booking_id, b.date,
       u.id AS user_id, u.username, u.email,
       p.id AS property_id, p.name AS property_name, p.location,
       pay.id AS payment_id, pay.amount, pay.method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.date >= '2023-01-01' 
  AND pay.method = 'Credit Card';

-- Analyze performance of the initial query
EXPLAIN
SELECT b.id AS booking_id, b.date,
       u.id AS user_id, u.username, u.email,
       p.id AS property_id, p.name AS property_name, p.location,
       pay.id AS payment_id, pay.amount, pay.method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.date >= '2023-01-01' 
  AND pay.method = 'Credit Card';

-- Optimized query: selecting fewer columns and using indexed columns
SELECT b.id AS booking_id, b.date,
       u.username,
       p.name AS property_name,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.date >= '2023-01-01' 
  AND pay.method = 'Credit Card';

-- Analyze performance of the optimized query
EXPLAIN
SELECT b.id AS booking_id, b.date,
       u.username,
       p.name AS property_name,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.date >= '2023-01-01' 
  AND pay.method = 'Credit Card';
