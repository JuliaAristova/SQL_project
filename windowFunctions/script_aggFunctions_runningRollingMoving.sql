--Window Functions - Aggregate Functions
--ANALYSIS OVER TIME:
--RUNNING TOTAL - aggregate all values from the beginnng up to the current
--ROLLING TOTAL - aggregate all values withins a fixed time window (e.g. 30 days);
--                as the new dat added, the oldest data point will be dropped.

--TRACKING: tracking current Sales with Target Sales
--TREND ANALYSIS: providing insites into historical patterns

SELECT 
	OrderID, 
	OrderDate,
	ProductId,
	DATENAME(month, OrderDate) as month,
	SUM(Sales) OVER(ORDER BY MONTH(orderDate) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as runningTotal,
	Sales,
	SUM(Sales) OVER(ORDER BY MONTH(orderDate) ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as rolling3Months
FROM Sales.Orders


--MOVING AVERAGE for each product over time
SELECT 
	OrderID, 
	OrderDate,
	ProductId,
	DATENAME(month, OrderDate) as month,
	Sales,
	AVG(Sales) OVER(PARTITION BY productID ORDER BY OrderDate 
	ROWS BETWEEN UNBOUNDED PRECEDING  AND CURRENT ROW) as movingTotal, --can be omitted as it is default
	AVG(Sales) OVER (PARTITION BY productID) as productAvg
FROM Sales.Orders

--calculate koving aferage of sales for each product over time, including only next order
SELECT
	orderID,
	orderDate,
	ProductID, 
	Sales,
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate 
	ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) as rollingAvg
FROM Sales.Orders
