SELECT count(*) as flights_with_bookings FROM flight f 
where exists(
select f.flight_id from booking_leg bl where bl.flight_id = f.flight_id
);


SELECT count(*) as flights_with_no_bookings FROM flight f 
where not exists(
select f.flight_id from booking_leg bl where bl.flight_id = f.flight_id
);