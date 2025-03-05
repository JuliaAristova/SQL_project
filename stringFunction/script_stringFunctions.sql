/*
STRING FUNCTIONS:
CONCAT() - return strings by concatination two or more string values
LOWER() - convert string to lowercase
UPPER() - comvet string to uppercase
TRIM() - remove s leading and trailing spaces from a string
LENGTH() - returns the length of a sttring
SUBSTRING() - returns substring of a string (column, start, length)
*/

SELECT * from Sales.Employees

SELECT	
	CONCAT(firstName,' ',lastName) as fullName,
	UPPER(firstName) firstName,
	LEN(firstName) as lengthFN,
	LEN(TRIM(firstName)) as cleanedLengthFN,
	LOWER(lastName) lastName,
	Department,
	SUBSTRING(Department, 1, 3) as dep,
FROM Sales.Employees
