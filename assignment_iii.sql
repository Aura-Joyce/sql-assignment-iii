CREATE DATABASE yousra_joyce_ishimwe_202513181_online_shopping_system;

USE yousra_joyce_ishimwe_202513181_online_shopping_system;

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20) 
);

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50),
price DECIMAL(10, 2) NOT NULL,
stock_quantity INT NOT NULL
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
product_id INT,
order_date DATE NOT NULL,
quantity INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_name, email, phone)
VALUES ('Alice Uwase', 'alice@gmail.com', '0788888888'),
('Jean Bosco', 'bosco@gmail.com', '0733333333'),
('Diane Mutoni', 'diane@gmail.com', '07222222222'),
('Eric Mugisha', 'eric@gmail.com', '0799999999'),
('Grace Uwimana', 'grace@gmail.com', '0789345672');

INSERT INTO products (product_name, category, price, stock_quantity)
VALUES ('Smartphone X', 'Electronics', 450000.00, 15),
('Running Shoes', 'Fashion', 45000.00, 30),
('Bluetooth Speaker', 'Electronics', 35000.00, 25),
('Backpack', 'Fashion', 25000.00, 50),
('Water Bottle', 'Home', 10000.00, 100);

INSERT INTO orders (customer_id, product_id, order_date, quantity)
 VALUES (1, 1, '2026-10-01', 1),
(2, 2, '2026-10-02', 2),
(3, 3, '2026-10-03', 1),
(4, 4, '2026-10-04', 1),
(5, 5, '2026-10-05', 3);

-- basic data retrival
SELECT customer_name, email 
FROM customers;

-- conditional data retrival
SELECT product_name, price, stock_quantity 
FROM products 
WHERE category = 'Electronics';

-- sorted data retrival
SELECT product_name, price, stock_quantity 
FROM products 
ORDER BY price DESC;

-- inner join
SELECT o.order_id, c.customer_name, o.order_date, o.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- left join
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- multi-table join
SELECT o.order_id, c.customer_name, p.product_name, o.quantity, p.price, (o.quantity * p.price) AS total_cost
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

-- update one record
UPDATE customers 
SET phone = '0789999999' 
WHERE customer_id = 1;

SELECT * FROM customers 
WHERE customer_id = 1;

-- update multiple records
UPDATE products 
SET stock_quantity = stock_quantity + 10 
WHERE category = 'Electronics';

SELECT * FROM products 
WHERE category = 'Electronics';

-- conditional update 
UPDATE products 
SET price = price * 0.90 
WHERE stock_quantity > 40;

SELECT * FROM products 
WHERE stock_quantity > 40;

-- rename column
ALTER TABLE customers 
RENAME COLUMN customer_name TO full_name;

DESCRIBE customers;

-- change a column's data type 
ALTER TABLE customers 
MODIFY COLUMN phone VARCHAR(15);

DESCRIBE customers;

-- add shipping status column
ALTER TABLE orders 
ADD COLUMN shipping_status VARCHAR(50) DEFAULT 'Pending';

DESCRIBE orders;

SET FOREIGN_KEY_CHECKS = 0;

-- insert a single record
INSERT INTO products (product_name, category, price, stock_quantity) 
VALUES ('Mechanical keyboard', 'Electronics', 25000.00, 25);

SELECT * FROM products 
WHERE product_name = 'Mechanical keyboard';

-- insert multiple records
INSERT INTO customers (full_name, email, phone) VALUES
('Louse ndogo', 'louse@gmail.com', '0723451234'),
('Aline Uwase', 'aline@gmail.com', '0787777777');

SELECT * FROM customers 
WHERE customer_id IN (6, 7);

-- insert a related record
INSERT INTO orders (customer_id, product_id, order_date, quantity) 
VALUES (6, 6, '2026-10-24', 2);

SELECT * FROM orders 
WHERE order_id = 6;

SET FOREIGN_KEY_CHECKS =1;









