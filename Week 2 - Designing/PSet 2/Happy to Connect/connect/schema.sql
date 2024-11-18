CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT UNIQUE NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT UNIQUE NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT UNIQUE NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "connections_people" (
    "id" INTEGER,
    "person_a_id" INTEGER,
    "person_b_id" INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY("person_a_id") REFERENCES "users"("id")
    FOREIGN KEY("person_b_id") REFERENCES "users"("id")
);

CREATE TABLE "connections_schools" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "affiliation_start_date" NUMERIC NOT NULL,
    "affiliation_end_date" NUMERIC,
    "degree_pursued" TEXT NOT NULL,
    PRIMARY KEY("id")
    FOREIGN KEY("user_id") REFERENCES "users"("id")
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "connections_companies" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "affiliation_start_date" NUMERIC NOT NULL,
    "affiliation_end_date" NUMERIC,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id")
    FOREIGN KEY("user_id") REFERENCES "users"("id")
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
