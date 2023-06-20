-- ABS() returns the absolute value of a number
SELECT ABS(-66);
SELECT ABS(66);

-- CEIL() returns the next integer (greater than) of the decimal number
SELECT CEIL(2.0001);
SELECT CEIL(-2.1);

-- DIV performs integer division
SELECT 5 DIV 2;
SELECT 9 DIV 2;

-- EXP() for the exponential
SELECT EXP(1);

-- FLOOR() returns the integer before (less than) the decimal number
SELECT FLOOR(2.999);
SELECT FLOOR(-2.1);

-- MOD for modulus
SELECT 10 MOD 2;
SELECT 9 MOD 2;
SELECT 9 % 2;

-- POW() or POWER() for power numbers
SELECT POWER(2,10);
SELECT POW(2,10);

-- ROUND() to round the number
SELECT ROUND(2.51);
SELECT ROUND(2.49);

-- SQRT() for square root
SELECT SQRT(9);

-- TRUNCATE() used to truncate to specified number of decimal places
SELECT TRUNCATE(2.123456789, 4);
