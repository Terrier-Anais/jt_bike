-- Revert jtbike:base from pg

BEGIN;

DELETE FROM reservation;
DELETE FROM timeslot;
DELETE FROM bike_user;
DELETE FROM role;

COMMIT;
