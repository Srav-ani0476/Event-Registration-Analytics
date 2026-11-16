/*Procedure 1 – Display Completed Events
The college management wants to view all completed events along with their names, dates, venues and capacities.*/
delimiter //
create procedure get_completed_events()
begin
select event_name,event_date,venue,capacity,event_status as status
from events
where event_status='completed'
order by event_date;
end //
delimiter ;
call get_completed_events();

/*Procedure 2: Event Feedback Summary
Display each event's name, total number of feedback responses, and average feedback rating. Display the events in descending order of their average ratings.*/
delimiter //
create procedure get_feedback_summary()
begin
select e.event_name,count(f.feedback_id) as total_feedbacks,
avg(f.rating) as average_rating
from events e
left join registrations r
on e.event_id=r.event_id
left join feedback f
on r.registration_id=f.registration_id
group by e.event_id,e.event_name
order by average_rating desc;
end //
delimiter ;
call get_feedback_summary();

/*Procedure 3 – Events by Category.
The college wants to view events belonging to a particular category. Create a stored procedure that accepts a category name and displays the event name, event date, venue and event status.*/
delimiter //
create procedure get_events_by_category(in p_category varchar(50))
begin
select e.event_name,e.event_date,e.venue,e.event_status
from events e
inner join event_categories c
on e.category_id=c.category_id
where c.category_name=p_category
order by e.event_date;
end //
delimiter ;
call get_events_by_category('Technical');

/*Procedure 4: Participant Registration Count
Write a stored procedure to calculate and return the total number of registrations made by a particular participant.*/
delimiter //
create procedure get_registration_count(in p_participant_id int,out p_count int)
begin
select count(*) into p_count 
from registrations
where participant_id=p_participant_id;
end //
delimiter ;
call get_registration_count(1,@count);
select @count;

/*Procedure 5: Update Event Capacity
Write a stored procedure to increase an event's existing capacity by a given number and return the updated capacity.*/
delimiter //
create procedure update_event_capacity(in p_event_id int,inout p_capacity int)
begin
select capacity+p_capacity
into p_capacity
from events
where event_id=p_event_id;
end //
delimiter ;
set @capacity=20;
call update_event_capacity(1,@capacity);
select @ capacity;