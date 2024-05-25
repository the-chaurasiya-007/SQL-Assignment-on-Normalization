CREATE DATABASE hotwax;
USE hotwax;
CREATE TABLE orders (
     id INT,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     product_name VARCHAR(255),
     product_description VARCHAR(255),
     product_returnable VARCHAR(50),
     seller VARCHAR(255),
     order_id VARCHAR(50),
     total DECIMAL(10, 2),
     date DATE,
     order_status VARCHAR(50),
     address VARCHAR(255)
);

DROP TABLE orders;

INSERT INTO orders (first_name, last_name, product_name, product_description, product_returnable, seller, order_id, total, date, order_status, address)
VALUES
('John', 'Doe', 'One Plus Nord, Air Jordans', 'Red Mobile Phone, Shoes', 'No, Yes', 'Seller_Z, Nike', 'O1, O2', 20000, '2022-08-15', 'Approved, Approved', '452001, Indore, MP'),
('Mary', 'Ann', 'One Plus Nord', 'Red Mobile Phone', 'No', 'Seller_Z', 'O3', 20000, '2000-08-15', 'Approved', '410014, Pune, Maharashtra');

TRUNCATE TABLE orders;

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE orders
ADD COLUMN city VARCHAR(255),
ADD COLUMN state VARCHAR(255),
ADD COLUMN pincode VARCHAR(20);

ALTER TABLE orders
DROP COLUMN address;

INSERT INTO orders (order_id, first_name, last_name, product_name, product_description, product_returnable, seller, total, date, order_status, city, state, pincode) 
VALUES 
('O1', 'John', 'Doe', 'One Plus Nord', 'Red Mobile Phone', 'No', 'Seller_Z', 20000, '2022-08-15', 'Approved', 'Indore', 'MP', '452001'), 
('O2', 'John', 'Doe', 'Air Jordans', 'Shoes', 'Yes', 'Nike', 25000, '2000-08-15', 'Approved', 'Indore', 'M.P.', '452001'), 
('O3', 'Mary', 'Ann', 'One Plus Nord', 'Red Mobile Phone', 'No', 'Seller_Z', 20000, '2000-08-15', 'Approved', 'Pune', 'Maharashtra', '410014');

CREATE TABLE products (
     product_id VARCHAR(20) PRIMARY KEY,
     product_name VARCHAR(100),
     product_description TEXT,
     product_returnable VARCHAR(45),
    owner VARCHAR(100)
);

CREATE TABLE users (
     user_id VARCHAR(20) PRIMARY KEY,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     pincode VARCHAR(10),
     city VARCHAR(100),
     state VARCHAR(100)
);

ALTER TABLE orders RENAME TO orders_old;

CREATE TABLE orders (
     order_id VARCHAR(45) PRIMARY KEY,
     product_id VARCHAR(45),
     user_id VARCHAR(45),
     total DOUBLE,
     date DATE,
     status VARCHAR(50),
     FOREIGN KEY (product_id) REFERENCES products(product_id),
     FOREIGN KEY (user_id) REFERENCES users(user_id)
);

ALTER TABLE users
DROP COLUMN city,
DROP COLUMN state;

CREATE TABLE address (
     pincode VARCHAR(10) PRIMARY KEY,
     city VARCHAR(255),
     state VARCHAR(255)
);

ALTER TABLE users
ADD CONSTRAINT fk_pincode
FOREIGN KEY (pincode) REFERENCES address(pincode);

INSERT INTO products (product_id, product_name, product_description, product_returnable, owner)
VALUES
('P1', 'One Plus Nord', 'Red Mobile Phone', 'No', 'Seller_Z'),
('P2', 'Air Jordans', 'Shoes', 'Yes', 'Nike');

INSERT INTO address (pincode, city, state)
VALUES
('452001', 'Indore', 'MP'),
('410014', 'Pune', 'Maharashtra');

ALTER TABLE users
ADD COLUMN city VARCHAR(255),
ADD COLUMN state VARCHAR(255);

INSERT INTO users (user_id, first_name, last_name, pincode, city, state)
VALUES
('U1', 'John', 'Does', '452001', 'Indore', 'MP'),
('U2', 'Mary', 'Ann', '410014', 'Pune', 'Maharashtra');

INSERT INTO orders (order_id, product_id, user_id, total, date, status)
VALUES
('O1', 'P1', 'U1', 2000, '2024-03-04', 'Approved'),
('O2', 'P2', 'U2', 7000, '2024-03-04', 'Pending'),
('O3', 'P1', 'U1', 25000, '2024-03-04', 'Shipped');

SELECT * FROM orders;