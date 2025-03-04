--WINDOW VALUE (ANALYTICAL) FUNCTIONS

SELECT Month(OrderDate) as month,
		SUM(Sales) as currentMonthSales,
		LAG(SUM(Sales)) OVER(ORDER by Month(OrderDate)) as previousMonthSale,
		LEAD(SUM(Sales)) OVER(ORDER by Month(OrderDate)) as nextMonthSale
		FROM Sales.Orders
GROUP BY MONTH(OrderDate)

--Time series analysis
--analyze month-over-month (MoM) performance by finding the 
--percentage change in sales between the current and previous month

SELECT *, 
	(currentMonthSales - previousMonthSale) as Mom_change,
	ROUND(CAST((currentMonthSales - previousMonthSale) AS FLOAT)/previousMonthSale * 100, 2) as Mom_percentage
FROM (
	SELECT 
		Month(OrderDate) as month, 
		SUM(Sales) as currentMonthSales,
		LAG(SUM(Sales)) OVER(ORDER by Month(OrderDate)) as previousMonthSale
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
)t

--Customer Retention Analysis
--analyze customer loyalty by ranking customers based on the
--average number of days between orders

SELECT 
	CustomerID, 
	AVG(diffDays) as avgBetweenOrders,
	RANK() OVER (ORDER BY COALESCE(AVG(diffDays), 9999999)) as rankAvg
	FROM (
		--find difference in days between orders for each customer
		SELECT 
			CustomerID, OrderID, 
			OrderDate AS currentOrder,
			LEAD(OrderDate) OVER(Partition By CustomerID Order BY OrderDate) as nextOrder,
			DATEDIFF(day, OrderDate,LEAD(OrderDate) OVER(PARTITION BY CustomerID Order BY OrderDate)) as diffDays
			FROM Sales.Orders
	)t
GROUP BY CustomerID

--FIRST_VALUE() / LAST_VALUE() 
--Compare to Extremes
--find the lowest and the higest sales for each product
SELECT OrderID, ProductID, Sales,
FIRST_VALUE(Sales) OVER(Partition BY ProductID Order BY Sales) as lowestSale,
LAST_Value(Sales) OVER(Partition BY ProductID 
             Order BY Sales ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as highestSale
FROM Sales.Orders

--or--
SELECT OrderID, ProductID, Sales,
FIRST_VALUE(Sales) OVER(Partition BY ProductID Order BY Sales) as lowestSale,
LAST_Value(Sales) OVER(Partition BY ProductID Order BY Sales DESC) as highestSale
FROM Sales.Orders

SELECT OrderID, ProductID, Sales,
MIN(Sales) OVER(PARTITION BY ProductID) as lowestSales,
MAX(Sales) OVER(PARTITION BY ProductID) as highestSales
FROM Sales.Orders

SELECT ProductID, MIN(Sales) as lowestSale, MAX(Sales) as highestSale
FROM Sales.Orders
GROUP BY (ProductID)
