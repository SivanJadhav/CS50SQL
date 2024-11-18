CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT UNIQUE NOT NULL,
    "gluten_free_condition" TEXT NOT NULL CHECK("gluten_free_condition" IN ('true', 'false')),
    "price" NUMERIC NOT NULL,
    "ingredients_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "order_number" INTEGER,
    "ordered_items" TEXT NOT NULL,
    "customer_id" INTEGER NOT NULL,
    PRIMARY KEY("order_number"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_id" INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY("order_id") REFERENCES "orders"("order_number")
);
