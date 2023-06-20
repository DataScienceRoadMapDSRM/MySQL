/*  
-- TCL stands for Transaction Control Language 
-- TCL commands used to have more control on transactions
-- A transcation can be defined as one or more logical SQL statements made using INSERT, 
   UPDATE or DELETE commands (Data Manipulation Language commands DML)
-- MySQL treats a transaction as a single unit with one or more logical statements
   that can be saved or not
   
-- Transactions commands are COMMIT, ROLLBACK and SAVEPOINT
-- COMMIT used to permanently save changes made
-- ROLLBACK used to go back to a savepoint or to the previous state before the current 
   transaction without saving the changes
-- SAVEPOINT used to create savepoints which allows to save one part of the transaction

-- A transcation starts with "START TRANSACTION"
-- A transaction ends when is is committed (using COMMIT) or rolledback (using ROLLBACK)
*/

USE joins;

SELECT *
FROM table_1;

-- By default, all changes are saved automatically in MySQL
-- To remove that we set autocommit = 0

SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO table_1
VALUES(6, 'sdfg');

COMMIT;
-- ROLLBACK;

SELECT *
FROM table_1;

DELETE FROM  table_1
WHERE id=6;



























