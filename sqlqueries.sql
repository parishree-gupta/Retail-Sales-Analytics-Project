drop database if exists dataset;
create database dataset;
use dataset;
select * from cleaned limit 10;

#Top 10 profitable products 
SELECT product_name, SUM(profit) AS total_profit FROM cleaned
GROUP BY product_name ORDER BY total_profit DESC LIMIT 10;

#Top 10 customers by sales  
SELECT customer_name, SUM(sales) AS total_sales FROM cleaned
GROUP BY customer_name ORDER BY total_sales DESC LIMIT 10;

#Region-wise total sales 
SELECT region, SUM(sales) AS total_sales FROM cleaned
GROUP BY region ORDER BY total_sales DESC;

#Category-wise average profit 
SELECT category, AVG(profit) AS avg_profit FROM cleaned
GROUP BY category;

#Highest discount category 
SELECT category, AVG(discount) AS avg_discount FROM cleaned
GROUP BY category ORDER BY avg_discount DESC LIMIT 1;

#Orders with negative profit 
SELECT order_id, product_name, profit FROM cleaned
WHERE profit < 0;

#Monthly sales trend 
SELECT MONTH(order_date) AS month, SUM(sales) AS total_sales FROM cleaned
GROUP BY month ORDER BY month;

#Market-wise revenue analysis 
SELECT market, SUM(sales) AS revenue FROM cleaned
GROUP BY market ORDER BY revenue DESC;

#Top-performing sub-categories 
SELECT sub_category, SUM(sales) AS total_sales FROM cleaned
GROUP BY sub_category ORDER BY total_sales DESC LIMIT 10;

#Ship mode usage analysis
SELECT ship_mode, COUNT(*) AS total_orders FROM cleaned
GROUP BY ship_mode ORDER BY total_orders DESC;