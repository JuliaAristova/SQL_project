1. Wrote a query to display employee last name, hire date, department id for all employees
  who were hired after the employee whose name is Lee

select last_name, hire_date, department_id
 from employees 
 where hire_date >= (select hire_date from employees where last_name = 'Lee');

2. Write a query to display employees last name, salary, department named for all employees
who earn more than or equal to the average salary. Order by salary

  select last_name, salary, department_name
  from employees 
  join departments on employees.department_id=departments.department_id
  where salary >= (select AVG(salary) from employees)
  order by salary;

3. Write a query to display last name, salary, department id for 
employees with the smalles salary in their departments 

 select employee_id, last_name, salary ,department_id
 from employees
 where salary in (select MIN(Salary) from employees group by (department_id));

4. Write a query to display last name, salary,email of all employees
who work in a department with any employees whost ladt name start with a letter 'J'

select last_name, salary, email from employees
where department_id in (Select department_Id from employees where last_name like 'J%');

5. Write a query to display a list of employees whose salary in more that salaey of any employyer from department 100

 select last_name, salary from employees
 where salary > ANY (select salary from employees where department_id = 100);

6. Return all employess whose salary is equal to Matos salary and who works at the same department

  select last_name, job_id, department_id, salary
from employees 
where (salary, department_id) = (select salary, department_id from employees where last_name='Matos')
and last_name!='Matos';

7. write a query to display last name, job id and department id of all employees 
whose job id and department id is the same as employee 'Lee'

 select last_name, job_id, department_id 
 from employees
 where (job_id, department_id) = (select job_id, department_id from employees where last_name = 'Lee')
 and last_name != 'Lee';
