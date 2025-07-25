SELECT 
UPPER('us') as upperCase,
LOWER('US') as lowerCase,
INITCAP('united states') as InitCap,
SUBSTR('United States', 8) as substr,
SUBSTR('United States', 8, 5) as substr2,
CONCAT('U', 'S') as concat1,
'U'||'S'||'A' as concat2,
INSTR('Inited States', 'States') as Contains_position,
LPAD('USA', 7, '*') leftPad,
RPAD('USA', 7, '*') rightPad,
LPAD('USA', 7) leftPad_blank,
LENGTH(LPAD('USA', 7)) afterDefaultPadding,
RPAD('USA', 7) rightPad_blank,
LENGTH(RPAD('USA',7)) afterDefaultPadding2,
LENGTH('---US---' ) length,
LTRIM('---US---', '-') ltrim,
LTRIM('     US     ') ltrim_default,
LENGTH(LTRIM('     US     ')) as spaceTrimmed,
RTRIM('---US---', '-') rtrim,
RTRIM('     US     ') rtrim_default,
TRIM('-' FROM '---US---') trimmed,
TRIM(BOTH '-' FROM '---US---') both_trimmed,
TRIM(LEADING '-' FROM '---US---') L_Trimmed,
TRIM(TRAILING '-' FROM '---US---') T_Trimmed,
TRIM('   United States  ') trimSpace,
SOUNDEX('United States') sounds
FROM DUAL;

'''
    "uppercase": "US",
    "lowercase": "us",
    "initcap": "United States",
    "substr": "States",
    "substr2": "State",
    "concat1": "US",
    "concat2": "USA",
    "contains_position": 8,
    "leftpad": "****USA",
    "rightpad": "USA****",
    "leftpad_blank": "    USA",
    "afterdefaultpadding": 7,
    "rightpad_blank": "USA    ",
    "afterdefaultpadding2": 7,
    "length": 8,
    "ltrim": "US---",
    "ltrim_default": "US     ",
    "spacetrimmed": 7,
    "rtrim": "---US",
    "rtrim_default": "     US",
    "trimmed": "US",
    "both_trimmed": "US",
    "l_trimmed": "US---",
    "t_trimmed": "---US",
    "trimspace": "United States",
    "sounds": "U533"
'''

1. Write a query to display department number, department name, length of department name,
las 4 characters of the department name for all department located in 1700; 
give appropriate column names, sort by length of department name in descending order
SELECT
    department_id, 
    department_name,
    LENGTH(department_name) depName_lenth,
    SUBSTR(department_name, -4) dep_name_last4
 FROM departments
 WHERE location_id=1700
 ORDER BY 3 DESC;

2. Write a query to display the country number, country name after replacing the 
first two characters with '**", give each column an appropriate name
SELECT 
   country_id,
   country_name,
   REPLACE(country_name, SUBSTR(country_name, 1, 2), '**') afterReplace
FROM hr.COUNTRIES;

3. Write a query to display empl number, last name, salary, and salary increased by 10% (rounded to zero decimal points)
    for all employes working in department 100. Label the columns as 'New Salary' order as user wants
    
SELECT employee_id, last_name, 
    salary,
    ROUND(salary*1.1) "New Salary"
FROM hr.EMPLOYEES
WHERE department_id = 100
ORDER BY &order_col;
    
4. Write a query to display the reminder of 30 divided by 7, the smallest whole number (integer)
greater or equal to 79.3, the smallest whole number (integer) smaller or equal to 34.7
SELECT 
    MOD(30,7) remainder,
    CEIL(79.3) smNum,
    FLOOR(34.7) lgNum
FROM DUAL;

5. Write a query to display the systme date, yesterday, and tomorrow
SELECT 
   SYSDATE, 
   (SYSDATE - 1) yesterday, 
   (SYSDATE + 1) tomorrow 
FROM DUAL;

6. Write a query to display the employees' last name, hire date, hire date added 3 mnth for all employees
working in department 30
SELECT 
    last_name, department_id, 
    (SYSDATE-hire_date) DAYS 
FROM employees
WHERE department_id = 90;

