CREATE TABLE employee.employee(
id SERIAL,
id_user INTEGER,
name_employee TEXT,
ap_paternal TEXT,
ap_maternal TEXT,
CONSTRAINT pk_employee PRIMARY KEY(id),
CONSTRAINT fk_users_user FOREIGN KEY(id_user) REFERENCES users.user(id)
);

CREATE TABLE employee.control_access(
id SERIAL,
id_user INTEGER,
admin_access TEXT,
sale TEXT,
buy TEXT,
store TEXT,
CONSTRAINT pk_control_access PRIMARY KEY(id),
CONSTRAINT fk_users_user FOREIGN KEY(id_user) REFERENCES users.user(id)
);

CREATE TABLE employee.position(
id SERIAL,
name_c TEXT,
description_c TEXT,
CONSTRAINT pk_position PRIMARY KEY(id)
);

CREATE TABLE employee.contact (
id SERIAL,
date_c DATE DEFAULT CURRENT_TIMESTAMP,
type_c TEXT,
time TEXT,
id_employee INTEGER,
id_position INTEGER,
CONSTRAINT pk_contact PRIMARY KEY(id),
CONSTRAINT fk_employee_employee FOREIGN KEY(id_employee) REFERENCES employee.employee(id),
CONSTRAINT fk_employee_position FOREIGN KEY(id_position) REFERENCES employee.position(id)
);

CREATE TABLE employee.area(
id SERIAl,
location_a TEXT,
description_a TEXT,
n_area INTEGER,
CONSTRAINT pk_area PRIMARY KEY(id)
);

CREATE TABLE employee.assign_area(
id SERIAL,
id_employee INTEGER,
id_area INTEGER,
CONSTRAINT pk_assign_area PRIMARY KEY(id),
CONSTRAINT fk_employee_employee FOREIGN KEY(id_employee) REFERENCES employee.employee(id),
CONSTRAINT fk_employee_area FOREIGN KEY (id_area) REFERENCES employee.area(id)
);
INSERT INTO employee.employee (id_user, name_employee, ap_paternal, ap_maternal)
VALUES 
(1, 'Juan Perez', 'Perez', 'Gomez'),
(2, 'Maria Lopez', 'Lopez', 'Martinez'),
(3, 'Carlos Sanchez', 'Sanchez', 'Rodriguez'),
(4, 'Ana Fernandez', 'Fernandez', 'Garcia'),
(5, 'Luis Garcia', 'Garcia', 'Hernandez'),
(6, 'Pedro Ruiz', 'Ruiz', 'Diaz'),
(7, 'Laura Morales', 'Morales', 'Soto'),
(8, 'Jose Castillo', 'Castillo', 'Mora'),
(9, 'Claudia Martinez', 'Martinez', 'Perez'),
(10, 'Antonio Romero', 'Romero', 'Vazquez');

INSERT INTO employee.control_access (id_user, admin_access, sale, buy, store)
VALUES 
(1, 'YES', 'YES', 'YES', 'YES'),
(2, 'NO', 'YES', 'YES', 'YES'),
(3, 'YES', 'YES', 'NO', 'NO'),
(4, 'NO', 'NO', 'YES', 'YES'),
(5, 'YES', 'YES', 'YES', 'YES'),
(6, 'NO', 'YES', 'NO', 'YES'),
(7, 'YES', 'NO', 'YES', 'YES'),
(8, 'NO', 'YES', 'YES', 'NO'),
(9, 'YES', 'YES', 'YES', 'YES'),
(10, 'NO', 'NO', 'YES', 'NO');

INSERT INTO employee.position (name_c, description_c)
VALUES 
('Gerente', 'Responsable de la administración general de la empresa'),
('Vendedor', 'Encargado de realizar ventas directas al cliente'),
('Comprador', 'Encargado de la compra de productos para la tienda'),
('Almacenista', 'Responsable de la organización y el control del almacén'),
('Repartidor', 'Encargado de entregar productos a los clientes'),
('Asistente Administrativo', 'Asistencia en tareas administrativas generales'),
('Supervisor', 'Supervisa las operaciones de la tienda o área'),
('Contador', 'Encargado de llevar las finanzas y la contabilidad de la empresa'),
('Cajero', 'Encargado de recibir pagos y realizar cobros a clientes'),
('Secretaria', 'Encargada de tareas administrativas y de organización');

INSERT INTO employee.contact (date_c, type_c, time, id_employee, id_position)
VALUES 
(CURRENT_DATE, 'Email', '09:00', 1, 1),
(CURRENT_DATE, 'Teléfono', '10:00', 2, 2),
(CURRENT_DATE, 'Reunión', '11:30', 3, 3),
(CURRENT_DATE, 'Email', '12:45', 4, 4),
(CURRENT_DATE, 'Teléfono', '14:00', 5, 5),
(CURRENT_DATE, 'Reunión', '15:30', 6, 6),
(CURRENT_DATE, 'Email', '16:00', 7, 7),
(CURRENT_DATE, 'Reunión', '17:15', 8, 8),
(CURRENT_DATE, 'Teléfono', '18:00', 9, 9),
(CURRENT_DATE, 'Reunión', '09:30', 10, 10);


