CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("reviews"."id")
FROM "listings"
JOIN "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "reviews"."listing_id"
ORDER BY COUNT("reviews"."id") DESC, "property_type" ASC, "host_name" ASC
LIMIT 100;