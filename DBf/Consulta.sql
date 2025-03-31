SELECT p.id, p.discount, p.amount
FROM store.promotion p
JOIN store.item i ON p.id_item = i.id
WHERE i.name_item = 'Arroz';  -- Cambia 'Arroz' por el nombre del producto que quieras consultar.

SELECT s.id, s.date_sale, s.total, c.name_client
FROM sale.sale s
JOIN sale.client c ON s.id_client = c.id
WHERE s.id_user = 1;  -- Cambia 1 por el ID del usuario específico.

SELECT e.id, e.name_employee, e.ap_paternal, e.ap_maternal
FROM employee.employee e
WHERE e.id_user = 1;  -- Cambia 1 por el ID del usuario.


SELECT i.name_item, st.amout
FROM store.store st
JOIN store.item i ON st.id_item = i.id
WHERE i.name_item = 'Arroz';  -- Cambia 'Arroz' por el nombre del producto.

SELECT i.name_item, st.amout
FROM store.store st
JOIN store.item i ON st.id_item = i.id
WHERE st.amout < 10;  -- Muestra los productos con menos de 10 unidades en stock.

SELECT COUNT(*) AS cantidad_clientes
FROM sale.client;

SELECT c.name_client, SUM(s.total) AS total_compras
FROM sale.sale s
JOIN sale.client c ON s.id_client = c.id
GROUP BY c.name_client
ORDER BY total_compras DESC
LIMIT 1;  -- El cliente con el costo más alto de compra.

SELECT c.name_client, SUM(ds.amount) AS total_comprado
FROM sale.sale s
JOIN sale.client c ON s.id_client = c.id
JOIN sale.detali_sale ds ON s.id_detali_sale = ds.id
GROUP BY c.name_client
ORDER BY total_comprado DESC
LIMIT 1;  -- El cliente que más ha comprado.

SELECT i.name_item, SUM(ds.amount) AS cantidad_vendida
FROM sale.detali_sale ds
JOIN store.item i ON ds.id_item = i.id
GROUP BY i.name_item
ORDER BY cantidad_vendida DESC
LIMIT 1;  -- Obtiene el producto más vendido.

SELECT DISTINCT s.name_supplier, s.phone
FROM buy.supplier s
JOIN buy.detali_buy db ON s.id = db.id_item
JOIN store.item i ON db.id_item = i.id
WHERE i.name_item = 'Producto X';  -- Cambia 'Producto X' por el nombre del producto.

SELECT s.id, s.date_sale, s.total, c.name_client
FROM sale.sale s
JOIN sale.client c ON s.id_client = c.id
WHERE s.id_user = 1;  -- Cambia 1 por el ID del usuario específico.


SELECT SUM(s.total) AS total_ingresos
FROM sale.sale s
WHERE EXTRACT(MONTH FROM s.date_sale) = 3  
AND EXTRACT(YEAR FROM s.date_sale) = 2025;  



