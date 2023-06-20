USE joins;

SELECT *
FROM table_1;

SET AUTOCOMMIT = 0;

START TRANSACTION;

DELETE FROM table_1
WHERE id = 5;

SAVEPOINT point_A;

UPDATE table_1
SET name_1 = 'zzzzz' WHERE id = 1; 

ROLLBACK TO point_A;

SELECT *
FROM table_1;