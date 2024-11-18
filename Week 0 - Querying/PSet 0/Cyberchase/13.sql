SELECT "title", "topic", "air_date" FROM "episodes"
WHERE "topic" LIKE '%algebra%'
OR "topic" LIKE '%number theory%'
ORDER BY "title" ASC;
