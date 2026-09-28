# HR Analysis — Findings and Insight
**Project:** RetailEdge SA — Customer Analysis
**Author:** Katlego Madumetja
**Date:** 2026/09/28
**Tool:** Microsoft SQL Server (T-SQL)


## Q1 Worforce Overview

### findings 

The workforce contain 15 employees with a combined salary bill of R1,040,000

The average employee salary is approximately R69,333 with salaries ranging from R42,000 to R95,000

### Insights

The salary range shows a significant difference between the lowest and highest paid employees.
This is expected because the workforce contains employees across junior ,specialist ,senior and director level position

---
## Q2 Department Summary 

### findings 

The department analysis compares headcount and salary distribution across Engineering , HR , Finance , Sales and Marketing.

Engineering has the lagest salary bill , while department salary levels vary based on the number of employees and the seniority of positions within each department

### Insights

Total salary cost should be considered together with headcount

A department with a higher salary bill does not neccessarily have the highest average salary because it's 
total cost is also affected

---
## Q3 — Salary Ranking Company-Wide

### findings 

Employees are ranked from highest to lowest salary across the entire organisation using DENSE_RANK().

The highest-paid employee is the Head of Engineering with a Salary of R95,000.

### Insights

Comapny-wide ranking provides a quick view of salary position across the organisation and allows employees to be compared regardless of department.

---

## Q4 — Salary Ranking Within Department

### findings 

Employees are ranked both company-wide and within their respective departments.

The departmant ranking provides a more meaningful comparison between employees performing within the same organisation area.

### Insights

Comparing an employee's salary within their department can provide more useful contect than comparing them against the entire organization because different departments may have different salary structure.


## Q5 — Tenure Analysis

### findings 

Employee tenure is calculated using the employee's HireDate and the current date.

The workforce includes employees with the different levels of orginisation experience , ranging from recent hires to employees who have been with the company for several years.

### Insights

Tenure analysis can help identify workforce experience levels and can support future analysis such as rentention , promotion patterns and salary progression.

