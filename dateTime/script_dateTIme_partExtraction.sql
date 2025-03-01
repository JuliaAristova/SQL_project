--OrderDate, ShipDate  - date
--CreationTime - datetime
SELECT OrderID, 
OrderDate,	
ShipDate, 
CreationTime 
FROM Sales.Orders

--hardCoded 
--GETDATE() - returns current date&time
SELECT OrderID, 
CreationTime,
'2025-02-09' hardCoded,
GETDATE() today
FROM Sales.Orders

--functions to get year&month&day of the date
SELECT OrderID, 
CreationTime,
DAY(CreationTime) AS day,
MONTH(CreationTime) AS month,
YEAR(CreationTime) AS year
FROM Sales.Orders

SELECT OrderDate,
DAY(OrderDate) AS day,
MONTH(OrderDate) AS month,
YEAR(OrderDate) AS year
FROM Sales.Orders

--functions to get a specified part of the date
SELECT OrderID, CreationTime,
DATEPART(year, CreationTime) AS year,
DATEPART(quarter, CreationTime) AS quarter,
DATEPART(month, CreationTime) AS month,
DATENAME(month, CreationTime) AS monthName,
DATEPART(week, CreationTime) AS week,
DATEPART(weekday, CreationTime) AS weekDay,
DATENAME(weekday, CreationTime) AS weekDayName,
DATEPART(hour, CreationTime) AS hour
FROM Sales.Orders

SELECT OrderID, OrderDate,
DATEPART(mm, OrderDate) AS monthNumeric,
DATENAME(month, OrderDate) AS month,
DATEPART(weekday, OrderDate) AS monthNumeric,
DATENAME(weekday, OrderDate) AS month
FROM Sales.Orders

SELECT OrderID, OrderDate,
DATEPART(week, OrderDate) AS week
FROM Sales.Orders

SELECT DATENAME(weekday, GETDATE()) as today

--set time to 0, day&month to 1 
SELECT OrderID, CreationTime,
DATETRUNC(minute, CreationTime) noSecTime,
DATETRUNC(hour, CreationTime) noMinTime,
DATETRUNC(day, CreationTime) noDayTime,
DATETRUNC(year, CreationTime) noMonthTime
FROM Sales.Orders

--display orders per month
SELECT  DATETRUNC(month, CreationTime) , 
COUNT(*) orderMonth
FROM Sales.Orders
GROUP BY DATETRUNC(month, CreationTime)

--EOMONTH returns the last day of the month
SELECT EOMONTH(GETDATE()) as currentEOM

SELECT OrderID, CreationTime,
EOMONTH(CreationTime) endMonth,
CAST(DATETRUNC(month, CreationTime) AS DATE) startMonth --sets day to 1
FROM Sales.Orders

-- how many orders were placed each year
SELECT Year(OrderDate) year, Count(*) numOfOrdersY
FROM Sales.Orders
GROUP BY YEAR(OrderDate)
UNION 
SELECT Year(OrderDate) year, Count(*) numOfOrdersY
FROM Sales.OrdersArchive
GROUP BY YEAR(OrderDate)

-- how many orders were placed each month
SELECT DATENAME(month, OrderDate) month, Count(*) numOfOrdersM
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate)

SELECT DATENAME(month, OrderDate) month, Count(*) numOfOrdersM
FROM Sales.OrdersArchive
GROUP BY DATENAME(month, OrderDate),DATEPART(month,OrderDate)
ORDER BY DATEPART(month,OrderDate)

--show all orders that were place in February
SELECT * 
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2

SELECT DATENAME(month, OrderDate) month, Count(*) numOfOrders
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate)
HAVING DATENAME(month, OrderDate) = 'February'
