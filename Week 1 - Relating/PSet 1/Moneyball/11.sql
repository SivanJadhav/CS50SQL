SELECT "first_name", "last_name", ("salary" / "H") AS 'dollars per hit'
FROM "players" AS pa

JOIN "salaries" AS s ON pa.id = s.player_id
JOIN "performances" AS pe ON pa.id = pe.player_id

WHERE pe.year = 2001 AND s.year = 2001
AND "H" != 0

ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC

LIMIT 10;
