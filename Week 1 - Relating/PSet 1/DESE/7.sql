SELECT "name" FROM "schools"
WHERE "district_id" = (
    SELECT "id" FROM "districts"
    WHERE "districts"."name" = 'Cambridge'
);