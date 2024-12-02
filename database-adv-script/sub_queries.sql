-- Query 1: Non-Correlated Subquery
-- Find all properties where the average rating is greater than 4.0
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.location
FROM 
    Property
WHERE 
    property_id IN (
        SELECT 
            Review.property_id
        FROM 
            Review
        GROUP BY 
            Review.property_id
        HAVING 
            AVG(Review.rating) > 4.0
    );

-- Query 2: Correlated Subquery
-- Find users who have made more than 3 bookings
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    User
WHERE 
    (SELECT COUNT(*) 
     FROM Booking 
     WHERE Booking.user_id = User.user_id) > 3;