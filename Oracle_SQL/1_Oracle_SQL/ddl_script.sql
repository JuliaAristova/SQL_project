--must have admin priviligies

CREATE DATABASE testDB
DROP DATABASE testDB

--to check if created
SHOW DATABASES

--create TABLE

CREATE TABLE table_name (
    column_1 datatype,
    column_2 datatype,
    column_3 datatype,
    ...
)

--create table from another table
CREATE TABLE new_table_name AS (
    SELECT column_1, column_2, column_3...
    FROM existing_table_name
    WHERE ..
  }

--drop table
  DROP TABLE table_name

--delete data from table
  TRUNCATE TABLE table_name

-- alter table - add column
  ALTER TABLE table_name
  ADD column_name datatype

 --alter table - remove columnn
  ALTER TABLE table_name
  DROP COLUMN column_name

--alter table - rename column
ALTER TABLE table_name
RENAME COLUMNS old_name TO new_name

--SQL Server: EXEC sp_rename 'table_name.old_name', 'new_name', 'COLUMN'

--alter table - modify datatype
--SQL Server
  ALTER TABLE table_name 
  ALTER COLUMN column_name datatype

--MySQL 
  ALTER TABLE table_name 
  MODIFY COLUMN column_name datatype
  
--Oracle 10G and higher
  ALTER TABLE table_name 
  MODIFY column_name datatype

  
