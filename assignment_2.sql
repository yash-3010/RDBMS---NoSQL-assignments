-- using mysql;
--
--
-- QUESTION - 1 - ANSWER
--
--
SELECT
   *
FROM
   employees
WHERE
   last_name LIKE 'Sah%';
--
--
-- QUESTION - 2 - ANSWER
--
--
SELECT
   *
FROM
   employees
WHERE
   hire_date BETWEEN '2021-06-01' AND '2022-02-15'
LIMIT
   10 offset 3;
--
--
-- QUESTION - 3 - ANSWER
--
--
SELECT
   DISTINCT salary AS "Top 5 salaries"
FROM
   employees
ORDER BY
   salary desc
LIMIT
   5;
--
--
-- QUESTION - 4 - ANSWER
--
--
SELECT
   first_name,
   last_name,
   email
FROM
   employees
WHERE
   salary BETWEEN 25000 AND 45000;
--
--
-- QUESTION - 5 - ANSWER
--
--
SELECT
   first_name,
   manager_id,
   salary
FROM
   employees
WHERE
   department_id = 101
ORDER BY
   salary;
--
--
-- QUESTION - 6 - ANSWER
--
--
SELECT
   *
FROM
   employees
WHERE
   first_name LIKE 'A%'
   OR last_name LIKE '_TH%';