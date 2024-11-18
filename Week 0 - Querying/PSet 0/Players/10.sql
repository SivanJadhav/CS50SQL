SELECT "first_name" AS 'First Name', "last_name" AS 'Last Name' FROM "players"
WHERE "debut" LIKE '2009-__-__'
ORDER BY "first_name" ASC, "last_name" ASC;
