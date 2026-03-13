# SQL - Based HR Employee Analytics Project

**Description:** End-to-end SQL project analyzing HR data using employee, department, 
and  salary tables.

## Project Overview
This project is a SQL-based HR analytics case study designed to demonstrate
foundational data analysis skills. It uses a relational database containing department,
employee, and salary tables to answer 20 busniess-oriented storytelling questions. The
focus of the project is on writing structured SQL queries and organizing analysis 
results in a clear, professional format.

---- 

## Dataset description
The project usus relational tables :

### Departments
- dep_id
- dep_name
- location

### Employees
- emp_id
- emp_name
- dep_id
- join_date
- job_title

### Salaries
- emp_id
- salary 
- bonus

----

## Storytelling Questions Covered
The project answers business-driven questions such as :
- Employees distibution across departments
- Department-wise salary expenditure.
- Identification of top and low performers.
- Salary comparison within departments.
- Promotion and appraisal eligibility analysis.

---- 

## Skills Covered
- SQL JOINS (INNER, LEFT)
- GROUP BY and HAVING
- Subqueries and correlated subqueries
- Window functions (RANK)
- CASE expressions
- Data aggregation and filtering
- Business storytelling using SQL

----

## Project Structure
HR_SQL_Analytics_Project/
|-------01_schema_and_data.sql
|-------02_storytelling_queries.sql
|-------03_insights.md
|-------04_business_summary.md
|_______README.md


## How to Run This Project
1. Create the database ("hr_analytics_db)
2. Run "01_schema_and_data.sql" to create tables and insert data
3. Execute queries from "02_storytelling_queries.sql"
4. Review insights in "03_insights.md"
5. Read high-level findings in "04_business_summary.md"

----

## Intended Audience
This project is designed for :
- SQL beginners
- freshers / junior data analysts
- Interview and portfolio demonstration

