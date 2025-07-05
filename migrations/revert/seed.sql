-- Revert jtbike:seed from pg

BEGIN;

DELETE FROM reservation 
WHERE bike_user_id IN (
  SELECT id FROM bike_user 
  WHERE email IN ('anais@example.com', 'lucas@example.com')
);

-- Supprimer les utilisateurs
DELETE FROM bike_user 
WHERE email IN ('anais@example.com', 'lucas@example.com');

-- Supprimer les créneaux horaires spécifiques
DELETE FROM timeslot 
WHERE day IN (
  TO_DATE('10/10/2025', 'DD/MM/YYYY'),
  TO_DATE('11/10/2025', 'DD/MM/YYYY'),
  TO_DATE('12/10/2025', 'DD/MM/YYYY')
);

-- Supprimer les rôles ajoutés
DELETE FROM role 
WHERE name IN ('admin', 'client');


COMMIT;
