USE world;

SELECT name, continent, population,
RANK() OVER(PARTITION BY continent ORDER BY population DESC) AS population_rank
FROM country;

SELECT name, continent, population,
DENSE_RANK() OVER(PARTITION BY continent ORDER BY population DESC) AS population_rank
FROM country;

SELECT name, continent, population,
PERCENT_RANK() OVER(PARTITION BY continent ORDER BY population DESC) AS population_rank
FROM country;

SELECT name, continent, population,
ROUND(CUME_DIST() OVER(PARTITION BY continent ORDER BY population DESC),2) AS population_rank
FROM country;

SELECT *
FROM
(SELECT name, continent, population,
ROW_NUMBER() OVER(PARTITION BY continent ORDER BY population DESC) AS rownumber
FROM country) AS temporary_table
WHERE (rownumber BETWEEN 5 AND 15) AND continent='Asia';