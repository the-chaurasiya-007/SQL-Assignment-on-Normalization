# SQL-Assignment-on-Normalization
Submission of assignment using MySQL Workbench.


### Structure and Normalization Process Explanation

#### Table Structure:

The provided SQL script creates and modifies tables in the `hotwax` database. The main tables created are `orders`, `products`, and `users`, along with an auxiliary table `address`.

##### 1. `orders` Table:
- This table stores information about orders placed.
- Columns include:
  - `order_id`: Primary key, uniquely identifies each order.
  - `product_id`: Foreign key referencing the `products` table.
  - `user_id`: Foreign key referencing the `users` table.
  - `total`: Total amount of the order.
  - `date`: Date of the order.
  - `status`: Status of the order.

##### 2. `products` Table:
- Stores information about products available for purchase.
- Columns include:
  - `product_id`: Primary key, uniquely identifies each product.
  - `product_name`: Name of the product.
  - `product_description`: Description of the product.
  - `product_returnable`: Indicates whether the product is returnable.
  - `owner`: Owner/seller of the product.

##### 3. `users` Table:
- Stores information about users/customers.
- Columns include:
  - `user_id`: Primary key, uniquely identifies each user.
  - `first_name`: First name of the user.
  - `last_name`: Last name of the user.
  - `pincode`: Pincode of the user's address.
  - `city`: City of the user's address.
  - `state`: State of the user's address.

##### 4. `address` Table:
- Auxiliary table to store city and state information based on pincode.
- Columns include:
  - `pincode`: Primary key, uniquely identifies each pincode.
  - `city`: City corresponding to the pincode.
  - `state`: State corresponding to the pincode.

#### Normalization Process:

Normalization is the process of organizing data in a database efficiently. It involves splitting a table into smaller tables and defining relationships between them to minimize redundancy and dependency.

In the provided SQL script:
- The initial `orders` table had redundant columns like `first_name`, `last_name`, `product_name`, etc., which were normalized into separate tables (`users`, `products`) to eliminate redundancy and maintain data integrity.
- The `address` table was created to store city and state information based on pincode, avoiding repetition of city and state names in the `users` table.

### Sample Data Used for Testing

Sample data was inserted into the tables for testing purposes. This includes:
- Sample orders placed by users.
- Information about products available for purchase.
- Details of users/customers.
- City and state information based on pincode.

### Note:

- The SQL script provided demonstrates the process of creating tables, altering their structure, and inserting sample data for testing purposes.
- Foreign key constraints are applied to maintain referential integrity between tables.

