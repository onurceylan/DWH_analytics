-- Cumulative Analysis > for example, its for looking how much buiness is growing

-- Calculate the total sales per month - cumulative
-- Calculate the running total of sales over time

SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales, -- its for looking how much buiness is growing
	AVG(avg_price) OVER (PARTITION BY order_date ORDER BY order_date) AS moving_average_price
FROM (
	SELECT 
		DATETRUNC(MONTH, order_date) AS order_date,
		SUM(sales_amount) AS total_sales,
		AVG(price) AS avg_price -- normal aggregation
	FROM	
		gold.fact_sales
	WHERE 
		order_date IS NOT NULL
	GROUP BY
		DATETRUNC(MONTH, order_date) 
	 ) t
