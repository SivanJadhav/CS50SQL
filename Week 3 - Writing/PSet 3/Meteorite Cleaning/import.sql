-- Meteorites table schema
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

-- Importing (the Data from CSV files)
.import --csv "meteorites.csv"  "temp"

UPDATE "temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "temp"
SET "long" = NULL
WHERE "long" = '';

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name" ASC;

-- Cleaning (the Data in Database)
UPDATE "meteorites"
SET "mass" = (SELECT ROUND("mass", 2) FROM "meteorites");

UPDATE "meteorites"
SET "lat" = (SELECT ROUND("lat", 2) FROM "meteorites");

UPDATE "meteorites"
SET "long" = (SELECT ROUND("long", 2) FROM "meteorites");

DROP TABLE "temp";
