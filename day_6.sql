1. Subquery in WHERE clause using IN

SELECT name 
FROM employees 
WHERE department_id IN (
  SELECT department_id 
  FROM departments 
  WHERE location = 'New York'
);
2. Subquery in WHERE using EXISTS

SELECT name 
FROM employees e 
WHERE EXISTS (
  SELECT 1 
  FROM projects p 
  WHERE p.employee_id = e.id
);
3. Scalar subquery in SELECT

SELECT name, 
  (SELECT COUNT(*) FROM tasks t WHERE t.employee_id = e.id) AS task_count 
FROM employees e;
4. Correlated subquery in WHERE

SELECT name 
FROM employees e 
WHERE salary > (
  SELECT AVG(salary) 
  FROM employees 
  WHERE department_id = e.department_id
);
5. Subquery in FROM clause (Derived Table)

SELECT department_id, avg_salary 
FROM (
  SELECT department_id, AVG(salary) AS avg_salary 
  FROM employees 
  GROUP BY department_id
) AS dept_avg 
WHERE avg_salary > 50000;
