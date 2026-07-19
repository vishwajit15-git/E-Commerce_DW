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

-- tables 5: stores
CREATE TABLE stores(
    -- details
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100) NOT NULL,

    -- OneStop has Physical stores and an online
    store_type ENUM('Physical', 'Online') NOT NULL,


    -- address
    city VARCHAR(50),
    state VARCHAR(50),
    pincode CHAR(6)
    
);

-- table 6: coupons
CREATE TABLE coupons(
    coupon_id INT PRIMARY KEY AUTO_INCREMENT,
    coupon_code VARCHAR(20) NOT NULL UNIQUE,
    discount_percentage DECIMAL(5,2),
    coupon_expiry DATETIME,
    is_active BOOLEAN DEFAULT TRUE
);


-- table 7: orders  [most important table in our e-commerce]

CREATE TABLE orders(

    order_id INT PRIMARY KEY AUTO_INCREMENT,
    status ENUM('Pending','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(12,2) NOT NULL,
    customer_id INT,
    store_id INT,
    coupon_id INT,


    -- FOREIGN KEYS
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (coupon_id) REFERENCES coupons(coupon_id)

);

-- table 8 :order_items

CREATE TABLE order_items(
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,

    order_id INT NOT NULL,
    product_id INT NOT NULL,

    -- FOREIGN KEY
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- table 9: reviews

CREATE TABLE reviews(
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    rating INT NOT NULL CHECK(rating BETWEEN 1 AND 5) ,
    comment TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    customer_id INT,
    product_id INT,

    -- FOREIGN KEY
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
SHOW TABLES;
