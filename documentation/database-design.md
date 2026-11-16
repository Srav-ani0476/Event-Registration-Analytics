# Database Design

## 1. Introduction
The project uses a relational database in MySQL to manage event-related information.

**Database Name:** `event_registration_analytics`

The database contains seven related tables.

## 2. Database Tables

| Table | Purpose | Primary Key |
|---|---|---|
| participants | Participant details | participant_id |
| organizers | Organizer details | organizer_id |
| event_categories | Event categories | category_id |
| events | Event information | event_id |
| registrations | Participant registrations | registration_id |
| attendance | Attendance records | attendance_id |
| feedback | Ratings and comments | feedback_id |

## 3. Foreign Key Relationships

- `events.category_id` → `event_categories.category_id`
- `events.organizer_id` → `organizers.organizer_id`
- `registrations.participant_id` → `participants.participant_id`
- `registrations.event_id` → `events.event_id`
- `attendance.registration_id` → `registrations.registration_id`
- `feedback.registration_id` → `registrations.registration_id`

## 4. Database Relationships

| Relationship | Cardinality |
|---|---|
| Participants → Registrations | One-to-Many |
| Events → Registrations | One-to-Many |
| Organizers → Events | One-to-Many |
| Event Categories → Events | One-to-Many |
| Registrations → Attendance | One-to-Zero-or-One |
| Registrations → Feedback | One-to-Zero-or-One |

Participants and Events have a Many-to-Many relationship resolved through the `registrations` table.

## 5. Constraints Used

- **PRIMARY KEY:** Uniquely identifies records.
- **FOREIGN KEY:** Connects related tables.
- **NOT NULL:** Prevents missing mandatory values.
- **UNIQUE:** Prevents duplicate values.
- **DEFAULT:** Assigns default values.
- **CHECK:** Restricts invalid values.
- **AUTO_INCREMENT:** Generates sequential IDs.

Additional constraints:
- Attendance status is restricted to Present or Absent.
- Feedback ratings must be between 1 and 5.
- Attendance and feedback registration IDs are UNIQUE and NOT NULL.

## 6. Database Design Approach
Separate tables are used to organize different types of information. The registrations table connects participants and events, while attendance and feedback are maintained separately.

This approach reduces unnecessary data duplication and improves consistency.

## 7. Sample Data Summary

| Table | Records |
|---|---:|
| participants | 15 |
| organizers | 4 |
| event_categories | 4 |
| events | 10 |
| registrations | 25 |
| attendance | 20 |
| feedback | 12 |
| **Total** | **90** |

## 8. Conclusion
The database uses seven related tables, keys and constraints to maintain data integrity and support event-related analysis.