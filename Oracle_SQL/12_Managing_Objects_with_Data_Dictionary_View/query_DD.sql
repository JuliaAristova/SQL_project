describe user_objects;

1. Query the USER_OBJECTS data dictionary view to see information about the obect you own.
  
SELECT object_name, object_type, created, status
FROM USER_OBJECTS
WHERE object_type = 'TABLE';

2. Query the ALL_OBJECTS data dictionary view to see information about the obect you can access.

SELECT owner, object_name, object_type, created, status
FROM ALL_OBJECTS;

3. Query the USER_TABLES dictionary view to see information about the tables you own.
SELECT table_name, status
FROM USER_TABLES;

4. Query the ALL_TABLES dictionary view to see information about the tables you can access.
SELECT owner, table_name, status
FROM ALL_TABLES;

5. Query the USER_TAB_COLUMNS dictionary view to see information about the columns of all tables you own, 
  filter the output for Employees table
SELECT colummn_ame, data_type, data_length, nullable
from user_tab_columns
where table_name = 'EMPLOYEES';

6. Edit the previous task to prompt the user to enter a table name, tet for the table EMP_NEW
SELECT column_name, data_type, data_length, nullable
from user_tab_columns
where table_name = '&tName';

7. Write a query to view all constraints (table name, constraint name, constraint type, status, delete rule) 
SELECT table_name, constraint_name, constraint_type, delete_rule, status
FROM USER_CONSTRAINTS
WHERE table_name = '&tName';

8. Write a query to view all constraints (table name, constraint name, constraint type, status, delete rule AND column name)
SELECT c.table_name, c.constraint_name, cc.column_name, c.constraint_type, c.delete_rule, c.status
FROM USER_CONSTRAINTS c
JOIN USER_CONS_COLUMNS cc ON c.constraint_name = cc.constraint_name
WHERE c.table_name = '&tName';

9. Add comment to a table and column
COMMENT ON TABLE 'Employees' IS 'List of Employees';
COMMENT ON COLUMN Employees.job IS 'Position of employee';

10. Check comment added to a table
SELECT table_name, comments
FROM USER_TAB_COMMENTS
WHERE table_name = "EMPLOYEES';

11. Check comment added to a column
  SELECT table_name, column_name, comments
  FROM USER_COL_COMMENTS
  WHERE table_name = 'EMPLOYEES';

12. Check dictionary content for a particular view
SELECT * FROM dictionary
WHERE table_name LIKE 'USER_CON%';

