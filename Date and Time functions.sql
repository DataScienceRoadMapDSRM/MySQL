-- NOW() returns the current date and time at which the statement begins to execute
SELECT NOW();
SELECT NOW(), SLEEP(2), NOW(); -- Example from MySQL documentation

-- SYSDATE() returns the time at which it executes
SELECT SYSDATE();
SELECT SYSDATE(), SLEEP(2), SYSDATE(); -- Example from MySQL documentation

-- CURRENT_DATE() returns the current date
SELECT CURRENT_DATE();

-- CURRENT_TIME() returns the current time
SELECT CURRENT_TIME();

USE sakila;

SELECT *
FROM FILM;

-- SECOND() returns the second 
SELECT SECOND(last_update) FROM film;

-- MINUTE() returns the minute
SELECT MINUTE(last_update) FROM film;

-- HOUR() returns the hour
SELECT HOUR(last_update) FROM film;
 
-- DAY() returns the day
SELECT DAY(last_update) FROM film;

-- DAYNAME() returns the name of the weekday
SELECT DAYNAME(last_update) FROM film;

-- WEEK() returns the week
SELECT WEEK(last_update) FROM film;

-- MONTH() returns the month
SELECT MONTH(last_update) FROM film;

-- MONTHNAME() returns the name of the month
SELECT MONTHNAME(last_update) FROM film;

-- YEAR() returns the year
SELECT YEAR(last_update) FROM film;

-- TIMESTAMP() returns the timestamp
SELECT TIMESTAMP(last_update) FROM film;

-- DATDIFF() used to subtract two dates, the result will be in days
SELECT DATEDIFF(NOW(), (SELECT last_update FROM film LIMIT 1))/365;

SELECT last_update FROM film LIMIT 1;


