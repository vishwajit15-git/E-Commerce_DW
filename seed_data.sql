USE onestop;

-- : Layer 1 — Manual Inserts


-- INSERT INTO CATEGORIES (MULTI-LINE INSERT)
INSERT INTO categories (category_name,description) VALUES
('Electronics','Gadgets, phones, laptops and accessories'),
('Clothing','Shirts, Jeans, ethnic wear'),
('Home & Kitchen','Appliances, utensils, furniture'),
('Accessories','Watches, Bags, wallets, belts, jewellery and fashion accesories'),
('Footwear','Shoes, sandals, sneakers, boots and slippers'),
('Books','Fiction, non-Fiction, Academic Books, novels, comics and magazines');

-- INSERT INTO STORES 
INSERT INTO stores(store_name,store_type,city,state,pincode) VALUES
('OneStop Connaught Place','Physical','New Delhi','Delhi','110001'),
('OneStop Bandra','Physical','Mumbai','Maharashtra','400050'),
('OneStop Koramangala','Physical','Bangalore','Karnataka','560034'),
('OneStop.com','Online','Mumbai','Maharashtra','400001');


-- INSERT INTO COUPONS
INSERT INTO coupons(coupon_code,discount_percentage,coupon_expiry,is_active) VALUES
('WELCOME10',10.00,'2027-12-31 23:59:59',TRUE),
('FESTIVE20',20.00,'2026-11-30 23:59:59',TRUE),
('OLD5',5.00,'2025-01-01 00:00:00',FALSE );


-- Layer 2: Medium Datasets (Suppliers & Products)

-- INSERT INTO SUPPLIERS
INSERT INTO suppliers (supplier_name, contact_person, email, phone, city, state) VALUES
('TechCorp', 'Rajesh Kumar', 'rajesh@techcorp.in', '9876543210', 'Bangalore', 'Karnataka'),
('FashionHub', 'Priya Singh', 'contact@fashionhub.com', '9876543211', 'Mumbai', 'Maharashtra'),
('HomeDecor Plus', 'Amit Patel', 'sales@homedecor.in', '9876543212', 'Ahmedabad', 'Gujarat'),
('GamerZone', 'Vikram Reddy', 'vendors@gamerzone.com', '9876543213', 'Hyderabad', 'Telangana');


-- INSERT INTO PRODUCTS
-- category_id: 1=Electronics, 2=Clothing, 3=Home, 4=Accessories, 5=Footwear, 6=Books
-- supplier_id: 1=TechCorp, 2=FashionHub, 3=HomeDecor, 4=GamerZone
INSERT INTO products (product_name, description, price, stock_quantity, category_id, supplier_id) VALUES
('Samsung Galaxy S24', 'Latest flagship smartphone 256GB', 74999.00, 50, 1, 1),
('Sony WH-1000XM5', 'Noise cancelling wireless headphones', 29990.00, 30, 1, 1),
('Levi''s Blue Jeans', 'Slim fit men''s denim', 2599.00, 100, 2, 2),
('Cotton T-Shirt', '100% cotton casual wear', 799.00, 200, 2, 2),
('Prestige Mixer Grinder', '750W mixer with 3 jars', 3499.00, 45, 3, 3),
('King Size Bedsheet', 'Cotton printed bedsheet with pillow covers', 1299.00, 80, 3, 3),
('Razer DeathAdder Mouse', 'Ergonomic gaming mouse', 4599.00, 60, 1, 4),
('Leather Wallet', 'Genuine leather bi-fold wallet', 999.00, 120, 4, 2);


SELECT * FROM suppliers;