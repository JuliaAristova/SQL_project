--Select * FROM Sales.Customers

--ISNULL _ COALESCE 
SELECT 
	CustomerID, 
	Score, 
	AVG(Score) OVER() AS avgScore
FROM Sales.Customers   `					--625

--cleaned before calculation average ISNULL (SQL Serve, NVL - Oracle, IFNULL - MySQL)
SELECT 
	CustomerID, 
	ISNULL(Score, 0) as cleanedScore, 
	AVG(ISNULL(Score, 0)) OVER() AS avgScore
FROM Sales.Customers						--500

SELECT 
	CustomerID, 
	COALESCE(Score, 0) as cleanedScore, 
	AVG(COALESCE(Score, 0)) OVER() AS avgScore
FROM Sales.Customers

--add 5 bonus points to score 
SELECT 
	CustomerID, 
	Score,
	(Score + 5) as scoreAfterBonus    --not added if Score is NULL
FROM Sales.Customers

SELECT 
	CustomerID, 
	ISNULL(Score, 0) as cleanedScore,
	(ISNULL(Score, 0) + 5) as scoreAfterBonus
FROM Sales.Customers


--Display first and list name in one column
SELECT 
	CustomerID, 
	(firstName + ' ' + LastName) as Name
FROM Sales.Customers

SELECT 
	CustomerID, 
	(COALESCE(firstName, '') + ' ' + COALESCE(LastName, '')) AS Name
FROM Sales.Customers

--join tables - on columns year and type (may have NULL values)
Select a.year, a.type, a.orders, b.sales
FROM tableA a
JOIN tableB b 
ON a.year = b.year AND ISNULL(a.type,'') = ISNULL(b.type,'')

--Sorting data 
--ASC - NULL displayed at the start, DESC - at the end

SELECT CustomerID, score
FROM Sales.Customers
ORDER BY score 

--set score ASC/DESC
SELECT 
	CustomerID, score,
	CASE	
		WHEN score IS NULL THEN 1
		ELSE 0
	END as flag
FROM Sales.Customers
ORDER BY flag, score DESC

--hide flag
SELECT CustomerID, score
FROM Sales.Customers
ORDER BY (CASE WHEN score IS NULL THEN 1 ELSE 0 END), score DESC


--NULLIF - set 0 to NULL - preventing division by 0

SELECT 
	quantity, 
	sales,
	(sales/quantity) as price --Divide by zero error encountered.
FROM Sales.Orders

SELECT 
	quantity, 
	sales,
	(sales/NULLIF(quantity,0)) as price  --price set to NULL
FROM Sales.Orders

--searching for missing inforamtion
SELECT * from Sales.Customers
WHERE Score IS NULL

--finding mismatched rows between 2 tables
SELECT c.customerID, o.orderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o        --to display all customers
ON c.CustomerID = o.CustomerID

--'anti-join
SELECT c.customerID, o.orderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o        --to display all customers
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL         --to filter customers without orders
