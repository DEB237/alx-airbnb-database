
-- Step 1: Drop the existing Booking table (if it exists) to avoid conflicts
DROP TABLE IF EXISTS Booking;

-- Step 2: Create the Booking table with partitioning based on the start_date column
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Other columns as necessary
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES User(user_id)
)
PARTITION BY RANGE (start_date);  
-- Partitioning the table by the start_date column

-- Step 3: Create partitions for different year ranges (e.g., each year in the future)
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2022-12-31');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2023-12-31');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2024-12-31');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-12-31');

-- Additional partitions for future years can be created in a similar manner.
-- we can adjust the range as per your requirements (monthly, quarterly, etc.).

-- Step 4: Create indexes on the partitions for better performance
CREATE INDEX idx_booking_user_id_2022 ON Booking_2022 (user_id);
CREATE INDEX idx_booking_property_id_2022 ON Booking_2022 (property_id);
CREATE INDEX idx_booking_user_id_2023 ON Booking_2023 (user_id);
CREATE INDEX idx_booking_property_id_2023 ON Booking_2023 (property_id);
CREATE INDEX idx_booking_user_id_2024 ON Booking_2024 (user_id);
CREATE INDEX idx_booking_property_id_2024 ON Booking_2024 (property_id);
CREATE INDEX idx_booking_user_id_2025 ON Booking_2025 (user_id);
CREATE INDEX idx_booking_property_id_2025 ON Booking_2025 (property_id);

-- Step 5: Verify the partitioning strategy
-- Query to check partitioning details
SELECT 
    tablename, 
    partitionname, 
    range_start, 
    range_end
FROM 
    pg_partitions
WHERE 
    schemaname = 'public' AND tablename = 'booking';