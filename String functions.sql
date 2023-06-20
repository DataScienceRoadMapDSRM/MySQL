-- CONCAT() returns concatenated string
SELECT CONCAT('abc', 'def');
SELECT CONCAT('abc', '     ', 'def');

-- LEFT() returns the leftmost number of characters as specified
SELECT LEFT('abcerfgh',4);

-- LENGTH() returns the length of a string
SELECT LENGTH('abcerfgh');

-- LOWER()  returns the string in lowercase
SELECT LOWER('QSDFGH');

-- REPLACE() is used to replace a string in a a sentence
SELECT REPLACE('Data Science', 'Science', 'Analysis');

-- REVERSE() reverses the order of characters in a string
SELECT REVERSE('Data Science');

-- RIGHT() returns the specified rightmost number of characters
SELECT RIGHT('abcerfgh', 2);

/*
STRCMP() compares two strings, by definition from MySQL doc: 
returns 0 if the strings are the same, -1 if the first argument is smaller than the second 
according to the current sort order, and NULL if either argument is NULL. It returns 1 otherwise.
*/
SELECT STRCMP('date','data');
SELECT STRCMP(null,null);

-- SUBSTR() or SUBSTRING() returns the substring of a string starting from the defined position
SELECT SUBSTR('data science', 5); 

-- TRIM() removes leading and trailing spaces, and the specified characters from both sides
SELECT ('     abcerfgh         ') AS result;
SELECT TRIM('     abcerfgh') AS result;
SELECT TRIM(BOTH 'z' FROM 'zzzzzzzabcerfghzzzzzzz') AS result;

-- UPPER() returns the string in uppercase
SELECT UPPER('abc');