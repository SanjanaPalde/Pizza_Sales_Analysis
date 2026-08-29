-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT pt.category, SUM(od.quantity) Total_Quantity 
FROM order_details od
JOIN pizzas p
ON p.pizza_id=od.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category
ORDER BY Total_Quantity DESC;

-- Determine the distribution of orders by hour of the day.
SELECT HOUR(order_time) AS Hour,
       COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY HOUR(order_time)
ORDER BY Hour;

-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT category ,COUNT(pt.category) AS Total_category_types
FROM pizza_types pt
JOIN pizzas p
ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category;

-- Group the orders by date 
-- and calculate the average number of pizzas ordered per day.
SELECT AVG(TOTAL_COUNT)
FROM
(
	SELECT o.order_date, SUM(od.quantity) AS TOTAL_COUNT
	FROM order_details od
	JOIN orders o 
	ON o.order_id=od.order_id
	GROUP BY o.order_date
    ) AS Daily_orders;
    
-- Determine the top 3 most ordered pizza types based on revenue.
SELECT pt.name,sum((p.price*od.quantity)) AS Total_Revenue
FROM order_details od 
JOIN pizzas p
ON p.pizza_id=od.pizza_id
JOIN pizza_types pt
ON pt.pizza_type_id=p.pizza_type_id
group by pt.name
ORDER BY Total_Revenue desc
LIMIT 3;

