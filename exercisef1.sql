CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

-- Insert entries into customers table
INSERT INTO customers (customer_id, customer_name, city)
VALUES 
(1, 'John Doe', 'New York'),
(2, 'Jane Smith', 'Chicago'),
(3, 'Michael Clark', 'Miami');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert entries into orders table
INSERT INTO orders (order_id, customer_id, order_date)
VALUES
(101, 1, '2024-01-15'),
(102, 2, '2024-02-18'),
(103, 1, '2024-03-12');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Insert entries into products table
INSERT INTO products (product_id, product_name, price)
VALUES
(201, 'Laptop', 1000),
(202, 'Mobile', 500),
(203, 'Tablet', 700);

CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert entries into order_details table
INSERT INTO order_details (order_id, product_id, quantity)
VALUES
(101, 201, 2),
(102, 202, 1),
(103, 201, 1),
(103, 203, 1);
