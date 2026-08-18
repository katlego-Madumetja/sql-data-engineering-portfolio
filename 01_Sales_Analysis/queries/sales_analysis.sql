SELECT *
FROM dbo.SalesData;

-- Q1 — Total Revenue Overview
--What is the total revenue, total number of transactions and total units sold across the entire dataset?

SELECT	COUNT(TransactionID) AS TotalNumberOfTransaction,
		SUM(Quantity)	AS TotalUnitsSold,
		SUM(TotalAmount)	AS TotalRevenue
FROM dbo.SalesData;

--Order of the Select statement makes more sense transaction , Units , Revenue


--===============================================================================

-- Q2 — Revenue by Region
-- Which region generates the most revenue? Show total revenue, transaction count and average transaction value per region. Sort by revenue descending.

SELECT	Region	AS Region,
		COUNT(TransactionID) AS TransactionCount,
		SUM(TotalAmount) AS TotalRevenue,
		AVG(TotalAmount) AS AverageTransactionValuePerRegion
FROM dbo.SalesData
GROUP BY Region
ORDER BY [TotalRevenue] DESC;

--====================================================================================

-- Q3 — Revenue by Category
-- How does Electronics compare to Furniture in terms of total revenue and number of transactions?

SELECT	Category AS Category,
		COUNT(TransactionID) AS NumberOfTransactions,
		SUM(TotalAmount) AS TotalRevenue
FROM dbo.SalesData
GROUP BY Category;

--===================================================================================

-- Q4 — Monthly Revenue Trend
-- What does revenue look like month by month? Extract the month from TransactionDate and show total revenue per month — sorted chronologically.

SELECT	MONTH(TransactionDate) AS MonthsValue,
		DATENAME(MONTH,TransactionDate) AS MonthNames,
		SUM(TotalAmount) AS TotalRevenuePerMonths
FROM dbo.SalesData
GROUP BY MONTH(TransactionDate),
		 DATENAME(MONTH,TransactionDate)
ORDER BY MONTH(TransactionDate) ASC;

--Important note is that using MONTH(TransactionDate) it only resulted to Months as 1,2,3 and it does not give more insight so i added actual months names and Value so that we understand.


--=================================================================================

-- Q5 — Top 5 Products by Revenue
-- Which products drive the most revenue? Show product name, category, total units sold and total revenue — top 5 only.

SELECT	TOP(5) ProductName AS ProductName,
		Category AS Category,
		SUM(Quantity) AS TotalUnitSold,
		SUM(TotalAmount) AS TotalRevenue
FROM Dbo.SalesData
GROUP BY ProductName,
		 Category
ORDER BY TotalRevenue DESC;

--=================================================================================

-- Q6 — Customer Purchase Summary
-- How much has each customer spent in total? Show CustomerID, CustomerName, total transactions, total spent and average spend per transaction. Sort by total spent descending.

SELECT	CustomerID,
		CustomerName,
		COUNT(TransactionID) AS TotalTransaction,
		SUM(TotalAmount) AS TotalSpend,
		AVG(TotalAmount)	AS AverageSpendPerTransaction
FROM dbo.SalesData
GROUP BY CustomerID,
		 CustomerName
ORDER BY [TotalSpend] DESC;

--=================================================================================	 

-- Q7 — Sales Rep Performance
-- How is each sales rep performing? Show total revenue generated, number of transactions handled and average deal size per rep. Rank them by revenue using DENSE_RANK().

SELECT	SalesRep,
		SUM(TotalAmount) AS TotalRevenue,
		COUNT(TransactionID)	AS NumberOfTransaction,
		AVG(TotalAmount)	AverageDealSize,
		DENSE_RANK() OVER(ORDER BY SUM(TotalAmount) DESC)
FROM dbo.SalesData
GROUP BY SalesRep;

--=================================================================================	 

-- Q8 — Running Revenue Total by Month
-- Using a window function — show each transaction alongside a running cumulative total of revenue ordered by 
-- TransactionDate. Include TransactionID, CustomerName, TotalAmount and 'Running Revenue'.

SELECT	TransactionID	AS TransactionID,
		CustomerName AS CustomerName,
		TotalAmount AS TotalAmount,
		SUM(TotalAmount) OVER(ORDER BY TransactionDate) AS RunningRevenue
FROM dbo.SalesData;

--=================================================================================	 
