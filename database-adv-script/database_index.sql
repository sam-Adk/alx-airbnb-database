-- Index on bookings.user_id for faster joins with users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for faster joins with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.date for faster filtering by date
CREATE INDEX idx_bookings_date ON bookings(date);

-- Index on properties.name for faster searching/sorting by property name
CREATE INDEX idx_properties_name ON properties(name);
