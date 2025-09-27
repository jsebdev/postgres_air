select * from flight f limit 1;

explain SELECT flight_id, departure_airport  FROM flight f;
explain SELECT flight_id, flight_no  FROM flight f where f.flight_id = 1;
SELECT flight_id, flight_no  FROM flight f where f.flight_id = 1;
explain SELECT flight_id, flight_no  FROM flight f where f.flight_id = 1;
select f.flight_id, f.flight_no from flight f where f.flight_no = '2935';
explain select f.flight_id from flight f where f.flight_no = '2935';


select f.flight_id, bl.booking_id from flight f 
join booking_leg bl on bl.flight_id = f.flight_id
where f.flight_id = 1 ;

explain
select f.flight_id, bl.booking_id from flight f 
join booking_leg bl on bl.flight_id = f.flight_id
where f.flight_id = 1 ;

select f.flight_id from flight f 
where f.departure_airport = 'MEX';

select f.departure_airport from flight f 
where f.departure_airport = 'MEX';

explain
select f.departure_airport from flight f 
where f.departure_airport = 'MEX';

select f.flight_id, f.arrival_airport from flight f 
where f.departure_airport = 'MEX' and f.arrival_airport = 'MLM';

explain
select f.flight_id, f.arrival_airport from flight f 
where f.departure_airport = 'MEX' and f.arrival_airport = 'MLM';









