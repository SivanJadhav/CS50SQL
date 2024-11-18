SELECT "t"."name"
FROM "teams" AS 't'

JOIN "performances" AS 'pe' ON "t"."id" = "pe"."team_id"
JOIN "players" AS 'pa' ON "pe"."player_id" = "pa"."id"

WHERE "pa"."first_name" = 'Satchel'
AND "pa"."last_name" = 'Paige';
