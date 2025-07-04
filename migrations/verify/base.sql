-- Verify jtbike:base on pg

BEGIN;

SELECT COUNT(*) FROM role WHERE name IN ('admin', 'client', 'technician');
SELECT COUNT(*) FROM bike_user;
SELECT COUNT(*) FROM timeslot;
SELECT COUNT(*) FROM reservation;

ROLLBACK;
