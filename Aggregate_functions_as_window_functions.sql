USE world;

SELECT *
FROM country;

SELECT SUM(population)
FROM country;


SELECT name, continent, population
FROM country;

-- To apply aggregation functions on a given set of categories, we use GROUP BY
-- GROUP BY reduces the number of rows depending on the total categories

SELECT continent, SUM(population)
FROM country
GROUP BY continent;

-- When using window functions, we get exactly the total number of rows with the value assigned to each row
-- The window or partition is defined using OVER() clause with PARTITION BY 

SELECT name, continent, 
SUM(population) OVER() AS global_population,
SUM(population) OVER(PARTITION BY continent) AS continent_population
FROM country;

/*
BY definition the execution of queries in MySQL is as follows:
FROM --> JOIN --> WHERE --> GROUP BY --> HAVING --> SELECT --> DISTINCT --> ORDER BY --> LIMIT
*/

/*
From MySQL official documentation:
Query result rows are determined from the FROM clause, after WHERE, JOIN, GROUP BY, and HAVING processing, 
and windowing execution occurs before ORDER BY, LIMIT, and SELECT DISTINCT.
*/ 