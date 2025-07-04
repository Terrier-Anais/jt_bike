-- Deploy jtbike:base to pg

BEGIN;

CREATE TABLE "role"(
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "bike_user"(
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "lastname" TEXT NOT NULL,
  "firstname" TEXT NOT NULL,
  "email" TEXT NOT NULL UNIQUE,
  "bike" TEXT,
  "suspension" TEXT,
  "password" TEXT NOT NULL,
  "role_id" INT NOT NULL REFERENCES "role"("id") ,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
  "updated_at" TIMESTAMPTZ
);


CREATE TABLE "timeslot"(
   "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   "day"  DATE NOT NULL,
   "available" BOOLEAN DEFAULT TRUE,
    UNIQUE(day),
   "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
   "updated_at" TIMESTAMPTZ
);

CREATE TABLE "reservation"(
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "bike_user_id" INT NOT NULL REFERENCES "bike_user"("id") ,
  "timeslot_id" INT NOT NULL REFERENCES "timeslot"("id"),
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
  "updated_at" TIMESTAMPTZ
);

COMMIT;
