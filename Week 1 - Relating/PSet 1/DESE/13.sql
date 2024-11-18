SELECT "s"."name", "d"."name"
FROM "schools" AS "s"

JOIN "districts" AS "d" ON "s"."district_id" = "d"."id"

WHERE "s"."type" = 'Charter School'

LIMIT 10;
