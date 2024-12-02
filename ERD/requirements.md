# Entity-Relationship (ER) Diagram - AirBnB Database

## Overview
The ER diagram for the AirBnB database illustrates the entities, attributes, and relationships required to manage users, properties, bookings, payments, reviews, and messages within the system. Each entity is uniquely identified by a primary key, and foreign key relationships are defined to ensure referential integrity.

---

## Entities and Attributes

### 1. **User**
- **Primary Key:** `user_id` (UUID, Indexed)
- Attributes:
  - `first_name`: VARCHAR, NOT NULL
  - `last_name`: VARCHAR, NOT NULL
  - `email`: VARCHAR, UNIQUE, NOT NULL
  - `password_hash`: VARCHAR, NOT NULL
  - `phone_number`: VARCHAR, NULL
  - `role`: ENUM (guest, host, admin), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. **Property**
- **Primary Key:** `property_id` (UUID, Indexed)
- Attributes:
  - `host_id`: Foreign Key (references `User.user_id`)
  - `name`: VARCHAR, NOT NULL
  - `description`: TEXT, NOT NULL
  - `location`: VARCHAR, NOT NULL
  - `pricepernight`: DECIMAL, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. **Booking**
- **Primary Key:** `booking_id` (UUID, Indexed)
- Attributes:
  - `property_id`: Foreign Key (references `Property.property_id`)
  - `user_id`: Foreign Key (references `User.user_id`)
  - `start_date`: DATE, NOT NULL
  - `end_date`: DATE, NOT NULL
  - `total_price`: DECIMAL, NOT NULL
  - `status`: ENUM (pending, confirmed, canceled), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. **Payment**
- **Primary Key:** `payment_id` (UUID, Indexed)
- Attributes:
  - `booking_id`: Foreign Key (references `Booking.booking_id`)
  - `amount`: DECIMAL, NOT NULL
  - `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### 5. **Review**
- **Primary Key:** `review_id` (UUID, Indexed)
- Attributes:
  - `property_id`: Foreign Key (references `Property.property_id`)
  - `user_id`: Foreign Key (references `User.user_id`)
  - `rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
  - `comment`: TEXT, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 6. **Message**
- **Primary Key:** `message_id` (UUID, Indexed)
- Attributes:
  - `sender_id`: Foreign Key (references `User.user_id`)
  - `recipient_id`: Foreign Key (references `User.user_id`)
  - `message_body`: TEXT, NOT NULL
  - `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships

### 1. **User to Property**
- **Relationship:** One-to-Many
- A user with the role of `host` can list multiple properties.
- The `host_id` attribute in the `Property` table references `User.user_id`.

### 2. **User to Booking**
- **Relationship:** One-to-Many
- A user with the role of `guest` can create multiple bookings.
- The `user_id` attribute in the `Booking` table references `User.user_id`.

### 3. **Property to Booking**
- **Relationship:** One-to-Many
- A property can have multiple bookings.
- The `property_id` attribute in the `Booking` table references `Property.property_id`.

### 4. **Booking to Payment**
- **Relationship:** One-to-One
- Each booking can have one associated payment.
- The `booking_id` attribute in the `Payment` table references `Booking.booking_id`.

### 5. **User to Review**
- **Relationship:** One-to-Many
- A user with the role of `guest` can leave multiple reviews for different properties.
- The `user_id` attribute in the `Review` table references `User.user_id`.

### 6. **Property to Review**
- **Relationship:** One-to-Many
- A property can have multiple reviews.
- The `property_id` attribute in the `Review` table references `Property.property_id`.

### 7. **User to Message**
- **Relationship:** Many-to-Many (via sender_id and recipient_id)
- A user can send and receive multiple messages.
- The `sender_id` and `recipient_id` attributes in the `Message` table reference `User.user_id`.

---

## Constraints and Indexing

### General Constraints
- **Primary Keys:** Automatically indexed.
- **Unique Constraints:** `email` in the `User` table.
- **Check Constraints:** `rating` in the `Review` table (1-5).

### Foreign Key Constraints
- **User Table:** Referenced by `Property.host_id`, `Booking.user_id`, `Review.user_id`, `Message.sender_id`, and `Message.recipient_id`.
- **Property Table:** Referenced by `Booking.property_id` and `Review.property_id`.
- **Booking Table:** Referenced by `Payment.booking_id`.

### Additional Indexing
- `email` in the `User` table.
- `property_id` in the `Property` and `Booking` tables.
- `booking_id` in the `Booking` and `Payment` tables.

---


