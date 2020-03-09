-- Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street, "addresses".city
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, "line_items".quantity, "products".description
FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "line_items".product_id = "products".id;

-- Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, "customers".last_name, COUNT("orders".id) FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id 
JOIN "orders" ON "addresses".id = "orders".address_id
GROUP BY "customers".first_name, "customers".last_name;

-- How many customers do we have?
SELECT COUNT(DISTINCT "customers".first_name) FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id 
JOIN "orders" ON "addresses".id = "orders".address_id;

-- How many products do we carry?
SELECT COUNT("products".description) FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) FROM "warehouse_product"
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi';

