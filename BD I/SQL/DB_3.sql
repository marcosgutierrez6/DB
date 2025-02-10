SELECT *
FROM student
WHERE ID 
NOT IN ( SELECT ID
FROM takes );

SELECT * FROM instructor WHERE dept_name IN (SELECT dept_name FROM department WHERE budget > 90000.00);