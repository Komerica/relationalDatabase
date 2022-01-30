/*
				Assignment 1 
                  Worth 3%
                Total Assignment is out of 75 marks  
		Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/

/*
 Question 1
 Write a statement to Create a database (make sure your database doesn't contain special characters)  ( 5 marks )
*/
CREATE DATABASE ASSIGNMENT1;

/*
 Question 2
 Write a statement to Drop that Database you created in Question 1  ( 5 marks )
*/
DROP DATABASE ASSIGNMENT1;

/*
 Question 3
 Write a statement to set the database you created to be the one that will be active for your session  ( 5 marks )
*/
USE ASSIGNMENT1;

/*
 Question 4
 Write a statement to Create a table that will have columns that represent all of the basic datatypes that are available in the database
         (make sure your table and column names describe the content of the table)  ( 15 marks )
 example
 CREATE TABLE book_info (
     id                 VARCHAR(32)     not null,
     filePath           long varchar     null,
     price		        float     null ,
     title                  null,
     author             long varchar     null,
  );
*/
CREATE TABLE employee_info (
    idNumber CHAR(2) NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    salary FLOAT,
    phoneNumb CHAR(10),
    PRIMARY KEY (idNumber)
);

/*
 Question 5
 Write 5 statements to add data to the table you created in question 4   ( 15 marks )
 */
INSERT INTO employee_info (idNumber,firstName,lastName,salary,phoneNumb)
VALUES
 (01,'Jepil','Lee',100000.50,'1234567890'),
 (02,'Darcy','Kim',999999.99,'2345678901'),
 (03,'Daniel','Oh',123456.78,'3456789012'),
 (04,'Nick','Jeon',147258.36,'4567890123'),
 (05,'Bryan','Im', 159357.28,'5678901234');

/*
 Question 6
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row
 ( make sure your table and column names are describe the content of the table)   ( 10 marks )
 */
CREATE TABLE student_info (
	studentID		CHAR(9) NOT NULL,
    studentName		VARCHAR(20) NOT NULL,
    class			CHAR(2) NOT NULL,
    age				INT NOT NULL,
    emergContact	CHAR(10),
    PRIMARY KEY (studentID)
);
CREATE TABLE studnt_grade (
	gradeID			CHAR(2) NOT NULL,
	studentID 		INT,
    grade 			varchar(2) NOT NULL,
    PRIMARY KEY (gradeID)
);

/*
 Question 7
 Write 5 statements to add to the first table you created in question 6   ( 10 marks )
 Write 5 statements to add to the second table you created in question 6  ( 10 marks )
 */
 INSERT INTO student_info (studentID,studentName,class,age,emergContact)
 VALUES
  (200494772,'Jepil','A1',25,1234567890), 
  (200494773,'Darcy','A1',42,1234567891),
  (200494774,'Daniel','A2',23,1234567892),
  (200494775,'Nick','A2',24,1234567893),
  (200494776,'Bryan','A3',22,1234567894);
  
INSERT INTO studnt_grade
 VALUES
  (01,200494772,'A+'), 
  (02,200494773,'A'), 
  (03,200494774,'B+'), 
  (04,200494775,'B'), 
  (05,200494776,'C+');
