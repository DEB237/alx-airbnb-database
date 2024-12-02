-- Step 1: Enable partitioning support if required (specific to the database, e.g., PostgreSQL or MySQL).

-- For PostgreSQL:
-- Ensure the table allows for partitioning by creating a new partitioned table.
CREATE TABLE Booking_partitioned (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions based on date ranges.
CREATE TABLE Booking_partition_2023 PARTITION OF Booking_partitioned 
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_partition_2024 PARTITION OF Booking_partitioned 
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 3: Populate partitions with existing data from the original Booking table.
INSERT INTO Booking_partitioned
SELECT * FROM Booking;

-- Step 4: Drop the original Booking table if desired.
-- DROP TABLE Booking;
