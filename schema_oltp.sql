DROP DATABASE IF EXISTS onestop;
CREATE DATABASE onestop;
USE onestop;

-- tabel 1 customers
CREATE TABLE customers (
    -- identity
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,

    -- contact info
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),

    -- personal info
    gender ENUM('M', 'F', 'Other'),
    date_of_birth DATE,

    -- address
    city VARCHAR(50),
    state VARCHAR(50),
    pincode CHAR(6),

    -- metadata
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- tabel 2 : categories

CREATE TABLE categories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT
);

-- table 3 : Suppliers

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(50),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- table 4: products
CREATE TABLE products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    category_id INT ,
    supplier_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    -- FOREIGN KEYS

    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)

);

SHOW TABLES;
