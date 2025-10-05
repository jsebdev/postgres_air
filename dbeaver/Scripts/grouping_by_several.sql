select count(*) as number_of_flights from flight f ;

select count(*) as number_of_passanger from passenger p ;

select count(*) as number_of_booking_legs from booking_leg bl ;

select
count(*) as number_of_join_f_bl
from flight f
join booking_leg bl on bl.flight_id = f.flight_id
;

select
count(*) as number_of_join_f_bl_p
from flight f
join booking_leg bl on bl.flight_id = f.flight_id
join passenger p on p.booking_id = bl.booking_id 
;

select
count(*) as number_of_join_bl_p
from booking_leg bl 
join passenger p on p.booking_id = bl.booking_id 
;

select
	f.flight_no,
	count(p.passenger_id) as passenger_count
from flight f
join booking_leg bl on bl.flight_id = f.flight_id
join passenger p on p.booking_id = bl.booking_id 
group by f.flight_no 
;

select
	f.flight_no,
	f.scheduled_arrival - f.scheduled_departure as flight_length,
	count(p.passenger_id) as passenger_count
from flight f
join booking_leg bl on bl.flight_id = f.flight_id
join passenger p on p.booking_id = bl.booking_id 
group by f.flight_no, flight_length 
;

