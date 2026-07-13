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
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    SUM(amount) OVER(
        PARTITION BY salesperson_id 
        ORDER BY order_date, sale_id
    ) AS running_total
FROM sales;

-- Show the previous sale using LAG(). If no such sale exists (e.g., for the first sale), 
-- return a default value of 0.00.
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    LAG(amount, 1, 0.00) OVER(
        PARTITION BY salesperson_id 
        ORDER BY order_date, sale_id
    ) AS sale_two_steps_back
FROM sales;


-- Show the next sale using LEAD().If no such sale exists (e.g., for the last sale), 
-- return a default value of 0.00.
SELECT 
    sale_id, salesperson_id, order_date, product_id, amount,
    LEAD(amount, 1, 0.00) OVER(
        PARTITION BY salesperson_id 
        ORDER BY order_date, sale_id
    ) AS sale_two_steps_ahead
FROM sales;

/*
Return every sale together with:
salesperson_id, order_date, amount, running total, previous sale amount
difference from previous sale
Sort the output by salesperson and order date.
*/

-- Calculate what percentage each sale contributes to the salesperson's total revenue.

-- =============================
--  Bonus Challenge
-- =============================

/*
Find the top 2 highest sales for each salesperson, ordered by the sale amount descending. 
If a salesperson has a tie for their second-highest sale, break the tie by choosing the sale 
with the earlier sale_id. 
A salesperson with only one total sale should still be included in the output.
*/
WITH ranked_sales AS (
    SELECT 
        sale_id, salesperson_id, order_date, product_id, amount,
        DENSE_RANK() OVER (
            PARTITION BY salesperson_id 
            ORDER BY amount DESC
        ) AS sale_rank
    FROM sales
)
SELECT salesperson_id, sale_id, order_date, product_id, amount, sale_rank AS price_tier
FROM ranked_sales
WHERE sale_rank <= 2
ORDER BY salesperson_id, amount DESC;