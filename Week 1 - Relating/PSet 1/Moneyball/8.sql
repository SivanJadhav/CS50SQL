SELECT "salary"
FROM "salaries" AS 's'
JOIN "performances" AS 'p' ON "s"."player_id" = "p"."player_id"
WHERE "HR" = (SELECT MAX("HR") FROM "performances")
AND "p"."year" = 2001
AND "s"."year" = 2001;
