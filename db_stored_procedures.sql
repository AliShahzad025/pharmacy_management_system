# COMPLEX SQL QUERIES BY STORED PROCEDURES AND VIEWS

USE  pharmacy_management_system ;

 #Check Low Inventory Across All Pharmacies
DELIMITER //
CREATE PROCEDURE LOW_INVENTORY(
  IN p_threshold int 
  
)
begin 
Select p.pharmacy_id,p.pharmacy_name,i.medicine_id
  from pharmacies as p 
join inventories as i
on p.pharmacy_id=i.pharmacy_id
where i.inventory_quantity< p_threshold ;
END //,

DELIMITER 

CALL LOW_INVENTORY(500);


#Monthly Revenue & Most Sold Medicine for Each Pharmacy
DELIMITER //

CREATE PROCEDURE revenue_most_sold(
  IN p_pharmacy_id INT
)
BEGIN
  -- Monthly Revenue
  SELECT  
    p.pharmacy_id,
    p.pharmacy_name,
    SUM(s.sale_total_price) AS monthly_revenue
  FROM sales s
  JOIN pharmacies p ON s.pharmacy_id = p.pharmacy_id
  WHERE s.pharmacy_id = p_pharmacy_id
    AND s.sale_date BETWEEN '2025-07-01' AND '2025-07-31'
  GROUP BY p.pharmacy_id;

  -- Most Sold Medicine
  SELECT 
    m.medicine_id,
    m.medicine_name,
    SUM(si.sale_item_quantity) AS total_sold
  FROM sales_items si
  JOIN sales s ON s.sale_id = si.sale_id
  JOIN medicines m ON si.medicine_id = m.medicine_id
  WHERE s.pharmacy_id = p_pharmacy_id
    AND s.sale_date BETWEEN '2025-07-01' AND '2025-07-31'
  GROUP BY m.medicine_id
  ORDER BY total_sold DESC
  LIMIT 1;
END;
//

DELIMITER ;

call revenue_most_sold(1);

# CUSTOMER PURCHASE SUMMARY FOR THE CUSTOMER 

DELIMITER //

CREATE PROCEDURE customer_summary (
    IN p_customer_id INT
)
BEGIN 
    SELECT 
        c.customer_name,
        COUNT(DISTINCT s.sale_id) AS total_visits,
        SUM(s.sale_total_price) AS total_spent,
        GROUP_CONCAT(DISTINCT m.medicine_name) AS medicines_bought
    FROM customers AS c
    JOIN sales AS s ON s.customer_id = c.customer_id
    JOIN sales_items AS si ON si.sale_id = s.sale_id
    JOIN medicines AS m ON m.medicine_id = si.medicine_id
    WHERE c.customer_id = p_customer_id
    GROUP BY c.customer_id;
END;
//

DELIMITER ;

CALL customer_summary(1);


#Return Sale Item and Adjust Inventory
DELIMITER //

CREATE procedure return_sale_item (
IN p_sale_id int ,
IN  p_return_date date ,
IN p_medicine_id INT,
IN p_return_quantity INT,
IN p_reason TEXT,
IN p_refunded_amount DECIMAL (10,2)
)


BEGIN 
DECLARE v_pharmacy_id INT;
  
  Select s.pharmacy_id
  into  v_pharmacy_id
  from sales as s 
  where s.sale_id=p_sale_id ;
  
insert 
into returns_items( sale_id,medicine_id , return_date, return_quantity, return_reason, refunded_amount)
values (p_sale_id , p_medicine_id ,p_return_date,p_return_quantity,p_reason,p_refunded_amount);

UPDATE inventories
SET inventory_quantity= inventory_quantity +p_return_quantity 
where medicine_id =p_medicine_id AND pharmacy_id = v_pharmacy_id;

END;
//
DELIMITER 

CALL return_sale_item(
    1,                 -- p_sale_id
    '2025-08-04',        -- p_return_date
    1,                   -- p_medicine_id (Paracetamol)
    5,                   -- p_return_quantity
    'Damaged packaging', -- p_reason
    150.00               -- p_refunded_amount
);


