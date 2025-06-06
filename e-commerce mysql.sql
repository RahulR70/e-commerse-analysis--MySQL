create database g1;
use g1;
-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
-- Insert 10 rows
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@example.com', 'Mumbai'),
(2, 'Bob', 'bob@example.com', 'Delhi'),
(3, 'Charlie', 'charlie@example.com', 'Bangalore'),
(4, 'David', 'david@example.com', 'Chennai'),
(5, 'Eve', 'eve@example.com', 'Hyderabad'),
(6, 'Frank', 'frank@example.com', 'Pune'),
(7, 'Grace', 'grace@example.com', 'Kolkata'),
(8, 'Hannah', 'hannah@example.com', 'Ahmedabad'),
(9, 'Ian', 'ian@example.com', 'Jaipur'),
(10, 'Judy', 'judy@example.com', 'Mumbai');

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Insert 10 rows
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 70000),
(2, 'Smartphone', 'Electronics', 30000),
(3, 'Headphones', 'Accessories', 2000),
(4, 'Shoes', 'Fashion', 2500),
(5, 'T-Shirt', 'Fashion', 700),
(6, 'Backpack', 'Accessories', 1200),
(7, 'Refrigerator', 'Appliances', 20000),
(8, 'Microwave', 'Appliances', 10000),
(9, 'Washing Machine', 'Appliances', 25000),
(10, 'Book', 'Stationery', 400);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- Insert 10 rows
INSERT INTO Orders VALUES
(101, 1, '2024-06-01'),
(102, 2, '2024-06-02'),
(103, 1, '2024-06-03'),
(104, 3, '2024-06-03'),
(105, 5, '2024-06-04'),
(106, 4, '2024-06-05'),
(107, 6, '2024-06-06'),
(108, 7, '2024-06-07'),
(109, 8, '2024-06-08'),
(110, 10, '2024-06-09');

-- Create OrderItems table
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

select*from Customers;

-- Get all orders from Mumbai customers
SELECT * FROM Orders
WHERE customer_id IN (SELECT customer_id FROM Customers WHERE city = 'Mumbai');

-- Group orders by customer and count
SELECT customer_id, COUNT(*) AS order_count
FROM Orders
GROUP BY customer_id
ORDER BY order_count DESC;

-- INNER JOIN: Orders with customer names
SELECT o.order_id, c.customer_name, o.order_date
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- LEFT JOIN: All orders, show customer details
SELECT o.order_id, c.customer_name
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id;

-- RIGHT JOIN: All customers and any orders
SELECT c.customer_name, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON o.customer_id = c.customer_id;

-- Customers who have placed more than 1 order
SELECT customer_id, customer_name
FROM Customers
WHERE customer_id IN (
  SELECT customer_id
  FROM Orders
  GROUP BY customer_id
  HAVING COUNT(*) > 1
);

-- Total sales per category
SELECT p.category, SUM(p.price * oi.quantity) AS total_sales
FROM Products p
JOIN OrderItems oi ON p.product_id = oi.product_id
GROUP BY p.category;

-- Average price of products sold
SELECT AVG(p.price) AS avg_price
FROM Products p
JOIN OrderItems oi ON p.product_id = oi.product_id;

-- Create a view of detailed order information
CREATE VIEW OrderSummary AS
SELECT o.order_id, c.customer_name, p.product_name, oi.quantity, (p.price * oi.quantity) AS total_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

