SELECT * FROM customer_behavior..customer_data

--Q1.What's the revenue and behavioral difference between H&M Members and Non-Members?


SELECT 
CASE
	WHEN subscription_status='Yes' THEN 'Member'
	WHEN subscription_status='No'  THEN 'Non-Member'
END AS subscription_status,
SUM(purchase_amount) AS total_revenue,
ROUND(AVG(purchase_amount),2) AS avg_revenue,
COUNT(customer_id) AS total_customers
FROM customer_behavior..customer_data
GROUP BY CASE
	WHEN subscription_status='Yes' THEN 'Member'
	WHEN subscription_status='No'  THEN 'Non-Member'
END 
ORDER BY total_revenue DESC

--Q2.Which promo codes drive the most revenue and customer acquisition?
SELECT 
promo_code_used,
SUM(purchase_amount) AS total_revenue ,
COUNT(DISTINCT customer_id) AS unique_customer
FROM customer_behavior..customer_data
GROUP BY promo_code_used 
ORDER BY total_revenue DESC

--Q3.Who are our most valuable customers and how should we segment them?
SELECT 
CASE
	WHEN subscription_status='Yes' THEN 'Member'
	WHEN subscription_status='No'  THEN 'Non-Member'
END AS subscription_status,
COUNT(DISTINCT customer_id) AS unique_customer,
ROUND(AVG(purchase_amount),2) AS avg_order_value,
ROUND(SUM(purchase_amount),2) AS total_revenue,
ROUND(AVG(review_rating),2) AS avg_satisfaction_score
FROM customer_behavior..customer_data
GROUP BY 
CASE
	WHEN subscription_status='Yes' THEN 'Member'
	WHEN subscription_status='No'  THEN 'Non-Member'
END 
ORDER BY total_revenue DESC

--Q4.Which product categories generate the most revenue and profit?
SELECT TOP 5
category,
item_purchased,
SUM(purchase_amount) AS total_revenue,
COUNT(8) AS total_orders
FROM customer_behavior..customer_data
GROUP BY category , item_purchased
ORDER BY total_revenue DESC

--Q5.What are the seasonal purchasing patterns and how should inventory be planned?
SELECT TOP 5
season,
category,
COUNT(*) AS units_sold,
ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer_behavior..customer_data
GROUP BY season , category
ORDER BY total_revenue DESC

--Q6.Who are our highest valued customer ?
SELECT TOP 10
customer_id,
SUM(purchase_amount) AS total_spend,
COUNT(*) AS total_purchase 
FROM customer_behavior..customer_data
GROUP BY customer_id
ORDER BY total_spend DESC

--Q7.Which age group and gender contribute the most to total sales?
SELECT 
gender,
age_group,
SUM(purchase_amount) AS total_sales,
COUNT(customer_id) As total_customer
FROM customer_behavior..customer_data
GROUP BY gender , age_group
ORDER BY total_sales DESC

--Q8.Which city has high sppending but low satisfaction?
SELECT
location,
ROUND(AVG(purchase_amount),2) AS avg_spend,
ROUND(AVG(review_rating),2) AS avg_rating
FROM customer_behavior..customer_data
GROUP BY location
HAVING
	AVG(purchase_amount) > (
		SELECT AVG(purchase_amount)
		FROM customer_behavior..customer_data
	)
	AND AVG(review_rating) < (
		SELECT AVG(review_rating)
		FROM customer_behavior..customer_data
	)
ORDER BY avg_spend DESC

SELECT 
    local_net_address AS IPAddress,
    local_tcp_port AS PortNumber
FROM sys.dm_exec_connections
WHERE session_id = @@SPID;
