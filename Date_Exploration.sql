-------------------------
-- Date Exploration
-------------------------

-- Find the date of the first and last order
-- How many years of sales are available

SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales


-- Find the youngest and oldest customer

SELECT
	MIN(birth_date) AS oldest_birth_date,
	DATEDIFF(year, MIN(birth_date), GETDATE()) AS oldest_age,
	MAX(birth_date) AS youngest_birth_date,
	DATEDIFF(year, MAX(birth_date), GETDATE()) AS youngest_age
FROM gold.dim_customers

--SELECT * FROM gold.dim_customers

















