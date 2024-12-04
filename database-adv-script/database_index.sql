-- database_index.sql
-- This file contains SQL commands to create indexes and measure query performance using EXPLAIN ANALYZE.

-- ================================================================
-- User Table Indexes
-- ================================================================

-- Index on user_id for fast lookups in JOINs and WHERE clauses
CREATE INDEX idx_user_user_id ON User(user_id);

-- Index on email if frequently used for searching users
CREATE INDEX idx_user_email ON User(email);

-- Index on first_name and last_name for potential searches or filtering
CREATE INDEX idx_user_name ON User(first_name, last_name);

-- ================================================================
-- Booking Table Indexes
-- ================================================================

-- Index on user_id to optimize JOINs between Booking and User tables
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property_id to optimize JOINs between Booking and Property tables
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on start_date and end_date for filtering bookings by date range
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Index on status for filtering bookings by their status
CREATE INDEX idx_booking_status ON Booking(status);

-- ================================================================
-- Property Table Indexes
-- ================================================================

-- Index on property_id to optimize JOINs between Property and Booking tables
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Index on name for fast searching or ordering properties by name
CREATE INDEX idx_property_name ON Property(name);

-- ================================================================
-- Measure Query Performance
-- ================================================================

-- Measure performance of a query that retrieves bookings for a specific user
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE user_id = 1;

-- Measure performance of a query that retrieves bookings for a specific property
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE property_id = 10;

-- Measure performance of a query that retrieves all users and their total bookings
EXPLAIN ANALYZE 
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM 
    User
LEFT JOIN 
    Booking 
ON 
    User.user_id = Booking.user_id
GROUP BY 
    User.user_id, User.first_name, User.last_name;

-- Measure performance of a query that ranks properties by total bookings
EXPLAIN ANALYZE 
SELECT 
    Property.property_id,
    Property.name AS property_name,
    COUNT(Booking.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS booking_rank
FROM 
    Property
LEFT JOIN 
    Booking 
ON 
    Property.property_id = Booking.property_id
GROUP BY 
    Property.property_id, Property.name;
