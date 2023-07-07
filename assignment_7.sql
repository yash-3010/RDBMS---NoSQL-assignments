-- using mysql;
-- 
-- 
-- QUESTION - 1 - ANSWER 
-- 
--
ALTER TABLE
    dependents
ADD
    COLUMN full_name VARCHAR(255);

delimiter // 

CREATE TRIGGER fill_full_name BEFORE
INSERT
    ON dependents FOR EACH ROW BEGIN
SET
    NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);

END; // 

delimiter ;

-- 
-- 
-- QUESTION - 2 - ANSWER 
-- 
--
delimiter //

CREATE TRIGGER locations_log_insert
AFTER
    INSERT ON locations FOR EACH ROW BEGIN
INSERT INTO
    locations_info (
        location_id,
        operation,
        old_value,
        new_value
    )
VALUES
    (
        NEW.location_id,
        CASE
            WHEN @old_value IS NULL THEN 'INSERT'
            WHEN @new_value IS NULL THEN 'DELETE'
            ELSE 'UPDATE'
        END,
        COALESCE(@old_value, NULL),
        COALESCE(@new_value, NULL)
    );

SET
    @old_value = NEW;

SET
    @new_value = NULL;

END; //

delimiter ;

delimiter //

CREATE TRIGGER locations_log_delete
AFTER
    DELETE ON locations FOR EACH ROW BEGIN
INSERT INTO
    locations_info (
        location_id,
        operation,
        old_value,
        new_value
    )
VALUES
    (
        OLD.location_id,
        'DELETE',
        OLD.location_id,
        NULL
    );

END; //

delimiter ;

delimiter //

CREATE TRIGGER locations_log_update
AFTER
UPDATE
    ON locations FOR EACH ROW BEGIN
INSERT INTO
    locations_info (
        location_id,
        operation,
        old_value,
        new_value
    )
VALUES
    (
        NEW.location_id,
        'UPDATE',
        OLD.location_id,
        NEW.location_id
    );

END; // 

delimiter ;

-- 
-- 
-- QUESTION - 3 - ANSWER 
-- 
--

CREATE VIEW employee_information AS
SELECT
   e.first_name,
   e.last_name,
   e.salary,
   d.department_name,
   l.city,
   l.pincode
FROM
   employees e
   INNER JOIN departments d ON e.department_id = d.department_id
   INNER JOIN locations l ON d.location_id = l.location_id
WHERE
   length(pincode) < 5;


-- 
-- 
-- QUESTION - 4 - ANSWER 
-- 
--
-- Answer--
-- ACID is a set of properties that guarantee the reliability of a database transaction.
-- The acronym stands for:

-- Atomicity: A transaction is an atomic unit of work. Either all of the operations in the transaction
--     are completed successfully, or none of them are.
-- Consistency: The database state is consistent after a transaction is committed. This means that the 
--     database will not be in an inconsistent state if a transaction is rolled back.
-- Isolation: Transactions are isolated from each other. This means that the changes made by one transaction
--     will not be visible to other transactions until the first transaction is committed.
-- Durability: Once a transaction is committed, its changes are durable and will not be lost even if the
--     database crashes.

-- An example of an ACID property is atomicity. Imagine that you are transferring money from one bank account
-- to another. This is a transaction that must be atomic. Either all of the money is transferred, or none of 
-- the money is transferred. If the transaction is not atomic, it is possible that some of the money is 
-- transferred and some of the money is not transferred. This would create an inconsistent state in the 
-- database.

-- Another example of an ACID property is isolation. Imagine that you are running two transactions at the 
-- same time. The first transaction is transferring money from one bank account to another, and the second 
-- transaction is checking the balance of the first bank account. If the transactions are not isolated, it 
-- is possible that the second transaction will see an incorrect balance because the first transaction has 
-- not yet been committed.

-- ACID properties are important for ensuring the reliability of a database. If a database does not have 
-- ACID properties, it is possible for the database to become inconsistent or for transactions to be lost. 
-- This can lead to serious problems for businesses that rely on their databases.


-- 
-- 
-- QUESTION - 5 - ANSWER 
-- 
--
-- Answer --
-- The index is build from the Occupation field.
-- Explanation:

-- The index field associated with the values 1, 3, 2, 5 and 4 is the Occupation field because after 
-- sorting the Occupational field lexicographically will give the sequence 1,3,2,5,4.
