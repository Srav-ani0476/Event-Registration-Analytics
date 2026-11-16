/*Display all events along with a unique sequential row number, arranged by event date.*/
select event_id,event_name,event_date,row_number() over(order by event_date) as row_num
from events;

/*Display all events with their capacity-based rankings, starting from the highest capacity.*/
select event_id,event_name,capacity,rank() over(order by capacity desc) as event_rank 
from events;

/*Display participants along with their total number of registrations and rank them based on registration count, from highest to lowest.*/
select participant_id,count(*) as total_registrations,dense_rank() over(order by count(*) desc) as registration_rank
from registrations
group by participant_id;

/*Display all events with their category-wise sequential row numbers, arranging events within each category by capacity from highest to lowest.*/
select e.event_name,c.category_name,e.capacity,row_number()
over(partition by c.category_name order by e.capacity desc) as row_num
from events e
inner join event_categories c
on e.category_id=c.category_id;