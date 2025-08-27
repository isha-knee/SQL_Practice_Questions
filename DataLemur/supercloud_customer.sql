--A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category 
--listed in the products table. Write a query that identifies the customer IDs of these Supercloud customers.

customer_contracts Table:           products Table:
Column Name	Type                    Column 	        Type
product_id	integer                 customer_id	    integer
product_category	string            product_id	    integer
product_name	string                amount	        integer

WITH purchase_count AS
(SELECT cc.customer_id, COUNT(DISTINCT product_category) AS product_count
FROM customer_contracts cc
INNER JOIN products p
ON cc.product_id=p.product_id
GROUP BY cc.customer_id),
total_count AS
(SELECT COUNT(DISTINCT product_category) AS total_categories
FROM products p)
SELECT c.customer_id
FROM purchase_count c
JOIN total_count t
ON c.product_count=t.total_categories



