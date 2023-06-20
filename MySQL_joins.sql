CREATE DATABASE joins;

USE joins;

CREATE TABLE table_1(
id INT,
name_1 VARCHAR(20));

CREATE TABLE table_2(
name_2 VARCHAR(20));

CREATE TABLE table_3(
id INT);

INSERT INTO table_1
VALUES(1, 'abc'),
	  (2, 'def'),
      (3, 'ghi'),
      (4, 'jkl');
       
SELECT *
FROM table_1;


INSERT INTO table_2
VALUES('abc'),
	  ('opk'),
      ('lmn'),
      ('jkl');

SELECT *
FROM table_2;

INSERT INTO table_3
VALUES('1'),
	  ('4');
      
SELECT *
FROM table_3;

-- INNER Join
SELECT *
FROM table_1
INNER  JOIN table_2 ON table_1.name_1 = table_2.name_2;

-- Left Outer Join
SELECT *
FROM table_1
LEFT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2;

-- Right Outer Join
SELECT *
FROM table_1
RIGHT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2;

-- Full Outer Join in MySQL without  duplicates
SELECT *
FROM table_1
LEFT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2
UNION
SELECT *
FROM table_1
RIGHT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2;

-- Full Outer Join in MySQL with  duplicates
SELECT *
FROM table_1
LEFT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2
UNION ALL
SELECT *
FROM table_1
RIGHT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2;

-- CROSS Join
SELECT *
FROM table_1
CROSS JOIN table_2
ORDER BY table_1.id;

-- NATURAL Join
SELECT *
FROM table_1
NATURAL JOIN table_3;

-- Left Outer Join (IF NULL)
SELECT *
FROM table_1
LEFT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2
WHERE table_2.name_2 IS NULL;

-- Right Outer Join (IF NULL)
SELECT *
FROM table_1
RIGHT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2
WHERE table_1.name_1 IS NULL;

-- Full Outer Join in MySQL without  duplicates (IF NULL) --> Opposite of intersection
SELECT *
FROM table_1
LEFT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2
WHERE table_2.name_2 IS NULL
UNION
SELECT *
FROM table_1
RIGHT OUTER JOIN table_2 ON table_1.name_1 = table_2.name_2
WHERE table_1.name_1 IS NULL;


SELECT *
FROM table_1
WHERE name_1 = ANY (SELECT name_2
			        FROM table_2);
