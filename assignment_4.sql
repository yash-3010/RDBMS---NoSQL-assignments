-- using mysql;
--
--
-- QUESTION - 1 - ANSWER
--
--
SELECT
   employees.first_name,
   employees.last_name,
   employees.email,
   employees.salary,
   departments.department_name,
   locations.pincode,
   locations.state_province
FROM
   (
      (
         employees
         INNER JOIN departments ON employees.department_id = departments.department_id
      )
      INNER JOIN locations ON departments.location_id = locations.location_id
   );
--
--
-- QUESTION - 2 - ANSWER
--
--
SELECT
   departments.department_name,
   locations.state_province,
   locations.street_address
FROM
   departments
   INNER JOIN locations ON departments.location_id = locations.location_id
WHERE
   locations.state_province = "Jammu Kashmir"
   OR locations.state_province = "Jharkhand";
--
--
-- QUESTION - 3 - ANSWER
--
--
SELECT
   COUNT(*),
   jobs.job_title,
   AVG(employees.salary)
FROM
   employees
   INNER JOIN jobs ON employees.job_id = jobs.job_id
GROUP BY
   jobs.job_title
HAVING
   AVG(employees.salary) > 10000;
--
--
-- QUESTION - 4 - ANSWER
--
--
SELECT
   first_name,
   last_name
FROM
   employees
UNION ALL
SELECT
   first_name,
   last_name
FROM
   dependents
ORDER BY
   last_name desc;
--
--
-- QUESTION - 5 - ANSWER
--
--
SELECT
   e.employee_id,
   e.first_name,
   e.last_name,
   m.first_name AS manager_name
FROM
   employees e
   JOIN employees m ON e.manager_id = m.employee_id;
--
--
-- QUESTION - 6 - ANSWER
--
--
SELECT
   departments.department_name,
   locations.state_province,
   COUNT(employees.employee_id)
FROM
   (
      (
         employees
         INNER JOIN departments ON employees.department_id = departments.department_id
      )
      INNER JOIN locations ON departments.location_id = locations.location_id
   )
WHERE
   employees.salary > 50000
   AND (
      locations.state_province = 'New York'
      OR locations.state_province = 'California'
   )
GROUP BY
   departments.department_id
HAVING
   COUNT(employees.employee_id) > 5;
--
--
-- QUESTION - 7 - ANSWER
--
--
SELECT
   employees.employee_id,
   dependents.dependent_id,
   jobs.job_title
FROM
   employees
   INNER JOIN dependents ON employees.employee_id = dependents.employee_id
   INNER JOIN jobs ON employees.job_id = jobs.job_id
   INNER JOIN departments ON employees.department_id = departments.department_id
WHERE
   jobs.job_title LIKE '%manager%'
ORDER BY
   departments.department_id;
--
--
-- QUESTION - 8 - ANSWER
--
--
ALTER TABLE
   dependents
ADD
   COLUMN city VARCHAR(255);
--
SELECT
   employees.employee_id,
   employees.first_name,
   employees.last_name,
   departments.department_name,
   locations.city,
   employees.salary,
   jobs.job_title
FROM
   employees
   JOIN departments ON employees.department_id = departments.department_id
   JOIN locations ON departments.location_id = locations.location_id
   JOIN dependents ON employees.employee_id = dependents.employee_id
   JOIN jobs ON employees.job_id = jobs.job_id
WHERE
   employees.hire_date > CURRENT_DATE - INTERVAL 3 YEAR
   AND dependents.city <> locations.city
   AND employees.salary > (
      SELECT
         AVG(salary)
      FROM
         employees
      WHERE
         job_id = jobs.job_id
   )
   AND jobs.job_title LIKE '%Director%'
ORDER BY
   departments.department_name;