# Table Partitioning Performance Report

## Objective
Optimize query performance on the `Booking` table, which contains a large volume of data, by implementing partitioning based on the `start_date` column.

## Steps Taken
1. **Implemented Range Partitioning**:
   - The `Booking` table was restructured into a partitioned table `Booking_partitioned`.
   - Partitions were created for bookings based on year ranges (e.g., 2023 and 2024).

2. **Populated Partitions**:
   - Data from the original `Booking` table was migrated to the new partitioned table.

3. **Tested Queries**:
   - Queried bookings for a specific date range both on the original and partitioned tables.
   - Used the `EXPLAIN` command to analyze performance.

