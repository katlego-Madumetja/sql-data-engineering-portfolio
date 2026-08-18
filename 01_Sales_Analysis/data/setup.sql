--==============================================================

-- RetailEdge SA    : Sales Analysis
-- Author           : Katlego Ramokolo
-- Email            : katlegoramokolo1@gmail.com
-- Date             : 2026
-- Description      : Raw Sales data setup for analysis

--==============================================================


--Safe Drop before creating oebjects
IF OBJECT_ID('dbo.SalesData') IS NOT NULL 
        DROP TABLE dbo.SalesData;

--Create Sales Tabble
CREATE TABLE dbo.SalesData (
    TransactionID   INT,
    CustomerID      INT,
    CustomerName    VARCHAR(100),
    ProductName     VARCHAR(100),
    Category        VARCHAR(50),
    Region          VARCHAR(50),
    Quantity        INT,
    UnitPrice       DECIMAL(10,2),
    TotalAmount     DECIMAL(10,2),
    TransactionDate DATE,
    SalesRep        VARCHAR(100)
);


INSERT INTO dbo.SalesData VALUES
(1001, 201, 'Lerato Dlamini',  'Laptop Pro 15',     'Electronics', 'Gauteng',    2, 15999.00, 31998.00, '2024-01-05', 'Thabo Nkosi'),
(1002, 202, 'Sipho Khumalo',   'Office Chair',       'Furniture',   'Western Cape', 4, 2499.00,  9996.00,  '2024-01-12', 'Naledi Sithole'),
(1003, 203, 'Zanele Mokoena',  'Wireless Mouse',     'Electronics', 'Gauteng',    10, 349.00,  3490.00,  '2024-01-18', 'Thabo Nkosi'),
(1004, 204, 'Bonga Zulu',      'Standing Desk',      'Furniture',   'KZN',         1, 8999.00,  8999.00,  '2024-01-25', 'Ama Dube'),
(1005, 205, 'Naledi Sithole',  'Laptop Pro 15',      'Electronics', 'Western Cape', 1, 15999.00, 15999.00, '2024-02-03', 'Naledi Sithole'),
(1006, 201, 'Lerato Dlamini',  'Mechanical Keyboard','Electronics', 'Gauteng',    3, 1299.00,  3897.00,  '2024-02-14', 'Thabo Nkosi'),
(1007, 206, 'Kagiso Molefe',   'Monitor 27"',        'Electronics', 'Gauteng',    2, 5499.00, 10998.00,  '2024-02-20', 'Thabo Nkosi'),
(1008, 207, 'Ama Dube',        'Office Chair',       'Furniture',   'KZN',         3, 2499.00,  7497.00,  '2024-02-28', 'Ama Dube'),
(1009, 203, 'Zanele Mokoena',  'Laptop Pro 15',      'Electronics', 'Gauteng',    1, 15999.00, 15999.00, '2024-03-07', 'Thabo Nkosi'),
(1010, 208, 'Thabo Nkosi',     'Standing Desk',      'Furniture',   'Gauteng',    2, 8999.00, 17998.00,  '2024-03-15', 'Thabo Nkosi'),
(1011, 209, 'Priya Naidoo',    'Wireless Mouse',     'Electronics', 'KZN',         5, 349.00,   1745.00,  '2024-03-22', 'Ama Dube'),
(1012, 210, 'Ruan van Wyk',    'Monitor 27"',        'Electronics', 'Western Cape', 1, 5499.00,  5499.00,  '2024-03-30', 'Naledi Sithole'),
(1013, 201, 'Lerato Dlamini',  'Standing Desk',      'Furniture',   'Gauteng',    1, 8999.00,  8999.00,  '2024-04-04', 'Thabo Nkosi'),
(1014, 204, 'Bonga Zulu',      'Laptop Pro 15',      'Electronics', 'KZN',         1, 15999.00, 15999.00, '2024-04-11', 'Ama Dube'),
(1015, 202, 'Sipho Khumalo',   'Mechanical Keyboard','Electronics', 'Western Cape', 2, 1299.00,  2598.00,  '2024-04-19', 'Naledi Sithole'),
(1016, 211, 'Fatima Essop',    'Office Chair',       'Furniture',   'Western Cape', 6, 2499.00, 14994.00,  '2024-04-25', 'Naledi Sithole'),
(1017, 207, 'Ama Dube',        'Monitor 27"',        'Electronics', 'KZN',         2, 5499.00, 10998.00,  '2024-05-02', 'Ama Dube'),
(1018, 209, 'Priya Naidoo',    'Laptop Pro 15',      'Electronics', 'KZN',         1, 15999.00, 15999.00, '2024-05-10', 'Ama Dube'),
(1019, 208, 'Thabo Nkosi',     'Wireless Mouse',     'Electronics', 'Gauteng',    8, 349.00,   2792.00,  '2024-05-18', 'Thabo Nkosi'),
(1020, 210, 'Ruan van Wyk',    'Standing Desk',      'Furniture',   'Western Cape', 1, 8999.00,  8999.00,  '2024-05-24', 'Naledi Sithole'),
(1021, 203, 'Zanele Mokoena',  'Mechanical Keyboard','Electronics', 'Gauteng',    4, 1299.00,  5196.00,  '2024-06-01', 'Thabo Nkosi'),
(1022, 211, 'Fatima Essop',    'Laptop Pro 15',      'Electronics', 'Western Cape', 2, 15999.00, 31998.00, '2024-06-09', 'Naledi Sithole'),
(1023, 206, 'Kagiso Molefe',   'Office Chair',       'Furniture',   'Gauteng',    2, 2499.00,  4998.00,  '2024-06-15', 'Thabo Nkosi'),
(1024, 204, 'Bonga Zulu',      'Monitor 27"',        'Electronics', 'KZN',         3, 5499.00, 16497.00,  '2024-06-22', 'Ama Dube'),
(1025, 201, 'Lerato Dlamini',  'Wireless Mouse',     'Electronics', 'Gauteng',    6, 349.00,   2094.00,  '2024-06-30', 'Thabo Nkosi');