USE pizzahut;
SELECT * FROM pizza_types;		-- parent table
SELECT * FROM pizzas;			-- contain pizza_type_id from pizza_types
SELECT * FROM orders;			-- individual
SELECT * FROM order_details LIMIT 50000;	-- depends on both pizzas and orders

SELECT COUNT(*) FROM order_details;