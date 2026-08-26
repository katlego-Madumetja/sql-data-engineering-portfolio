-- ============================================================
-- RetailEdge SA : Customer Analysis
-- Author        : Katlego Ramokolo
-- Email         : katlegoramokolo1@gmail.com
-- Date          : 2026
-- Description   : Customer and transaction data for CRM analysis
-- ============================================================

-- Customers Table
IF OBJECT_ID('dbo.Customers') IS NOT NULL
    DROP TABLE dbo.Customers;

CREATE TABLE dbo.Customers (
    CustomerID      INT PRIMARY KEY,
    FirstName       VARCHAR(50),
    LastName        VARCHAR(50),
    Email           VARCHAR(100),
    Region          VARCHAR(50),
    SignupDate      DATE,
    CustomerSegment VARCHAR(50)
);

INSERT INTO dbo.Customers VALUES
(201, 'Lerato',  'Dlamini',  'lerato.d@email.com',   'Gauteng',      '2022-03-15', 'Retail'),
(202, 'Sipho',   'Khumalo',  'sipho.k@email.com',    'Western Cape', '2022-07-01', 'Corporate'),
(203, 'Zanele',  'Mokoena',  'zanele.m@email.com',   'Gauteng',      '2021-11-20', 'Retail'),
(204, 'Bonga',   'Zulu',     'bonga.z@email.com',    'KZN',          '2023-01-10', 'Corporate'),
(205, 'Naledi',  'Sithole',  'naledi.s@email.com',   'Western Cape', '2022-05-05', 'Retail'),
(206, 'Kagiso',  'Molefe',   'kagiso.m@email.com',   'Gauteng',      '2023-06-18', 'Retail'),
(207, 'Ama',     'Dube',     'ama.d@email.com',      'KZN',          '2021-09-30', 'Corporate'),
(208, 'Thabo',   'Nkosi',    'thabo.n@email.com',    'Gauteng',      '2022-01-12', 'Retail'),
(209, 'Priya',   'Naidoo',   'priya.n@email.com',    'KZN',          '2023-03-22', 'Retail'),
(210, 'Ruan',    'van Wyk',  'ruan.v@email.com',     'Western Cape', '2022-09-08', 'Corporate'),
(211, 'Fatima',  'Essop',    'fatima.e@email.com',   'Western Cape', '2021-06-14', 'Corporate'),
(212, 'David',   'Mahlangu', 'david.m@email.com',    'Gauteng',      '2023-08-05', 'Retail'),
(213, 'Nomsa',   'Khumalo',  'nomsa.k@email.com',    'KZN',          '2022-04-19', 'Retail'),
(214, 'Jacques', 'du Plessis','jacques.d@email.com', 'Western Cape', '2021-12-01', 'Corporate'),
(215, 'Ayesha',  'Patel',    'ayesha.p@email.com',   'Gauteng',      '2023-10-15', 'Retail');

-- Customer Transactions Table
IF OBJECT_ID('dbo.CustomerTransactions') IS NOT NULL
    DROP TABLE dbo.CustomerTransactions;

CREATE TABLE dbo.CustomerTransactions (
    TransactionID   INT PRIMARY KEY,
    CustomerID      INT,
    ProductCategory VARCHAR(50),
    Amount          DECIMAL(10,2),
    TransactionDate DATE,
    PaymentMethod   VARCHAR(50)
);

INSERT INTO dbo.CustomerTransactions VALUES
(3001, 201, 'Electronics',  31998.00, '2024-01-05', 'Credit Card'),--Lerato
(3002, 202, 'Furniture',     9996.00, '2024-01-12', 'EFT'),
(3003, 203, 'Electronics',   3490.00, '2024-01-18', 'Credit Card'),
(3004, 204, 'Furniture',     8999.00, '2024-01-25', 'EFT'),
(3005, 205, 'Electronics',  15999.00, '2024-02-03', 'Credit Card'),
(3006, 201, 'Electronics',   3897.00, '2024-02-14', 'Credit Card'),--Lerato
(3007, 206, 'Electronics',  10998.00, '2024-02-20', 'Debit Card'),
(3008, 207, 'Furniture',     7497.00, '2024-02-28', 'EFT'),
(3009, 203, 'Electronics',  15999.00, '2024-03-07', 'Credit Card'),
(3010, 208, 'Furniture',    17998.00, '2024-03-15', 'EFT'),
(3011, 209, 'Electronics',   1745.00, '2024-03-22', 'Debit Card'),
(3012, 210, 'Electronics',   5499.00, '2024-03-30', 'Credit Card'),
(3013, 201, 'Furniture',     8999.00, '2024-04-04', 'Credit Card'),--Lerato
(3014, 204, 'Electronics',  15999.00, '2024-04-11', 'EFT'),
(3015, 202, 'Electronics',   2598.00, '2024-04-19', 'EFT'),
(3016, 211, 'Furniture',    14994.00, '2024-04-25', 'Credit Card'),
(3017, 207, 'Electronics',  10998.00, '2024-05-02', 'EFT'),
(3018, 209, 'Electronics',  15999.00, '2024-05-10', 'Debit Card'),
(3019, 208, 'Electronics',   2792.00, '2024-05-18', 'Credit Card'),
(3020, 210, 'Furniture',     8999.00, '2024-05-24', 'Credit Card'),
(3021, 203, 'Electronics',   5196.00, '2024-06-01', 'Credit Card'),
(3022, 211, 'Electronics',  31998.00, '2024-06-09', 'Credit Card'),
(3023, 206, 'Furniture',     4998.00, '2024-06-15', 'Debit Card'),
(3024, 204, 'Electronics',  16497.00, '2024-06-22', 'EFT'),
(3025, 201, 'Electronics',   2094.00, '2024-06-30', 'Credit Card'),--Lerato
(3026, 212, 'Electronics',   8999.00, '2024-04-08', 'Debit Card'),
(3027, 213, 'Furniture',     4998.00, '2024-02-14', 'EFT'),
(3028, 214, 'Electronics',  12500.00, '2024-01-30', 'Credit Card'),
(3029, 213, 'Electronics',   3490.00, '2024-05-05', 'Debit Card'),
(3030, 215, 'Furniture',     2499.00, '2024-03-18', 'Credit Card');


