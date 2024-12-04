CREATE INDEX idx_user_email ON User(email);

CREATE INDEX idx_user_id ON User(user_id);

CREATE INDEX idx_booking_user_id ON Booking(user_id);


CREATE INDEX idx_booking_property_id ON Booking(property_id);

CREATE INDEX idx_booking_start_date ON Booking(start_date);


CREATE INDEX idx_property_id ON Property(property_id);


CREATE INDEX idx_property_location ON Property(location);

EXPLAIN SELECT * FROM User WHERE user_id = 1;

ANALYZE SELECT * FROM Booking WHERE user_id = 1;