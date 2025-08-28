--Recently, Zomato encountered an issue with their delivery system. Due to an error in the delivery driver instructions, 
--each item's order was swapped with the item in the subsequent row. 
--As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.
--If the last item has an odd order ID, it should remain as the last item in the corrected data. 
--For example, if the last item is Order ID 7 Tandoori Chicken, then it should remain as Order ID 7 in the corrected data.
--In the results, return the correct pairs of order IDs and items.

--orders Schema:
column_name	    type	
order_id	      integer	
item	          string	

with tot_items AS
(SELECT order_id,item,
LAG(item) OVER (ORDER BY order_id) AS prev_item,
LEAD(item) OVER (ORDER BY order_id) AS next_item,
RANK() OVER (ORDER BY order_id) AS ranking
FROM orders )
SELECT order_id,
CASE
WHEN ranking%2=1 AND next_item IS NOT NULL THEN next_item
WHEN ranking%2=0 THEN prev_item
ELSE item
END AS corrected_item
FROM tot_items
ORDER BY order_id
