-- Users table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('host', 'guest')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Properties table
CREATE TABLE Properties (
    property_id SERIAL PRIMARY KEY,
    host_id INT NOT NULL REFERENCES Users(user_id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bookings table
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    guest_id INT NOT NULL REFERENCES Users(user_id) ON DELETE CASCADE,
    property_id INT NOT NULL REFERENCES Properties(property_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending','confirmed','cancelled'))
);

-- Payments table
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT UNIQUE NOT NULL REFERENCES Bookings(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20),
    status VARCHAR(20) CHECK (status IN ('pending','paid','failed')),
    paid_at TIMESTAMP
);

-- Reviews table
CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    booking_id INT UNIQUE NOT NULL REFERENCES Bookings(booking_id) ON DELETE CASCADE,
    guest_id INT NOT NULL REFERENCES Users(user_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance
CREATE INDEX idx_user_email ON Users(email);
CREATE INDEX idx_property_location ON Properties(location);
CREATE INDEX idx_booking_dates ON Bookings(start_date, end_date);
