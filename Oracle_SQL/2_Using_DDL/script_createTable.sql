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

/*
columns - 7
constrains  - 2
  captain_id - unnamed constraint, will be assigned system-generated name
  primary key - unique value for each cruis_id
default value will be used if not provided in INSERT
*/
CREATE TABLE cruises (
  cruise_id           NUMBER,
  cruise_type_id      NUMBER,
  cruise_name         VARCHAR(20),
  captain_id          NUMBER NOT NULL,
  start_date          DATE,
  end_date            DATE,
  status              VARCHAR(5)  DEFAULT 'DOCK'
  CONSTRAINT          PRIMARY KEY (cruise_id)
  );
 
