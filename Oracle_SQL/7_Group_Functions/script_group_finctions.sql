1. Write a query to display the highest, lowest, sum, and average slary of all employees working in department 100,
  give appropriate labels, round to 2 decimal points
SELECT 
   MAX(salary) max_salary,
   MIN(salary) min_salary,
   SUM(salary) total_salary,
   ROUND(AVG(salary), 2) avg_salary
FROM hr.EMPLOYEES
WHERE DEPARTMENT_ID = 100;

2. Write a query to find number of department locatin in location_id = 1700
SELECT COUNT(*) num_dept
FROM hr.DEPARTMENTS
WHERE LOCATION_ID = 1700;

3.  Write a query todisplay number of distinct departments in employees table
SELECT COUNT(DISTINCT department_id) dept_number from hr.EMPLOYEES;

4.  Write a query to display bumber of distinct locations in departments table
SELECT COUNT(DISTINCT location_id) location_number from hr.DEPARTMENTS;

5.  Write a query to display number of managers, provide and appropriate column alias for the columns
SELECT COUNT(DISTINCT manager_id) managers_number from hr.EMPLOYEES;

6.  Write a query to display number of employees with the same job, label column, sort output by number of employees in desc order
SELECT job_id, COUNT(employee_id) emp_num
FROM hr.EMPLOYEES
GROUP BY JOB_ID
ORDER By emp_num DESC;

7.  Write a query to display number of departments in each location
SELECT location_id, COUNT(*) dept_number
FROM hr.DEPARTMENTS
GROUP By location_id
Order by dept_number DESC;

8. Write a query to display sum, average, min, max salary for each department and job
SELECT DEPARTMENT_ID, JOB_ID,
   SUM(salary) total_salary,
   ROUND(AVG(salary), 2) avg_salary,
   MIN(salary) min_salary,
   MAX(salary) max_salary
FROM hr.EMPLOYEES
GROUP By (DEPARTMENT_ID, JOB_ID)
Order by DEPARTMENT_ID, job_id;

9. Write a query to display  regions id having more than 5 countries. Order by number of countries
SELECT region_id, COUNT(country_id) country_num
FROM hr.COUNTRIES
group by region_id
HAVING country_num > 5
order by 2;

10. Write a query to display sum of salaries of employees per each job for departments 5 and 80.
Limit the output for only rows where sum of salaries >= 60000
Select job_id, sum(salary) total_salary
FROM hr.EMPLOYEES
where DEPARTMENT_ID in (50, 80)
group by (job_id)
HAVING total_salary > 60000
order by 2;
