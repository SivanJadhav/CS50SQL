-- Creating a table for storing the triplets
CREATE TABLE "triplets" (
    "id" INTEGER,
    "sentence_number" INTEGER,
    "first_character" INTEGER,
    "length" INTEGER,
    PRIMARY KEY("id")
);

-- Creating a trigger and a table for finding and keeping the message
CREATE TABLE "decrypted_messages" (
    "id" INTEGER,
    "message" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TRIGGER "decryptor"
AFTER INSERT ON "triplets"
FOR EACH ROW
BEGIN
    INSERT INTO "decrypted_messages"("message")
    VALUES (
        SUBSTR(
            (SELECT "sentence" FROM "sentences" WHERE "id" = NEW."sentence_number"),
            NEW."first_character",
            NEW."length"
        )
    );
END;

-- Inserting the triplets into the table
INSERT INTO "triplets"("sentence_number", "first_character", "length")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

-- Creating the view

-- CS50 AI DDB told me about GROUP CONCAT and REPLACE
CREATE VIEW "message" AS
SELECT REPLACE(GROUP_CONCAT(TRIM("message") ORDER BY "id" ASC), ',', ' ') AS "phrase"
FROM "decrypted_messages";