# Database Schema (DDL)

This folder contains the SQL Data Definition Language (DDL) script for the Airbnb-like database.

## Files
- `schema.sql`: Creates the database schema including tables, relationships, and indexes.

## Schema Overview
- **Users**: Stores guest and host information.
- **Properties**: Listings created by hosts.
- **Bookings**: Reservations made by guests for properties.
- **Payments**: Payments linked to bookings.
- **Reviews**: Guest reviews for completed bookings.

## Key Features
- Proper use of **Primary Keys** and **Foreign Keys**.
- **CHECK constraints** for valid data (e.g., role, booking status, review rating).
- **Indexes** on commonly queried fields for performance optimization.
