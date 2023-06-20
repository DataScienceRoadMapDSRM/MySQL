-- A self join is one type of joins where the table is joined with itself

USE world;

-- Select pairs of country names using a self join method 1
SELECT c1.name, c2.name, c1.region
FROM country c1, country c2
WHERE  c1.code <> c2.code AND c1.continent = 'Europe' AND c1.region=c2.region
ORDER BY c1.region;

SELECT *
FROM country;

-- Select pairs of country names using a self join method 2
SELECT c1.name AS country1, c2.name AS country2, c1.region
FROM country c1 
CROSS JOIN country c2
WHERE  c1.code <> c2.code AND c1.continent = 'Europe' AND c2.continent = 'Europe' AND c1.region=c2.region
ORDER BY c1.region;


/*
- NULL SAFE JOIN used to handle and join Null values
- To look for Null values, we use either IS NULL or the Null Safe operator <=> 
- Null safe <=> operator performs an equality comparison like the = operator
- returns 1 rather than NULL if both operands are NULL
- returns 0 rather than NULL if one operand is NULL
*/

SELECT 1 = NULL;
SELECT 1 <=> NULL;

SELECT 0 = NULL;
SELECT 0 <=> NULL;

SELECT NULL = NULL;
SELECT NULL <=> NULL;

USE joins;

INSERT INTO table_1
VALUES (5, Null);

SELECT *
FROM table_1;

INSERT INTO table_2
VALUES ('dfr');

UPDATE table_2
SET name_2 = Null WHERE name_2='abc';

SELECT *
FROM table_2;

-- INNER JOIN without Null Values
SELECT *
FROM table_1
INNER JOIN table_2 ON table_1.name_1 = table_2.name_2;

-- By definition a <=> b is the same as  a = b OR (a IS NULL AND b IS NULL)
 
-- NULL SAFE JOIN method 1
SELECT *
FROM table_1
INNER JOIN table_2 ON table_1.name_1 <=> table_2.name_2;

-- NULL SAFE JOIN method 2
SELECT *
FROM table_1
INNER JOIN table_2 ON table_1.name_1 = table_2.name_2 OR (table_1.name_1 IS NULL AND table_2.name_2 IS NULL);


