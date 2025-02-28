--NULL - Empty String - Blank

WITH Orders AS (
	SELECT 1 AS id, 'A' AS Category UNION
	SELECT 2, NULL UNION				--NULL
	SELECT 3,'' UNION					--Empty String
	SELECT 4, ' '						--Blank
	)
SELECT *,
DATALENGTH(Category) As categoryLength
FROM Orders

--Policy 1 - use only NULLs and Empty Strings (avoid blank spaces)
WITH Orders AS (
	SELECT 1 AS id, 'A' AS Category UNION
	SELECT 2, NULL UNION				--NULL
	SELECT 3,'' UNION					--Empty String
	SELECT 4, ' '						--Blank
	)
SELECT *,
DATALENGTH(Category) As categoryLength,
DATALENGTH(TRIM(Category)) As policy_1   --removes blank spaces
FROM Orders

--Policy 2 - use only NULLs(avoid empty strings and blank spaces)
WITH Orders AS (
	SELECT 1 AS id, 'A' AS Category UNION
	SELECT 2, NULL UNION				
	SELECT 3,'' UNION					
	SELECT 4, ' '						
	)
SELECT *,
	TRIM(Category) As policy_1,		--removes blank spaces
	NULLIF(TRIM(Category),'') AS policy_2 
FROM Orders

--Policy 3 - use default calue 'unknown' (avoid NULLs,empty strings and blank spaces)
WITH Orders AS (
	SELECT 1 AS id, 'A' AS Category UNION
	SELECT 2, NULL UNION				
	SELECT 3,'' UNION					
	SELECT 4, ' '						
	)
SELECT *,
	TRIM(Category) As policy_1,		--removes blank spaces
	NULLIF(TRIM(Category),'') AS policy_2,
	COALESCE(NULLIF(TRIM(Category),''), 'unknown') AS policy_3
FROM Orders
