SELECT "per_pupil_expenditure" AS 'ppe', "graduated", "schools"."name" AS 'se'
FROM "schools"
JOIN "districts" AS 'd' ON "schools"."district_id" = "d"."id"
JOIN "expenditures" AS 'e' ON "e"."district_id" = "d"."id"
JOIN "graduation_rates" AS 'g' ON "g"."school_id" = "schools"."id"
ORDER BY "ppe" DESC, "se" ASC;
