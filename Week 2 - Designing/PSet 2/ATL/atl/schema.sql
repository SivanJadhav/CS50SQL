CREATE TABLE "passengers" (
    "id" NUMERIC,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" NUMERIC,
    "datetime" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "flight_id" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER,
    "airline_id" INTEGER,
    "departing_airport_code" TEXT,
    "arrival_airport_code" TEXT,
    "expected_departure_time" TEXT,
    "expected_arrival_time" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
)
