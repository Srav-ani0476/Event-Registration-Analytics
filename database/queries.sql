/* Display the event name, event date, category name and total registrations for completed events conducted between March and June 2026. 
Show only events with more than 2 registrations and sort by registration count in descending order.*/

select e.event_name,e.event_date,c.category_name,count(r.registration_id) as total_registrations from events e
inner join event_categories c on e.category_id=c.category_id
inner join registrations r on e.event_id=r.event_id
where e.event_status='completed'
and e.event_date between '2026-03-01' and '2026-06-30'
group by e.event_id,e.event_name,e.event_date,c.category_name
having count(r.registration_id)>2
order by total_registrations desc;

/* The college wants to identify participants whose names start with 'A' and who registered for events during March and April 2026.
Display the participant name in uppercase, email address, registration date and registration status. 
Show only registrations with the status 'Registered' and arrange the results from newest to oldest.*/

select upper(p.participant_name) as participant_name,lower(p.email) as email,r.registration_date,r.registration_status from participants p
inner join registrations r on p.participant_id=r.participant_id
where p.participant_name like 'A%'
and r.registration_date between '2026-03-01' and '2026-04-31'
and r.registration_status='Registered'
order by r.registration_date desc;

/* The college wants to find events with a capacity between 50 and 120 seats that are either completed or upcoming.
Display the event name, venue, capacity and event status. 
Show events conducted at venues containing the word 'Hall' and arrange them by capacity from highest to lowest.*/

select event_name,venue,capacity,event_status from events
where capacity between 50 and 120
and event_status in ('completed','upcoming')
and venue like '%hall%'
order by capacity desc;

/* The college wants to display upcoming events scheduled after today's date. 
Show the event name, event date, month name and the number of days remaining until each event. 
Arrange the results by event date, earliest first.*/

select event_name,event_date,monthname(event_date) as event_month,datediff(event_date,curdate()) as days_remaining from events 
where event_status ='upcoming'
and event_date>curdate()
order by event_date asc; 

/* Display the category name and total number of registrations for events conducted in 2026. 
Consider only completed events and show categories having more than 3 registrations. 
Arrange the results by total registrations in descending order.*/

select c.category_name,count(r.registration_id) as total_registrations
from event_categories c
inner join events e on c.category_id=e.category_id
inner join registrations r on e.event_id=r.event_id
where e.event_status ='completed'
and year(e.event_date)=2026
group by c.category_id,c.category_name
having count(r.registration_id)>3
order by total_registrations desc;

/* The college wants to display feedback details submitted by participants.
Show the participant name, event name and feedback rating for all feedback records where the rating is 4 or higher.
Display the highest ratings first.*/

select p.participant_name,e.event_name,f.rating
from feedback f
inner join registrations r on f.registration_id=r.registration_id
inner join participants p on r.participant_id =p.participant_id
inner join events e on r.event_id=e.event_id
where f.rating>=4
order by f.rating desc;

/* The college management wants to identify events whose seating capacity is greater than the average capacity of all events.
Display the event name, category name, capacity and event status. 
Show only events with capacity greater than the overall average capacity and arrange them from highest to lowest capacity.*/

select e.event_name,c.category_name,e.capacity,e.event_status
from events e
inner join event_categories c
on e.category_id=c.category_id
where e.capacity>(select avg(capacity) from events)
order by e.capacity desc;