-- Seed Users
INSERT INTO Users (first_name, last_name, email, role) VALUES
('Alice', 'Johnson', 'alice@example.com', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'host'),
('Carol', 'Davis', 'carol@example.com', 'guest'),
('David', 'Lee', 'david@example.com', 'host');

-- Seed Properties
INSERT INTO Properties (host_id, title, description, location, price_per_night) VALUES
(2, 'Cozy Apartment', 'A nice city apartment in downtown.', 'New York', 120.00),
(4, 'Beach House', 'Ocean view villa with private pool.', 'Los Angeles', 300.00);

-- Seed Bookings
INSERT INTO Bookings (guest_id, property_id, start_date, end_date, status) VALUES
(1, 1, '2025-09-01', '2025-09-05', 'confirmed'),
(3, 2, '2025-10-10', '2025-10-15', 'pending');

-- Seed Payments
INSERT INTO Payments (booking_id, amount, payment_method, status, paid_at) VALUES
(1, 480.00, 'card', 'paid', '2025-08-20 10:00:00');

-- Seed Reviews
INSERT INTO Reviews (booking_id, guest_id, rating, comment) VALUES
(1, 1, 5, 'Amazing stay! Highly recommend.');
