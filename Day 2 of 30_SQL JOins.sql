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