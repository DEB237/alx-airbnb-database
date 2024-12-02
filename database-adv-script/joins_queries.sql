-- Query 1: INNER JOIN to retrieve all bookings and respective users
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id;

-- Query 2: LEFT JOIN to retrieve all properties and their reviews, including properties with no reviews
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Property.location,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;

-- Query 3: FULL OUTER JOIN to retrieve all users and all bookings, even if no link exists
SELECT 
    User.user_id AS user_id,
    User.first_name AS user_first_name,
    User.last_name AS user_last_name,
    Booking.booking_id AS booking_id,
    Booking.property_id AS booking_property_id,
    Booking.start_date,
    Booking.end_date
FROM User
FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;
