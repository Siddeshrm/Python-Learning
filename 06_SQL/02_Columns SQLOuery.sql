/* Assume that you already created a column
we can do following operations on columns

A) We can add a new column
B) we can drop a column
C) We can modify that data type of a column
D) We can rename the column

That means some thing we are changing already an existed table

The main keyword here is : ALTER    */



use datascience

select * from student_details


/*======================= Case-1:  Add a Column ======================
 -- Syntax :
 -- alter table <table_name> add <column_name>  <data_type>    */

 ALTER table student_details
 add city varchar(30)                      -- when you add new column: first it takes null value

select * from student_details


-- you can add multiple columns
-- syntax:
-- alter table <table_name> add <column_name1> <data_type>, <column_name2> <data_type2>

ALTER table student_details
add student_fee float,
student_department char

select * from student_details


/*========================== Case-2: Drop the columns ====================

-- syntax:
-- alter table <table_name> drop column <column_name>
-- for multiple columns
-- alter table <table_name> drop column <column_name1>, column <column_name2> */

alter table student_details
drop column city

select * from student_details

-- now for multiple columns

alter table student_details
drop column student_fee, 
	  column student_department

select * from student_details




/*======================= Case-3: Modify the column ================================

-- "modify columns" means changing the "data type"
-- student details table student_id data type is int
-- If we want to change int type to char

- syntax
-- alter table <table_name> alter column <column_name> <change_data_type>   */

alter table student_details
alter column student_id char

select * from student_details

-- get back to int type and check the details
alter table student_details
alter column student_id int

select * from student_details



/*====================== Case-4: Rename the Column ====================
this case have difference in SQL and MySQL server

-- In MS SQL server we have stored procedures
-- It is like a package in python
-- 10% syntax changes will be there Mysql/MSSQL/Oracle
-- Stored procedures (SP) is acollection of sql statements and sql commands
-- Which are already compiled and stored in database



-- syntax

-- sp_rename '<table_name>.<old_column_name>', '<new_column_name>', 'column'   */

-- change the student to SNAME

sp_rename 'student_details.student_name','SNAME','column'
select * from student_details

EXEC sp_rename 'student_details.SNAME','student_name','column'
select * from student_details



/*============================ Case-5: Rename the table ============================

-- syntax
-- sp_rename '<old_table_name>','<new_table_name>'   */

sp_rename 'student_details','STUDENT_DETAILS1'
select * from student_details1

-- SQL is not a case sensitive

EXEC sp_rename 'STUDENT_DETAILS1','student_details'
select * from student_details



/*============================ All Together ===============================
A) Add a new column
B) Drop a column
C) modify the column
D) rename the column  */


create table student(student_id int)


--A) Add a new column
alter table student
add student_name varchar(30),
    student_marks float

alter table student
add student_city char

select * from student



-- B) Drop column
alter table student
drop column student_city




-- C) modify the column
alter table student
alter column student_name char

alter table student
alter column student_name varchar(30)




-- D) rename the column 

sp_rename 'student.student_name','SNAM','column'

select * from student

sp_rename 'student.SNAM','student_name','column'        -- or u can use EXEC

select * from student

-- E) renmae the table

sp_rename 'student','STD'

sp_rename 'STD','student'

select * from student