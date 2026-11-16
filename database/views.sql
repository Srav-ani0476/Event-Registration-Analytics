/*Create a view that displays the event name, event date, category name, organizer name and event status.*/
create view event_details_view as 
select e.event_name,e.event_date,c.category_name,o.organizer_name,e.event_status from events e
inner join event_categories c
on e.category_id=c.category_id
inner join organizers o
on e.organizer_id=o.organizer_id;

select * from event_details_view;

/*Create a view displaying participant name, email, event name, registration date and registration status.*/
create view participant_registration_view as
select p.participant_name,p.email,e.event_name,r.registration_date,r.registration_status from participants p
inner join registrations r 
on p.participant_id=r.participant_id
inner join events e
on r.event_id=e.event_id;

select * from participant_registration_view;

/*Create a view displaying each event name, its category and total number of registrations. Include only events having at least one registration.*/
create view event_registration_summary as 
select e.event_name,c.category_name,count(r.registration_id) as total_registrations from events e
inner join event_categories c
on e.category_id=c.category_id
inner join registrations r
on e.event_id=r.event_id
group by e.event_id,e.event_name,c.category_name;

select * from event_registration_summary;

/*Create a view displaying participant name, event name, feedback rating and feedback comments. Include only feedback with a rating of 4 or higher.*/
create view participant_feedback_view as 
select p.participant_name,e.event_name,f.rating,f.comments from feedback f
inner join registrations r
on f.registration_id=r.registration_id
inner join participants p
on r.participant_id=p.participant_id
inner join events e
on r.event_id=e.event_id
where f.rating>=4;

select * from participant_feedback_view;