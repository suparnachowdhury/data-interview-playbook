-- ============================================
-- Practice Exercises Solution
-- ============================================

-- Easy

-- 1. Find all sales where the amount is greater than the average sale amount across the entire table.
SELECT *
FROM sales
WHERE amount >
(
    SELECT AVG(amount)
    FROM sales
);

-- 2. For each salesperson, count the number of high-value sales (sales greater than $1,000).

SELECT
    salesperson_id,
    COUNT(CASE WHEN amount > 1000 THEN 1 END) AS high_value_sales
FROM sales
GROUP BY salesperson_id;


-- Medium

-- 1. Find the salespeople whose total sales are greater than the average total sales of all salespeople.
WITH salesperson_sales AS
(
    SELECT
        salesperson_id,
        SUM(amount) AS total_sales
    FROM sales
    GROUP BY salesperson_id
),
average_sales AS
(
    SELECT AVG(total_sales) AS avg_total_sales
    FROM salesperson_sales
)

SELECT
    s.salesperson_id,
    s.total_sales
FROM salesperson_sales s
CROSS JOIN average_sales a
WHERE s.total_sales > a.avg_total_sales;

-- 2. For each salesperson, return their total sales, average sale amount, and total value of high-value sales (sales greater than $1,000) in a single query.

-- 3. Create a report that displays each salesperson's February sales total as a separate column using conditional aggregation.

-- ==============================================
-- Bonus Challenge
-- ==============================================
/*
Write a single query that returns each salesperson_id, their total sales, average sale amount, 
number of high-value sales (greater than $1,000), and their rank based on total sales. 
Your solution must use a CTE, conditional aggregation, and a window function
and it should not use any nested subqueries.
*/ 