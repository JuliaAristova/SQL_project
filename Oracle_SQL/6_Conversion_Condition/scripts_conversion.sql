    
SELECT SYSDATE,                          			                -- 16-JUL-2025
TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') format1,        	  -- 2025/07/16 05:15:10 
TO_CHAR(SYSDATE, 'YYYY-Mon-Day HH:MI:SS AM') format2,         -- 2025-07-Wednesday 05:12: 10 AM 
TO_CHAR(SYSDATE, 'fmDY-MONTH "of" YYYY HH24:MI:SS') format3,  -- WED-JULY of 2025  5:12:10
TO_CHAR(SYSDATE, 'fmDdspth-MONTH "of" YYYY') format4,         -- Sixteenth-JUL of 2025
TO_CHAR(SYSDATE, 'fmDdsp-MMsp-YYYY') format5                  -- Sixsteen-SEVEN-2025
FROM DUAL;

SELECT last_name, salary,						              -- 24000
TO_CHAR(salary, '$99,999.99') formatSalary,			  -- $24,000.00
TO_CHAR(salary, 'L0099,999.99') formatSalary2			-- $0024,000.00
FROM hr.employees
WHERE department_id=90;


1. Write a query to display last name, salary, hire date, and hire date added plus 4 months for all employees working in department 100
Foramtring like "Sunday, the Trhirty-First of May, 2003'
  
SELECT last_name, salary, 
TO_CHAR(hire_date, 'Day, "the" Ddspth "of" Month, YYYY') hire_date,
ADD_MONTHS(HIRE_DATE, 4) hd4
from hr.EMPLOYEES
where DEPARTMENT_ID = 100;

2. Write a query to display following data for employess working in department 0
<emp last name: earns <salary> monthly but wants  <3 times salary_> as
Matos earns $2,600.00 monthly but wants $7,800.00

SELECT last_name || ' earns ' ||
TO_CHAR(salary, '$99,999.00') || ' monthly, but wants ' ||
TO_CHAR(salary*3, '$99,999.00') wantedSalary
from hr.EMPLOYEES
where DEPARTMENT_ID = 90;

3.  Write a query to display output of arithmetic operation '$5,200.3' + 500

SELECT (TO_NUMBER('$5,200.3', '$9,999.9') + 500) as "$5,200.3 + 500"
from dual;
  
4.  Write a query to display last name, salary, hire date of all employees
who were hired between 01-02-2015 and 31-03-2016 (note: Oracle accepts 01-feb-2015 oe 31-March-2016)

SELECT last_name, salary, hire_date
FROM hr.EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('01-02-2015', 'DD-MM-YYYY') and 
HIRE_DATE <= TO_DATE('31-03-2016', 'DD-MM-YYYY');

SELECT
    NULLIF(10, 10)      	 "NULLIF(10, 10)",			// null
    NULLIF(10, 20)      	 "NULLIF(10, 20)",			// 10
    NVL(null, 2)            "NVL(null, 2)",			// 2
    NVL(1, 2)               "NVL(1, 2)",			// 1
    NVL2(null, 2, 3)        "NVL2(null, 2, 3)",		// 3
    NVL2(1, 2, 3)           "NVL(1, 2, 3)",			// 2
    COALESCE(null, 2)       "COALESCE(null, 2)",		// 3
    COALESCE(null, null,3)  "COALESCE(null,null, 3)",		// 3
    COALESCE(1, 2)          "COALESCE(1, 2)"			// 1
from dual;

5. Write a query to display department name, department number and manager number for all departments located in location 1700.
  If a department has a manager show "Has Manager",, otherwise show "No Manager". Label the column Manager use NVL2

SELECT department_name, department_id, manager_id,
NVL2(manager_id, 'Has Manager', 'No Manager') "MANAGER"
FROM hr.departments
Where LOCATION_ID = 1700
order by DEPARTMENT_NAME;
  
6. Write a query to display employee's last name, salary, commission anount for all employees working in department numbe (110, 80).
  If an employees does not have a commission. show "No Commission". Label column as COMMISTTION. Use NVL function

SELECT last_name, salary, commission_pct,
NVL(TO_CHAR(COMMISSION_PCT), 'No Commission') COMMISSION
FROM hr.EMPLOYEES
WHERE department_id IN (80, 110)
Order by last_name;

7. Using CASE write a query to display the employee last name, job id, grade of all employees based on the value of Hob_id column, useing the following data:
Job        Grade
AD_PRES      A
IT_PROG      B
SA_REP       C
None above   0

SELECT last_name, 
    CASE job_id
        WHEN 'AD_PRES' THEN 'A'
        WHEN 'IT_PROG' THEN 'B'
        WHEN 'SA_REP' THEN 'C'
        ElSE  '0'
    END Grade
FROM hr.employees;

8. Rewrite using DECODE

SELECT last_name, 
    DECODE( job_id,
         'AD_PRES', 'A',
         'IT_PROG', 'B',
         'SA_REP', 'C',
         '0') Grade
FROM hr.employees;
