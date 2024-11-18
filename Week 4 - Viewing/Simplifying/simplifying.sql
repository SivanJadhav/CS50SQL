CREATE VIEW "longlist" AS
SELECT "name", "title"  FROM "authors"
JOIN "authored" ON "author"."id" = "authored"."author_id"
JOIN "books" ON "authored"."book_id" = "books"."id";