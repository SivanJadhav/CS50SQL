SELECT "name", "per_pupil_expenditure" AS 'ppe'
FROM "expenditures" AS 'e'
JOIN "districts" AS 'd' ON "d"."id" = "e"."district_id"
WHERE "d"."type" = 'Public School District'
ORDER BY "ppe" DESC
LIMIT 10;
