SET search_path TO postgres_air;
CREATE INDEX flight_departure_airport ON flight(departure_airport);
CREATE INDEX flight_scheduled_departure ON flight(scheduled_departure);
CREATE INDEX flight_update_ts ON flight(update_ts);
CREATE INDEX booking_leg_booking_id ON booking_leg(booking_id);
CREATE INDEX booking_leg_update_ts ON booking_leg(update_ts);
CREATE INDEX account_last_name ON account(last_name);