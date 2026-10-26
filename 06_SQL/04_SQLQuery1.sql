use datascience

select * from bank

-- 1Q) Top 20 rows

select top 20 * from bank



-- 2Q) No of rows in a table
-- use count

select count(*) from bank
-- the output is in a tabulat form
-- column : no column name (it is showing below like this)
-- row : count value

select count(*) as no_of_rows from bank
-- here column name: no_of_rows(see in output)

-- without using "as" it will work
select count(*)  count_of_rows from bank


-- All Together
select count(*) from bank
select count(*) as no_of_rows from bank
select count(*) count_of_rows from bank




-- 3Q) select top5 rows of balance column

select top 5 balance from bank

-- 4Q) Find the sum of balance  Keyword: sum
select sum(balance) as total_balance from bank

-- 5Q) Find the max of balance   keyword : max
select max(balance) as max_balance from bank

-- 6Q) Find the  of balance   keyword : min
select min(balance) as min_balance from bank

-- 7Q) Find the average of balance   keyword : avg
select avg(balance) as average_balance from bank
-- round the
select round(avg(balance),3) as avg_balance from bank

-- 8Q) Find count of balance
select count(balance) as count_balance from bank



-- All Together

select count(balance) as count_balance,
	   sum(balance) as total_balance,
	   max(balance) as max_balance,
	   min(balance) as min_balance,
	   avg(balance) as average_balance from bank

select sum(balance), count(balance),
		sum(balance)/count(balance) from bank




-- 9Q) How many types of jobs available
-- EDA we use unique
-- SQL distinct

select job from bank -- bank data 

select distinct job as unique_jobs from bank -- unique data will dispaly 12

select count(job) as total_jobs from bank -- entire data count 45211

select APPROX_COUNT_DISTINCT(job) from bank

select * from bank

-- 10Q) Retrive the balance for theose have age 80
select balance from bank where age=80

-- 11Q) Retrive the average balance for those have age=80
select avg(balance) as balance_80 from bank where age=80
select avg(balance) as balance_79 from bank where age=79
select avg(balance) as balance_78 from bank where age=78

-- above logic using between and in operator
select avg(balance) from bank where balance in (78,79,80)
-- this above question is given by OMKAR but i am fail






-----------------------------GROUPBY------------------------------
select age from bank
group by age

select count(age) from bank
select count(distinct age) as unique_age_count from bank


select distinct(age) from bank             -- both distinct and group by giving same output
select age from bank group by age              -- it will group all age members


select count(age) from bank group by age       -- it will count how many members are there who's the age 23. 23 age== 20 members are there


select age, count(age) from bank group by age




-- now for jod category

select job from bank group by job
select marital from bank group by marital


select marital,job from bank group by marital -- error
select marital,count(job) from bank group by marital
select job from bank group by marital --- error
select count(job) from bank group by marital

/* Case-1:
select job from bank group by marital -- error
select marital,count(job) from bank group by marital -- unique labels
select marital,job from bank group by marital -- error
we need to apply aggregate functions== sum, max, min, count .......
select marital,count(job) from bank group by marital  -- Correct */


-- Note: which column you want group select that column first

select age from bank group by age  -- this query divids age into different groups

select age, avg(balance) as age_average_balance
from bank group by age


select age,count(age) age_count from bank group by age

select age,count(age) age_count,
			sum(balance) as sum_balance,
			avg(balance) as avg_balance from bank group by age



--================================= ORDER BY ====================================

select age from bank group by age
order by age             -- default arrenge ages in ascending order

-- if you want descending order use desc
select age from bank group by age order by age desc

-- if you want ascending order use asc
select age from bank group by age order by age asc


-- job ascending descending
select job from bank group by job order by job

select job from bank group by job order by job desc



-- where condition ===== > group by ====> order by

select age, count(age) count_age,
			sum(balance) sum_balance,
			max(balance) max_balance,
			min(balance) min_balance,
			avg(balance) avg_balance from bank

group by age
order by avg_balance


-- 11Q) get the average balance of unemployed people

select job, avg(balance) avg_balance from bank
where job='unemployed'
group by job


select job, avg(balance) avg_balance from bank
group by job
where job='unemployed'     --- error




-- 14Q)  get the max, min, avg balance of different group of age people where y=0

select age, avg(balance),
			max(balance),
			min(balance) from bank
where y=0
group by age

--------------------------- IMP for interview Group by  ------------------------------------------
/* GROUP BY : IT divides the data into chungs. later u want to retrive another data. u have to apply aggrigation function

