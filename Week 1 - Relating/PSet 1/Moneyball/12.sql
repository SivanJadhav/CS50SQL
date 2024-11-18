SELECT "pa"."first_name", "pa"."last_name"
FROM (
    SELECT "id" AS "comm_id"
    FROM (
        SELECT pa.id AS id
        FROM "players" AS pa

        JOIN "performances" AS pe ON pa.id = pe.player_id
        JOIN "salaries" AS s ON pa.id = s.player_id

        WHERE pe.year = 2001
        AND s.year = 2001
        AND pe.H != 0

        ORDER BY ("salary" / "pe"."H") ASC

        LIMIT 10
    ) AS hits

    INTERSECT

    SELECT "id" AS "comm_id"
    FROM (
        SELECT pa.id AS id
        FROM "players" AS pa

        JOIN "performances" AS pe ON pa.id = pe.player_id
        JOIN "salaries" AS s ON pa.id = s.player_id

        WHERE pe.year = 2001
        AND s.year = 2001
        AND pe.RBI != 0

        ORDER BY ("salary" / "pe"."RBI") ASC

        LIMIT 10
    ) AS rbis
)

JOIN "players" AS pa ON "comm_id" = pa.id

ORDER BY pa.id ASC;
