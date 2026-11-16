insert into participants
(participant_name, email, phone, registration_date)
values
('Aarav Malhotra', 'aarav@gmail.com', '9876500001', '2026-01-05'),
('Saanvi Kapoor', 'saanvi@gmail.com', '9876500002', '2026-01-06'),
('Aditya Rao', 'aditya@gmail.com', '9876500003', '2026-01-08'),
('Ishita Menon', 'ishita@gmail.com', '9876500004', '2026-01-10'),
('Ritvik Sharma', 'ritvik@gmail.com', '9876500005', '2026-01-12'),
('Kavya Iyer', 'kavya@gmail.com', '9876500006', '2026-01-15'),
('Nikhil Verma', 'nikhil@gmail.com', '9876500007', '2026-01-18'),
('Aditi Deshmukh', 'aditi@gmail.com', '9876500008', '2026-01-20'),
('Vihaan Reddy', 'vihaan@gmail.com', '9876500009', '2026-01-22'),
('Mira Joshi', 'mira@gmail.com', '9876500010', '2026-01-25'),
('Reyansh Nair', 'reyansh@gmail.com', '9876500011', '2026-02-01'),
('Tara Choudhary', 'tara@gmail.com', '9876500012', '2026-02-03'),
('Devansh Gupta', 'devansh@gmail.com', '9876500013', '2026-02-05'),
('Rhea Kulkarni', 'rhea@gmail.com', '9876500014', '2026-02-08'),
('Kabir Mehta', 'kabir@gmail.com', '9876500015', '2026-02-10');
select * from participants;

insert into organizers
(organizer_name, email, phone)
values
('Tech Events Team', 'tech@gmail.com', '9876510001'),
('Cultural Committee', 'cultural@gmail.com', '9876510002'),
('Sports Association', 'sports@gmail.com', '9876510003'),
('Career Development Cell', 'career@gmail.com', '9876510004');
select * from organizers;

insert into event_categories
(category_name, description)
values
('Technical', 'Technical competitions and seminars'),
('Cultural', 'Cultural and artistic activities'),
('Sports', 'Indoor and outdoor sports events'),
('Workshop', 'Skill development workshops');
select * from event_categories;

insert into events
(event_name, category_id, organizer_id, event_date, venue, capacity, event_status)
values
('Python Hackathon', 1, 1, '2026-03-10', 'Seminar Hall', 100, 'Completed'),
('Web Development Workshop', 4, 4, '2026-03-15', 'Lab 1', 50, 'Completed'),
('Annual Cultural Fest', 2, 2, '2026-04-05', 'Auditorium', 200, 'Completed'),
('Cricket Tournament', 3, 3, '2026-04-12', 'Sports Ground', 80, 'Completed'),
('AI and ML Seminar', 1, 1, '2026-05-10', 'Seminar Hall', 120, 'Completed'),
('Resume Building Workshop', 4, 4, '2026-05-18', 'Conference Hall', 60, 'Completed'),
('Dance Competition', 2, 2, '2026-06-05', 'Auditorium', 100, 'Completed'),
('Coding Competition', 1, 1, '2026-11-15', 'Lab 2', 100, 'Upcoming'),
('Photography Contest', 2, 2, '2026-11-20', 'Open Auditorium', 75, 'Upcoming'),
('Cloud Computing Workshop', 4, 4, '2026-12-05', 'Lab 3', 50, 'Upcoming');
select * from events;

insert into registrations
(participant_id, event_id, registration_date, registration_status)
values
(1, 1, '2026-03-01', 'Registered'),
(2, 1, '2026-03-02', 'Registered'),
(3, 1, '2026-03-03', 'Registered'),
(4, 1, '2026-03-04', 'Registered'),
(5, 2, '2026-03-05', 'Registered'),
(6, 2, '2026-03-06', 'Registered'),
(1, 3, '2026-03-20', 'Registered'),
(7, 3, '2026-03-22', 'Registered'),
(8, 3, '2026-03-25', 'Registered'),
(9, 4, '2026-04-01', 'Registered'),
(10, 4, '2026-04-02', 'Registered'),
(2, 5, '2026-05-01', 'Registered'),
(3, 5, '2026-05-02', 'Registered'),
(11, 5, '2026-05-03', 'Registered'),
(12, 6, '2026-05-10', 'Registered'),
(13, 6, '2026-05-11', 'Registered'),
(14, 7, '2026-05-25', 'Registered'),
(15, 7, '2026-05-26', 'Registered'),
(4, 8, '2026-10-20', 'Registered'),
(5, 8, '2026-10-21', 'Registered'),
(6, 9, '2026-10-22', 'Registered'),
(7, 9, '2026-10-23', 'Registered'),
(8, 8, '2026-10-24', 'Cancelled'),
(9, 8, '2026-10-25', 'Registered'),
(10, 9, '2026-10-26', 'Registered');
select * from registrations;

insert into attendance
(registration_id, attendance_status)
values
(1, 'Present'),
(2, 'Present'),
(3, 'Absent'),
(4, 'Present'),
(5, 'Present'),
(6, 'Absent'),
(7, 'Present'),
(8, 'Present'),
(9, 'Present'),
(10, 'Present'),
(11, 'Absent'),
(12, 'Present'),
(13, 'Present'),
(14, 'Absent'),
(15, 'Present'),
(16, 'Present'),
(17, 'Present'),
(18, 'Absent'),
(19, 'Present'),
(20, 'Absent');
select * from attendance;

insert into feedback
(registration_id, rating, comments, feedback_date)
values
(1, 5, 'Excellent hackathon experience', '2026-03-10'),
(2, 4, 'Good event organisation', '2026-03-10'),
(4, 5, 'Very interesting competition', '2026-03-10'),
(5, 4, 'Useful workshop', '2026-03-15'),
(7, 5, 'Enjoyed the cultural fest', '2026-04-05'),
(8, 4, 'Amazing performances', '2026-04-05'),
(9, 3, 'Good event', '2026-04-05'),
(10, 4, 'Well organised tournament', '2026-04-12'),
(12, 5, 'Very informative seminar', '2026-05-10'),
(13, 4, 'Learned new concepts', '2026-05-10'),
(15, 5, 'Helpful workshop', '2026-05-18'),
(17, 4, 'Enjoyed the competition', '2026-06-05');
select * from feedback;
