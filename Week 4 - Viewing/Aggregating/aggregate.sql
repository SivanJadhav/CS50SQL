CREATE VIEW "average_book_ratings" AS
SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "books"
JOIN "ratings" ON "books"."id" = "ratings"."book_id"
GROUP BY "books"."id";