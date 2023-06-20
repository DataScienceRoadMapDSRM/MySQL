USE world;

-- ----------------------------------------------------------------------------------------------------------------
-- ROW_NUMBER() is used to assign an integer to each row of the window(partition) defined by PARTITION BY within OVER() clause
-- Assigns peers different row numbers
-- Rows numbers range from 1 to the number of partition rows

SELECT name, continent, population,
ROW_NUMBER() OVER() AS rowNumber
FROM country;

SELECT name, continent, population,
ROW_NUMBER() OVER(PARTITION BY continent 
				  ORDER BY population DESC) AS rowNumber
FROM country;

-- OVER() used to define the set of rows that can be used as the window frame
-- PARTITION BY used to classify the rows into groups  
-- ORDER BY is used to order the rows within the window or partition
-- ROWS or RANGE are used within a frame
-- A frame can be defined as a subset of the partition or window
-- ROWS is used to define a number of rows with respect to the current row
-- Whereas RANGE is used to define a range of values with respect to the value in the current row

-- -----------------------------------------------------------------------------------------------------------------
-- FIRST_VALUE() is used to return the value of the first row in the window frame from the specified column

SELECT name, continent, population,
FIRST_VALUE(population) OVER(PARTITION BY continent 
                             ORDER BY population DESC
                             RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_population_in_continent
FROM country;


SELECT name, continent, population,
FIRST_VALUE(population) OVER(PARTITION BY continent 
                             ORDER BY population DESC
                             ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS max_population_in_continent
FROM country;

-- -----------------------------------------------------------------------------------------------------------------
-- LAST_VALUE() is used to return the value of the last row in the window frame from the specified column

SELECT name, continent, population,
LAST_VALUE(population) OVER(PARTITION BY continent 
                             ORDER BY population 
                             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_population_in_continent
FROM country;

SELECT name, continent, population,
LAST_VALUE(population) OVER(PARTITION BY continent 
                             ORDER BY population
                             ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) AS x
FROM country;
-- -----------------------------------------------------------------------------------------------------------------
-- NTH_VALUE() is used to return the value of the nth row in the window frame from the specified column

SELECT name, continent, population,
ROW_NUMBER() OVER(PARTITION BY continent 
                             ORDER BY population DESC) AS y,
NTH_VALUE(population, 10) OVER(PARTITION BY continent 
                             ORDER BY population DESC) AS 10th_population_in_continent
FROM country;


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
-- ------------------------------------------------------------------------------------------------------------------
-- LEAD() returns the value of the column from the row that leads the current row by N rows within its partition

SELECT name, continent, population,
LEAD(population ,2 ) OVER(PARTITION BY continent ORDER BY population) AS next_higher_population
FROM country;

-- -------------------------------------------------------------------------------------------------------
-- LAG() returns the value of the column from the row that lags (precedes) the current row by N rows within its partition

SELECT name, continent, population,
LAG(population ,1) OVER(PARTITION BY continent ORDER BY population DESC) AS population_of_previous_country
FROM country
WHERE continent= 'Asia';

CREATE TABLE revenue_table(
year INT,
Val INT);

INSERT INTO revenue_table
VALUES (2017, 240000),
       (2018, 220000),
       (2019, 250000),
       (2020, 310000),
       (2021, 450000);

SELECT *
FROM revenue_table;

SELECT *,
       LAG(val, 1) OVER(ORDER BY year ASC) AS val_previous_year,
       val - LAG(val, 1) OVER() AS year_over_year_growth
FROM revenue_table;       

-- -------------------------------------------------------------------------------------------------------
-- NTILE() is used to distribute the rows for each window partition into a specified number of ranked groups

SELECT name, continent, population,
NTILE(10) OVER(PARTITION BY continent ORDER BY population DESC) AS group_number
FROM country;

SELECT COUNT(name)
FROM country
WHERE continent='Europe';

-- -------------------------------------------------------------------------------------------------------
-- RANK() must be used with ORDER BY
-- RANK() returns the rank of the current row within its partition, with gaps. Peers are considered ties and receive the same rank 
USE world;

SELECT name, continent, lifeexpectancy,
ROW_NUMBER() OVER(PARTITION BY continent 
ORDER BY lifeexpectancy DESC) AS rownumber,
RANK() OVER(PARTITION BY continent 
ORDER BY lifeexpectancy DESC) AS _rank,
DENSE_RANK() OVER(PARTITION BY continent 
ORDER BY lifeexpectancy DESC) AS _dense_rank
FROM country;




-- -------------------------------------------------------------------------------------------------------
-- PERCENT_RANK() Returns the percentage of partition values less than the value in the current row, excluding the highest value
-- Returns values range from 0 to 1 and represent the row relative rank

SELECT name, continent, lifeexpectancy,
PERCENT_RANK() OVER(PARTITION BY continent ORDER BY lifeexpectancy DESC) AS my_ranking_2
FROM country;

-- -------------------------------------------------------------------------------------------------------
-- DENSE_RANK() must be used with ORDER BY
-- Returns the rank of the current row within its partition, without gaps

SELECT name, continent, lifeexpectancy,
DENSE_RANK() OVER(PARTITION BY continent ORDER BY lifeexpectancy DESC) AS my_ranking_3
FROM country;

-- -------------------------------------------------------------------------------------------------------
-- Calculates the cumulative distribution of a value in a set of values

SELECT  continent, name, lifeexpectancy,
ROUND(CUME_DIST() OVER(PARTITION BY continent ORDER BY lifeexpectancy),2) AS life_expectancy_cumulative_distribution,
COUNT(name) OVER(PARTITION BY continent) AS total_countries_in_the_continent
FROM country;

