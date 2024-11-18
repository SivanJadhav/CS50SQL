SELECT "d"."name" AS 'District' FROM "districts" AS 'd'
JOIN "expenditures" AS 'e' ON "d"."id" = "e"."district_id"
WHERE "pupils" = (SELECT MIN("pupils") FROM "expenditures");
