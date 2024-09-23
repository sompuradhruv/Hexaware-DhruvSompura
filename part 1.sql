-- Exercise 1: Find all orders with customer names
SELECT c.customer_name, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Exercise 2: Retrieve all products ordered by a specific customer (John Doe)
SELECT p.product_name, p.price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE c.customer_name = 'John Doe';

-- Exercise 3: Find customers who have placed orders
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Exercise 4: List all orders and include customers who haven't ordered
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Exercise 5: List all orders placed on or after February 1, 2024
SELECT o.order_id, o.order_date, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date >= '2024-02-01';

-- Exercise 6: Show product details for orders made by customer "Jane Smith"
SELECT p.product_name, p.price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE c.customer_name = 'Jane Smith';

-- Exercise 7: Get the order count for each customer
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Exercise 8: List all customers and the total number of products they ordered
SELECT c.customer_name, SUM(od.quantity) AS total_products
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_name;

-- Exercise 9: Retrieve customers who ordered more than 1 product
SELECT c.customer_name, SUM(od.quantity) AS total_products
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_name
HAVING SUM(od.quantity) > 1;

-- Exercise 10: Retrieve customers and their orders with order dates sorted in descending order
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;
