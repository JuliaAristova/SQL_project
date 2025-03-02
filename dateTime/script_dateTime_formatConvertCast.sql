--formatting

--display creation time using the following format
--Day Wed Jan Q1 2025 12:34:56PM
SELECT 
	orderID, 
	CreationTime,
	'Day' + ' ' + 
	FORMAT(creationTime, 'ddd MMM') + ' Q' + 
	CAST(DATEPART(quarter, CreationTIme) AS VARCHAR) + ' ' +
	FORMAT(creationTime, 'yyyy hh:mm:sstt')
	as formattedCreationTime
FROM Sales.Orders

--count orders by month, display as ex.Jan 25

SELECT FORMAT(OrderDate, 'MMM yy') as date, COUNT(*) as totalOrders
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy')

--convert(target, source, <style>

SELECT CONVERT(INT, '124') as strToInt

SELECT CONVERT(VARCHAR, OrderDate) as dateToStr
FROM Sales.Orders

--display order creationTime as a date in US and European standards
SELECT 
	OrderID,
	CreationTime,
	CONVERT(date, CreationTime) as creationDate,
	CONVERT(varchar, CreationTIme, 32) as US_Stand_style,
	CONVERT(varchar, CreationTIme, 34) as Euro_Stand_style
FROM Sales.Orders

--cast(value ad data_type)
SELECT
	CAST('123' as INT) as [String to Int],
	CAST(123 as VARCHAR) as [Int to String],
	CAST('2025-08-20' as DATE) as [String to Date],
	CAST('2025-08-20' as DATETIME2) as [String to DateTime],
	CreationTime,
	CAST(CreationTime as DATE) as[DateTime to Date]
FROM Sales.Orders
