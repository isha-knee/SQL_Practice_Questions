--Assume you're given a table containing data on Amazon customers and their spending on products in different category. 
--write a query to identify the top two highest-grossing products within each category in the year 2022. 
--The output should include the category, product, and total spend.

--product_spend Table:
Column 	              Type
category	            string
product	              string
user_id	              integer
spend	                decimal
transaction_date	    timestamp

--products Table:
Column 	              Type
product_id	          integer
product_category	    string
product_name	        string

WITH highest_rank AS
(SELECT category,product,SUM(spend) AS total_spend,
RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) as ranking
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date)=2022
GROUP BY category,product)
SELECT category,product,total_spend
FROM highest_rank
WHERE ranking<=2
ORDER BY category,ranking
