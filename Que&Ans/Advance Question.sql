						-- Advanced
-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT pt.name, ROUND(SUM(p.price*od.quantity)*100/
(
	SELECT SUM(p2.price*od2.quantity)
    FROM pizzas p2
    JOIN order_details od2
    ON p2.pizza_id=od2.pizza_id ),2) AS SUBQUERY
FROM pizza_types pt
JOIN pizzas p 
ON pt.pizza_type_id=p.pizza_type_id
JOIN order_details od
ON p.pizza_id=od.pizza_id
GROUP BY pt.name
ORDER BY SUBQUERY DESC;

-- Analyze the cumulative revenue generated over time. / Running Total
SELECT date,Revenue,SUM(Revenue) OVER (order by date) as cum_revenue
FROM
    (SELECT o.date,
	ROUND(SUM(p.price*od.quantity),2) AS Revenue
	FROM order_details od
	JOIN pizzas p
	ON od.pizza_id=p.pizza_id
	JOIN orders o
	ON o.order_id=od.order_id
	GROUP BY o.date) AS sales;
    
    -- Running Total / Cumulative Revenue BY MONTH
WITH  a as(SELECT o.date,
ROUND(SUM(p.price*od.quantity),2) Sales
FROM orders AS o
JOIN order_details AS od
USING (order_id)
JOIN pizzas as p
USING (pizza_id)
GROUP BY o.date)
SELECT *,
ROUND(SUM(Sales) OVER (order by date),2) YTD,
ROUND(SUM(Sales) OVER (PARTITION BY MONTH(date)ORDER BY date),2) as MTD
FROM a;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT pt.category ,SUM(p.price*od.quantity) AS Revenue
FROM pizzas p 
JOIN order_details od
ON p.pizza_id=od.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category
ORDER BY Revenue DESC;








