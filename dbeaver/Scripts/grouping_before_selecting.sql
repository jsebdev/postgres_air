-- this query takes a long time, about a minute
select
	a.city ,
	date_trunc('month', f.scheduled_departure) as month,
	count(*) passengers
from 
airport a 
join flight f on f.departure_airport = a.airport_code 
join booking_leg bl on f.flight_id = bl.flight_id 
join boarding_pass bp on bp.booking_leg_id = bl.booking_leg_id 
group by 1, 2
order by 3 desc;


-- this query, joins only 2 tables to get a count of passengers per flight
-- reduces the dataset size before continuing to other joins
-- returns the same result as the previous query, but takes only 25 seconds 
with ppf as (
	select
		flight_id,
		count(*) passengers
	from booking_leg bl 
	join boarding_pass bp on bp.booking_leg_id = bl.booking_leg_id 
	group by bl.flight_id
)
select
	a.city ,
	date_trunc('month', f.scheduled_departure) as month,
	SUM(ppf.passengers) passengers
from ppf
join flight f on f.flight_id = ppf.flight_id 
join airport a on f.departure_airport = a.airport_code
group by 1, 2
order by 3 desc
;

-- CTA used in the previous query
select
	flight_id,
	count(*) passengers
from booking_leg bl 
join boarding_pass bp on bp.booking_leg_id = bl.booking_leg_id 
group by bl.flight_id
order by passengers asc;


select count(*) number_of_flights from flight f ;