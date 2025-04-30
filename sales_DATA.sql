CREATE DATABASE sales;
USE sales;


# Monthly Sales Revenue Report
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(Sale_Date, 'DD-MM-YYYY')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(Sale_Date, 'DD-MM-YYYY')) AS month,
    SUM(Sales_Amount) AS total_revenue
FROM sales_data
GROUP BY year, month
ORDER BY year, month;


# Monthly Sales Volume (Number of Orders)
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(Sale_Date, 'DD-MM-YYYY')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(Sale_Date, 'DD-MM-YYYY')) AS month,
    COUNT(DISTINCT Product_ID) AS order_count
FROM sales_data
GROUP BY year, month
ORDER BY year, month;


# Total Revenue by Region and Sales Representative
SELECT 
    Region,
    Sales_Rep,
    SUM(Sales_Amount) AS total_revenue
FROM sales_data
GROUP BY Region, Sales_Rep
ORDER BY total_revenue DESC;


# Top Product Categories by Revenue
SELECT 
    Product_Category,
    SUM(Sales_Amount) AS total_revenue
FROM sales_data
GROUP BY Product_Category
ORDER BY total_revenue DESC;


#Sales Volume by Region (Number of Unique Product Sales)
SELECT 
    Region,
    COUNT(DISTINCT Product_ID) AS unique_product_volume
FROM sales_data
GROUP BY Region
ORDER BY unique_product_volume DESC;


# Sales Volume by Sales Rep
SELECT 
    Sales_Rep,
    COUNT(DISTINCT Product_ID) AS unique_product_volume
FROM sales_data
GROUP BY Sales_Rep
ORDER BY unique_product_volume DESC;



