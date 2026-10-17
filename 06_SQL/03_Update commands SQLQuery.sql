use datascience

/*============ Update =========================
update is used to update the rows
		- specific rows
		- on specific column
		- by using some conditions

update means simply update(modify) the rows

-- All the values in a specific column will update
syntax:
update <table_name>
set <column_name>=value

-- update multiple columns values
update <table_name>
set <column1>=value,
	<column2>=value   */


-- insert 3 rows
insert into student_details values (1,'chandu',200),
									(4,'shree',100),
									(5,'bhaskar',300)
select * from student_details

/*======================== Case-1 =======================
now update all the students_marks is 500 */



update student_details 
set student_marks=500

select * from student_details




/*====================== Case-2 (on single condition) ============================
I want to update a specific row
I want to update only Harsh marks as 300

use condition : where clause----- important interview question


-- syntax:
update <table_name> set <column_name>
where <condition>          */

update student_details 
set student_marks=250 where student_name='Harsh'

select * from student_details

-- update student_marks =400 where student_id=1
update student_details
set student_marks=270 where student_id=1

select * from student_details






/*=================== Case-3(Two conditions)=========================
I want change the student_name = 'Neha' based on student_id=3 and student_marks=500 */

update student_details set student_name='Neha'
where student_id=3 and student_marks=500

select * from student_details


update student_details set student_name='Neha'
where student_id=3 or student_marks=500

select * from student_details

update student_details set student_name='Ankit'
where student_id=3 or student_marks=270

select * from student_details







/*===================== Case-4(Update null values) ====================
update the null values
create a new column sudent_city
by using alter command     */

-- for this we have to create city column with null
alter table student_details add student_city varchar

sp_rename 'student_details.student_city','city','column'
select * from student_details

alter table student_details alter column city varchar(20)

--------------------------------------------- updating null values -------------------
update student_details set city='Hyb'

select * from student_details


----- create one more column as base_location
alter table student_details add base_location varchar(20)
select * from student_details


-- update base location with Hyb
-- where base_location has null values and student_marks==270

update student_details set base_location='Hyb' where student_marks=270
select * from student_details 

--- above query we can write like this also
update student_details set base_location='Hyb' where student_marks=270 and base_location is NULL
select * from student_details 



--updating 270 marks to 400
update student_details set student_marks=400 where student_marks=270
select * from student_details













/*========================== Case-5: Update with NULL values ===================
-- Where student_id = 1
-- I want to update student name with NULL */

update student_details set student_name=NULL where student_id=1
select * from student_details




/*===================== Case-6(In operator)================================

I want update city with Bengaluru only for ids2,4,5 */

update student_details set city='Blr'
where student_id in (2,4,5)

select * from student_details





/*===================== Case-7 (not in operator)================================*/
update student_details set city='Chennai'
where student_id not in (2,4,5)          -- means it wll change in 1,3,1

select * from student_details





/*===================== Case-8 (Between operator)================================*/
update student_details set student_name='Sai'
where student_id between 2 and 5

select * from student_details




/*=================== Case-8 (> , < operators) ===============================
update student marks with Null where student id > 3 */

update student_details set student_marks=null
where student_id>3

select * from student_details


/*=============== updating multiple columns ================================*/
update student_details set student_marks=450, base_location='Mumbai' where student_id>=2

select * from student_details