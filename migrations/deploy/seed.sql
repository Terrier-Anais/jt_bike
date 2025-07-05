-- Deploy jtbike:seed to pg

BEGIN;

-- Insertion des rôles
INSERT INTO role (name) VALUES 
  ('admin'),
  ('client');

-- Insertion des utilisateurs
INSERT INTO bike_user (lastname, firstname, email, bike, suspension, password, role_id)
VALUES 
  ('Terrier', 'Anaïs', 'anais@example.com', 'Lapierre Edge 5.9', 'avant/arrière', 'hashed_password_1', 1),
  ('Martin', 'Lucas', 'lucas@example.com', 'Rockrider 540', 'avant', 'hashed_password_2', 2);

-- Insertion des créneaux horaires avec dates explicites
INSERT INTO timeslot (day)
VALUES 
  (TO_DATE('10/10/2025', 'DD/MM/YYYY')),
  (TO_DATE('11/10/2025', 'DD/MM/YYYY')),
  (TO_DATE('12/10/2025', 'DD/MM/YYYY'));

-- Insertion des réservations
-- NB : les IDs de timeslot supposent que ce sont les 3 premiers insérés
-- Si besoin, fais des SELECT pour lier dynamiquement
INSERT INTO reservation (bike_user_id, timeslot_id)
VALUES
  (1, 1),  -- Anaïs réservée pour le 10/10/2025
  (2, 2);  -- Lucas réservée pour le 11/10/2025


COMMIT;
