USE pizzahut;			

-- Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS Total_Orders
FROM
    orders;
-- Calculate the total revenue generated from pizza sales.
SELECT 
    SUM(o.quantity * p.price) AS Total_Revenue
FROM
    order_details AS o
        JOIN
    pizzas AS p ON p.pizza_id = o.pizza_id;
				-- ROUND(SUM(o.quantity*p.price),2) AS Total_Revenue      = ROUND And 2 is use for decimal limit
                
-- Identify the highest-priced pizza.
SELECT 
    pt.name, p.price AS heighest_price
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.     Use of ctrl+b
SELECT 
    p.size, COUNT(*) AS Total_Orders
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY Total_Orders DESC;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, SUM(od.quantity) AS Total_quantity
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY Total_quantity DESC
LIMIT 5;