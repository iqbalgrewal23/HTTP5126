--  LAB 5 MULTIPLE TABLES

--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sale WHERE stock_item_id >1014;

-- B 
SELECT sale.date ,stock_item.stock_item_id FROM sale JOIN stock_item ON
sale.stock_item_id=stock_item.stock_item_id WHERE stock_item.stock_item_id=1014;

--  2
-- A 
SELECT *from sale where employee_id=111;
-- B
SELECT sale.date , employee.first_name ,employee.last_name ,sale.stock_item_id
FROM sale JOIN employee ON sale.employee_id=employee.employee_id 
WHERE sale.employee_id=111;


--  3
-- A
SELECT sale.date ,stock_item.name FROM sale JOIN stock_item
ON sale.stock_item_id=stock_item.stock_item_id WHERE sale.date LIMIT 5;
-- B
SELECT sale.date ,employee.first_name,employee.last_name, stock_item.name,
stock_item.price FROM sale JOIN employee ON sale.employee_id=employee.employee_id
JOIN stock_item ON stock_item.stock_item_id=sale.stock_item_id 
WHERE sale.date limit 5;

--  4
-- A
SELECT sale.date,stock_item.name, employee.first_name FROM sale INNER JOIN
stock_item ON stock_item.stock_item_id=sale.stock_item_id INNER JOIN employee ON
employee.employee_id=sale.employee_id
WHERE sale.date BETWEEN '2025-01-12'AND '2025-01-18';

-- B
SELECT employee.first_name ,employee.last_name, COUNT(*) AS total_sales 
FROM sale JOIN employee ON sale.employee_id = employee.employee_id
GROUP BY  employee.first_name, employee.last_name
ORDER BY total_sales DESC;

--  5
-- A
SELECT sale.date, stock_item.name AS item_name, stock_item.price, stock_item.category, employee.first_name
FROM sale JOIN employee ON sale.employee_id = employee.employee_id JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
WHERE sale.employee_id = (SELECT sale.employee_id FROM sale GROUP BY sale.employee_id ORDER BY COUNT(sale.sale_id) DESC LIMIT 1);

-- B
SELECT stock_item.stock_item_id, stock_item.name, stock_item.price, stock_item.category, COUNT(sale.sale_id) as times_sold
FROM stock_item LEFT JOIN sale ON stock_item.stock_item_id = sale.stock_item_id
GROUP BY stock_item.stock_item_id, stock_item.name, stock_item.price, stock_item.category
ORDER BY stock_item.stock_item_id;

--  6
-- A 
-- A. Question: "As a manager, I want to know which product categories generate the most revenue. 
-- Can you show me the total sales value and number of items sold for each category, ordered by total revenue?"

-- B
SELECT stock_item.category, COUNT(sale.sale_id) as items_sold,
SUM(stock_item.price) as total_revenue FROM stock_item
LEFT JOIN sale ON stock_item.stock_item_id = sale.stock_item_id GROUP BY 
stock_item.category ORDER BY total_revenue DESC;