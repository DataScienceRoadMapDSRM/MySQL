USE joins;

SELECT *
FROM table_1;

SET AUTOCOMMIT = 0;

START TRANSACTION;

UPDATE table_1
SET name_1 = 'cvnji' WHERE id = 5;

SAVEPOINT point_1;

UPDATE table_1
SET name_1 = 'zzzzz' WHERE id = 1; 

ROLLBACK TO point_1;

SELECT *
FROM table_1;