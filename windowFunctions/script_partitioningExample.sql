/*
Display total sales
Display total sales for all different products
Display total sales for all different products and order status
*/

--PARTITIONING

SELECT 
	OrderID, 
	OrderStatus, 
	ProductID, 
	Sales,
	SUM(Sales) OVER() AS totalSales,  --no partitioning
	SUM(SALES) OVER(PARTITION BY productID) AS totalProductSales, --partitioned by productID
	SUM(SALES) OVER(PARTITION BY productID, orderStatus) AS totalProductStatusSales --partitioned by productID and orderStatus
FROM Sales.Orders
