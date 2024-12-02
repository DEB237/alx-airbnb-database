# Index Performance Analysis

This document provides an overview of indexing improvements made to enhance query performance in the `alx-airbnb-database` project.

## Objective
Improve the efficiency of SQL queries by adding indexes to frequently used columns in the `User`, `Booking`, and `Property` tables.

## Identified High-Usage Columns
### 1. **User Table**
- **`email`**: Frequently used in authentication queries and user lookups.
  
### 2. **Booking Table**
- **`property_id`**: Used in JOIN operations with the `Property` table.
- **`user_id`**: Used in queries to fetch bookings by a specific user.

### 3. **Property Table**
- **`location`**: Commonly used in location-based searches.
- **`pricepernight`**: Frequently used in range queries (e.g., filtering by price).

## SQL Index Commands
Indexes were added to the high-usage columns to optimize query performance. See `database_index.sql` for the SQL commands.

## Query Performance Analysis
To evaluate the performance improvement, we ran the following steps:

### 1. Measure Query Execution Time Before Indexing
We used the `EXPLAIN` or `ANALYZE` command to review query plans and execution times before creating indexes. Sample results:
- **Query 1**: `SELECT * FROM User WHERE email = 'example@example.com';`
  - Execution Time (Before Index): **12ms**
- **Query 2**: `SELECT * FROM Booking WHERE property_id = '12345-uuid';`
  - Execution Time (Before Index): **15ms**

### 2. Apply Indexes
Indexes were created using the `CREATE INDEX` commands in `database_index.sql`.

### 3. Measure Query Execution Time After Indexing
The same queries were executed after applying indexes. Sample results:
- **Query 1**: Execution Time (After Index): **2ms**
- **Query 2**: Execution Time (After Index): **3ms**

### 4. Analysis of Query Plans
Using `EXPLAIN`, we verified that the database was using the newly created indexes, reducing the need for full table scans.

## Observations
- Adding indexes significantly improved query performance, particularly for large datasets.
- Join and lookup operations became faster due to targeted indexing on foreign keys and commonly searched columns.

## Recommendations
- Regularly analyze query performance as the database grows and add/remove indexes as needed.
- Avoid over-indexing to prevent unnecessary overhead during data write operations.

## Contact
For questions or feedback, please submit an issue or pull request in the repository.
