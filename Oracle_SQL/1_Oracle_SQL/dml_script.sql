--add data to a table 
INSERT INTO table_name (col_1, col_2, col_3...)
VALUES (value_1, value_2, value_3 ...);

-- add to all columns
  INSERT INTO table_name VALUES (value_1, value_2, value_3 ...);

  -- add to specific colums (all constraints should be followed)
  INSERT INTO table_name (col_5, col_1) VALUES (val_5, val_1);

--see inserted value
SELECT *                    --or list of columns
FROM table_name;
