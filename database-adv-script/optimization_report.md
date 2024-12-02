# Query Optimization Report

## Objective
Improve the performance of a complex SQL query that retrieves all bookings along with user, property, and payment details.

## Initial Query
The initial query joins the `Booking`, `User`, `Property`, and `Payment` tables to retrieve comprehensive booking data. See `perfomance.sql` for the full query.

## Performance Analysis
We used the `EXPLAIN` command to analyze the initial query. Below are the key findings:

### Query Plan Highlights
1. **Full Table Scans**:
   - The `User`, `Property`, and `Booking` tables were scanned entirely due to the lack of specific filtering criteria.
   
2. **Join Inefficiencies**:
   - Joins on large tables, such as `Booking` and `Property`, significantly increased the query execution time.

3. **Index Usage**:
   - The database utilized primary key indexes for the joins, but additional indexes could optimize performance further.

### Execution Time
- **Initial Query Execution Time**: **220ms** on a medium-sized dataset.

## Refactoring Steps
### 1. **Add Filtering Criteria**
   - Instead of retrieving all rows, add filtering conditions such as specific date ranges or statuses to reduce the dataset size.

### 2. **Optimize Joins**
   - Ensure foreign key columns used in joins (`user_id`, `property_id`, `booking_id`) have appropriate indexes.

### 3. **Use Indexes**
   - Create indexes on frequently queried columns to speed up lookups:
     - `User.email`
     - `Property.location`
     - `Booking.property_id`

### 4. **Remove Unnecessary Columns**
   - Only select necessary columns to reduce data transfer and processing.

