-- ============================================================
-- RetailEdge SA : HR Analysis
-- Author        : Katlego Ramokolo
-- Email         : katlegoramokolo1@gmail.com
-- Date          : 2026
-- Description   : Employee and department data for HR analytics
-- ============================================================

IF OBJECT_ID('dbo.HREmployees') IS NOT NULL
    DROP TABLE dbo.HREmployees;

CREATE TABLE dbo.HREmployees (
    EmployeeID      INT PRIMARY KEY,
    FirstName       VARCHAR(50),
    LastName        VARCHAR(50),
    Department      VARCHAR(50),
    JobTitle        VARCHAR(100),
    Salary          DECIMAL(10,2),
    HireDate        DATE,
    ManagerID       INT,
    EmploymentStatus VARCHAR(20)
);

INSERT INTO dbo.HREmployees VALUES
(1,  'Thabo',    'Nkosi',      'Engineering',  'Head of Engineering',    95000.00, '2019-03-15', NULL, 'Active'),
(2,  'Lerato',   'Dlamini',    'Engineering',  'Senior Engineer',         78000.00, '2020-07-01', 1,    'Active'),
(3,  'Zanele',   'Mokoena',    'HR',           'HR Director',             85000.00, '2018-11-20', NULL, 'Active'),
(4,  'Sipho',    'Khumalo',    'HR',           'HR Officer',              52000.00, '2021-01-10', 3,    'Active'),
(5,  'Naledi',   'Sithole',    'Finance',      'Finance Director',        92000.00, '2017-06-05', NULL, 'Active'),
(6,  'Ama',      'Dube',       'Finance',      'Senior Accountant',       71000.00, '2020-09-18', 5,    'Active'),
(7,  'Kagiso',   'Molefe',     'Engineering',  'Junior Engineer',         58000.00, '2022-02-28', 1,    'Active'),
(8,  'Bonga',    'Zulu',       'Sales',        'Sales Director',          88000.00, '2019-08-12', NULL, 'Active'),
(9,  'Priya',    'Naidoo',     'Sales',        'Senior Sales Rep',        65000.00, '2021-04-22', 8,    'Active'),
(10, 'Ruan',     'van Wyk',    'Sales',        'Junior Sales Rep',        48000.00, '2023-01-15', 8,    'Active'),
(11, 'Fatima',   'Essop',      'Marketing',    'Marketing Director',      82000.00, '2020-03-01', NULL, 'Active'),
(12, 'David',    'Mahlangu',   'Marketing',    'Marketing Specialist',    61000.00, '2022-06-10', 11,   'Active'),
(13, 'Nomsa',    'Khumalo',    'HR',           'HR Specialist',           56000.00, '2021-09-05', 3,    'Active'),
(14, 'Jacques',  'du Plessis', 'Finance',      'Junior Accountant',       45000.00, '2023-03-20', 5,    'Active'),
(15, 'Ayesha',   'Patel',      'Marketing',    'Junior Marketer',         42000.00, '2023-07-15', 11,   'Inactive');

-- SCD Type 2 History Table
IF OBJECT_ID('dbo.HREmployeeHistory') IS NOT NULL
    DROP TABLE dbo.HREmployeeHistory;

CREATE TABLE dbo.HREmployeeHistory (
    SurrogateKey     INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID       INT,
    FirstName        VARCHAR(50),
    LastName         VARCHAR(50),
    Department       VARCHAR(50),
    JobTitle         VARCHAR(100),
    Salary           DECIMAL(10,2),
    EffectiveDate    DATE,
    ExpiryDate       DATE,
    IsCurrent        BIT
);

-- Load initial state as current records
INSERT INTO dbo.HREmployeeHistory
    (EmployeeID, FirstName, LastName, Department, JobTitle, Salary, EffectiveDate, ExpiryDate, IsCurrent)
SELECT
    EmployeeID, FirstName, LastName, Department, JobTitle, Salary,
    HireDate    AS EffectiveDate,
    NULL        AS ExpiryDate,
    1           AS IsCurrent
FROM dbo.HREmployees;