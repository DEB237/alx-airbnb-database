
# Database Performance Monitoring and Optimization Report

## Objective:
To continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments. We will use tools like `EXPLAIN ANALYZE` to identify bottlenecks in frequently used queries and make necessary optimizations such as adding indexes or adjusting the schema.

---

## Methodology

### Step 1: Monitor Query Performance Using `EXPLAIN ANALYZE`

First, we identify a few frequently used queries in the system and analyze their execution plans using the `EXPLAIN ANALYZE` command. This helps to understand where the query spends most of its time, such as in full table scans or inefficient joins.

Example query to fetch all bookings for a particular user:

```sql
EXPLAIN ANALYZE
SELECT booking_id, start_date, end_date, total_price
FROM Booking
WHERE user_id = 'some-user-id'
AND start_date BETWEEN '2023-01-01' AND '2023-12-31';
