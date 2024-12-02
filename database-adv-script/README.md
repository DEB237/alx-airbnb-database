
## Tasks Overview

### 1. **Aggregations and Window Functions**
   - SQL script to perform aggregation (e.g., using `COUNT` with `GROUP BY`) and window functions (e.g., `ROW_NUMBER` and `RANK`) to analyze data.

### 2. **Indexing for Performance Optimization**
   - Create indexes for high-usage columns to optimize query performance in the `User`, `Booking`, and `Property` tables. 
   - Performance improvements were measured using the `EXPLAIN` command before and after indexing.

### 3. **Query Optimization**
   - Refactored complex queries to improve performance by reducing unnecessary joins, utilizing indexes, and testing query performance with `EXPLAIN`.

### 4. **Table Partitioning**
   - Implemented partitioning on the `Booking` table based on the `start_date` column to improve query performance on large datasets, especially for date-based queries.
   - A report was created to compare query performance before and after partitioning.

### 5. **Performance Monitoring**
   - Monitored query performance using `EXPLAIN ANALYZE` and identified bottlenecks. 
   - Suggested and implemented optimizations like new indexes and schema adjustments.

### 6. **SQL Joins**
   - Created SQL queries using different types of joins (`INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`) to retrieve and analyze data from the database.

### 7. **Subqueries**
   - Wrote SQL queries using both non-correlated and correlated subqueries to solve specific data retrieval tasks, such as fetching properties with average ratings or finding users with multiple bookings.

## Usage

To use the SQL scripts, you can execute them on your MySQL or PostgreSQL database. These scripts can be directly run via a command-line interface or using a database management tool such as MySQL Workbench or pgAdmin.

```sql
-- Example for executing a script
source path_to_script/aggregations_and_window_functions.sql;
