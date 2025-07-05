-- Verify jtbike:seed on pg

BEGIN;

-- Vérifie la présence des rôles
SELECT COUNT(*) AS nb_roles FROM role 
WHERE name IN ('admin', 'client');

-- Vérifie la présence des utilisateurs
SELECT COUNT(*) AS nb_utilisateurs FROM bike_user 
WHERE email IN ('anais@example.com', 'lucas@example.com');

-- Vérifie la présence des créneaux horaires (dates précises)
SELECT COUNT(*) AS nb_timeslots FROM timeslot 
WHERE day IN (
  TO_DATE('10/10/2025', 'DD/MM/YYYY'),
  TO_DATE('11/10/2025', 'DD/MM/YYYY'),
  TO_DATE('12/10/2025', 'DD/MM/YYYY')
);

-- Vérifie qu’il y a bien 2 réservations (une pour chaque utilisateur)
SELECT COUNT(*) AS nb_reservations FROM reservation 
WHERE bike_user_id IN (
  SELECT id FROM bike_user 
  WHERE email IN ('anais@example.com', 'lucas@example.com')
);

ROLLBACK;
