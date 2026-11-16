CREATE TABLE participants (
    participant_id INT PRIMARY KEY AUTO_INCREMENT,
    participant_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE organizers (
    organizer_id INT PRIMARY KEY AUTO_INCREMENT,
    organizer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE
);

CREATE TABLE event_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    organizer_id INT NOT NULL,
    event_date DATE NOT NULL,
    venue VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    event_status VARCHAR(20) DEFAULT 'Upcoming',
    FOREIGN KEY (category_id) REFERENCES event_categories(category_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id),
    CHECK (capacity > 0),
    CHECK (event_status IN ('Upcoming', 'Completed', 'Cancelled'))
);

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    participant_id INT NOT NULL,
    event_id INT NOT NULL,
    registration_date DATE DEFAULT (CURRENT_DATE),
    registration_status VARCHAR(20) DEFAULT 'Registered',
    FOREIGN KEY (participant_id) REFERENCES participants(participant_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    UNIQUE (participant_id, event_id),
    CHECK (registration_status IN ('Registered', 'Cancelled'))
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_id INT NOT NULL UNIQUE,
    attendance_status VARCHAR(20) DEFAULT 'Absent',
    FOREIGN KEY (registration_id) REFERENCES registrations(registration_id),
    CHECK (attendance_status IN ('Present', 'Absent'))
);

CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_id INT NOT NULL UNIQUE,
    rating INT NOT NULL,
    comments VARCHAR(500),
    feedback_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (registration_id) REFERENCES registrations(registration_id),
    CHECK (rating BETWEEN 1 AND 5)
);

desc participants;
desc organizers;
desc event_categories;
desc events;
desc registrations;
desc attendance;
desc feedback;