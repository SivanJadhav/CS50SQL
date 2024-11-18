SELECT "year", "salary"
FROM "salaries" AS 's'
JOIN "players" AS 'p' ON "p"."id" = "s"."player_id"
WHERE "first_name" = 'Cal'
AND "last_name" = 'Ripken'
ORDER BY "year" DESC;
