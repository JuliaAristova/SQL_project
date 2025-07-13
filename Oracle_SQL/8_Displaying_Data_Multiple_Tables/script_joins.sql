https://livesql.oracle.com/next/
  
1. Write a query to display department id, department name, city, address, country name of all departments. 
  Order by department id. Use Natural Join to produce the result

SELECT department_id, department_name, city, street_address,country_name 
FROM hr.departments
NATURAL JOIN hr.LOCATIONS 
NATURAL JOIN hr.countries
ORDER BY department_id
  
2. Write a query to display the employee last_name, department id, job id, job title for all employees working in department (110, 90, 20).
Use Natural Join to produce the result

SELECT last_name, department_id, job_id, job_title
FROM hr.EMPLOYEES
NATURAL JOIN hr.jobs
WHERE department_id IN (10, 20, 90)

3. Write a query to display department id, department name, city, address, country name of all departments. 
   Order by department id. Use  Join with USING clause
  
SELECT department_id, department_name, city, street_address, country_name 
FROM hr.departments
JOIN hr.locations USING  (location_id) 
JOIN hr.countries USING (country_id)
ORDER BY department_id

  
4. Write a query to display the employee last_name, department id, job id, job title for all employees working in department (110, 90, 20).
Use  Join with USING clause
  
SELECT last_name, department_id,  job_id, job_title
FROM hr.employees 
join hr.jobs USING (job_id)
WHERE department_id IN (10, 20, 90)

5. Write a query to display the country id, caountry naem, region name for all countries

SELECT country_id, country_name, region_name
FROM hr.countries 
JOIN hr.regions USING (region_id)
ORDER BY country_id

6.  Write a query to display department id, department name, city, address, country name of all departments. 
  Order by department id. Use join ON
  
SELECT department_id, department_name, city, street_address,country_name 
FROM hr.departments
NATURAL JOIN hr.LOCATIONS 
NATURAL JOIN hr.countries
ORDER BY department_id

7. Write a query to display the employee last_name, department id, job id, job title for all employees working in department (110, 90, 20).
Use  Join ON clause
  
SELECT last_name, department_id,  job_id, job_title
FROM hr.employees 
join hr.jobs USING (job_id)
WHERE department_id IN (10, 20, 90)

8. You can apply additional filters using WHERE or AND keywords
SELECT last_name, department_id,  e.job_id, j.job_title
FROM hr.employees e 
join hr.jobs j ON e.job_id = j.job_id
AND e.department_id = 90
Order BY j.job_id

9. Write a query to display the employee last_name, department id, department name, city 
  for all employees who works in London

SELECT last_name, d.department_id,department_name, city 
FROM hr.employees e
join hr.departments d ON e.department_id = d.department_id
join hr.locations l ON d.location_id = l.location_id
WHERE  l.city = 'London';

10.  Write a query to display the employee id, employee last_name, and manageger id and last name.
(Self Join)
  
select e.EMPLOYEE_ID employee_id, e.LAST_NAME emp_name, m.employee_ID as manager_id, m.LAST_NAME manager_name
from hr.EMPLOYEES e
left outer join hr.EMPLOYEES m ON (e.MANAGER_ID = m.EMPLOYEE_ID)
order by e.EMPLOYEE_ID;

11. Write a query to display city, country for all locations,
including locations that don't have countries an countries that do no have any locations.

select l.city, c.country_name from hr.locations l
full outer join hr.countries c ON (l.COUNTRY_ID = c.COUNTRY_ID);
