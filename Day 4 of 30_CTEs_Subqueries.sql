CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    salesperson_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1,101,'2026-02-01',501,1200),
(2,101,'2026-02-03',502,450),
(3,101,'2026-02-07',503,450),
(4,102,'2026-02-02',501,800),
(5,102,'2026-02-05',504,1600),
(6,102,'2026-02-09',502,300),
(7,103,'2026-02-01',505,240),
(8,103,'2026-02-04',503,480),
(9,103,'2026-02-06',501,1950),
(10,103,'2026-02-10',504,720),
(11,101,'2026-03-02',501,900),
(12,101,'2026-03-08',504,1800),
(13,102,'2026-03-03',503,650),
(14,102,'2026-03-10',505,2200),
(15,103,'2026-03-01',502,500),
(16,103,'2026-03-07',501,1400);

-- =======================
-- Practice Exercises
-- ========================

-- Easy

-- 1. Find all sales where the amount is greater than the average sale amount across the entire table.


-- 2. For each salesperson, count the number of high-value sales (sales greater than $1,000).


-- Medium

-- 1. Find the salespeople whose total sales are greater than the average total sales of all salespeople.


-- 2. For each salesperson, return their total sales, average sale amount, and total value of high-value sales (sales greater than $1,000) in a single query.

-- 3. Create a report that displays each salesperson's February sales total as a separate column using conditional aggregation.

Bonus Challenge
Write a single query that returns each salesperson_id, their total sales, average sale amount, number of high-value sales (greater than $1,000), and their rank based on total sales. Your solution must use a CTE, conditional aggregation, and a window function, and it should not use any nested subqueries.