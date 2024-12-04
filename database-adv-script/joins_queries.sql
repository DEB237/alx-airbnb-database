-- Query 1: INNER JOIN - Retrieve all bookings and the respective users who made those bookings
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User 
ON 
    Booking.user_id = User.user_id;

-- Query 2: LEFT JOIN - Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Review.review_id,
    Review.rating,
    Review.comment
FROM 
    Property
LEFT JOIN 
    Review 
ON 
    Property.property_id = Review.property_id
ORDER BY
    Property.property_id;

-- Query 3: FULL OUTER JOIN - Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price
FROM 
    User
FULL OUTER JOIN 
    Booking 
ON 
    User.user_id = Booking.user_id;


-- Combine LEFT JOIN and RIGHT JOIN using UNION
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price
FROM 
    User
LEFT JOIN 
    Booking 
ON 
    User.user_id = Booking.user_id

UNION

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price
FROM 
    Booking
LEFT JOIN 
    User 
ON 
    Booking.user_id = User.user_id;