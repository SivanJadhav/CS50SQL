SELECT "first_name", "last_name", "salary", "HR", "s"."year"
FROM "players" AS pa

JOIN "salaries" AS s ON pa.id = s.player_id
JOIN "performances" AS pe ON pa.id = pe.player_id

WHERE s.year = pe.year

ORDER BY pa.id ASC, s.year DESC, pe.HR DESC, s.salary DESC;
