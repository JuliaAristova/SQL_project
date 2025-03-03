--generate a report showing the total sales dividing into categories
--sort the result from lowest to highest
--high > 50
--medium 20-50
--low <20
SELECT category, SUM(sales) as totalSales
	FROM (
	SELECT OrderID, Sales,
		CASE
			WHEN Sales > 50 THEN 'high' 
			WHEN Sales BETWEEN 20 and 50 THEN 'medium'
			ELSE 'low'
		END category
	FROM Sales.Orders
	)t
	GROUP BY category
	Order by totalSales

--retrieve employees details, display gender as Male/Female
SELECT firstName, lastName, gender,
	CASE
		WHEN gender = 'M' THEN 'Male'
		WHEN gender = 'F' THEN 'Female'
		ELSE 'Unavailable'
	END genderFullText
FROM Sales.Employees

--retrieve customer details with abbreviated country code
SELECT * FROM Sales.Customers (Germany, USA)

Select CustomerID, firstName, lastName,
	CASE 
		WHEN country = 'Germany' THEN 'DE'
		WHEN country = 'USA' THEN 'US'
		Else 'Unavailable'
	END countryCode
FROM Sales.Customers

--find average scores of Customers and treat NULLs as 0
--add additional details as customerID and lastName

SELECT * FROM Sales.Customers
SELECT 
	customerID, 
	lastName, 
	CASE	
		WHEN score IS NULL THEN 0
		Else score
	END AS cleanedScore,
	AVG (
		CASE	
			WHEN score IS NULL THEN 0
			Else score
		END) OVER () as avgScore
FROM Sales.Customers

Select 
	customerID, 
	ISNULL(score, 0) as cleanedScore,
	AVG(CASE WHEN score IS NULL THEN 0 Else score END) OVER () as avgScore
FROM Sales.Customers

--count how many times each customer has made an order with sales greater than 30
SELECT CustomerID, COUNT(*) as numOrders
FROM Sales.Orders
GROUP BY CustomerID

SELECT CustomerID, 
	SUM(Case WHEN Sales > 30 then 1 Else 0 END) AS ordersGreater30,
	COUNT(*) As totalOrders
FROM Sales.Orders
GROUP BY CustomerID

SELECT CustomerID, 
	SUM(Case WHEN Sales > 30 then 1 Else 0 END) AS ordersGreater30,
	SUM(Case WHEN Sales <= 30 then 1 Else 0 END) AS ordersLessOrEqual30,
	COUNT(*) As totalOrders
FROM Sales.Orders
GROUP BY CustomerID

--CASE in ORDER BY
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);
