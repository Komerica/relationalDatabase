
-- drop the existing database, create it and use it
DROP DATABASE IF EXISTS db_pizzas;
CREATE DATABASE db_pizzas;
USE db_pizzas;

-- drop the existing table
-- DROP TABLE IF EXISTS tbl_pizzas;

CREATE TABLE tbl_pizzas
(
	pizza_name	VARCHAR(20)         PRIMARY KEY, 				-- name of the pizza
    pizza_type	VARCHAR(25)			NOT NULL,					-- type of the pizza
    pizza_cost	DEC(4,2)			NOT NULL DEFAULT 1,			-- cost of the pizza
    customer_rating	ENUM('0','1','2','3','4','5') DEFAULT '0'		-- rating given by customer; '5' is the maximum
);

-- populate the table with data
INSERT INTO tbl_pizzas(pizza_name,pizza_type,pizza_cost,customer_rating)
VALUES
('Hawaiian','DeepDish',2.50,'3'),
('Deluxe','Thick Stuffed',2,'3'),
('Pepperoni','Ring',2.00,NULL),
('Cheese','Thick',DEFAULT,'4'),
('BBQ Chicken','Suffed Crust',1.50,'2'),
('Meat','Plain',2.25,'5');
-- (NULL,'Ring',2.50,4), -- Primary Key value cannot be null
-- ('Meat','Ring',2.50,4); -- cannot add a duplicate name (PK)

INSERT INTO tbl_pizzas(pizza_name,pizza_type)
VALUES
('Waky Meat','Special');

-- 1. select all records(no filter) and all fields(*)
desc tbl_pizzas;
-- describe tbl_pizzas; 도 가능함!
SELECT * FROM tbl_pizzas;


-- 2a. display record of BBQ Chicken all fields. Case insensitive filtering.Exact match with =
SELECT * FROM tbl_pizzas
WHERE pizza_name = 'BBQ Chicken'; 

-- always mention field list in any order of fields/columns
SELECT pizza_name, pizza_type, pizza_cost, customer_rating
FROM tbl_pizzas
WHERE pizza_name = 'HawaIIan';

-- 2b. case sensitive search. A collation is a set of rules that defines how to compare and sort character strings.
SELECT * FROM tbl_pizzas
WHERE pizza_name = 'HawaIIan'
COLLATE 'utf8mb4_bin';  -- default is utf8_general_ci 
; 

-- 3. inexact match using LIKE - all pizzas that have Meat in its name using wildcard characters - % stands for 0 or more characters
SELECT *
FROM tbl_pizzas
WHERE pizza_name LIKE '%Meat%';

-- 4b.Select all pizzas that begin with Haw in its name
SELECT  * FROM   tbl_pizzas
WHERE pizza_name LIKE 'Haw%';

-- 5. Select all pizzas with a name that has characters following; the wildcard character _ stands for one character
SELECT * FROM tbl_pizzas
WHERE pizza_name LIKE 'Pepper___';

-- 6. Select all pizzas with 6 letter names 
SELECT * FROM tbl_pizzas
WHERE pizza_name LIKE '______';

-- use trim to remove leading and trailing blanks and then the length function to count the characters in name
SELECT TRIM('    DARCY  RICETTO   ');
SELECT LENGTH('DARCY RICETTO');

SELECT * FROM tbl_pizzas
WHERE LENGTH(TRIM(pizza_name)) = 6;


-- 7. Wild characters can be combined
-- all pizzas with name that have a single character followed by eat..... ;
SELECT * FROM tbl_pizzas
WHERE TRIM(pizza_name) LIKE '_eat%';

-- 8. Select all pizzas with 'i' in the name
SELECT * FROM tbl_pizzas
WHERE pizza_name LIKE '%i%';

-- 9. try to figure this Select 
SELECT * FROM tbl_pizzas
WHERE pizza_name LIKE '%____i'; 

-- 10. Select fields(any number, any order), - pizza_name, pizza_cost for all 'Meat' pizzas
SELECT pizza_name, pizza_cost
FROM tbl_pizzas
WHERE pizza_name LIKE '%%e_t%';

-- compound conditions using boolean operators - and, or, not
-- relational opeartors >, >=, < ,<= ,=, !=, <> (last two are 'not equal')

-- 11. Select pizzas of type ring and cost at least 2, display the name and cost
SELECT pizza_name, pizza_cost
FROM tbl_pizzas
WHERE pizza_type = 'Ring' AND pizza_cost >= 2;

-- 12. Select pizzas of type ring or cost at least 2, display the name and cost
SELECT pizza_name, pizza_cost, pizza_type 
FROM tbl_pizzas
WHERE pizza_type = 'Ring' OR pizza_cost >= 2;

-- 13. Select pizzas of type ring and cost at least 2, display the name and cost - use NOT operator which SHOULD be used with field name
SELECT pizza_name, pizza_cost
FROM tbl_pizzas
WHERE pizza_type = 'Ring' AND  NOT pizza_cost < 2;

-- 14. Select pizza  name and cost of those pizzas where cost is different from $2 - three solutions
SELECT pizza_name, pizza_cost
FROM tbl_pizzas
WHERE pizza_cost <> 2;

SELECT pizza_name, pizza_cost
FROM tbl_pizzas
WHERE pizza_cost != 2;

SELECT pizza_name, pizza_cost
FROM tbl_pizzas
WHERE NOT pizza_cost = 2;

-- 15. Select pizza name and the customer rating, with rating >=3
-- the rating is an enumerated type- list of string objects with a pre-defined order
SELECT pizza_name , customer_rating
FROM tbl_pizzas
WHERE customer_rating >= '3';

-- will give wrong answer
SELECT pizza_name , customer_rating
FROM tbl_pizzas
WHERE customer_rating >= 3;

-- 16. Select pizzas with 'NULL' rating; use IS , cannot use = 
SELECT * 
FROM tbl_pizzas
WHERE customer_rating IS NULL; 

-- 17. Select pizzas that do not have a NULL rating; use IS NOT , cannot use <> or !=
SELECT * 
FROM tbl_pizzas
WHERE customer_rating IS NOT NULL; 

-- 18a. Select pizzas with cost between $2 and $3, inclusive - 3 solutions
SELECT * 
FROM tbl_pizzas
WHERE pizza_cost >= 2 AND pizza_cost <= 3 ;
-- between can be used with numeric and text data ; both limits are included
SELECT * 
FROM tbl_pizzas
WHERE pizza_cost BETWEEN 2 AND 4 ;
-- NOT operator
SELECT * 
FROM tbl_pizzas
WHERE NOT pizza_cost < 2 AND NOT pizza_cost > 3 ;

-- 18b. Select pizzas with name starting with A, B or C
-- using relational operators
SELECT * 
FROM tbl_pizzas
WHERE pizza_name >='A' AND pizza_name < 'Dz';

-- insert a couple of 'test' records
INSERT INTO tbl_pizzas
VALUES
('D', 'Ring', 3, '5');
INSERT INTO tbl_pizzas
VALUES
('Do','Ring', 3, '5');

-- using BETWEEN operator
SELECT * 
FROM tbl_pizzas
WHERE pizza_name BETWEEN 'A' AND 'D'
AND pizza_name != 'D';

-- use a string function
SELECT LEFT(pizza_name,1), RIGHT(pizza_name,1), pizza_name
FROM tbl_pizzas
WHERE LEFT(pizza_name,1) BETWEEN 'A' AND 'C';
 
-- 19. Select statement to display names different from field names, use AS or without AS - no quotes requred in display/alias name if it is a single word with no special characters, so Rating in the select list can be used with or without quotes but the other two have to be enclosed in quotes
SELECT pizza_name 'Pizza Name', pizza_cost  'Cost($)', customer_rating Rating
FROM tbl_pizzas;
-- new cost with 20% increase - necessary to use display names in computed fields
SELECT pizza_name AS 'Pizza Name', ROUND(pizza_cost * 1.20,2) 'New Price 20% Increase'
FROM tbl_pizzas;

-- 20a. Display records - order the display by pizza type - ascending by default
SELECT *
FROM tbl_pizzas
ORDER BY pizza_type
;

SELECT *
FROM tbl_pizzas
ORDER BY pizza_type ASC
;

-- 20b. Display records in descending order
SELECT *
FROM tbl_pizzas
ORDER BY pizza_type DESC
;

-- 21. Can order by more than one field
-- display all pizzas by  type in descending order and in there by cost by ascending order
SELECT * 
FROM tbl_pizzas
ORDER BY pizza_type DESC, pizza_cost ASC;

-- 22. Display the first two records - BEWARE could be different for different runs
-- the order of records and the order of columns is not not 'fixed' in a table
SELECT * 
FROM tbl_pizzas
LIMIT 0,2; -- offset,how_many

SELECT * 
FROM tbl_pizzas
LIMIT 2; --  0 is the default offset

-- 23. Display records 2,3 and 4
SELECT * 
FROM tbl_pizzas
LIMIT 1,3 ;

-- 24. Combine the order by and limit to display the 'same' records
SELECT * 
FROM tbl_pizzas
ORDER BY pizza_type
LIMIT 0,2; 

-- 25  COMPLETE select STATEMENT - sequence is important
SELECT pizza_name 'pizza Name', pizza_cost 'Cost($)', customer_rating 'Rating'
FROM tbl_pizzas
WHERE customer_rating >= '2'
ORDER BY customer_rating DESC
LIMIT 0,5 ; 					--  if number of records < 5, the limit is ignored

SELECT pizza_name 'pizza Name', pizza_cost 'Cost($)', customer_rating Rating
FROM tbl_pizzas
WHERE customer_rating >= '2'
ORDER BY 3 DESC --  3 represents the third field in the select list
LIMIT 0, 10 ; --  if number of records < 10, the limit is ignored

-- you can use diplay/alias name IF they are single word with no special characters and no quotes, so Rating can be used in the ORDER BY clause
SELECT pizza_name 'pizza Name', pizza_cost 'Cost($)', customer_rating 'Rating'
FROM tbl_pizzas
WHERE customer_rating >= '2'
ORDER BY Rating DESC 			-- use the display/alias name without quotes
LIMIT 0,10 ; 					--  if number of records < 10, the limit is ignored