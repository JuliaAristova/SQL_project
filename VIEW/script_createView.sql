IF OBJECT_ID('Sales.V_Monthly_Summary', 'V') IS NOT NULL
	DROP VIEW Sales.V_Monthly_Summary;
GO
	CREATE VIEW Sales.V_Monthly_Summary AS (
	SELECT DATETRUNC(month, OrderDate) AS orderMonth,
		SUM(Sales) AS totalSales,
		COUNT(OrderID) AS totalOrders,
		SUM(Quantity) AS totalQuantity
		FROM Sales.Orders
		GROUP BY DATETRUNC(month, OrderDate)
	)

Select orderMonth, totalSales,
SUM(totalSales) OVER (ORDER BY orderMonth) AS runningTotal
FROM Sales.V_Monthly_Summary

--provide a view that combines details from orders, products,
--customers, and employees

IF OBJECT_ID('Sales.V_Order_Details', 'V') IS NOT NULL
	DROP VIEW Sales.V_Order_Detailsy;
GO
CREATE VIEW Sales.V_Order_Details AS 
(
	SELECT o.OrderID, o.OrderDate, o.Sales, o.Quantity,
	p.ProductID, p.Category,
	c.FirstName + ' ' + COALESCE(c.LastName, '') AS customerName,
	c.Country customerCountry,
	e.FirstName + ' ' + COALESCE(e.LastName, '') AS employeeName,
	e.Department
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p ON  p.ProductID = o.ProductID
	LEFT JOIN Sales.Customers c ON c.CustomerID = o.CustomerID
	LEFT JOIN Sales.Employees e ON e.EmployeeID = o.SalesPersonID
)

SELECT * FROM Sales.V_Order_Details

--provide a view for US Sales Team
--that combines details from all tables
--and exclude data not related to the US

IF OBJECT_ID('Sales.V_Orders_US', 'V') IS NOT NULL
	DROP VIEW Sales.V_Orders_US;
GO
CREATE VIEW Sales.V_Orders_US AS 
(
	SELECT o.OrderID, o.OrderDate, o.Sales, o.Quantity,
	p.ProductID, p.Category,
	c.FirstName + ' ' + COALESCE(c.LastName, '') AS customerName,
	c.Country customerCountry,
	e.FirstName + ' ' + COALESCE(e.LastName, '') AS employeeName,
	e.Department
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p ON  p.ProductID = o.ProductID
	LEFT JOIN Sales.Customers c ON c.CustomerID = o.CustomerID
	LEFT JOIN Sales.Employees e ON e.EmployeeID = o.SalesPersonID
	WHERE c.Country = 'USA'
)

SELECT * FROM Sales.V_Orders_US
