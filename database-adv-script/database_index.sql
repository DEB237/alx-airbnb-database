-- Create an index on the email column in the User table for quick lookup
CREATE INDEX idx_user_email ON User(email);

-- Create an index on the property_id column in the Booking table to improve JOIN performance
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create an index on the user_id column in the Booking table to speed up queries involving user-related bookings
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create an index on the location column in the Property table for location-based searches
CREATE INDEX idx_property_location ON Property(location);

-- Create an index on the pricepernight column in the Property table to improve performance of range queries
CREATE INDEX idx_property_price ON Property(pricepernight);
