CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO customers
(customer_id, customer_name, city)
VALUES
(101, 'Michael Johnson', 'New York'),
(102, 'Sophia Martinez', 'Chicago'),
(103, 'Daniel Kim', 'Boston'),
(104, 'Priya Sharma', 'Seattle'),
(105, 'James Wilson', 'Boston'),
(106, 'Olivia Brown', 'Seattle'),
(107, 'Emma Davis', 'Denver');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);


INSERT INTO orders
(order_id, customer_id, product_id, order_date, quantity, total_amount)
VALUES

(1001, 101, 201, '2026-01-03', 1, 1200.00),

(1002, 102, 202, '2026-01-05', 4, 320.00),

(1003, 101, 203, '2026-01-10', 2, 50.00),

(1004, 103, 204, '2026-01-12', 10, 50.00),

(1005, 104, 205, '2026-01-15', 2, 600.00),

(1006, 102, 206, '2026-01-18', 1, 250.00),

(1007, 105, 207, '2026-01-20', 3, 135.00),

(1008, 103, 202, '2026-01-22', 2, 160.00),

(1009, 101, 209, '2026-01-24', 5, 60.00),

(1010, 106, 201, '2026-01-26', 1, 1300.00),

(1011, 104, 206, '2026-01-27', 2, 500.00);