-- Layer 3: Generating Massive Data (Stored Procedures)

USE onestop;

-- Change the delimiter so MySQL doesn't get confused by the semicolons inside the loop
DELIMITER //

CREATE PROCEDURE generate_customers(IN total_customers INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= total_customers DO
        INSERT INTO customers (first_name, last_name, email, phone, gender, city, state)
        VALUES (
            CONCAT('First', i),                         -- e.g., First1, First2
            CONCAT('Last', i),                          -- e.g., Last1, Last2
            CONCAT('customer', i, '@example.com'),      -- e.g., customer1@example.com
            CONCAT('98000', LPAD(i, 5, '0')),           -- Fake phone numbers
            IF(i % 2 = 0, 'M', 'F'),                    -- Alternate Male/Female
            IF(i % 3 = 0, 'Mumbai', IF(i % 3 = 1, 'Delhi', 'Bangalore')), -- Randomize cities
            IF(i % 3 = 0, 'Maharashtra', IF(i % 3 = 1, 'Delhi', 'Karnataka'))
        );
        SET i = i + 1;
    END WHILE;
END //

-- Change delimiter back to normal
DELIMITER ;


CALL generate_customers(100);


SELECT * FROM customers;