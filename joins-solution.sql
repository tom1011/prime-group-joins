-- 1. Get all customers and their addresses.
SELECT * FROM "customers" JOIN "addresses" ON "addresses"."customer_id" = "customers"."id";
 -- 2. Get all orders and their line items (orders, quantity and product).
 SELECT "orders"."id", "line_items"."quantity", "products"."description" FROM "orders" JOIN "line_items" ON "line_items"."order_id" = "orders"."id" 
JOIN "products" ON "line_items"."product_id" = "products"."id";
-- 3. Which warehouses have cheetos?
SELECT "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id" 
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
 WHERE "products"."description" = 'cheetos';

 --4. Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id" 
JOIN "products" ON "warehouse_product"."product_id" = "products"."id" 
WHERE "products"."description" = 'cheetos';

--5. Get the number of orders for each customer.
SELECT "customers"."first_name", COUNT("orders"."address_id") FROM "customers" JOIN "addresses" ON "addresses"."customer_id" = "customers"."id" 
JOIN "orders" ON "orders"."address_id" = "addresses"."id" GROUP BY "customers"."first_name";

--6. How many customers do we have?

SELECT COUNT("customers") FROM "customers";

--7. How many products do we carry?

SELECT COUNT("products") FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") FROM "products" 
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id" 
WHERE "products"."description" = 'diet pepsi';

--9. How much was the total cost for each order?
SELECT SUM ("products"."unit_price") FROM "products" 
JOIN "line_items" ON "line_items"."product_id" = "products"."id"
GROUP BY "line_items"."order_id";

-- 10. How much has each customer spent in total?
SELECT SUM ("products"."unit_price") FROM "products" 
JOIN "line_items" ON "line_items"."product_id" = "products"."id" 
JOIN "orders" ON "line_items"."order_id" = "orders"."id" 
JOIN "addresses" ON "addresses"."id" = "orders"."address_id" 
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."first_name";

