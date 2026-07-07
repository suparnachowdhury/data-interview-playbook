-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    order_date DATE,
    category VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO orders (
    order_id,
    customer_id,
    customer_name,
    city,
    order_date,
    category,
    product,
    quantity,
    unit_price,
    total_amount
) VALUES
(1001, 101, 'Michael Johnson', 'New York',     '2026-01-03', 'Electronics',     'Laptop',         1, 1200.00, 1200.00),
(1002, 102, 'Sophia Martinez', 'Chicago',      '2026-01-05', 'Furniture',       'Chair',          4,   80.00,  320.00),
(1003, 101, 'Michael Johnson', 'New York',     '2026-01-10', 'Electronics',     'Mouse',          2,   25.00,   50.00),
(1004, 103, 'Daniel Kim',      'Boston',       '2026-01-12', 'Office Supplies', 'Notebook',      10,    5.00,   50.00),
(1005, 104, 'Priya Sharma',    'Seattle',      '2026-01-15', 'Electronics',     'Monitor',        2,  300.00,  600.00),
(1006, 102, 'Sophia Martinez', 'Chicago',      '2026-01-18', 'Furniture',       'Desk',           1,  250.00,  250.00),
(1007, 105, 'James Wilson',    'Boston',       '2026-01-20', 'Electronics',     'Keyboard',       3,   45.00,  135.00),
(1008, 103, 'Daniel Kim',      'Boston',       '2026-01-22', 'Furniture',       'Chair',          2,   80.00,  160.00),
(1009, 101, 'Michael Johnson', 'New York',     '2026-01-24', 'Office Supplies', 'Printer Paper',  5,   12.00,   60.00),
(1010, 106, 'Olivia Brown',    'Seattle',      '2026-01-26', 'Electronics',     'Laptop',         1, 1300.00, 1300.00),
(1011, 104, 'Priya Sharma',    'Seattle',      '2026-01-27', 'Furniture',       'Desk',           2,  250.00,  500.00),
(1012, 102, 'Sophia Martinez', 'Chicago',      '2026-01-29', 'Electronics',     'Headphones',     2,  120.00,  240.00),
(1013, 105, 'James Wilson',    'Boston',       '2026-01-30', 'Office Supplies', 'Pen Set',        8,    6.00,   48.00),
(1014, 101, 'Michael Johnson', 'New York',     '2026-01-31', 'Electronics',     'Monitor',        1,  300.00,  300.00);

