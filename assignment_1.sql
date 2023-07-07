-- using mysql;
--
-- QUESTION - 1 - ANSWER
--
--
CREATE DATABASE testdb;
USE testdb;
CREATE TABLE jobs(
   job_id INT PRIMARY KEY,
   job_title VARCHAR(255),
   min_salary INT,
   max_salary INT
);
CREATE TABLE regions(region_id INT PRIMARY KEY, region_name VARCHAR(255));
CREATE TABLE countries(
   country_id INT PRIMARY KEY,
   country_name VARCHAR(255),
   region_id INT,
   FOREIGN key(region_id) REFERENCES regions(region_id)
);
CREATE TABLE locations(
   location_id INT PRIMARY key,
   street_address VARCHAR(255),
   postal_code INT,
   city VARCHAR(255),
   state_province VARCHAR(255),
   country_id INT,
   FOREIGN key(country_id) REFERENCES countries(country_id)
);
CREATE TABLE departments(
   department_id INT PRIMARY key,
   department_name VARCHAR(255),
   location_id INT,
   FOREIGN key (location_id) REFERENCES locations(location_id)
);
CREATE TABLE employees(
   employee_id INT PRIMARY key,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   email VARCHAR(255),
   phone_number INT,
   hire_date DATE,
   job_id INT,
   salary INT,
   manager_id INT,
   department_id INT,
   FOREIGN key(job_id) REFERENCES jobs(job_id),
   FOREIGN key(department_id) REFERENCES departments(department_id)
);
CREATE TABLE dependents(
   dependent_id INT PRIMARY key,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   relationship VARCHAR(255),
   employee_id INT,
   FOREIGN key(employee_id) REFERENCES employees(employee_id)
);
--
--
-- QUESTION - 2 - ANSWER
--
--
INSERT INTO
   jobs
VALUES
   (1, 'SDE 1', 200000, 400000),
   (2, 'SDE 2', 400000, 600000),
   (3, 'SDE 3', 600000, 800000),
   (4, 'manager', 800000, 1000000),
   (5, 'CEO', 1000000, 2000000);
INSERT INTO
   regions
VALUES
   (1, 'a'),
   (2, 'b'),
   (3, 'c'),
   (4, 'd'),
   (5, 'e');
INSERT INTO
   countries
VALUES
   (1, 'India', 1),
   (2, 'USA', 2),
   (3, 'China', 3),
   (4, 'Russia', 4),
   (5, 'Germany', 5);
INSERT INTO
   locations
VALUES
   (1, 'dfsdfsdf', 23423423, 'afaf', 'sd', 1),
   (2, 'dfsdfsdf', 23423423, 'afaf', 'sd', 2),
   (3, 'dfsdfsdf', 23423423, 'afaf', 'sd', 3),
   (4, 'dfsdfsdf', 23423423, 'afaf', 'sd', 4),
   (5, 'dfsdfsdf', 23423423, 'afaf', 'sd', 5);
INSERT INTO
   departments
VALUES
   (1, 'technical', 1),
   (2, 'sales', 2),
   (3, 'customer relationship', 3),
   (4, 'HR', 4),
   (5, 'warehouse', 5);
INSERT INTO
   employees
VALUES
   (
      1,
      'Arya',
      'Stark',
      'arya@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      2,
      6654654,
      2,
      1
   ),
   (
      2,
      'John',
      'Snow',
      'john@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      1,
      6654654,
      3,
      4
   ),
   (
      3,
      'Sansa',
      'Stark',
      'sansa@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      3,
      6654654,
      3,
      2
   ),
   (
      4,
      'Brandon',
      'Stark',
      'brandon@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      2,
      6654654,
      2,
      1
   ),
   (
      5,
      'Trion',
      'Lanistor',
      'trion@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      1,
      6654654,
      3,
      3
   ),
   (
      6,
      'Deneyres',
      'Targarion',
      'deneyres@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      3,
      6654654,
      4,
      5
   ),
   (
      7,
      'cerci',
      'Lanistor',
      'cerci@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      1,
      6654654,
      5,
      1
   ),
   (
      8,
      'jamie',
      'Lanistor',
      'jamie@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      4,
      6654654,
      2,
      2
   ),
   (
      9,
      'jorah',
      'mormont',
      'jorah@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      5,
      6654654,
      1,
      1
   ),
   (
      10,
      'brien',
      'tarth',
      'brien@gmail.com',
      2342423,
      STR_TO_DATE('07-01-2023', '%m-%d-%Y'),
      5,
      6654654,
      2,
      4
   );
INSERT INTO
   dependents
VALUES
   (1, 'Nikhil', 'Jain', 'child', 5),
   (2, 'Harsh vardhan', 'Tripathi', 'child', 2),
   (3, 'Sarthak', 'Tiwari', 'child', 1),
   (4, 'Sibasis', 'Palo', 'child', 4),
   (5, 'Vignesh', 'Selvan', 'child', 7);
--
--
-- QUESTION - 3 - ANSWER
--
--
-- A
ALTER TABLE
   departments
ADD
   COLUMN manager_name VARCHAR(255);
-- B
ALTER TABLE
   jobs DROP COLUMN max_salary;
-- C
ALTER TABLE
   locations rename COLUMN postal_code TO pincode;
--
--
-- QUESTION - 4 - ANSWER
--
--
-- A
ALTER TABLE
   employees modify first_name VARCHAR(255) NOT NULL;
ALTER TABLE
   employees modify last_name VARCHAR(255) NOT NULL;
ALTER TABLE
   dependents modify first_name VARCHAR(255) NOT NULL;
ALTER TABLE
   dependents modify last_name VARCHAR(255) NOT NULL;
-- B
ALTER TABLE
   jobs
ADD
   CHECK(min_salary > 1000);
-- C
ALTER TABLE
   locations
ADD
   CHECK(length(pincode) < 11);