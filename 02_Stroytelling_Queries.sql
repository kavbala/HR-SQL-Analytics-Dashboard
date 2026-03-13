/*
Project Name : SQL-Based HR Employee Analytics
Author       : Kaviya S
Database     : hr_analytics_db
Description  : This file contains 20 storytelling SQL queries for HR data analysis
*/

-- =======================================================================================
-- Q1.Find the list of employees along with their department names
-- ======================================================================================
select e.emp_name,d.dep_name
from employees e
join departments d
on e.dep_id=d.dep_id;

-- ====================================================================================
-- Q2.Identify employees who joined the company in the last 2 years
-- ====================================================================================
select emp_name,join_date
from employees
where join_date <= date_sub(curdate(),interval 2 year);

-- ====================================================================================
-- Q3.Which departments have the highest number of employees
-- ====================================================================================
select d.dep_name,count(e.emp_id) as emp_count
from departments d
join employees e
on d.dep_id=e.dep_id
group by d.dep_name
order by emp_count desc;

-- ===================================================================================
-- Q4.Find employees whose salary is above the average salary of their department
-- ===================================================================================
select e.emp_name,d.dep_name,s.salary
from employees e
join departments d
on e.dep_id=d.dep_id
join salaries s
on e.emp_id=s.emp_id
where s.salary >
(
select avg(s2.salary)
from employees e2
join salaries s2
on e2.emp_id=s2.emp_id
where e2.dep_id=e.dep_id
);

-- ====================================================================================
-- Q5.Determine the department-wise total salary expenditure
-- ====================================================================================
select d.dep_name,sum(s.salary) as total_salary
from employees e
join departments d
on e.dep_id=d.dep_id
join salaries s
on e.emp_id=s.emp_id
group by d.dep_name;

-- ====================================================================================
-- Q6.Find employees with the highest salary in each department
-- ====================================================================================
select e.emp_name,d.dep_name,s.salary
from employees e
join departments d
on e.dep_id=d.dep_id
join salaries s
on e.emp_id=s.emp_id
where s.salary = 
(
select max(s2.salary)
from employees e2
join salaries s2
on e2.emp_id=s2.emp_id
where e2.dep_id=e.dep_id
);

-- ====================================================================================
-- Q7.Show department-wise average salary and bonus
-- ====================================================================================
select d.dep_name,
avg(s.salary) as avg_salary,
avg(s.bonus) as avg_bonus
from departments d
join employees e
on d.dep_id=e.dep_id
join salaries s
on e.emp_id=s.emp_id
group by d.dep_name;

-- ===================================================================================
-- Q8. Identify employees whose bonus is greater than 5000
-- ===================================================================================
select e.emp_name,s.bonus
from employees e
join salaries s
on e.emp_id=s.emp_id
where s.bonus > 5000;

-- ====================================================================================
-- Q9.Rank employees based on their salary across the organisation
-- ====================================================================================
select e.emp_name,s.salary,
rank() over(order by s.salary desc) as "salary_rank"
from employees e
join salaries s
on e.emp_id=s.emp_id;

-- ====================================================================================
-- Q10.Find employees in IT and HR departments and their salary details
-- ====================================================================================
select e.emp_name,d.dep_name,s.salary
from employees e
join departments d
on e.dep_id=d.dep_id
join salaries s
on e.emp_id=s.emp_id
where d.dep_name in ("IT","HR");

-- ===================================================================================
-- Q11.Identify departments where the average salary is greater than 70000
-- ===================================================================================
select d.dep_name,avg(s.salary) as avg_salary
from departments d
join employees e
on d.dep_id=e.dep_id
join salaries s
on e.emp_id=s.emp_id
group by d.dep_name
having avg(s.salary) > 70000;

-- ====================================================================================
-- Q12.List the employees with their total compensation(salary+bonus)
-- ===================================================================================
select e.emp_name,s.salary+s.bonus as total_compensation
from employees e
join salaries s
on e.emp_id=s.emp_id;

-- ===================================================================================
-- Q13.Count the number of employees per job title
-- ===================================================================================
select job_title,count(*) as emp_count
from employees
group by job_title;

-- ===================================================================================
-- Q14.Determine departments where more than 50% of employees earn above 60000
-- ===================================================================================
select d.dep_name
from departments d
join employees e
on d.dep_id=e.dep_id
join salaries s
on e.emp_id=s.emp_id
group by d.dep_name
having
sum(case when s.salary > 60000 then 1 else 0 end) > 0.5 * count(e.emp_id);

-- ===================================================================================
-- Q15.Categorize employees into salary grades: High,Medium,Low
-- ===================================================================================
select e.emp_name,s.salary,
case
when s.salary > 75000 then "High"
when s.salary between 60000 and 75000 then "Medium"
else "Low"
end as salary_grade
from employees e
join salaries s
on e.emp_id=s.emp_id;

-- ===================================================================================
-- Q16.Find employees who joined before 2020 and have salaries above the department average
-- ====================================================================================
select e.emp_name,s.salary
from employees e
join salaries s
on e.emp_id=s.emp_id
where e.join_date < "2020-01-01" 
and s.salary > 
(
select avg(s2.salary)
from employees e2
join salaries s2
on e2.emp_id=s2.emp_id
where e2.dep_id=e.dep_id
);

-- ====================================================================================
-- Q17.Show department-wise minimum and maximum salary
-- ====================================================================================
select d.dep_name,
min(s.salary) as min_salary,
max(s.salary) as max_salary
from departments d
join employees e
on d.dep_id=e.dep_id
join salaries s
on e.emp_id=s.emp_id
group by d.dep_name;

-- ===================================================================================
-- Q18.Identify employees whose salary increased(assume bonus as proxy) more than 20% of their salary
-- ===================================================================================
select e.emp_name,s.salary,s.bonus
from employees e
join salaries s
on e.emp_id=s.emp_id
where s.bonus > 0.20 * s.salary;

-- ==================================================================================
-- Q19.List employees with department location and their salary details
-- ===================================================================================
select e.emp_name,d.location,s.salary
from employees e
join departments d
on e.dep_id=d.dep_id
join salaries s
on e.emp_id=s.emp_id;

-- ====================================================================================
-- Q20.Find employees eligible for promotion based on salary(eg:those earning below department average)
-- ====================================================================================
select e.emp_name,s.salary,d.dep_name
from employees e
join salaries s
on e.emp_id=s.emp_id
join departments d
on e.dep_id=d.dep_id
where s.salary > 
(
select avg(s2.salary)
from employees e2
join salaries s2
on e2.emp_id=s2.emp_id
where e2.dep_id=e.dep_id
);

