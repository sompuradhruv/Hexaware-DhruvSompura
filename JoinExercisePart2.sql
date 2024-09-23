-- Exercise 1: Find the total amount spent by each customer
SELECT c.customer_name, SUM(p.price * od.quantity) AS total_amount_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.customer_name;

-- Exercise 2: List customers who have purchased products priced above $700
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.price > 700;

-- Exercise 3: Find the average quantity of each product ordered
SELECT p.product_name, AVG(od.quantity) AS average_quantity
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- Exercise 4: Retrieve the total quantity and amount spent on each product
SELECT p.product_name, SUM(od.quantity) AS total_quantity, SUM(p.price * od.quantity) AS total_amount_spent
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- Exercise 5: List customers who ordered a specific product (e.g., 'Laptop')
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = 'Laptop';

-- Exercise 6: Find the most frequently ordered product
SELECT p.product_name, SUM(od.quantity) AS total_quantity
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- Exercise 7: Retrieve orders made by each customer
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Exercise 8: List all products and the total number of customers who purchased them
SELECT p.product_name, COUNT(DISTINCT c.customer_id) AS total_customers
FROM products p
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY p.product_name;

-- Exercise 9: Find customers who ordered more than 2 different products
SELECT c.customer_name, COUNT(DISTINCT p.product_id) AS total_different_products
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.customer_name
HAVING COUNT(DISTINCT p.product_id) > 2;

-- Exercise 10: Find customers who placed more than 3 orders and total amount spent
SELECT c.customer_name, COUNT(o.order_id) AS total_orders, SUM(p.price * od.quantity) AS total_amount_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 3;
