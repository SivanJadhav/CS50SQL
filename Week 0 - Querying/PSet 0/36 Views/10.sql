SELECT "english_title" AS 'English', "japanese_title" AS "Japanese", "artist" AS 'Artist' from "views"
WHERE "brightness" > 0.5 AND "contrast" > 0.4
ORDER BY "english_title" ASC;
