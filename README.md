# ASSIGNMENT III: SQL TABLE MANIPULATION

## ONLINE SHOPPING SYSTEM

**Student Name:** Yousra Joyce Ishimwe  
**Student ID:** 202513181  
**Instructor:** Eric Maniraguha  
**Institution:** Kigali Independent University (ULK)  
**Selected DBMS:** MySQL 8.0   
**Submission Date:** 26 October 2026

# SECTION 1: PROJECT OVERVIEW

## 1.1 Project Title

Online Shopping System

## 1.2 Business Idea

The Online Shopping System is a relational database project designed to manage customers, products, and orders for an online shopping business. The database stores customer details, product information, available stock, and orders placed by customers.

## 1.3 Problem Statement

An online shopping business needs an organized way to store customer information, manage product details, and track customer orders. Managing this information without a structured database can lead to duplicated information, inaccurate records, and difficulties retrieving order details.

## 1.4 Project Objectives

The objectives of this project are to:

- Create a relational database using MySQL.
- Create related tables with primary keys and foreign keys.
- Insert and manage sample business records.
- Retrieve information using SELECT statements.
- Combine related information using JOIN operations.
- Modify existing records using UPDATE statements.
- Change table structures using ALTER TABLE.
- Add new records while maintaining data integrity.

## 1.5 Selected Database Management System

The selected database management system is MySQL 8.0, and MySQL Workbench is used to execute SQL statements and inspect the database.

## 1.6 Database Name

`yousra_joyce_ishimwe_202513181_online_shopping_system`

# SECTION 2: DATABASE AND TABLE DESIGN

## 2.1 Database Description

The database contains three related tables:

1. `customers`
2. `products`
3. `orders`

The customers table stores customer information, the products table stores product information, and the orders table records products ordered by customers.

## 2.2 Customers Table

The customers table stores information about customers.

| Column | Data type | Description |

| customer_id | INT | Automatically generated primary key |
| customer_name | VARCHAR(100) | Customer's name; later renamed to `full_name` |
| email | VARCHAR(100) | Customer's unique email address |
| phone | VARCHAR(20), later VARCHAR(15) | Customer's phone number |

Constraints:

- `customer_id` is the primary key and uses AUTO_INCREMENT.
- `customer_name` is NOT NULL before it is renamed.
- `email` is NOT NULL and UNIQUE.

## 2.3 Products Table

The products table stores information about products available for sale.

| Column | Data type | Description |

| product_id | INT | Automatically generated primary key |
| product_name | VARCHAR(100) | Name of the product |
| category | VARCHAR(50) | Product category |
| price | DECIMAL(10,2) | Product price |
| stock_quantity | INT | Quantity available in stock |

Constraints:

- `product_id` is the primary key and uses AUTO_INCREMENT.
- `product_name` is NOT NULL.
- `price` is NOT NULL.
- `stock_quantity` is NOT NULL.

## 2.4 Orders Table

The orders table stores information about orders placed by customers.

| Column | Data type | Description |

| order_id | INT | Automatically generated primary key |
| customer_id | INT | References the customer |
| product_id | INT | References the product |
| order_date | DATE | Date of the order |
| quantity | INT | Quantity ordered |
| shipping_status | VARCHAR(50) | Shipping status, added later |

Constraints:

- `order_id` is the primary key and uses AUTO_INCREMENT.
- `customer_id` references `customers(customer_id)`.
- `product_id` references `products(product_id)`.
- `order_date` is NOT NULL.
- `quantity` is NOT NULL.
- `shipping_status` has a default value of `Pending` after it is added.

## 2.5 Primary Keys and Foreign Keys

A primary key uniquely identifies each record in a table. In this database, `customer_id`, `product_id`, and `order_id` are primary keys. AUTO_INCREMENT allows MySQL to generate their values automatically.

A foreign key connects related tables and helps maintain referential integrity. The `customer_id` column in the orders table references the customers table, and `product_id` references the products table.

These constraints help prevent orders from referencing customers or products that do not exist, provided foreign-key enforcement is enabled and the constraints remain in place.

## 2.6 Table Relationships

### Customers and Orders

One customer can place multiple orders, while each order references one customer. This relationship connects customer information with order information.

### Products and Orders

One product can appear in multiple orders, while each order references one product. This relationship connects product information with order details.

The orders table acts as the child table because it contains foreign keys referencing the customers and products tables.

## 2.7 Entity-Relationship Diagram (ERD)

The ERD is generated from the actual database using MySQL Workbench.

<img width="578" height="417" alt="erdDigram" src="https://github.com/user-attachments/assets/65f7de2a-211c-4949-8e1a-2b990da62f79" />


# SECTION 3: DATABASE AND TABLE CREATION

## 3.1 Create the Database

CREATE DATABASE yousra_joyce_ishimwe_202513181_online_shopping_system;

USE yousra_joyce_ishimwe_202513181_online_shopping_system;

**Explanation:** The CREATE DATABASE statement creates the database, while USE selects it for subsequent SQL operations.

## 3.2 Create the Customers Table

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

**Explanation:** This statement creates the customers table. It defines an automatically generated primary key and constraints on customer names and email addresses.

## 3.3 Create the Products Table

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

**Explanation:** This statement creates the products table and defines the columns required to store product names, categories, prices, and stock quantities.

## 3.4 Create the Orders Table

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

**Explanation:** This statement creates the orders table. Its foreign keys connect each order to an existing customer and product.

## 3.5 Verification

SHOW TABLES;

DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;

<img width="510" height="168" alt="Table Creation" src="https://github.com/user-attachments/assets/6de9e4f1-db84-425a-ae1b-b725a60133a6" />


# SECTION 4: INITIAL DATA INSERTION

The initial dataset contains five customer records, five product records, and five order records. These records are inserted before carrying out the practical manipulation tasks.

## 4.1 Insert Initial Customers

INSERT INTO customers (customer_name, email, phone)
VALUES
('Alice Uwase', 'alice@gmail.com', '0788888888'),
('Jean Bosco', 'bosco@gmail.com', '0733333333'),
('Diane Mutoni', 'diane@gmail.com', '07222222222'),
('Eric Mugisha', 'eric@gmail.com', '0799999999'),
('Grace Uwimana', 'grace@gmail.com', '0789345672');

**Explanation:** This statement inserts five customer records. MySQL generates the customer IDs automatically.

## 4.2 Insert Initial Products

INSERT INTO products
(product_name, category, price, stock_quantity)
VALUES
('Smartphone X', 'Electronics', 450000.00, 15),
('Running Shoes', 'Fashion', 45000.00, 30),
('Bluetooth Speaker', 'Electronics', 35000.00, 25),
('Backpack', 'Fashion', 25000.00, 50),
('Water Bottle', 'Home', 10000.00, 100);

**Explanation:** This statement inserts five products with their categories, prices, and stock quantities.

## 4.3 Insert Initial Orders

INSERT INTO orders
(customer_id, product_id, order_date, quantity)
VALUES
(1, 1, '2026-10-01', 1),
(2, 2, '2026-10-02', 2),
(3, 3, '2026-10-03', 1),
(4, 4, '2026-10-04', 1),
(5, 5, '2026-10-05', 3);

**Explanation:** This statement inserts five orders. Each order references a customer and a product through foreign keys.

## 4.4 Verify Initial Records

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

**Explanation:** These queries retrieve the records in each table to verify that the initial data was inserted.

<img width="528" height="194" alt="initial records" src="https://github.com/user-attachments/assets/16991b33-3d39-4c5f-a97c-3c07b07a6c9f" />

# SECTION 5: SQL PRACTICAL TASKS

## 5.1 SELECT — Data Retrieval

### Q1.1: Basic Data Retrieval

**Objective:** Retrieve customer names and email addresses.

SELECT full_name, email
FROM customers;

**Explanation:** The query retrieves the customer names and email addresses without displaying every column in the table.

<img width="288" height="219" alt="basic data retrival" src="https://github.com/user-attachments/assets/7fc12533-e94c-4e21-acad-9b534a4c8195" />

### Q1.2: Conditional Data Retrieval

**Objective:** Retrieve products in the Electronics category.

SELECT product_name, price, stock_quantity
FROM products
WHERE category = 'Electronics';

**Explanation:** The WHERE clause filters the products table to display only electronic products, together with their prices and stock quantities.

<img width="358" height="166" alt="conditional data retrieval" src="https://github.com/user-attachments/assets/f8cea346-165a-4668-b931-6d127f1adb33" />


### Q1.3: Sorted Data Retrieval

**Objective:** Display products in descending order of price.

SELECT product_name, price, stock_quantity
FROM products
ORDER BY price DESC;

**Explanation:** ORDER BY arranges the product records according to price. DESC means the highest price appears first.

<img width="362" height="229" alt="sorted data retrieval" src="https://github.com/user-attachments/assets/1a945afb-00e6-41fc-b182-0491ee7366bc" />


## 5.2 JOIN — Retrieving Related Data

The following JOIN statements use `customer_name`, which is the original column name before the ALTER TABLE task. This keeps the script executable in the assignment's required order, where JOIN tasks come before the column rename.

### Q2.1: INNER JOIN

**Objective:** Retrieve orders with matching customer information.

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.quantity
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;

**Explanation:** INNER JOIN returns records where the customer ID matches in both the orders and customers tables.

<img width="528" height="194" alt="initial records" src="https://github.com/user-attachments/assets/d3a3b807-e2bd-4873-8a78-05c1dc5ea31e" />

### Q2.2: LEFT JOIN

**Objective:** Display all customers and their orders where available.

SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
    
**Explanation:** LEFT JOIN returns every customer from the left table, including customers without a matching order. The order columns are NULL when no matching order exists.

<img width="304" height="225" alt="left join" src="https://github.com/user-attachments/assets/f01ed503-f097-4373-9a7a-7bc0925d1880" />


### Q2.3: Multi-Table JOIN

**Objective:** Combine customer, product, and order information to calculate order costs.

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS total_cost
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id;

**Explanation:** This query combines three related tables. The total cost is calculated by multiplying the quantity ordered by the product price.

<img width="535" height="136" alt="multi table join" src="https://github.com/user-attachments/assets/2a9131e7-0712-4796-888b-9d9ff2039e56" />

## 5.3 UPDATE — Modifying Existing Data

### Q3.1: Update One Record

**Objective:** Change the phone number of one customer.

UPDATE customers
SET phone = '0789999999'
WHERE customer_id = 1;

SELECT *
FROM customers
WHERE customer_id = 1;

**Explanation:** The UPDATE statement changes the phone number of customer ID 1. The SELECT statement verifies the change.

<img width="400" height="77" alt="update one record" src="https://github.com/user-attachments/assets/e0f2e86b-5e1a-4ad2-92ab-89f6ded49e33" />

### Q3.2: Update Multiple Records

**Objective:** Increase the stock quantity of electronic products by 10.

UPDATE products
SET stock_quantity = stock_quantity + 10
WHERE category = 'Electronics';

SELECT *
FROM products
WHERE category = 'Electronics';

**Explanation:** The UPDATE statement adds 10 to the stock quantity of each product in the Electronics category.

<img width="510" height="175" alt="update multiple records" src="https://github.com/user-attachments/assets/5c26afdc-f1bc-4aaa-852a-ac3287abe3a4" />

### Q3.3: Conditional Update

**Objective:** Reduce the prices of products with stock quantities greater than 40 by 10%.

UPDATE products
SET price = price * 0.90
WHERE stock_quantity > 40;

SELECT *
FROM products
WHERE stock_quantity > 40;

**Explanation:** The query applies a 10% discount to products whose stock quantity is greater than 40.

<img width="511" height="216" alt="conditional update" src="https://github.com/user-attachments/assets/6142f902-0a23-41f2-adbb-a60849716ac1" />


## 5.4 ALTER TABLE — Modifying Table Structure

### Q4.1: Rename a Column

**Objective:** Rename `customer_name` to `full_name`.

ALTER TABLE customers
RENAME COLUMN customer_name TO full_name;

DESCRIBE customers;

**Explanation:** The ALTER TABLE statement renames the column without removing the existing customer names. DESCRIBE verifies the new column name.

**Result:** The customers table uses `full_name` after this operation.

<img width="472" height="117" alt="rename a column" src="https://github.com/user-attachments/assets/d0210075-6ff6-4a98-a9e5-afebd2eb3171" />

### Q4.2: Change a Column's Data Type

**Objective:** Change the phone column's data type to VARCHAR(15).

**Explanation:** This statement changes the permitted length of the phone column to 15 characters. VARCHAR is appropriate for phone numbers because they can contain leading zeros and are not used for arithmetic.

<img width="472" height="117" alt="rename a column" src="https://github.com/user-attachments/assets/0ad99b4b-0b83-4621-a96b-0b91cb58061c" />

### Q4.3: Add a Column

**Objective:** Add a shipping status column to the orders table.

ALTER TABLE orders
ADD COLUMN shipping_status VARCHAR(50) DEFAULT 'Pending';

DESCRIBE orders;

**Explanation:** The statement adds a column for tracking the shipping status of orders. The default value is Pending.

## 5.5 INSERT — Adding New Records

### Q5.1: Insert a Single Record

**Objective:** Insert one additional product into the products table.

INSERT INTO products
(product_name, category, price, stock_quantity)
VALUES
('Mechanical keyboard', 'Electronics', 25000.00, 25);

SELECT *
FROM products
WHERE product_name = 'Mechanical keyboard';


**Explanation:** The INSERT statement adds a product without manually specifying the primary key. The SELECT statement checks whether the product exists.

<img width="517" height="51" alt="insert a single record" src="https://github.com/user-attachments/assets/7c5eb158-ace8-4e98-9fee-9ab70bf4a28f" />

### Q5.2: Insert Multiple Records

**Objective:** Insert two additional customers.

INSERT INTO customers (full_name, email, phone)
VALUES
('Louse ndogo', 'louse@gmail.com', '0723451234'),
('Aline Uwase', 'aline.u@gmail.com', '0787777777');

SELECT *
FROM customers
WHERE email IN ('louse@gmail.com', 'aline.u@gmail.com');

**Explanation:** The INSERT statement adds two customers. The SELECT query verifies the records using their unique email addresses.

**Actual result recorded:**

| customer_id | full_name | email | phone |

| 33 | Louse ndogo | louse@gmail.com | 0723451234 |
| 34 | Aline Uwase | aline.u@gmail.com | 0787777777 |

MySQL generated the customer IDs automatically. AUTO_INCREMENT values may contain gaps.

### Q5.3: Insert a Related Record

**Objective:** Insert an order referencing an existing customer and product.

INSERT INTO orders
(customer_id, product_id, order_date, quantity)
VALUES
(6, 6, '2026-10-24', 2);

SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    shipping_status
FROM orders
WHERE order_id = 8;

| order_id | customer_id | product_id | order_date | quantity | shipping_status |

| 8 | 6 | 6 | 2026-10-24 | 2 | Pending |

**Explanation:** The shared orders output shows order ID 8 with customer ID 6 and product ID 6. The shipping status is Pending.

# SECTION 6: CONCLUSION

This assignment helped me understand how to create and manage a relational database using MySQL. I practiced creating tables, defining primary keys and foreign keys, and establishing relationships between customers, products, and orders. I also learned how to insert records, retrieve data using SELECT statements, combine related information using JOIN operations, modify records using UPDATE statements, and change table structures using ALTER TABLE. The project improved my understanding of SQL, data integrity, and the importance of verifying database operations through actual query results.

