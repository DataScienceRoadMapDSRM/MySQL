USE world;

SELECT name, continent, population,
NTILE(10) OVER(PARTITION BY continent ORDER BY population DESC) AS group_number
FROM country
WHERE continent='Asia';

SELECT COUNT(name)
FROM country
WHERE continent='Asia';