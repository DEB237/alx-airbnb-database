-- Query to retrieve all bookings with user details, property details, and payment details
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price AS booking_total_price,
    Booking.status AS booking_status,
    User.user_id,
    User.first_name AS user_first_name,
    User.last_name AS user_last_name,
    User.email AS user_email,
    Property.property_id,
    Property.name AS property_name,
    Property.location AS property_location,
    Property.pricepernight AS property_price_per_night,
    Payment.payment_id,
    Payment.amount AS payment_amount,
    Payment.payment_method AS payment_method,
    Payment.payment_date AS payment_date
FROM 
    Booking
JOIN 
    User ON Booking.user_id = User.user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;