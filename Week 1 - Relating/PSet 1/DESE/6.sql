SELECT "name" FROM "schools" AS 's'
JOIN "graduation_rates" AS 'g' ON "s"."id" = "g"."school_id"
WHERE "graduated" = 100;
