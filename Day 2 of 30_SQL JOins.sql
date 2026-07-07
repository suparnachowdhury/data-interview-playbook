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


-- Create Orders Table


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);





-- Create Products Table


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


-- Insert Product Data

INSERT INTO products
(product_id, product_name, category, price)
VALUES

(201, 'Laptop', 'Electronics', 1200.00),

(202, 'Chair', 'Furniture', 80.00),

(203, 'Mouse', 'Electronics', 25.00),

(204, 'Notebook', 'Office Supplies', 5.00),

(205, 'Monitor', 'Electronics', 300.00),

(206, 'Desk', 'Furniture', 250.00),

(207, 'Keyboard', 'Electronics', 45.00),

(208, 'Headphones', 'Electronics', 120.00),

(209, 'Printer Paper', 'Office Supplies', 12.00),

(210, 'Tablet', 'Electronics', 500.00);
