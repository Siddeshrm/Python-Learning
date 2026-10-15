-- when you open new query page, a white board will pop up
-- this page belongs to master database
-- so we have to crate new database

/*----------- syntax -------------*/

-- create database <database_name>
-- syntax in not case sensitive


create database datascience

-- we created a new data base : datascience
-- now we want to use the datascience database
-- use <database_name>

use datascience

-- database we can change manually or by using query

/*
create table <table_name>(column1 <data_type>,
						  column2 <data_type>,
						  column3 <data_type>)
*/

create table student_details(student_id int,
							 student_name varchar(255),    -- variable charecter
							 student_marks float)
-- create table student_details(student_gender varchar(255))


-- select * from <table_name>
select * from student_details      -- all the columns will select
select student_id,student_name from student_details    -- selected columns

-- insert values

/* insert into <tabel_name> values (row1),(row2), (row3)*/

insert into student_details values
(1,'Harsh',100),
(2,'Hemanth',200),
(3,'Shashi',300)


--Query the table

select * from student_details


--=================== All Together =================================
-- Create a database
-- Use a database
-- Create a table
-- insert values
-- query the table
/* 
create database datascience
use datascience

create table student_details(student_id int, student_name varchar(255), student_marks float)

select * from student_details
select student_id,student_name from student_details
insert into student_details values (1,'Harsh',100), (2,'Hemanth',200), (3,'Shashi',300)

select * from student_details */
-----------------------------------------------------------------------------------------------------------------------------------------------






--============================ 1) Identity columns ======================================================
/* identity(1,1)   start=1  increment by = 1      1,2,3,4
   identity(5,2)   start=5  increment=2           5,7,9,11 */

   -- create new table

create table employee_details(Eid int identity(1,1),
								 E_name varchar(30),
								 E_salary float)


insert into employee_details values ('Mukesh',50000.50),
									('Siddesh',35000),
									('Ganesh',60000),

select * from employee_details

insert into employee_details values (Null,70000)
select * from employee_details


/* Eid (INT, NOTNULL) ====>
					1) it is a integer data type
					2) and null values are not allowed

Esalary(float,null)===>
					1) It is a float data types
					2) Null values are allowed        */





--------------------------------- CASE-2:---------------------
/*====================== 2) Not NULL column =================*/

-- not null means the specified column not contain null values

create table product(
product_id int identity(1,1),
product_name varchar(30),
product_city varchar(25) not null)

insert into product values ('car','Mumbai')

select * from product

insert into product values ('Bus',Null) --error(bcz Cannot insert the value NULL into column 'product_city', table)

insert into product values (10,'Bus','Mumbai')  -- error

select * from product



----------------------------- Case-3 -------------------------

/*===================== default column name =========================
suppose assume all the items are from same city i.e "HYB"
then we can use "HYB" value as default value for city column    */

create table product1(
product_id int identity(1,1),
product_name varchar(30) not null,
product_city varchar(25) default 'Hyb')


insert into product1(product_name) values ('Car'),    -- when default column is there it can be null soo. product_city can be overwrite
                                                      -- when you want insert values sepcify column name
('Bus'),
('ambasidor'),
('bugati')

select * from product1
insert into product1(product_name,product_city) values ('Bus','Mumbai')
-- insert into product1 values ('Bus','Mumbai')            u can use this also or above last line also fine 
select * from product1

------------------------------------------------------------------------------------------------------------------------------


/* Drop the table vs Truncate the Table  and delete ----- very important questions


-- DROP TABLE <table_name1>, <Table_name2>

-- you will loss all the information

-- it will completely delete the table */

drop table product

select * from product


/*========================== Truncate the table ================*/

-- truncate Table <table_name1>, <table_name2>
-- delete all the rows
-- table will exist
-- using truncate we can not delete specifiv rows

truncate table product1

select * from product1

-- truncate ---  inside information will delete. table will remain 



------------ Getting Scheme of tables and columns------------------

