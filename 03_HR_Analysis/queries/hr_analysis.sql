-- ALL QUERIES 

SELECT * 
FROM dbo.HREmployees;

-- ==============================================================
				--Q1 : Workforce Overview
-- ==============================================================

--Return 
-- 1. Number of Emp(headcount)
-- 2. Total Salary Bill
-- 3. Average Salary
-- 4. Highest Salary
-- 5. Lowest Salary 
-- clean Labels

SELECT	COUNT(EmployeeID) AS TotalHeadcount,
		SUM(Salary) AS TotalSalaryBill,
		AVG(Salary) AS AverageSalary,
		MAX(Salary) AS HighestSalary,
		MIN(Salary) AS LowestSalary
FROM dbo.HREmployeeHistory
WHERE IsCurrent =1;

-- ==============================================================
				--Q2 : Department Summary
-- ==============================================================

SELECT	Department AS Department,
		COUNT(EmployeeID) AS TotalHeadcount,
		SUM(Salary) AS TotalSalary,
		AVG(Salary) AS AverageSalary,
		MAX(Salary) AS HighestSalary
FROM dbo.HREmployees
GROUP BY Department
ORDER BY [TotalSalary] DESC;

-- ==============================================================
				--Q3 : Salary Ranking Company-Wide
-- ==============================================================

SELECT	CONCAT(FirstName,' ',LastName) AS FullName,
		Department	AS Department,
		JobTitle	AS JobTitle,
		Salary AS Salary,
		DENSE_RANK() OVER(ORDER BY Salary DESC) AS CompanyWideSalaryRank
FROM dbo.HREmployees
ORDER BY [CompanyWideSalaryRank] ASC;

-- ==============================================================
				--Q4 : Salary Ranking Within Department
-- ==============================================================

SELECT	CONCAT(FirstName,' ',LastName) AS FullName,
		Department AS Department,
		Salary AS Salary,
		DENSE_RANK() OVER(ORDER BY Salary DESC) AS CompanyRank,
		DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS DeptRank
FROM dbo.HREmployees
ORDER BY [DeptRank] ASC , [CompanyRank] DESC;

-- ==============================================================
				--Q5 : Tenure Analysis
-- ==============================================================

SELECT	CONCAT(FirstName,' ',LastName) AS FullName,
		Department AS Department,
		HireDate AS HireDate,
		ROUND((DATEDIFF(DAY,HireDate,GETDATE()) / 365.25),1) AS YearsOfService
FROM dbo.HREmployees





		