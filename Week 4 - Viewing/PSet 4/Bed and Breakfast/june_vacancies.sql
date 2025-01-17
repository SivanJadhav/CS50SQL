CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("availabilities"."id")
FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
HAVING "available" = 'TRUE'
AND "availabilities"."date" LIKE '2023-06-__';