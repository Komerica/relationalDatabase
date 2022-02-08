/*
				Assignment 2 
                  Worth 3%
                Total Assignment is out of 75 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/

/*  NOTE   Please read all the questions before creating your table in question 1
as your table and data need to be good enough quality to satisfy the conditions for Question 3 - 6 */

 CREATE DATABASE ASSIGNMENT2;
 USE ASSIGNMENT2;
 
 /*
 Question 1
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row
 and are related by one of their columns ( make sure you have a least 1 date column )   ( 15 marks )
 */
 CREATE TABLE family_info (
	famMember VARCHAR(20) NOT NULL,
	fullName VARCHAR(20) NOT NULL,
	birthDate DATETIME NOT NULL,
    job VARCHAR(30),
    PRIMARY KEY(famMember)
);
	
CREATE TABLE house_chore (
	choreName VARCHAR(20) NOT NULL,
    famMember VARCHAR(20) NOT NULL,
    cleaningDay ENUM('Mon','Tues','Wed','Thurs','Fri','Sat','Sun','Everyday') NOT NULL DEFAULT 'Everyday',
	recentCleanedDate DATE NULL,
	priority ENUM('1','2','3','4','5') DEFAULT 3,
    PRIMARY KEY(choreName),
    FOREIGN KEY(famMember) REFERENCES family_info(famMember)
);


 /*
 Question 2
/////// NOTE remember the order of which table you insert into first is important
 Write 10 statements to add to the source table you created in question 1   ( 10 marks )
 Write 10 statements to add to the dependant table you created in question 1  ( 10 marks )
 */
INSERT INTO family_info 
VALUES
('Great grand father','Daniel','19220101','Samsung honorary president'),
('Great grand mother','Natalie','19280202','Housewife'),
('Grand father','Dave','19420303','Samsung CEO'),
('Grand mother','Nicole','19450404','Housewife'),
('Father','Michael','19650505','Samsung CTO'),
('Mother','Karen','19680606','Housewife'),
('Uncle','Justin','19790707','Samsung vice president'),
('Son','Jepil','19920808','Samsung director'),
('Sister1','Yang','19960909','Student'),
('Sister2','Jin','19960909','Student');
INSERT INTO house_chore
VALUES
('Ventilation','Great grand father',DEFAULT,'20220105','1'),
('Bathroom','Mother','Sun','20220106','2'),
('Master bedroom','Uncle','Sat','20220108','2'),
('Doing the dishes','Son',DEFAULT,'20220110','1'),
('Second room','Sister1','Fri','20220111','4'),
('Living room','Sister2','Thurs','20220112',DEFAULT),
('Vacuum','Great grand mother','Wed','20220112','2'),
('Car wash','Father','Tues','20220115','5'),
('Back yard','Grand mother','Wed','20220116','4'),
('Front yard','Grand father','Tues','20220119','4');
 
 /*
 Question 3
 Write a SELECT statement that uses the LIKE statement and a character to find some of the records
 in one of your tables you created in Question 1 ( Use either the % or the _ for the rest of your wildcard)   ( 10 marks )
 */
SELECT famMember, fullName, job FROM family_info WHERE famMember like '%father';
 
  /*
 Question 4
 Write a SELECT statement that uses the BETWEEN statement to find some of the records
 in one of your tables using the date column you created in Question 1  ( 10 marks )
 */
 SELECT famMember, choreName, recentCleanedDate FROM house_chore WHERE recentCleanedDate BETWEEN '20220108' and '20220111';
 
 /*
 Question 5
 Write a SELECT statement that uses the BETWEEN statement and sorts the data by 2 of the columns
 one in Ascending and one in Descending order on the tables you created in Question 1  ( 10 marks )
 */
 SELECT * FROM house_chore WHERE priority BETWEEN '1' and '3' ORDER BY recentCleanedDate DESC, priority ASC;
 
  /*
 Question 6
 Write a SELECT statement that selects a list of values (using the IN operator) from one of your tables,
 then use that same query and use the NOT operator to get the opposite data on the tables you created in Question 1   ( 10 marks )
 */
SELECT * FROM house_chore WHERE priority NOT IN('1');