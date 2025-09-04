-- Initial complex query: retrieve bookings with user, property, and payment details
SELECT b.id AS booking_id, b.date,
       u.id AS user_id, u.username, u.email,
       p.id AS property_id, p.name AS property_name, p.location,
       pay.id AS payment_id, pay.amount, pay.method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Optimized query: removing unnecessary columns and ensuring indexed columns are used
SELECT b.id AS booking_id, b.date,
       u.username,
       p.name AS property_name,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
