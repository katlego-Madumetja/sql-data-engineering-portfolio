-- Q1 — Customer Transaction Summary
-- Join dbo.Customers to dbo.CustomerTransactions. Return each customer's full name, 
-- region, segment, total transactions,total spend and average spend per transaction. 
-- Include customers who have never transacted — show NULL for their transaction columns. 
-- Sort by total spend descending.

-- dbo.CustomerTransactions : Rgiht Table
-- dbo.Customers : Left Table

SELECT	CONCAT(c.FirstName,' ',c.LastName) AS FullName,
		c.region AS Region,
		c.CustomerSegment AS Segment,
		COUNT(ct.TransactionID) AS TotalTransaction,
		SUM(ct.Amount) AS TotalSpend,
		AVG(ct.Amount) AS AverageSpendPerTransaction
FROM dbo.Customers c
LEFT JOIN dbo.CustomerTransactions ct
	ON c.CustomerID = ct.CustomerID
GROUP BY c.FirstName,c.LastName,c.region,c.CustomerSegment
ORDER BY [TotalSpend] DESC;

--========================================================================================

-- Q2 — Customer Segmentation by Spend
-- Using the results of Q1 as a CTE — classify every customer into a spend tier using CASE:
-- Total spend >= 40000 → 'Platinum'
-- Total spend >= 15000 → 'Gold'
-- Total spend >= 5000 → 'Silver'
-- Total spend > 0 → 'Bronze'
-- No transactions → 'Inactive'
--Return full name, region, segment, total spend and spend tier. Sort by total spend descending.
WITH CustomerTransactionSummary AS(
	SELECT	CONCAT(c.FirstName,' ',c.LastName) AS FullName,
		c.region AS Region,
		c.CustomerSegment AS Segment,
		COUNT(ct.TransactionID) AS TotalTransaction,
		SUM(ct.Amount) AS TotalSpend,
		AVG(ct.Amount) AS AverageSpendPerTransaction
FROM dbo.Customers c
LEFT JOIN dbo.CustomerTransactions ct
	ON c.CustomerID = ct.CustomerID
GROUP BY c.FirstName,c.LastName,c.region,c.CustomerSegment
)

SELECT	FullName AS FullName,
		Region AS Region,
		Segment AS Segment,
		TotalSpend AS TotalSpend,
		CASE
			WHEN TotalSpend >= 40000 THEN 'Platinum'
			WHEN TotalSpend >= 15000 THEN 'Gold'
			WHEN TotalSpend >= 5000 THEN 'Silver'
			WHEN TotalSpend > 0 THEN 'Bronze'
			ELSE 'Inactive'
		END AS 'SpendTier'
FROM CustomerTransactionSummary
ORDER BY [TotalSpend] DESC;

--================================================================================

-- Q3 — Revenue by Customer Segment
---- How does revenue break down by CustomerSegment (Retail vs Corporate)? Show total revenue, transaction count and average transaction value per segment.

SELECT	c.CustomerSegment,
		COUNT(ct.TransactionID) AS TotalTransaction,
		SUM(ct.Amount)	AS TotalRevenue,
		AVG(ct.Amount) AS AverageTransaction
FROM dbo.Customers c
INNER JOIN dbo.CustomerTransactions ct
	ON c.CustomerID = ct.CustomerID
GROUP BY c.CustomerSegment;

--================================================================================

-- Q4 — Most Recent Purchase Per Customer
-- Using a window function — show each customer's most recent transaction date alongside their total number of transactions.
-- Return CustomerID, full name, most recent purchase date and transaction count. Sort by most recent purchase descending.

SELECT	DISTINCT
        c.CustomerID AS CustomerID,
		CONCAT(c.FirstName,' ',c.LastName) AS FulllName,
        MAX(ct.TransactionDate) OVER(PARTITION BY c.CustomerID) AS MostRecentPurchase
		COUNT(ct.TransactionID) OVER(PARTITION BY c.CustomerID) AS TransactionCount
FROM dbo.Customers c
INNER JOIN dbo.CustomerTransactions ct
	ON c.CustomerID = ct.CustomerID
ORDER BY MostRecentPurchase DESC;

--================================================================================

-- Q5 — Customer Purchase Ranking Within Region
-- Using DENSE_RANK() — rank each customer within their region by total spend. Return full name, region,
-- total spend and regional rank. Show only customers who have made at least one transaction.


SELECT	CONCAT(c.FirstName,' ',c.LastName)	AS FullName,
		c.region	AS Region,
		SUM(ct.Amount) AS TotalSpend,
		DENSE_RANK() OVER(PARTITION BY c.region ORDER BY (SUM(ct.Amount)) DESC) AS Region_Rank
FROM dbo.Customers c
INNER JOIN dbo.CustomerTransactions ct
	ON c.CustomerID = ct.CustomerID
GROUP BY c.Region , c.FirstName , c.LastName;


--================================================================================

-- Q6 — Repeat vs One-Time Customers
-- How many customers are repeat buyers (more than one transaction) vs one-time buyers?
-- Return a summary showing customer type and count — label them 'Repeat Customer' and 'One-Time Customer'.

WITH CustomerTypes AS(
    SELECT	COUNT(ct.TransactionID) AS TransactionCount,
            CASE
                WHEN (COUNT(ct.TransactionID)) > 1 THEN 'Repeat Customer'
                ELSE 'One-Time Customer'
            END AS CustomerType
    FROM dbo.Customers c
    INNER JOIN dbo.CustomerTransactions ct
        ON c.CustomerID = ct.CustomerID
    GROUP BY c.CustomerID

)

SELECT  CustomerType,
        COUNT(*) AS CustomerCount
FROM CustomerType
GROUP BY CustomerType;
--================================================================================

-- Q7 — Payment Method Breakdown
-- Which payment method is most popular?  EFT or Debit Card , Credit Card
-- Show payment method, total transactions and total revenue per method. Sort by total revenue descending.

SELECT	PaymentMethod AS PaymentMethod,
		count(TransactionID) AS TotalTransactions,
		SUM(Amount) AS TotalRevenue
FROM dbo.CustomerTransactions
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;

--================================================================================
-- Q8 — Customer Lifetime Value Tier Using CTE + Window Function
-- Write a CTE that calculates total spend per customer. Then in the outer query:

-- Add a DENSE_RANK() across all customers by total spend descending — label it 'Spend Rank'
-- Add a 'CLV Tier' column using CASE on the rank:
-- Rank 1–3 → 'Top Tier'
-- Rank 4–6 → 'Mid Tier'
-- Otherwise → 'Standard'

-- Return full name, region, total spend, spend rank and CLV tier. Sort by spend rank ascending.

WITH CustomerTotalSpendSummary AS(
	SELECT	CONCAT(c.FirstName,' ',c.LastName) AS FullName,
			c.region AS region,
			SUM(ct.Amount) AS TotalSpend
	FROM dbo.Customers c
	INNER JOIN dbo.CustomerTransactions ct
		ON c.CustomerID = ct.CustomerID
	GROUP BY c.CustomerID ,c.FirstName,c.LastName,c.Region
),
TotalSpendRankSummary AS(
	SELECT	FullName AS FullName,
			Region AS Region,
			TotalSpend AS TotalSpend,
			DENSE_RANK() OVER(ORDER BY TotalSpend DESC) AS SpendRank
	FROM CustomerTotalSpendSummary
)

SELECT	FullName AS FullName,
		Region AS Region,
		TotalSpend AS TotalSpend,
		SpendRank AS SpendRank,
		CASE
			WHEN SpendRank BETWEEN 1 AND 3 THEN 'Top Tier'
			WHEN SpendRank BETWEEN 4 AND 6 THEN 'Mid Tier'
			ELSE 'Standard'
		END AS 'CLV tier'
FROM TotalSpendRankSummary;