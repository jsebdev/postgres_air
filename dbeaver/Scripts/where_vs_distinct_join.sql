
explain
SELECT count(*) as flights_with_bookings_using_exists FROM flight f 
where exists(
select f.flight_id from booking_leg bl where bl.flight_id = f.flight_id
);
-- takes about 0.83 sec, result 508844

explain
select count(*) as flights_with_bookings_using_join_distinct from flight f
join (
select distinct bl.flight_id from booking_leg bl 
) using (flight_id);
-- takes about 1.4 sec, result 508844