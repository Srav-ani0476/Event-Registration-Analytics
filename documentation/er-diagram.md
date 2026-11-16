# Entity Relationship Diagram (ER Diagram)

## 1. Introduction
An Entity Relationship Diagram (ER Diagram) represents database entities and their relationships.

The EER diagram for this project was generated using MySQL Workbench.

## 2. Entities
The database contains seven entities:

1. Participants
2. Organizers
3. Event Categories
4. Events
5. Registrations
6. Attendance
7. Feedback

## 3. Keys
Each entity has a Primary Key (PK) to uniquely identify records. Foreign Keys (FK) connect related entities.

| Table | Primary Key | Foreign Keys |
|---|---|---|
| participants | participant_id | — |
| organizers | organizer_id | — |
| event_categories | category_id | — |
| events | event_id | category_id, organizer_id |
| registrations | registration_id | participant_id, event_id |
| attendance | attendance_id | registration_id |
| feedback | feedback_id | registration_id |

## 4. Relationships
- Participants → Registrations (1:N)
- Events → Registrations (1:N)
- Organizers → Events (1:N)
- Event Categories → Events (1:N)
- Registrations → Attendance (1:0..1)
- Registrations → Feedback (1:0..1)

Participants and Events have a Many-to-Many relationship through Registrations.

## 5. Diagram Creation
The EER diagram was generated using the Reverse Engineer option in MySQL Workbench.

Steps:
1. Connect to the MySQL server.
2. Select the project database.
3. Open Database → Reverse Engineer.
4. Select the schema and complete the process.
5. Generate the EER diagram.

## 6. Conclusion
The EER diagram provides a visual representation of the seven database entities, their keys and relationships.