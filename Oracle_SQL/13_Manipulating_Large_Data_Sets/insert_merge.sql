INSERT FIRST
   WHEN (to_char(hire_date, 'RR')= '99') THEN
     INTO hired_99(id, job_id, department_id, hire_date)
     VALUES(employee_id, job_id, department_id, hire_date)
   WHEN (department_id=80) THEN
     INTO dep_80 (id, job_id, department_id, hire_date)
     VALUES(employee_id, job_id, department_id, hire_date)
   ELSE  INTO emp_archive(employee_id, job_id, department_id, hire_date)
     VALUES(employee_id, job_id, department_id, hire_date)
SELECT employee_id, job_id, department_id, hire_date 
FROM employees;

INSERT 
   WHEN (to_char(hire_date, 'RR')= '99') THEN
     INTO hired_99(id, job_id, department_id, hire_date)
     VALUES(employee_id, job_id, department_id, hire_date)
   WHEN (department_id=80) THEN
     INTO dep_80 (id, job_id, department_id, hire_date)
     VALUES(employee_id, job_id, department_id, hire_date)
   ELSE  INTO emp_archive(employee_id, job_id, department_id, hire_date)
     VALUES(employee_id, job_id, department_id, hire_date)
SELECT employee_id, job_id, department_id, hire_date 
FROM employees;

INSERT ALL 
   WHEN OCEAN IS NOT NULL THEN
     INTO ship_cabin_statistics (room_type, window_type, sq_ft)
     VALUES (room_type, 'Ocean', ocean)
   WHEN BALCONY IS NOT NULL THEN
    INTO ship_cabin_statistics (room_type, window_type, sq_ft)
    VALUES (room_type, 'Balcony', balcony)
   WHEN NO_WINDOW IS NOT NULL THEN
    INTO ship_cabin_statistics (room_type, window_type, sq_ft)
    VALUES (room_type, 'No Window', no_window)
SELECT ROWNUM rn, room_type, ocean, balcony, no_window
FROM ship_cabin_grid;

MERGE INTO wwa_invoices WWA
   USING ontario_orders ONT
   ON (WWA.cust_po = ONT.po_num)
   WHEN MATCHED THEN UPDATE SET
      WWA.notes = ONT.sales_rep
   WHEN NOT MATCHED THEN INSERT (WWA.inv_id, WWA.cust_po, WWA.inv_date, WWA.notes)
      VALUES (SEQ_inv_id.NEXTVAL, ONT.po_num, SYSDATE, ONT.sales_rep)
WHERE SUBSTR(ONT.po_num, 1, 3) <> 'NBC';

MERGE INTO wwa_invoices WWA
   USING ontario_orders ONT
   ON (WWA.cust_po = ONT.po_num)
   WHEN MATCHED THEN UPDATE SET
      WWA.notes = ONT.sales_rep
   WHEN NOT MATCHED THEN INSERT (WWA.inv_id, WWA.cust_po, WWA.inv_date, WWA.notes)
      VALUES (trunc(dbms_random.value(1, 100)), ONT.po_num, SYSDATE, ONT.sales_rep)
WHERE SUBSTR(ONT.po_num, 1, 3) <> 'NBC';

