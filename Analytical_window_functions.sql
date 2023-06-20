USE world;

SELECT name, continent, population,
FIRST_VALUE(population) OVER(PARTITION BY continent 
                             ORDER BY population DESC
                             RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_population_in_continent,
LAST_VALUE(population) OVER(PARTITION BY continent 
                             ORDER BY population DESC
                             RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS min_population_in_continent,
NTH_VALUE(population, 10) OVER(PARTITION BY continent 
                             ORDER BY population DESC
                             RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 10th_population_in_continent
FROM country;

SELECT name, continent, population,
LEAD(population ,1 ) OVER(PARTITION BY continent ORDER BY population DESC) AS next_lower_population
FROM country;

SELECT name, continent, population,
LAG(population ,1) OVER(PARTITION BY continent ORDER BY population DESC) AS next_higher_population
FROM country
WHERE continent= 'Asia';

SELECT name, continent, population,
NTILE(10) OVER(PARTITION BY continent ORDER BY population DESC) AS group_number
FROM country
WHERE continent='Asia';

SELECT COUNT(name)
FROM country
WHERE continent='Asia';