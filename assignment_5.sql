-- using mysql;
--
--
-- QUESTION - 1 - ANSWER
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
      WHERE
         job_id IN (
            SELECT
               job_id
            FROM
               jobs
            WHERE
               min_salary < 2000
         )
   );
--
--
-- QUESTION - 2 - ANSWER
--
--
SELECT
   country_name
FROM
   countries
WHERE
   country_id NOT IN (
      SELECT
         l.country_id
      FROM
         locations l
      WHERE
         location_id IN (
            SELECT
               d.location_id
            FROM
               departments d
            WHERE
               department_id IN (
                  SELECT
                     department_id
                  FROM
                     employees
               )
         )
   );
--
--
-- QUESTION - 3 - ANSWER
--
--
SELECT
   job_title
FROM
   jobs
WHERE
   job_id IN (
      SELECT
         job_id
      FROM
         employees
      WHERE
         department_id IN (
            SELECT
               department_id
            FROM
               employees
            GROUP BY
               department_id
            HAVING
               COUNT(employee_id) >= 2
         )
   );
--
--
-- QUESTION - 4 - ANSWER
--
--
SELECT
   country_name
FROM
   countries
WHERE
   country_id IN (
      SELECT
         country_id
      FROM
         locations
      WHERE
         city LIKE 'a%'
   );
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
   department_id NOT IN (
      SELECT
         department_id
      FROM
         locations
      WHERE
         city IS NOT NULL
   );