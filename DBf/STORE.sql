CREATE TABLE store.store(
id SERIAL,
id_item INTEGER,
date_store DATE DEFAULT CURRENT_TIMESTAMP,
amout INTEGER,
final_amount TEXT,
id_user INTEGER,
CONSTRAINT pk_store PRIMARY KEY(id),
CONSTRAINT fk_store_item FOREIGN KEY(id_item) REFERENCES store.item(id),
CONSTRAINT fk_users_user FOREIGN KEY(id_user) REFERENCES users.user(id)
);

CREATE TABLE store.item(
id SERIAL,
name_item TEXT,
description TEXT not null,
CONSTRAINT pk_item PRIMARY KEY(id)
);

CREATE TABLE store.promotion(
id SERIAL,
id_item INTEGER,
amount INTEGER,
discount text,
CONSTRAINT pk_promotion PRIMARY KEY(id),
CONSTRAINT fk_store_item FOREIGN KEY(id_item) REFERENCES store.item(id)
);

INSERT INTO store.item (name_item, description) 
VALUES 
('Arroz', 'Arroz de 1kg, marca de barrio'),
('Aceite', 'Aceite vegetal de 1L'),
('Pan', 'Pan fresco de la mañana, bolsa de 10 piezas'),
('Azúcar', 'Azúcar refinada de 1kg'),
('Leche', 'Leche fresca de vaca en botella de 1L'),
('Cerveza', 'Cerveza de 500ml, marca popular'),
('Galletas', 'Galletas de vainilla empaquetadas'),
('Tortillas', 'Tortillas de maíz, paquete de 12 unidades'),
('Jugo', 'Jugo de naranja de 1L'),
('Detergente', 'Detergente líquido para lavar ropa de 1L');
INSERT INTO store.store (id_item, amout, final_amount, id_user)
VALUES 
(1, 20, 'Finalizado', 1),  -- Arroz
(2, 15, 'En proceso', 2),  -- Aceite
(3, 25, 'Finalizado', 3),  -- Pan
(4, 10, 'Finalizado', 4),  -- Azúcar
(5, 30, 'En proceso', 5),  -- Leche
(6, 18, 'Finalizado', 6),  -- Cerveza
(7, 22, 'Finalizado', 7),  -- Galletas
(8, 12, 'En proceso', 8),  -- Tortillas
(9, 35, 'Finalizado', 9),  -- Jugo
(10, 50, 'Finalizado', 10); -- Detergente
INSERT INTO store.promotion (id_item, amount, discount)
VALUES 
(1, 5, 'Descuento de 10% por compras mayores a 5kg de arroz'),  -- Arroz
(2, 3, 'Descuento de 5% en la compra de dos botellas de aceite'), -- Aceite
(3, 8, 'Compra 1 pan y llévate el segundo a mitad de precio'),  -- Pan
(4, 4, 'Compra 2 paquetes de azúcar y obtén un 5% de descuento'), -- Azúcar
(5, 10, 'Llévate 3 botellas de leche y obtén 1 gratis'),  -- Leche
(6, 12, 'Compra 6 cervezas y obtén 1 gratis'),  -- Cerveza
(7, 10, 'Compra 2 paquetes de galletas y obtén el 3ro gratis'), -- Galletas
(8, 15, 'Descuento de 10% en la compra de 3 paquetes de tortillas'), -- Tortillas
(9, 5, 'Descuento de 5% en la compra de 2 jugos de naranja'),  -- Jugo
(10, 8, 'Descuento de 5% en la compra de 2 detergentes'); -- Detergente
