CREATE DATABASE task_3_db;
USE task_3_db;
SHOW TABLES;
CREATE TABLE sales_data (
    `Row ID` INT,
    `Order ID` VARCHAR(30),
    `Order Date` VARCHAR(20),
    `Month` VARCHAR(20),
    `Ship Date` VARCHAR(20),
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(30),
    `Customer Name` VARCHAR(150),
    `Segment` VARCHAR(50),
    `Country` VARCHAR(100),
    `City` VARCHAR(100),
    `State` VARCHAR(100),
    `Postal Code` VARCHAR(20),
    `Region` VARCHAR(50),
    `Product ID` VARCHAR(50),
    `Category` VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(255),
    `Sales` DECIMAL(10,2),
    `Quantity` INT,
    `Discount` DECIMAL(5,2),
    `Profit` DECIMAL(10,4)
);

SHOW TABLES;
DESCRIBE sales_data;
SELECT COUNT(*)
FROM sales_data;
SHOW VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS TotalRows
FROM sales_data;

SELECT COUNT(*) FROM sales_data;
SELECT * FROM sales_data
LIMIT 10;

SELECT COUNT(*) AS Total_Records
FROM sales_data;

SELECT SUM(Sales) AS Total_Sales FROM sales_data;

SELECT SUM(Profit) AS Total_Profit FROM sales_data;


SELECT
COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM sales_data;

SELECT Month, SUM(Sales) AS Monthly_Sales FROM sales_data GROUP BY Month ORDER BY FIELD(Month,'January','February','March','April','May','June','July','August','September','October','November','December');

SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT
    Segment,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Segment
ORDER BY Total_Sales DESC;

SELECT
    `Customer Name`,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    CASE
        WHEN SUM(Sales) >= 700000 THEN 'Excellent'
        WHEN SUM(Sales) >= 500000 THEN 'Good'
        ELSE 'Average'
    END AS Performance
FROM sales_data
GROUP BY Region;

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
HAVING SUM(Sales) > 700000;

SELECT
    `Order ID`,
    `Customer Name`,
    Sales
FROM sales_data
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM sales_data
)
ORDER BY Sales DESC;


SELECT
    AVG(Sales) AS Average_Sales
FROM sales_data;

SELECT
    MAX(Sales) AS Highest_Sale,
    MIN(Sales) AS Lowest_Sale
FROM sales_data;

SELECT
    Category,
    ROUND(AVG(Profit),2) AS Average_Profit
FROM sales_data
GROUP BY Category
ORDER BY Average_Profit DESC;

SELECT
    `Ship Mode`,
    COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY `Ship Mode`
ORDER BY Total_Orders DESC;

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;
