#alter commands to add constraints like not null ,unique 
 USE  pharmacy_management_system ;
ALTER TABLE pharmacies 
MODIFY pharmacy_name VARCHAR(255) NOT NULL,
MODIFY pharmacy_location VARCHAR(255) NOT NULL,
MODIFY pharmacy_email VARCHAR(100) NOT NULL;


ALTER TABLE pharmacies 
ADD CONSTRAINT unique_pharmacy_email UNIQUE (pharmacy_email),
ADD CONSTRAINT unique_pharmacy_number UNIQUE (pharmacy_number);


ALTER TABLE manufacturers 
MODIFY manufacturer_name VARCHAR(100) NOT NULL;

ALTER TABLE medicines 
MODIFY medicine_name VARCHAR(255) NOT NULL,
MODIFY medicine_unit_price DECIMAL(10, 2) NOT NULL;



ALTER TABLE suppliers 
ADD CONSTRAINT unique_supplier_email UNIQUE (supplier_email),
ADD CONSTRAINT unique_supplier_number UNIQUE (supplier_number);

ALTER TABLE customers 
ADD CONSTRAINT unique_customer_email UNIQUE (customer_email),
ADD CONSTRAINT unique_customer_number UNIQUE (customer_number);

ALTER TABLE employees 
ADD CONSTRAINT unique_employee_email UNIQUE (employee_email),
ADD CONSTRAINT unique_employee_number UNIQUE (employee_number);
