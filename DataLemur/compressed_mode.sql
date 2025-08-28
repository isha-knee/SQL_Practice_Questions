--You're given a table containing the item count for each order on Alibaba, along with the frequency of orders that have the same item count. 
--Write a query to retrieve the mode of the order occurrences. 
--Additionally, if there are multiple item counts with the same mode, the results should be sorted in ascending order.

--items_per_order Table:
Column	              Type
item_count	          integer
order_occurrences	    integer

SELECT item_count
FROM items_per_order
WHERE order_occurrences=
(SELECT MAX(order_occurrences)
FROM items_per_order)
