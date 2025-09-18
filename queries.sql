-- ================================
-- 1. Total Revenue
-- ================================
CREATE  VIEW Total_Revenue AS
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Retail_Sales_Clean;


-- ================================
-- 2. Average Order Value (AOV)
-- ================================
CREATE OR ALTER VIEW Avg_Order_Value AS
SELECT 
    SUM(Total_Amount) * 1.0 / COUNT(DISTINCT Transaction_ID) AS Avg_Order_Value
FROM Retail_Sales_Clean;


-- ================================
-- 3. Unique Customers
-- ================================
CREATE OR ALTER VIEW Unique_Customers AS
SELECT COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM Retail_Sales_Clean;


-- ================================
-- 4. Top Product Categories
-- ================================
CREATE OR ALTER VIEW Top_Product_Categories AS
SELECT Product_Category, SUM(Total_Amount) AS Revenue
FROM Retail_Sales_Clean
GROUP BY Product_Category;


-- ================================
-- 5. Monthly Revenue Growth
-- ================================
CREATE OR ALTER VIEW Monthly_Revenue AS
SELECT 
    FORMAT(Date, 'yyyy-MMMM') AS Month, 
    SUM(Total_Amount) AS Monthly_Revenue
FROM Retail_Sales_Clean
GROUP BY FORMAT(Date, 'yyyy-MMMM');


-- ================================
-- 6. Top Customers by Spend
-- ================================
CREATE OR ALTER VIEW Top_Customers AS
SELECT top(10) Customer_ID, SUM(Total_Amount) AS Customer_Spend
FROM Retail_Sales_Clean
GROUP BY Customer_ID
order By SUM(Total_Amount) desc


-- ================================
-- 7. Sales by Gender
-- ================================
CREATE OR ALTER VIEW Sales_By_Gender AS
SELECT Gender, SUM(Total_Amount) AS Revenue
FROM Retail_Sales_Clean
GROUP BY Gender;




