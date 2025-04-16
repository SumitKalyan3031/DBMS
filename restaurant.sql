CREATE DATABASE RestaurantDB;
USE RestaurantDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);

INSERT INTO Customers (name, phone, email, address) VALUES
('Ravi Kumar', '9876543210', 'ravi.kumar@example.com', '12 MG Road, Delhi'),
('Sneha Mehta', '8765432109', 'sneha.mehta@example.com', '45 Park Street, Mumbai'),
('Amit Sharma', '9988776655', 'amit.sharma@example.com', '78 Anna Nagar, Chennai');

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    role VARCHAR(50),
    salary DECIMAL(10, 2),
    contact VARCHAR(15)
);

INSERT INTO Employees (name, role, salary, contact) VALUES
('Priya Singh', 'Chef', 45000.00, '9001122334'),
('Rahul Verma', 'Waiter', 22000.00, '9005566778'),
('Anjali Nair', 'Manager', 55000.00, '9009988776');

CREATE TABLE Menu (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(8, 2),
    availability BOOLEAN
);

INSERT INTO Menu (item_name, category, price, availability) VALUES
('Paneer Butter Masala', 'Main', 250.00, TRUE),
('Masala Dosa', 'Main', 120.00, TRUE),
('Gulab Jamun', 'Dessert', 60.00, TRUE),
('Lassi', 'Drink', 50.00, TRUE),
('Veg Manchurian', 'Starter', 150.00, TRUE),
('Dal Makhani', 'Main', 200.00, FALSE);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    employee_id INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Orders (customer_id, employee_id, total_amount) VALUES
(1, 2, 460.00),
(2, 1, 290.00),
(3, 2, 260.00);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(8, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu(item_id)
);

INSERT INTO Order_Details (order_id, item_id, quantity, price) VALUES
(1, 1, 1, 250.00),
(1, 3, 2, 60.00),
(2, 2, 2, 120.00),
(2, 4, 1, 50.00),
(3, 5, 1, 150.00),
(3, 4, 1, 50.00);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount_paid DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payments (order_id, payment_method, amount_paid) VALUES
(1, 'UPI', 460.00),
(2, 'Card', 290.00),
(3, 'Cash', 260.00);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    reservation_time DATETIME,
    number_of_people INT,
    table_number INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Reservations (customer_id, reservation_time, number_of_people, table_number) VALUES
(1, '2025-04-13 19:00:00', 2, 6),
(3, '2025-04-14 20:00:00', 4, 3);

-- 1. List all customers
SELECT * FROM Customers;

-- 2. List all employees with salary > ₹30,000
SELECT * FROM Employees
WHERE salary > 30000;

-- 3. Show available menu items
SELECT item_name, category, price
FROM Menu
WHERE availability = TRUE;

-- 4. Get order details by Order ID (e.g., order_id = 1)
SELECT o.order_id, c.name AS customer_name, m.item_name, od.quantity, od.price
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Menu m ON od.item_id = m.item_id
WHERE o.order_id = 1;

-- 5. Show all payments with order info
SELECT p.payment_id, p.order_id, p.payment_method, p.amount_paid, o.order_date
FROM Payments p
JOIN Orders o ON p.order_id = o.order_id;

-- 6. Get reservation details
SELECT r.reservation_id, c.name AS customer_name, r.reservation_time, r.number_of_people, r.table_number
FROM Reservations r
JOIN Customers c ON r.customer_id = c.customer_id;

-- 7. Total revenue collected
SELECT SUM(amount_paid) AS total_revenue
FROM Payments;

-- 8. Most ordered menu items (top 5)
SELECT m.item_name, SUM(od.quantity) AS total_ordered
FROM Order_Details od
JOIN Menu m ON od.item_id = m.item_id
GROUP BY m.item_name
ORDER BY total_ordered DESC
LIMIT 5;

-- 9. Orders handled by each employee
SELECT e.name AS employee_name, COUNT(o.order_id) AS orders_handled
FROM Employees e
JOIN Orders o ON e.employee_id = o.employee_id
GROUP BY e.name;

-- 10. Customers with both reservations and orders
SELECT DISTINCT c.name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Reservations r ON c.customer_id = r.customer_id;