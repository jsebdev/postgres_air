-- total number of passengers in flight id = 1
select f.flight_id, count(p.passenger_id)  from mydatabase.postgres_air.flight f
join mydatabase.postgres_air.booking_leg bl on bl.flight_id  = f.flight_id
join mydatabase.postgres_air.passenger p on p.booking_id = bl.booking_id
where f.flight_id = 1
group by f.flight_id

-- total number of passengers by booking leg in flight id = 1
select bl.booking_leg_id, count(p.passenger_id)  from mydatabase.postgres_air.flight f
join mydatabase.postgres_air.booking_leg bl on bl.flight_id  = f.flight_id
join mydatabase.postgres_air.passenger p on p.booking_id = bl.booking_id
where f.flight_id = 1
group by bl.booking_leg_id