USE world;

SELECT *
FROM city
ORDER BY population DESC;

-- Scalar or column subquery
CREATE TABLE city_population_summary(
minimum_population FLOAT,
maximum_population FLOAT,
Average_population FLOAT);

INSERT INTO city_population_summary
VALUES ( (SELECT MIN(population) FROM city),
         (SELECT MAX(population) FROM city),
         (SELECT AVG(population) FROM city));
		
SELECT MIN(population) FROM city;

SELECT * 
FROM city_population_summary;

-- It can also return a column of values
SELECT *, (SELECT AVG(population) FROM city) AS average_population
FROM city;

SELECT AVG(population) FROM city;

-- Comparisons using subqueries
SELECT name, population
FROM city
WHERE population > (
                    SELECT AVG(population)
                    FROM CITY);
                    

-- Subquery in FROM clause with a GROUP BY
-- We calculate The average of languages used in the world by country 

SELECT AVG(total_languages) AS average_languages_by_country
FROM  (
      SELECT country.name, COUNT(countrylanguage.language) AS total_languages
	  FROM countrylanguage
      INNER JOIN country ON country.code = countrylanguage.countrycode
      GROUP BY countrylanguage.countrycode
      ORDER BY total_languages DESC) AS temporary_table;
      
SELECT country.name, COUNT(countrylanguage.language) AS total_languages
	  FROM countrylanguage
      INNER JOIN country ON country.code = countrylanguage.countrycode
      GROUP BY countrylanguage.countrycode
      ORDER BY total_languages DESC;

SELECT *
FROM country;

SELECT *
FROM countrylanguage;


-- Subqueries with ANY, IN, SOME or ALL 
SELECT *
FROM city;

SELECT name
FROM city
WHERE countrycode NOT IN (SELECT DISTINCT code
						  FROM country);
                        
SELECT DISTINCT code
FROM country;
            
USE sakila;

-- Subqueries with ANY or SOME
-- SELECT customers that have addresses with 4 digits postal code
SELECT *
FROM customer
WHERE address_id = ANY  ( SELECT address_id
                          FROM address
                          WHERE postal_code > 10000);
SELECT address_id
FROM address
WHERE postal_code < 10000;

-- Subqueries with ALL
-- Returns true if all zip codes have 4 digits
SELECT *
FROM customer
WHERE address_id = ALL  ( SELECT address_id
                          FROM address
                          WHERE postal_code < 10000);

-- Subqueries with IN, NOT IN
-- Find customers who did not pay
SELECT *
FROM customer
WHERE customer_id NOT IN (SELECT customer_id 
						  FROM payment);
SELECT customer_id 
FROM payment;

-- Correlated subqueries with EXISTS and NOT EXISTS
SELECT *
FROM customer c
WHERE  NOT EXISTS ( SELECT address_id
				FROM address a
				WHERE postal_code < 10 );

SELECT  address_id
FROM address
WHERE postal_code < 10000;






































