-- Query 1: Non-correlated subquery to find properties with an average rating greater than 4.0
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Property.location,
    Property.pricepernight
FROM Property
WHERE Property.property_id IN (
    SELECT 
        Review.property_id
    FROM Review
    GROUP BY Review.property_id
    HAVING AVG(Review.rating) > 4.0
);

-- Query 2: Correlated subquery to find users with more than 3 bookings
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM User
WHERE (
    SELECT COUNT(*)
    FROM Booking
    WHERE Booking.user_id = User.user_id
) > 3;
