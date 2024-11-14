
WITH CTE AS
(
SELECT salary, gender, min(salary), max(salary), avg(salary),COUNT(salary)
FROM employee_salary as sal
	join employee_demographics as dem
       on sal.employee_id= dem.employee_id
group by salary,gender
)
SELECT salary,gender
FROM CTE;



