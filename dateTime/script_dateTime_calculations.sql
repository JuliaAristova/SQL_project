--adds/subtracts to/from specified part of the date
SELECT OrderId, OrderDate,
DATEADD(year, 2, OrderDate) As add2years,
DATEADD(month, 3, OrderDate) As add3months,
DATEADD(day, -10, OrderDate) As subtract10days
FROM Sales.Orders

--finds difference between two dates
Select OrderId, OrderDate, ShipDate,
DATEDIFF(day, OrderDate, ShipDate) AS diff
FROM Sales.Orders

--calculate the age of the employees
Select firstName, lastName, birthdate,
DATEDIFF(year, birthdate, GETDATE()) AS age
FROM Sales.Employees

--find the average shipping duration in days for each month
SELECT MONTH(OrderDate) as monthOrder, AVG(DATEDIFF(day, OrderDate, ShipDate)) AS avgDay2Ship
FROM Sales.Orders
Group By MONTH(OrderDate)

--TimeGap Analysis
--find the number of days between each order and previous order
SELECT OrderID, OrderDate as CurrentOrderDate,
LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousORderDate,
DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS numOfDays
FROM Sales.Orders
