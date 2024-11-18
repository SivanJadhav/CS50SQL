
-- *** The Lost Letter ***

-- Finding the id of the 'from' and 'to' addresses (I'll nest them later)

--  'From':
SELECT "id" FROM "addresses"
WHERE "address" = '900 Somerville Avenue';

--  'To' (Through one query--SELECT "id", "address" FROM "addresses" WHERE "address" LIKE '2 F%';-- I learnt that it's not "Finnegen" but "Finnigan". I kind of had predicted as Anneke had said that, "That address, let me tell you: it was a bit tricky to get right the first time."):
SELECT "id" FROM "addresses"
WHERE "address" = '2 Finnigan Street';

-- Finding the id and contents of the package to confirm that it's the right one
SELECT "id", "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '2 Finnigan Street'
);

-- From scans, getting what was the address id where the action was dropped, latest one
SELECT "address_id" FROM "scans"
WHERE "package_id" = (
    SELECT "id" AS "package id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
    )
    AND "to_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '2 Finnigan Street'
    )
)
AND "action" = 'Drop'
ORDER BY "timestamp" DESC
LIMIT 1;

-- Finding where it ended up and what kind of location was it
SELECT "type", "address" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" AS "package id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '2 Finnigan Street'
        )
    )
    AND "action" = 'Drop'
    ORDER BY "timestamp" DESC
    LIMIT 1
);

-- *** The Devious Delivery ***

-- Finding the data of the package with no 'From' address
SELECT * FROM "packages"
WHERE "from_address_id" IS NULL;

-- Finding the type of address where the package with the correct id last dropped (Some things like "addresses" AS 'a', are the things I learnt in CS50x, not plagarized.)
SELECT "type" FROM "addresses" AS 'a'
JOIN "scans" AS 's' ON "s"."address_id" = "a"."id"
JOIN "packages" AS 'p' ON "p"."id" = "s"."package_id"
WHERE "from_address_id" IS NULL
ORDER BY "s"."timestamp" DESC
LIMIT 1;

-- *** The Forgotten Gift ***

-- Finding the data of the package
SELECT * FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);

-- Now let's find which the last driver did something (Pick or Drop) to it
SELECT "name", "s"."action" FROM "drivers" AS 'd'
JOIN "scans" AS 's' ON "d"."id" = "s"."driver_id"
JOIN "packages" AS 'p' ON "s"."package_id" = "p"."id"
WHERE "p"."id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
    AND "to_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
)
ORDER BY "s"."timestamp" DESC
LIMIT 1;
