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

create table positions(
position_id    NUMBER Primary Key,
deptno	       NUMBER references dept(deptno) ON DELETE CASCADE,	
position       VARCHAR2(20) CONSTRAINT pos_nn NOT NULL,
exempt         VARCHAR2(10) CHECK (exempt IN ('Y', 'N')),
notes          VARCHAR2(50) DEFAULT 'Add description',
abbr	       VARCHAR2(5) CONSTRAINT abbr_u UNIQUE
);

create table positions(
position_id    NUMBER,
deptno	       NUMBER,	
position       VARCHAR2(20),
exempt         VARCHAR2(10),
notes          VARCHAR2(50) DEFAULT 'Add description',
abbr	       VARCHAR2(5),
CONSTRAINT pos_pk PRIMARY KEY (position_id),
CONSTRAINT deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno) ON DELETE SET NULL,
UNIQUE (abbr)
);

 ALTER TABLE positions
 MODIFY position NOT NULL;

 ALTER TABLE positions
 ADD CONSTRAINT exempt_c CHECK (exempt IN ('Y', 'N'));

 ALTER TABLE positions
 DROP CONSTRAINT exempt_c;

 ALTER TABLE positions
 RENAME CONSTRAINT SYS_CO011155 TO  pos_nn;

ALTER TABLE positions
 ADD col_1 NUMBER;

ALTER TABLE positions
 ADD (
	col_1 NUMBER,
	col2  NUMBER
);


ALTER TABLE positions
 DROP COLUMN col_only_one;

ALTER TABLE positions
 DROP (col_1);

ALTER TABLE positions
 DROP (col_1, col_2);

