
-- drop the database if it exists, create a new one and use it
DROP DATABASE IF EXISTS db_candies;
CREATE DATABASE db_candies;
USE db_candies;

-- set the environment variables
SET SQL_SAFE_UPDATES = 0;


-- drop the table if it exists
-- DROP TABLE IF EXISTS tbl_candies;

-- create the table
CREATE TABLE tbl_candies(
	candy_name  		VARCHAR(20) PRIMARY KEY,	
	candy_cost			DEC(4,2) UNSIGNED NOT NULL,	
	carbs_grams			FLOAT(4,1) UNSIGNED NOT NULL,
	candy_color			VARCHAR(15) NOT NULL,
	candy_has_ice	    ENUM('Yes', 'No')  DEFAULT 'Yes', 
    calories			TINYINT UNSIGNED 
);

-- insert data in the table
INSERT INTO tbl_candies
VALUES
('Blackthorn', 3, 8.4, 'Yellow', 'Yes', 33),
('Blue Moon', 2.5, 3.2, 'Blue', 'Yes', NULL),
('Oh My Gosh', 3.5, 8.61, 'Orange', 'Yes', 35),
('Lime Fizz', 2.5, 5.4, 'Green', 'Yes', 24),
('Kiss on the Lips', 5.5, 42.52, 'Purple', 'Yes', 171),
('Hot Gold', 3.2, 32.1, 'Orange', 'No', 135),
('Lone Tree', 3.6, 4.2, 'Red', 'Yes', 17),
('Greyhound', 4, 14, 'Yellow', 'Yes', 50),
('Indian Summer', 2.8, 7.2, 'Brown', 'no', 30),
('Bull Frog', 2.6, 21.5, 'Tan', 'Yes', 80),
('Martini',3,0.8,'Clear','No', 112),
('M',3,0.8,'Clear','No', 112), 
('Soda and It', 3.8, 4.7, 'Red', 'No', 19),
('Penicillin Cocktail', 5 , 11, 'Honey', 'Yes', 189),
('Zaza', 3, 9, 'Red', NULL, 181);

-- select all records/columns from the table
SELECT * FROM tbl_candies;

-- -- -- -- -- -- -- -- -- -- -- UPDATES-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 1 UPDATE THE cost OF BLUE MOON TO $3.50
UPDATE tbl_candies
SET candy_cost = 3.50
WHERE candy_name='blue moon';

SELECT *
FROM  tbl_candies
WHERE candy_name='blue moon';

-- 2 Increase the cost by $1 for the candies
-- Oh My Gosh and Lime Fizz using a single update statement.
SELECT *
FROM tbl_candies
WHERE candy_name = 'Oh My Gosh' OR candy_name='Lime Fizz';

UPDATE tbl_candies
SET candy_cost = candy_cost+ 1
WHERE candy_name = 'Oh My Gosh' OR candy_name='Lime Fizz';

UPDATE tbl_candies
SET candy_cost = candy_cost+ 1
WHERE candy_name IN ('Oh My Gosh' ,'Lime Fizz');

-- 3 Change the color of orange colored candies to rust  

SELECT *
FROM tbl_candies
WHERE candy_color ='orange';

UPDATE tbl_candies
SET candy_color = 'rust'
WHERE candy_color ='orange';

SELECT *
FROM tbl_candies
WHERE candy_color ='rust';

-- 4 Set the candy_has_ice field to No where it is NULL

SELECT *
FROM  tbl_candies
WHERE candy_has_ice IS NULL;

UPDATE tbl_candies
SET candy_has_ice = 'No'
WHERE candy_has_ice IS NULL;

SELECT *
FROM  tbl_candies
WHERE candy_has_ice = 'Yes';

-- 5 Set the candy_has_ice field for all the candies to Yes
UPDATE tbl_candies
SET candy_has_ice = 'Yes';
-- WHERE candy_has_ice  = 'No' -- not efficient  and should not be coded

SELECT * FROM tbl_candies;

-- 5 Update the cost of all candies that are less than or equal to $5 to $4.50 

select * from tbl_candies  WHERE candy_cost <= 5;

UPDATE tbl_candies
SET candy_cost = 4.50
WHERE candy_cost <= 5;

-- 6 Update the cost to $6 for all the candies where carbs are greater than 20 and calories at least 80
select * from tbl_candies WHERE carbs_grams > 20 AND calories >= 80;

UPDATE tbl_candies
SET candy_cost = 6
WHERE carbs_grams > 20 AND calories >= 80;

-- 7 Change the candy_has_ice to No and color to red for Oh My Gosh using a single update statement.

UPDATE tbl_candies
SET candy_has_ice = 'No',
    candy_color = 'Red',
    candy_name='Oh My Gosh 2'
WHERE candy_name='Oh My Gosh';

select * from tbl_candies WHERE candy_name='Oh My Gosh 2';

-- 8 Change the color of Indian Summer by appending(add at end) 'light' to its color. You have no idea of its original color

UPDATE tbl_candies 
SET candy_color = CONCAT(candy_color, ' light')
WHERE candy_name='Indian Summer';

-- changing the color of candy M by preceding it by Really
UPDATE tbl_candies 
SET candy_color = CONCAT('Really ', candy_color)
WHERE candy_name = 'M';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- DELETE-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 1 Delete all records with no ice
SELECT * FROM tbl_candies
WHERE candy_has_ice = 'No';

DELETE FROM tbl_candies
WHERE candy_has_ice = 'No';

DELETE FROM tbl_candies
WHERE NOT candy_has_ice = 'Yes';


-- 2 Delete the candy with name 'M'
DELETE FROM tbl_candies
WHERE candy_name = 'M';

-- 3 Delete all rust and brown colored candies
DELETE FROM tbl_candies
WHERE candy_color IN ('rust', 'brown');

DELETE FROM tbl_candies
WHERE candy_color ='rust' OR candy_color = 'brown';

-- 4 Delete all candies with null calories
DELETE FROM tbl_candies
WHERE calories IS NULL;


-- 5 Delete all records
DELETE FROM tbl_candies;

SELECT * FROM tbl_candies;

-- DROP TABLE tbl_candies;

ROLLBACK;
COMMIT;