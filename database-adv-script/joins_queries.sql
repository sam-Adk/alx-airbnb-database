SELECT bookings.id,bookings.date,users.username
FROM bookings
INNER JOIN users ON bookings.user_id = user.id;

SELECT properties.id,properties.name,reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

SELECT users.id AS user_id,users.username,bookings.id AS booking_id,bookinga.date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;