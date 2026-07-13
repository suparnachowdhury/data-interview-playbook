-- Dataset

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    salesperson_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO sales
(sale_id, salesperson_id, order_date, product_id, amount)
VALUES
(1,101,'2026-02-01',501,1200.00),
(2,101,'2026-02-03',502,450.00),
(3,101,'2026-02-07',503,450.00),

(4,102,'2026-02-02',501,800.00),
(5,102,'2026-02-05',504,1600.00),
(6,102,'2026-02-09',502,300.00),

(7,103,'2026-02-01',505,240.00),
(8,103,'2026-02-04',503,480.00),
(9,103,'2026-02-06',501,1950.00),
(10,103,'2026-02-10',504,720.00),
(11,104,'2026-02-08',506,1600.00);

-- =============================
-- Easy
-- =============================
-- Show every sale with the total revenue across the entire table.
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    SUM(amount) OVER() AS total_table_revenue
FROM sales;


-- Show every sale with each salesperson's total revenue.
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    SUM(amount) OVER(PARTITION BY salesperson_id) AS salesperson_total_revenue
FROM sales;


-- Rank all sales using RANK().
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    RANK() OVER(ORDER BY amount DESC) AS overall_sales_rank
FROM sales;

-- Number each salesperson's sales using ROW_NUMBER().
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    ROW_NUMBER() OVER(PARTITION BY salesperson_id ORDER BY order_date) AS salesperson_sale_number
FROM sales;


-- Find each salesperson's smallest sale.
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    MIN(amount) OVER(PARTITION BY salesperson_id) AS salesperson_min_sale
FROM sales;


-- ============================= 
-- Medium
-- =============================
-- Calculate a running total for every salesperson.

-- Show the previous sale using LAG().

-- Show the next sale using LEAD().

-- Rank each salesperson's sales using DENSE_RANK().

-- Calculate what percentage each sale contributes to the salesperson's total revenue.

-- =============================
--  Bonus Challenge
-- =============================
/*
Return every sale together with:

salesperson_id
order_date
amount
salesperson total revenue
running total
rank within salesperson
previous sale amount
difference from previous sale

Sort the output by salesperson and order date.
*/