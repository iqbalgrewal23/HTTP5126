-- LAB 4 AGGREGATE FUNCTIONS
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

--  1 
-- A
SELECT MIN(price) FROM stock_item ;
-- B
SELECT MAX(inventory) FROM stock_item;
-- C
SELECT AVG(price) FROM stock_item;
-- D
SELECT SUM(inventory) FROM stock_item;

--  2
-- A
SELECT role, COUNT(*)AS employee_count FROM employee GROUP BY role;
-- B
SELECT category, COUNT(*) AS mammals FROM stock_item  WHERE category <> 'piscine' GROUP BY (category);
-- C
SELECT AVG(price) AS 'Average price', category FROM stock_item WHERE inventory > 0 GROUP BY (category);

--  3
-- A
SELECT category AS 'species', SUM(inventory) AS 'In stock' FROM stock_item GROUP BY category ORDER BY 'In Stock' ASC;
-- B
SELECT category , SUM(inventory) AS total_stock, ROUND(AVG(price),2) AS averge_price FROM stock_item GROUP BY category
HAVING total_stock <100; 

--  4
-- A
SELECT item AS product ,CONCAT('$',price) AS price , inventory AS "Stock remaining", category AS Species,(price * inventory) AS "potential earnings"
FROM stock_item ORDER BY     "potential earnings" DESC;