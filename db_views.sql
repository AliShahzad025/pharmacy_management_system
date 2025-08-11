# SQL QUERIES THROUGH VIEWS 
# View: Medicines with No Sales in the Last 30 Days


DROP VIEW IF EXISTS no_sale_medicine;

CREATE VIEW no_sale_medicine AS 
SELECT 
    m.medicine_id,
    m.medicine_name,
    MAX(s.sale_date) AS last_sale_date
FROM medicines AS m
LEFT JOIN sales_items AS si 
ON si.medicine_id = m.medicine_id
LEFT JOIN sales AS s
 ON s.sale_id = si.sale_id
GROUP BY m.medicine_id, m.medicine_name
HAVING MAX(s.sale_date) IS NULL OR 
MAX(s.sale_date) <NOW() - INTERVAL 30 DAY;

SELECT * FROM  no_sale_medicine;
