--WINDOW AGGREGATE FUNCTIONS

-- 1. Overall Analysis: 
-- return the total sales across all orders and 
-- provide orderID and orderDate

SELECT 
	OrderID, 
	OrderDate,
	SUM(Sales) OVER() as totalSales
FROM Sales.Orders


-- 2. Group-wise analysis
-- the total sales for each product, provide orderID and orderDate
SELECT 
	OrderID, 
	OrderDate,
	SUM(Sales) OVER() as totalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) as totalProductSales
FROM Sales.Orders

-- 3. COmparison analysis
-- find the percentage contribution of each product sales to the total sales
SELECT 
	OrderID, 
	OrderDate,
	ProductId,
	SUM(Sales) OVER() as totalSales,
	Sales,
	ROUND (CAST(Sales AS FLOAT)/SUM(Sales) OVER() * 100, 2) as productSalesPercentage
FROM Sales.Orders

-- 4. Compare to Extremes analysis 
SELECT 
	OrderID, 
	OrderDate,
	ProductId,
	SUM(Sales) OVER() as totalSales,
	MIN(Sales) OVER() as lowestSales,
	MAX(Sales) OVER() as highestSales,
	Sales,
	(Sales - MIN(Sales) OVER()) As deviationFromLowest,
	(Sales - MAX(Sales) OVER()) As deviationFromHighest
FROM Sales.Orders
ORDER BY ProductID

-- 4. Compare to Average analysis 
SELECT 
	OrderID, 
	OrderDate,
	ProductId,
	AVG(Sales) OVER() as avgSales,
	Sales,
	(Sales - AVG(Sales) OVER()) As deviationFromAvg
FROM Sales.Orders
ORDER BY ProductID
