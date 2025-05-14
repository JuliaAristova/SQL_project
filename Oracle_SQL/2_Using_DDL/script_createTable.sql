/*
CREATE TABLE - reserved words
tableName - follow naming convention
columns decalration - name, datatype, columns separated by comma
*/

CREATE TABLE work_schedule (
  work_schedule_id    NUMBER,
  start_date          DATE,
  end_date            DATE
);


CREATE TABLE cruises (
  cruise_id           NUMBER,                          # name   data type
  cruise_type_id      NUMBER,
  cruise_name         VARCHAR(20),
  captain_id          NUMBER NOT NULL,                  #  unnamed constraint
  start_date          DATE,
  end_date            DATE,
  status              VARCHAR(5)  DEFAULT 'DOCK'
  CONSTRAINT          PRIMARY KEY (cruise_id)          # unique, not null
  );

/*
columns - 7
constrains  - 2
  captain_id - unnamed constraint, will be assigned system-generated name
  primary key - unique value for each cruis_id

status column - DEFAULT value will be used if not provided in INSERT
*/
 
/*
To check SQL* PLUS
DESC table_name
Output:
1 column - Name  - displays table's column names
2 column - Null  - shows whether there is a NOT NULL constraint applied to that particular column in the table
3 colum - Type  - shows the data tyoe for the particular table's column
*/
