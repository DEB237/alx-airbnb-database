# AirBnB Database Schema

## Objective
The purpose of this task is to define the schema for an AirBnB-like application database. The schema includes all necessary entities, their attributes, relationships, and constraints to ensure proper functionality and data integrity.

## Description
This schema creates tables for the following entities:
- **User**: Represents individuals interacting with the platform (guests, hosts, and admins).
- **Property**: Represents listings added by hosts for booking.
- **Booking**: Tracks reservations made by users for properties.
- **Payment**: Records financial transactions associated with bookings.
- **Review**: Allows users to review properties they have stayed at.
- **Message**: Tracks communication between users on the platform.

### Features
- **Primary Keys**: Ensure the uniqueness of records in every table.
- **Foreign Keys**: Define relationships between entities:
  - `host_id` in `Property` references `user_id` in `User`.
  - `property_id` and `user_id` in `Booking` reference their respective tables.
  - `booking_id` in `Payment` references `Booking`.
  - `property_id` and `user_id` in `Review` reference their respective tables.
  - `sender_id` and `recipient_id` in `Message` reference `User`.

- **Constraints**: 
  - Non-null constraints on essential attributes.
  - Unique constraint for `email` in the `User` table.
  - Check constraints to validate specific fields (e.g., `rating` in `Review` must be between 1 and 5).
  - ENUM constraints for fields like `role`, `status`, and `payment_method`.

- **Indexing**:
  - Automatically indexed primary keys.
  - Manual indexes on frequently queried columns such as `email`, `property_id`, and `booking_id`.

### Structure
1. **`schema.sql`**:
   - Contains the SQL script to create the database schema, define relationships, and set constraints.

2. **Task Breakdown**:
   - Create tables for all entities listed in the specification.
   - Define primary keys for every table.
   - Add foreign keys to enforce relationships between tables.
   - Define appropriate data types and constraints for each column.
   - Include indexes on important columns to optimize query performance.

