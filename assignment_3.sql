-- using mysql;
--
--
-- QUESTION - 1 - ANSWER
--
--
SELECT
   department_id,
   SUM(salary) AS total_salary
FROM
   employees
GROUP BY
   department_id
ORDER BY
   total_salary;
--
--
-- QUESTION - 2 - ANSWER
--
--
SELECT
   department_id,
   COUNT(employee_id),
   SUM(salary)
FROM
   employees
GROUP BY
   department_id;
--
--
-- QUESTION - 3 - ANSWER
--
--
SELECT
   MAX(salary),
   department_id
FROM
   employees
GROUP BY
   department_id
ORDER BY
   MAX(salary);
--
--
-- QUESTION - 4 - ANSWER
--
--
SELECT
   department_id
FROM
   employees
GROUP BY
   department_id
HAVING
   AVG(salary) > 60000;
--
--
-- QUESTION - 5 - ANSWER
--
--
SELECT
   department_name
FROM
   departments
WHERE
   department_id IN (
      SELECT
         department_id
      FROM
         employees
      GROUP BY
         department_id
      HAVING
         COUNT(employee_id) > 1
   );
--
--
-- QUESTION - 6 - ANSWER
--
--
SELECT
   department_name,
   CASE
      WHEN (
         SELECT
            COUNT(employee_id)
         FROM
            employees
         WHERE
            department_id = departments.department_id
      ) > 1 THEN 'Multiple candidates'
      ELSE 'One candidates'
   END AS assignedTo
FROM
   departments;