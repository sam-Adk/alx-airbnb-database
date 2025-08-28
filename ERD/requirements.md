# Entity-Relationship Diagram (ERD)

## Entities & Attributes

### User
- user_id (PK)
- first_name
- last_name
- email (unique)
- phone
- role (host / guest)
- created_at

### Property
- property_id (PK)
- host_id (FK → User.user_id)
- title
- description
- location
- price_per_night
- created_at

### Booking
- booking_id (PK)
- guest_id (FK → User.user_id)
- property_id (FK → Property.property_id)
- start_date
- end_date
- status (confirmed / cancelled / pending)

### Payment
- payment_id (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_method (card, PayPal, etc.)
- status (paid / pending / failed)
- paid_at

### Review
- review_id (PK)
- booking_id (FK → Booking.booking_id)
- guest_id (FK → User.user_id)
- rating (1–5)
- comment
- created_at

---

## Relationships
- A User (host) can list many Properties.
- A User (guest) can make many Bookings.
- A Property can have many Bookings.
- Each Booking has exactly one Payment.
- Each Booking can have one Review (by the guest).

---



