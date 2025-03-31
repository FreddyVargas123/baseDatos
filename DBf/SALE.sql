CREATE TABLE sale.sale(
id SERIAL,
date_sale DATE DEFAULT CURRENT_TIMESTAMP,
total INTEGER,
id_client INTEGER NULL,
id_detali_sale INTEGER NOT NULL,
id_user INTEGER NOT NULL,
CONSTRAINT pk_sale PRIMARY KEY (id),
CONSTRAINT fk_sale_client FOREIGN KEY (id_client) REFERENCES sale.client(id),
CONSTRAINT fk_sale_detali_sale FOREIGN KEY(id_detali_sale) REFERENCES sale.detali_sale(id),
CONSTRAINT fk_users_user FOREIGN KEY(id_user) REFERENCES users.user(id)
);

CREATE TABLE sale.client(
id SERIAL,
name_client VARCHAR(50),
telf VARCHAR(50),
CONSTRAINT pk_client PRIMARY KEY (id)
);

CREATE TABLE sale.detali_sale(
id SERIAL,
price DECIMAL(10,2),
amount INTEGER,
id_item INTEGER,
CONSTRAINT pk_detali_sale PRIMARY KEY(id),
CONSTRAINT fk_store_item FOREIGN KEY(id_item) REFERENCES store.item(id)
);
INSERT INTO sale.client (name_client, telf)
VALUES 
('Carlos Pérez', '312-4567890'),
('Ana Rodríguez', '312-3456789'),
('Luis Gómez', '312-2345678'),
('Marta Díaz', '312-1234567'),
('Pedro Martínez', '312-5678901'),
('Claudia López', '312-6789012'),
('José Sánchez', '312-7890123'),
('Laura Fernández', '312-8901234'),
('Carlos Ramírez', '312-9012345'),
('Isabel Torres', '312-1230987');
INSERT INTO sale.detali_sale (price, amount, id_item)
VALUES 
(25.50, 3, 1),  -- Arroz (3 unidades a $25.50)
(18.00, 2, 3),  -- Pan (2 unidades a $18.00)
(12.00, 5, 2),  -- Aceite (5 unidades a $12.00)
(30.00, 4, 4),  -- Azúcar (4 unidades a $30.00)
(22.50, 2, 5),  -- Leche (2 unidades a $22.50)
(40.00, 6, 6),  -- Cerveza (6 unidades a $40.00)
(15.00, 10, 7), -- Galletas (10 unidades a $15.00)
(20.00, 7, 8),  -- Tortillas (7 unidades a $20.00)
(10.00, 15, 9), -- Jugo (15 unidades a $10.00)
(18.50, 4, 10); -- Detergente (4 unidades a $18.50)
INSERT INTO sale.sale (date_sale, total, id_client, id_detali_sale, id_user)
VALUES 
(CURRENT_DATE, 76, 1, 1, 1),  -- Venta 1: Carlos Pérez compra Arroz
(CURRENT_DATE, 36, 2, 2, 2),  -- Venta 2: Ana Rodríguez compra Pan
(CURRENT_DATE, 60, 3, 3, 3),  -- Venta 3: Luis Gómez compra Aceite
(CURRENT_DATE, 120, 4, 4, 4), -- Venta 4: Marta Díaz compra Azúcar
(CURRENT_DATE, 45, 5, 5, 5),  -- Venta 5: Pedro Martínez compra Leche
(CURRENT_DATE, 240, 6, 6, 6), -- Venta 6: Claudia López compra Cerveza
(CURRENT_DATE, 150, 7, 7, 7), -- Venta 7: José Sánchez compra Galletas
(CURRENT_DATE, 140, 8, 8, 8), -- Venta 8: Laura Fernández compra Tortillas
(CURRENT_DATE, 150, 9, 9, 9), -- Venta 9: Carlos Ramírez compra Jugo
(CURRENT_DATE, 74, 10, 10, 10); -- Venta 10: Isabel Torres compra Detergente
