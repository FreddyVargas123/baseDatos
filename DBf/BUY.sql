CREATE TABLE buy.supplier (
    id SERIAL,
    name_supplier TEXT NOT NULL,
    phone VARCHAR(20) NOT NULL,
    CONSTRAINT pk_supplier PRIMARY KEY(id)
);


CREATE TABLE buy.detali_buy (
    id SERIAL,
    quantity INTEGER NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    type_detali_buy TEXT,
    id_item INTEGER NOT NULL,
    CONSTRAINT pk_detali_buy PRIMARY KEY(id),
    CONSTRAINT fk_buy_item FOREIGN KEY (id_item) REFERENCES store.item(id)
);


CREATE TABLE buy.buy (
    id SERIAL,
    date_buy DATE DEFAULT CURRENT_TIMESTAMP,
    id_user INTEGER,
    id_detali_buy INTEGER,
    id_supplier INTEGER,
    CONSTRAINT pk_buy PRIMARY KEY(id),
    CONSTRAINT fk_users_user FOREIGN KEY(id_user) REFERENCES users.user(id),
    CONSTRAINT fk_buy_detali_buy FOREIGN KEY(id_detali_buy) REFERENCES buy.detali_buy(id),
    CONSTRAINT fk_buy_supplier FOREIGN KEY(id_supplier) REFERENCES buy.supplier(id)
);


CREATE TABLE users.user (
    id SERIAL PRIMARY KEY
);


INSERT INTO buy.supplier (name_supplier, phone) 
VALUES 
('Proveedor 1', '123456789'),
('Proveedor 2', '987654321'),
('Proveedor 3', '456789123'),
('Proveedor 4', '789123456'),
('Proveedor 5', '321654987'),
('Proveedor 6', '654321789'),
('Proveedor 7', '987123456'),
('Proveedor 8', '321987654'),
('Proveedor 9', '789654123'),
('Proveedor 10', '456321987'),
('Proveedor 11', '654987321'),
('Proveedor 12', '123789456'),
('Proveedor 13', '987654987'),
('Proveedor 14', '654123456'),
('Proveedor 15', '321456123'),
('Proveedor 16', '123456987'),
('Proveedor 17', '987321654'),
('Proveedor 18', '456987123'),
('Proveedor 19', '789123987'),
('Proveedor 20', '654321654');





