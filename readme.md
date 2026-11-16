# Event Registration and Participation Analytics System Using MySQL

## 1. Project Description

The **Event Registration and Participation Analytics System** is a database management project developed using MySQL. It is designed to manage participants, organizers, event categories, events, registrations, attendance and feedback.

The system maintains event-related information in a structured relational database and helps analyse registration trends, event capacity, participant details and feedback.

The project demonstrates important SQL concepts, including database creation, table relationships, constraints, joins, aggregate functions, subqueries, views, stored procedures and window functions.

## 2. Features

- Manage participant and organizer information.
- Store and manage events and their categories.
- Maintain participant registration records.
- Track event attendance.
- Store participant feedback and ratings.
- Analyse event registrations using SQL queries.
- Generate event and participant summaries using views.
- Retrieve information using stored procedures.
- Rank events and participants using window functions.
- Maintain relationships between tables using primary and foreign keys.

## 3. Technologies Used

| Technology      | Purpose                                         |
| --------------- | ----------------------------------------------- |
| MySQL           | Relational database management                  |
| MySQL Workbench | SQL development and database management         |
| SQL             | Database creation, manipulation and analysis    |
| EER Diagram     | Visual representation of database relationships |

## 4. Database Structure

**Database Name:** `event_registration_analytics`

The database consists of seven tables:

| Table Name         | Description                                                  |
| ------------------ | ------------------------------------------------------------ |
| `participants`     | Stores participant details.                                  |
| `organizers`       | Stores event organizer information.                          |
| `event_categories` | Stores different event categories.                           |
| `events`           | Stores event details such as name, date, venue and capacity. |
| `registrations`    | Maintains participant registrations for events.              |
| `attendance`       | Stores attendance status for registrations.                  |
| `feedback`         | Stores participant ratings and comments.                     |

### Database Relationships

- One participant can register for multiple events.
- One event can have multiple registrations.
- One organizer can organize multiple events.
- One event category can contain multiple events.
- Each registration can have at most one attendance record.
- Each registration can have at most one feedback record.

The `registrations` table acts as a bridge between the `participants` and `events` tables, resolving their many-to-many relationship.

Primary keys and foreign keys are used to maintain data integrity and establish relationships between tables.

## 5. SQL Implementation

The project includes:

| Component               | Count |
| ----------------------- | ----- |
| Database tables         | 7     |
| Sample records          | 90    |
| SQL queries             | 7     |
| Views                   | 4     |
| Stored procedures       | 6     |
| Window function queries | 4     |
| EER diagram             | 1     |

### SQL Concepts Covered

- DDL – CREATE, ALTER and DROP
- DML – INSERT, UPDATE and DELETE
- DQL – SELECT
- Constraints – PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, DEFAULT and CHECK
- Filtering – WHERE, BETWEEN, IN and LIKE
- Clauses – GROUP BY, HAVING, ORDER BY and LIMIT
- Joins – INNER JOIN and LEFT JOIN
- Aggregate functions – COUNT, AVG, MAX, MIN and SUM
- String and date functions
- Subqueries
- Views
- Stored procedures and conditional statements
- Window functions – ROW_NUMBER(), RANK() and DENSE_RANK()

## 6. Installation and Setup

### Prerequisites

- MySQL Server
- MySQL Workbench

### Steps

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL Server.
3. Open a new SQL query tab.
4. Execute the database creation script.
5. Execute the table creation scripts.
6. Insert the sample data into the respective tables.
7. Execute the remaining SQL files in the appropriate order.

## 7. How to Execute SQL Files

Open MySQL Workbench and follow these steps:

1. Go to **File → Open SQL Script**.
2. Select the required `.sql` file.
3. Review the SQL statements.
4. Click the Execute button or press `Ctrl + Shift + Enter` to execute the script.
5. Refresh the Schemas panel to view the database objects.
6. Verify the output in the Result Grid.

### Recommended Execution Order

Execute the project scripts in this logical order:

1. Database creation
2. Table creation
3. Sample data insertion
4. SQL queries
5. View creation
6. Stored procedure creation
7. Window function queries

## 8. Sample SQL Queries

### Query 1: Display Event Details with Category Names
```
SELECT
    e.event_name,
    c.category_name,
    e.event_date,
    e.venue
FROM events e
INNER JOIN event_categories c
    ON e.category_id = c.category_id;
```
**Purpose:** Retrieves event information along with the corresponding category name using an INNER JOIN.

### Query 2: Find Events with Capacity Above Average
```
SELECT
    event_id,
    event_name,
    capacity
FROM events
WHERE capacity > (
    SELECT AVG(capacity)
    FROM events
)
ORDER BY capacity DESC;
```
**Purpose:** Uses a subquery to calculate the average event capacity and displays events whose capacity is greater than the average.

## 9. Future Enhancements

- Develop a web-based interface for easier event management.
- Implement user authentication and role-based access.
- Add automated email notifications for registrations.
- Generate graphical reports and dashboards.
- Introduce advanced analytics for event participation trends.
- Add additional reporting features for organizers.

## 10. Conclusion

The Event Registration and Participation Analytics System demonstrates how MySQL can be used to design and manage a relational database for an event management scenario.

Through this project, practical knowledge of database design, SQL queries, table relationships, views, stored procedures and window functions has been applied to a real-world use case.

---