/*
File Name   : 01_schema_and_data.sql
Project     : SQL-Based HR Employee Analytics
Database    : hr_analytics_db
Description : Creates HR tables and inserts sample employee, department, and salary data.
*/

create database hr_analytics_db;
use hr_analytics_db;

-- ----------------------------------------------------------------------------------
-- Table : Employees
-- Purpose : Stores employee master data including department and joining information
-- -----------------------------------------------------------------------------------
create table Employees(
Emp_id int primary key auto_increment,
Emp_name varchar(20),
Dep_id int,
Join_date date,
Job_title varchar(25)
);
drop table employees;
select*from Employees;
insert into Employees(emp_name,dep_id,join_date,job_title)
values
("Kaviya",1,"2020-01-10","HR Manager"),
("Arun",2,"2019-03-15","Accountant"),
("Sita",3,"2021-07-20","Software Engineer"),
("Ramesh",3,"2020-11-05","Data Analyst"),
("Priya",4,"2018-06-25","Marketing Executive"),
("Vikram",2,"2022-02-01","Finance Analyst"),
("Anitha",1,"2021-08-30","HR Executive"),
("Rohit",3,"2019-12-12","Software Engineer"),
("Meera",4,"2020-09-17","Marketing Manager"),
("Suresh",2,"2017-05-20","Senior Accountant");
alter table employees
auto_increment = 101;
set sql_safe_updates = 0;
delete from employees
where emp_id > 110;
alter table employees
auto_increment = 181;
insert into employees (emp_name,dep_id,join_date,job_title)
select  emp_name,dep_id,join_date,job_title from employees
limit 100;
select max(emp_id) from employees;
update employees
set dep_id = floor(6 + rand() * 10)
where emp_id >  150;

-- -----------------------------------------------------------------------------------
-- Table : Departments
-- purpose : Stores department master data
-- -----------------------------------------------------------------------------------
create table Departments(
Dep_id int,
Dep_name varchar(30),
Location varchar(25)
);
select*from Departments;
insert into Departments
values
(1,"HR","Chennai"),
(2,"Finance","Bangalore"),
(3,"IT","Hyderabad"),
(4,"Marketing","Delhi"),
(5,"HR","Chennai"),
(6,"Finance","Bangalore"),
(7,"IT","Hyderabad"),
(8,"Marketing","Delhi"),
(9,"Marketing","Delhi"),
(10,"HR","Chennai"),
(11,"Finance","Bangalore"),
(12,"IT","Hyderabad"),
(13,"Marketing","Delhi"),
(14,"Marketing","Delhi"),
(15,"HR","Chennai");
drop table departments;

-- -----------------------------------------------------------------------------------
-- Table : Salaries
-- Purpose : Stores employee salary and compensation data
-- -----------------------------------------------------------------------------------
create table Salaries(
Emp_id int,
Salary decimal(10,2),
Bonus decimal(10,2)
);
select*from Salaries;
insert into Salaries
values
(101,70000,5000),
(102,60000,3000),
(103,80000,7000),
(104,75000,4000),
(105,65000,3500),
(106,62000,2000),
(107,50000,1000),
(108,78000,5000),
(109,72000,4000),
(110,67000,3500);
drop table salaries;
insert into salaries(emp_id,salary,bonus)
select emp_id, 
30000 + (emp_id - 100 ) * 200,
2000 + (emp_id - 100) * 20
from employees
where emp_id not in (select emp_id from salaries);

