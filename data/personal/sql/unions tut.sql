SELECT first_name, last_name,employee_id,'old man' AS label
FROM employee_demographics
WHERE age > 40 AND gender ='male'

UNION 

SELECT first_name, last_name,employee_id,'old lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender ='Female'

UNION

SELECT first_name, last_name,employee_id, ' High paid employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name,last_name;