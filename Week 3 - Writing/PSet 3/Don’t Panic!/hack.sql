-- Altering
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- Adding and Erasing
UPDATE "user_logs"
SET "type" = 'update', "old_username" = 'admin', "new_username" = 'admin', "new_password" = (SELECT "password" FROM "users" WHERE "username" = 'emily33');