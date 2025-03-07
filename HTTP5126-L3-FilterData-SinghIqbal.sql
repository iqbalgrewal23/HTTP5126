-- LAB 3 FILTER DATA
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

--  1 
-- A
SELECT * FROM employee WHERE role ="manager" OR role="assistant";
-- B
SELECT * FROM stock_item WHERE category="piscne" AND inventory<"24";

--  2
-- A
SELECT item AS cages , price FROM stock_item WHERE item LIKE "%cage";
-- B
SELECT first_name FROM employee WHERE first_name like"f%"; 

--  3
-- A
 SELECT * FROM stock_item WHERE stock_item_id BETWEEN "1010"and "1015";
-- B
SELECT item,price FROM stock_item WHERE category="Canine" AND price BETWEEN "10"AND "20" ;

--  4
-- A
SELECT first_name,last_name ,phone FROM employee WHERE NOT (role="assistant" OR role="manager");
-- B
SELECT item, price , inventory, category FROM stock_item WHERE inventory > 20  AND category NOT IN ("Canine", "Feline");

--  5
-- A
SELECT first_name,last_name,role,phone FROM employee ORDER BY last_name;
-- B
SELECT stock_item_id,item,price,inventory FROM stock_item WHERE category="Murine" AND inventory>20 ORDER BY price DESC;