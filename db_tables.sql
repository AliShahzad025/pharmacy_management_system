
CREATE TABLE pharmacies (
    pharmacy_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_name VARCHAR(255),
    pharmacy_location VARCHAR(255),
    pharmacy_number VARCHAR(50),
    pharmacy_email VARCHAR(100),
    pharmacy_address VARCHAR(255)
);

Create TABLE manufacturers(
manufacturer_id integer Primary key  AUTO_INCREMENT ,
manufacturer_name varchar (100)
);

CREATE TABLE medicines (
     medicine_id INT PRIMARY KEY AUTO_INCREMENT,
     pharmacy_id INT,
     medicine_name VARCHAR(255),
     manufacturer_id integer,
     medicine_unit_price DECIMAL(10, 2),
	foreign key(manufacturer_id )REFERENCES manufacturers(manufacturer_id)ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE inventories (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_id INT,
    medicine_id INT,
     inventory_quantity INT,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_id INT,
     customer_name VARCHAR(255),
     customer_number VARCHAR(50),
     customer_email VARCHAR(100),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_id INT,
    customer_id INT,
    sale_date DATE,
    sale_total_price DECIMAL(10,2),
    sale_discount DECIMAL(10,2),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE sales_items(
sale_item_id int Primary key   AUTO_INCREMENT,
sale_id int  ,
medicine_id int ,
sale_item_quantity int ,
sale_item_unit_price decimal (10,2),

FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_id INT,
    employee_role VARCHAR(100),
    employee_name VARCHAR(255),
    employee_number VARCHAR(50),
    employee_email VARCHAR(100),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255),
    supplier_number VARCHAR(50),
    supplier_email VARCHAR(100)
);


CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_id INT,
    supplier_id INT,
    medicine_id INT,
    purchase_quantity INT,
    purchase_unit_price DECIMAL(10, 2),
     purchase_date DATE,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE payment_details (
    payment_details_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    payment_method VARCHAR(100),
     payment_amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    return_date DATE,
    return_quantity INT,
    return_reason TEXT,
    refunded_amount DECIMAL(10,2),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE ON UPDATE CASCADE
);

#create one new table JUNCTION TABLE /BRIDGE TABLE FOR MANY TO MANY RELATIONSHIPS  
CREATE TABLE  pharmacies_x_suppliers(
	pharmacy_id INT,
    supplier_id INT,
    PRIMARY KEY (pharmacy_id, supplier_id),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)ON DELETE CASCADE ON UPDATE CASCADE
);
