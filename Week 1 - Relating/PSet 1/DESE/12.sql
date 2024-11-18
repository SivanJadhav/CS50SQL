SELECT "name", "per_pupil_expenditure" AS 'ppe', "exemplary"
FROM "expenditures" AS 'e'

JOIN "districts" AS 'd' ON "e"."district_id" = "d"."id"
JOIN "staff_evaluations" AS 's' ON "e"."district_id" = "s"."district_id"

WHERE "type" = "Public School District"
AND "exemplary" > (
    SELECT AVG("exemplary")
    FROM "staff_evaluations"
)
AND "ppe" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)

ORDER BY "exemplary" DESC, "ppe" DESC;
