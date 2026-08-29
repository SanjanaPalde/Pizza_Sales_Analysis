USE pizzahut;
SELECT * FROM pizza_types;		-- parent table
SELECT * FROM pizzas;			-- contain pizza_type_id from pizza_types
SELECT * FROM orders;			-- individual
SELECT * FROM order_details;	-- depends on both pizzas and orders

