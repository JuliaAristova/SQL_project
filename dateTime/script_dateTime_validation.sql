--returns 1 if valid date, 0 if it is not

SELECT ISDATE(2025) as intDate,
ISDATE('2025-2-18') as strDate,
ISDATE('2025 Feb 18') as sDate,
ISDATE('2-18-2025') as usDate

SELECT
   --CAST(OrderDate AS DATE) OrderDate  --'2025-08' will result in error
   OrderDate,
   ISDATE(OrderDate) As isDate,
   CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
   END newOrderDate
FROM (
	SELECT '2025-08-20' AS OrderDate UNION
	SELECT '2025-08-21' UNION
	SELECT '2025-08-23' UNION
	SELECT '2025-08' 
)t
