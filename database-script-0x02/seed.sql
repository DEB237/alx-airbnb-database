-- Insert sample data into the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
  (UUID(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_password1', '1234567890', 'guest', CURRENT_TIMESTAMP),
  (UUID(), 'Bob', 'Smith', 'bob@example.com', 'hashed_password2', '0987654321', 'host', CURRENT_TIMESTAMP),
  (UUID(), 'Eve', 'Davis', 'eve@example.com', 'hashed_password3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Insert sample data into the Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at)
VALUES 
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Beach House', 'A lovely beach house.', 'California', 200.00, CURRENT_TIMESTAMP),
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Mountain Cabin', 'Cozy cabin in the mountains.', 'Colorado', 150.00, CURRENT_TIMESTAMP);

-- Insert sample data into the Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), 
   (SELECT user_id FROM User WHERE email = 'alice@example.com'), '2024-12-01', '2024-12-07', 1200.00, 'confirmed', CURRENT_TIMESTAMP),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'), 
   (SELECT user_id FROM User WHERE email = 'alice@example.com'), '2024-12-10', '2024-12-15', 750.00, 'pending', CURRENT_TIMESTAMP);

-- Insert sample data into the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
  (UUID(), (SELECT booking_id FROM Booking WHERE total_price = 1200.00), 1200.00, CURRENT_TIMESTAMP, 'credit_card'),
  (UUID(), (SELECT booking_id FROM Booking WHERE total_price = 750.00), 750.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert sample data into the Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), 
   (SELECT user_id FROM User WHERE email = 'alice@example.com'), 5, 'Amazing place!', CURRENT_TIMESTAMP),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'), 
   (SELECT user_id FROM User WHERE email = 'alice@example.com'), 4, 'Very cozy and relaxing.', CURRENT_TIMESTAMP);

-- Insert sample data into the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
  (UUID(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 
   (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Hello, is the Beach House available?', CURRENT_TIMESTAMP),
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 
   (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Yes, it is available for your requested dates.', CURRENT_TIMESTAMP);
