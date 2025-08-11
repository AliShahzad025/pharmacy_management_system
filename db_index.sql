# indexing and explain plan 

#ndex for inventories (used in joins with medicines and pharmacies)
CREATE INDEX idx_inventory_pharmacy_medicine 
ON inventories(pharmacy_id, medicine_id);

EXPLAIN SELECT 
    i.inventory_quantity, 
    m.medicine_name, 
    p.pharmacy_name
FROM 
    inventories i
JOIN medicines m ON i.medicine_id = m.medicine_id
JOIN pharmacies p ON i.pharmacy_id = p.pharmacy_id
WHERE 
    i.pharmacy_id = 5 AND i.medicine_id = 1;




# Index for sales (used in filtering/grouping by pharmacy and date)
CREATE INDEX idx_sales_pharmacy_date 
ON sales(pharmacy_id, sale_date);

 EXPLAIN SELECT 
    s.sale_id, 
    s.sale_date, 
    s.sale_total_price
FROM 
    sales s
WHERE 
    s.pharmacy_id = 3 
    AND s.sale_date BETWEEN '2025-07-01' AND '2025-07-31';
    
select * from sales_items ;
# SALE ITEMS USING SALE ID AND MEDICINE ID 
explain 
SELECT medicine_id,
 SUM(sale_item_quantity) as total_sold
FROM sales_items
WHERE sale_id BETWEEN 100 AND 200
GROUP BY medicine_id;

 