SELECT "t"."name", SUM("H") AS 'total hits'
FROM "performances" AS 'p'
JOIN "teams" AS 't' ON "p"."team_id" = "t"."id"
WHERE "p"."year" = 2001
GROUP BY "team_id"
ORDER BY "total hits" DESC
LIMIT 5;
