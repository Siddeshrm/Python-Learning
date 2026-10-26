/*========================== JOINS ============================ IMP pakka questions

Information retrive mrthods

1. Select : With where condition from a single table
2. Projection : With out where condition from a single table
3. Joins : Retrive the information from multiple tables

1Q) what  is the joining creteria
					
					you want join based on any column
					you want join based on any common column


2Q) When i join two tables is two tables has equal rows?
					different table has different rows

3Q) After joining is duplicates allowed

joins are two types

A) ANSI-Formate : "ON" key word on join condition
				(i) Inner join
				(ii) Outer join:
				      --> Left outer join
					  --> Right outer join
					  --> Full outer join
				(iii) Cross join

B) Non-ANSI format: "Where" key word on join condition
				(i) Equi join
				(ii) Non-Equi join
				(iii) self join

will create two tables
1. Student_information
	{STID int,CNAME varchar, SMAIL varchar,COURSEID int}
2. Course_details
    {COURSE int,CNAME varchar,CFEE decimal(6,2)}

decimal(6,2): 6 digits and 2 decimals
*/


use datascience


create table STUDENT_INFORMATION(STID int,SNAME varchar(50), SMAIL varchar(100),COURSEID INT)

CREATE TABLE COURSE_DETAILS(COURSEID INT,CNAME VARCHAR(20), CFEE DECIMAL(6,2))

SELECT * FROM STUDENT_INFORMATION, COURSE_DETAILS

INSERT INTO STUDENT_INFORMATION VALUES(1,'AKASHY','akashy@gmail.com',111),
									  (2,'Bunny','bunny@gmail.com',222),
									  (3,'Chinni','chinni@yahoo.com',333),
									  (4,'Darma','darma@outlook.com',444),
									  (5,'Veera','veera@gmail.com',555)

insert into COURSE_DETAILS values (111,'science',1000), --6 digit = 4 digit 2 decimal points
								  (222,'Commerce',800),
								  (333,'Arts',750)
select * from STUDENT_INFORMATION, COURSE_DETAILS


/*===================== Inner join ==========================
1. Common column
2. data type of common column must be same

syntax:
select * from <t1> join key <t2>
ON
<joining condition>

we are joining two tables by using "ON" keyword
by using commom column */

--====================== Case-1: Same column ======================

select * from STUDENT_INFORMATION
select * from COURSE_DETAILS

select * from STUDENT_INFORMATION inner join COURSE_DETAILS
ON
STUDENT_INFORMATION.COURSEID=COURSE_DETAILS.COURSEID



--======================= Case-2: Different column ======================
select * from STUDENT_INFORMATION inner join COURSE_DETAILS
ON
STUDENT_INFORMATION.STID=COURSE_DETAILS.COURSEID

-- Do one thing insert a one more row COURSE_DETAILS with COURSEID=5
--              insert one more row in student_information with stid=333

insert into COURSE_DETAILS values (5,'DS',2000)
insert into COURSE_DETAILS values (4,'AD',2000)
insert into STUDENT_INFORMATION values(333,'Ankit','ankith@gmail.com',5)


select * from STUDENT_INFORMATION
select * from COURSE_DETAILS

select * from STUDENT_INFORMATION inner join COURSE_DETAILS
ON 
STUDENT_INFORMATION.STID=COURSE_DETAILS.COURSEID


--inner join means common data
-- if data is not common, inner join will give empty table

-- we can able to join with different column also




/*=========================== Case-3: different column with different data type =========================
Try to join tables SMAIL from STUDENT_INFORMATION
with COURSEID from  COURSE_DETAILS    */

select * from STUDENT_INFORMATION inner join COURSE_DETAILS
ON
STUDENT_INFORMATION.SMAIL = COURSE_DETAILS.COURSEID   --- error

-- iN ORDER TO JOIN TWO TABLES EITHER USE SAME COLUMN OR DIFFERENT COLUMN
-- DATA TYPE MUST BE SAME


-- duplicates are allowed or not allowed?


-- insert a row COURSE DETAILS  with courseid=111
insert into COURSE_DETAILS values(111,'IOT',1500)
insert into COURSE_DETAILS values(222,'Commerce',800)

select * from STUDENT_INFORMATION
select * from COURSE_DETAILS


select * from STUDENT_INFORMATION inner join COURSE_DETAILS
ON
STUDENT_INFORMATION.COURSEID=	COURSE_DETAILS.COURSEID

-- Common column, different column, same data types, duplicates are allowed

--                     or
-- Duplicates are allowed
-- Same data type must
-- No common column required




--=================== Left outer join ========================

select * from STUDENT_INFORMATION
select * from COURSE_DETAILS

insert into COURSE_DETAILS values(555,'CS',3000),(666,'Block chain',4000)

-- CASE-1: SAME COLUMN

select * from COURSE_DETAILS
select * from STUDENT_INFORMATION

select * from  COURSE_DETAILS  left outer join STUDENT_INFORMATION
ON
COURSE_DETAILS.COURSEID =  STUDENT_INFORMATION.COURSEID

-- INTER CHANTE "STUDENT INFORMATION" AND "COURSE DETAILS"

select * from STUDENT_INFORMATION   left outer join COURSE_DETAILS 
ON
COURSE_DETAILS.COURSEID =  STUDENT_INFORMATION.COURSEID


--=================== CASE-2 =============================
-- different column

select * from COURSE_DETAILS
select * from STUDENT_INFORMATION

select * from COURSE_DETAILS left outer join STUDENT_INFORMATION
ON 
COURSE_DETAILS.COURSEID=STUDENT_INFORMATION.STID


--=================== Right outer join ================================

select * from COURSE_DETAILS
select * from STUDENT_INFORMATION

SELECT * FROM COURSE_DETAILS RIGHT OUTER JOIN STUDENT_INFORMATION
ON
COURSE_DETAILS.COURSEID=STUDENT_INFORMATION.COURSEID
















--=========================== FULL OUTER JOIN =====================

SELECT * FROM COURSE_DETAILS FULL outer join STUDENT_INFORMATION
ON
COURSE_DETAILS.COURSEID=STUDENT_INFORMATION.COURSEID










--================================ hi i am siddesh