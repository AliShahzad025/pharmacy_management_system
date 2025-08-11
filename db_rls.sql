

--Row level security for all tables other than medicines ,manufacturer,supplier

ALTER TABLE pharmacies ENABLE ROW LEVEL SECURITY;

Create Policy rls_pharmacies 
on pharmacies 
USING (pharmacy_id = current_setting('app.current_pharmacy_id')::int);
ALTER TABLE pharmacies FORCE ROW LEVEL SECURITY;



CREATE ROLE pharmacy_user_1 LOGIN PASSWORD 'testpass';
GRANT SELECT ON pharmacies TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM pharmacies;




ALTER TABLE pharmacies_x_medicines  ENABLE ROW LEVEL SECURITY;

Create Policy rls_pharmacies_x_medicines 
on pharmacies_x_medicines  
USING (pharmacy_id = current_setting('app.current_pharmacy_id')::INT);

ALTER TABLE pharmacies_x_medicines  FORCE ROW LEVEL SECURITY;

GRANT SELECT ON pharmacies_x_medicines TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM pharmacies_x_medicines;




ALTER TABLE inventories  ENABLE ROW LEVEL SECURITY;

Create Policy rls_inventories 
on inventories  
USING (pharmacy_id =current_setting ('app.current_pharmacy_id')::INT);

ALTER TABLE inventories   FORCE ROW LEVEL SECURITY;

GRANT SELECT ON inventories  TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM inventories ;





ALTER TABLE customers ENABLE ROW LEVEL SECURITY;

Create Policy rls_customers
on customers
USING (pharmacy_id =current_setting ('app.current_pharmacy_id')::INT);

ALTER TABLE customers   FORCE ROW LEVEL SECURITY;

GRANT SELECT ON customers  TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM customers ;






ALTER TABLE sales ENABLE ROW LEVEL SECURITY;

Create Policy rls_sales
on sales
USING (pharmacy_id =current_setting ('app.current_pharmacy_id')::INT);

ALTER TABLE  sales   FORCE ROW LEVEL SECURITY;

GRANT SELECT ON sales  TO pharmacy_user_1;

SET app.current_pharmacy_id = '2';
SELECT * FROM sales ;








ALTER TABLE employees ENABLE ROW LEVEL SECURITY;

Create Policy rls_employees 
on employees 
USING (pharmacy_id =current_setting ('app.current_pharmacy_id')::INT);

ALTER TABLE  employees    FORCE ROW LEVEL SECURITY;

GRANT SELECT ON  employees   TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM  employees  ;





ALTER TABLE sales_items ENABLE ROW LEVEL SECURITY;

Create Policy rls_sales_items
on sales_items  
USING (
 EXISTS (
        SELECT 1 FROM sales
        WHERE sales.sale_id = sales_items.sale_id
        AND sales.pharmacy_id = current_setting('app.current_pharmacy_id')::INT
    ));
ALTER TABLE sales_items    FORCE ROW LEVEL SECURITY;

GRANT SELECT ON  sales_items   TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM  sales_items  ;








ALTER TABLE payments_details ENABLE ROW LEVEL SECURITY;

Create Policy rls_payments_details
on payments_details  
USING (
 EXISTS (
        SELECT 1 FROM sales
        WHERE sales.sale_id = payments_details.sale_id
        AND sales.pharmacy_id = current_setting('app.current_pharmacy_id')::INT
    ));
ALTER TABLE payments_details    FORCE ROW LEVEL SECURITY;

GRANT SELECT ON  payments_details   TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM  payments_details  ;





ALTER TABLE returns ENABLE ROW LEVEL SECURITY;

CREATE POLICY rls_return
ON returns
USING (
    EXISTS (
        SELECT 1 FROM sales
        WHERE sales.sale_id = returns.sale_id
        AND sales.pharmacy_id = current_setting('app.current_pharmacy_id')::INT
    )
);

ALTER TABLE returns FORCE ROW LEVEL SECURITY;

GRANT SELECT ON returns TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM returns;







ALTER TABLE purchases ENABLE ROW LEVEL SECURITY;

Create Policy rls_purchases 
on purchases
USING (pharmacy_id =current_setting ('app.current_pharmacy_id')::INT);

ALTER TABLE  purchases   FORCE ROW LEVEL SECURITY;

GRANT SELECT ON  purchases   TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM purchases ;




ALTER TABLE pharmacies_x_suppliers ENABLE ROW LEVEL SECURITY;

Create Policy rls_pharmacies_x_suppliers
on pharmacies_x_suppliers
USING (pharmacy_id =current_setting ('app.current_pharmacy_id')::INT);

ALTER TABLE  pharmacies_x_suppliers  FORCE ROW LEVEL SECURITY;

GRANT SELECT ON  pharmacies_x_suppliers TO pharmacy_user_1;

SET app.current_pharmacy_id = '1';
SELECT * FROM pharmacies_x_suppliers;


