SELECT "first_name", "last_name"
FROM "players" AS 'p'
JOIN "salaries" AS 's' ON "p"."id" = "s"."player_id"
WHERE "salary" = (SELECT MAX("salary") FROM "salaries");
