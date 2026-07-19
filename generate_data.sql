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

DELIMITER //

CREATE PROCEDURE generate_orders(IN total_orders INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE random_customer INT;
    DECLARE random_store INT;
    DECLARE current_order_id INT;
    DECLARE items_count INT;
    DECLARE j INT;
    DECLARE random_product INT;

    WHILE i <= total_orders DO
        -- 1. Pick a random customer (1 to 100) and random store (1 to 4)
        SET random_customer = FLOOR(1 + (RAND() * 100));
        SET random_store = FLOOR(1 + (RAND() * 4));

        -- 2. Create the Order
        INSERT INTO orders (customer_id, store_id, total_amount, status)
        VALUES (
            random_customer, 
            random_store, 
            0, -- We will update this later after adding items!
            IF(RAND() > 0.8, 'Delivered', IF(RAND() > 0.5, 'Shipped', 'Pending'))
        );

        -- Get the ID of the order we just created
        SET current_order_id = LAST_INSERT_ID();

        -- 3. How many items in this order? (Randomly 1 to 3 items)
        SET items_count = FLOOR(1 + (RAND() * 3));
        SET j = 1;

        -- Loop to add order_items
        WHILE j <= items_count DO
            -- Pick a random product (1 to 8)
            SET random_product = FLOOR(1 + (RAND() * 8));

            INSERT INTO order_items (order_id, product_id, quantity, unit_price)
            VALUES (
                current_order_id,
                random_product,
                FLOOR(1 + (RAND() * 2)), -- Quantity 1 or 2
                (SELECT price FROM products WHERE product_id = random_product) -- Look up the real price!
            );
            
            SET j = j + 1;
        END WHILE;

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;


CALL generate_orders(200);

SELECT * FROM order_items;