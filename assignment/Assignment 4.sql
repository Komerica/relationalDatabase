/*
				Assignment 4
                  Worth 5%
                Total Assignment is out of 50 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements
                                
                Make sure you run the CreateDB Script to create the sample database 
                You will need it to create the queries based on these tables
                There is a .jpg file which shows the tables in the database
*/


/*
 Question 1
 Write an UPDATE statement to change all of the LASTNAMEs in the EMPLOYEE table to SMITH ( 5 marks )
*/
# Put your answer here
USE sample;
SET SQL_SAFE_UPDATES = 0;
UPDATE employee SET LASTNAME = 'SMITH' WHERE LASTNAME IS NOT NULL;
-- method 2. UPDATE employee SET LASTNAME = 'SMITH' WHERE LASTNAME!='';
SELECT * FROM employee;

/*
 Question 2
 Write an UPDATE statement to change all of the MAJPROJ records in the PROJECT to AD9999
 Where they don't have a value( 5 marks )
*/
UPDATE project SET MAJPROJ = 'AD9999' WHERE MAJPROJ ='';

DESC project;
SELECT * FROM project;

/*
 Question 3
 Write a single UPDATE statement to change the QUANTITY to 200
 and the LOCATION to Barrie  WHERE the PID has a 1 in the 7th position( 8 marks )
 INVENTORY TABLE
*/
UPDATE inventory SET QUANTITY = 200 WHERE PID LIKE '______1%';
SELECT * FROM inventory;
DESC inventory;

/*
 Question 4
 Write an UPDATE statement to change the SALARY to be increased by 10%
 WHERE EMPLOYEE IS older than 40 years old( 10 marks ) (hint date functions to determine age)
*/
UPDATE employee SET SALARY = SALARY*1.1 WHERE YEAR(NOW())-YEAR(BIRTHDATE) > 40;

SELECT * FROM employee WHERE YEAR(NOW())-YEAR(BIRTHDATE) > 40;

/*
 Question 5
 Write a DELETE statement to remove employee 000030 from the EMPLOYEE table  ( 5 marks )
 */
DELETE FROM employee WHERE EMPNO = '000030';
SELECT * FROM employee WHERE EMPNO = '000030';
DESC employee;

/*
 Question 6
 Write a DELETE statement to remove records where the total of their SALARY
 and COMM column together is less than $40000
 and they have worked for the company for less than 8 years from the STAFF table ( 7 marks )
*/
DELETE FROM staff WHERE SALARY + COMM < 40000 AND YEARS < 8;
SELECT * FROM staff WHERE SALARY + COMM < 40000 AND YEARS < 8;

/*
 Question 7
  Write a DELETE statement to remove records WHERE the REGION has South in the name
  and the SALES DATE is in APRIL in the SALES table  ( 10 marks )
*/
DELETE FROM SALES WHERE REGION LIKE '%south%' AND MONTH(SALES_DATE) = 4;
SELECT * FROM SALES WHERE REGION LIKE '%south%' AND MONTH(SALES_DATE) = 4;


 
 
 
