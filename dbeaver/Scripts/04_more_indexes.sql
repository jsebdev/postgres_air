-- additional indexes

SET search_path TO postgres_air;

CREATE INDEX flight_arrival_airport ON flight(arrival_airport);
CREATE INDEX booking_leg_flight_id ON booking_leg(flight_id);
CREATE INDEX flight_actual_departure ON flight(actual_departure);
CREATE INDEX boarding_pass_booking_leg_id ON boarding_pass(booking_leg_id);
CREATE INDEX booking_update_ts ON booking(update_ts);

analyze boarding_pass;
analyze flight;
analyze booking_leg;
analyze booking;
