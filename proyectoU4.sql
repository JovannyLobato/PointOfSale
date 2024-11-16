create database puntoVenta;
use puntoVenta;
create table proveedores(
idProveedor char(4) primary key,
nombreCompania varchar(40) not null,
nombreProveedor varchar(40) not null,
pass varchar(35) not null,
direccion varchar(100),
city varchar(50) not null,
CP char(5) not null,
pais varchar(50) not null,
telefono1 char(12)not null,
telefono2 char(12),
gmail varchar(50)
);

create table productos(
CodigoProducto char(12) primary key,
nombre varchar(40) not null,
precio decimal(6,2) not null,
cantidadDisp int not null,
idProveedor char(4),
constraint idProveedor foreign key (idProveedor)
references proveedores(idProveedor)
);

create table empleados(
idEmpleado varchar(24) primary key,
pass char(64) not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
rfc char(13) not null,
direccion varchar(100) not null,
CP char(5) not null,
ciudad varchar(50),
telefono1 char(12) not null,
telefono2 char(12) -- Este lo debo de modificar por correo
);

create table clientes(
idCliente char(10) primary key,
nombre varchar(50) not null,
apellido varchar(50) not null,
direccion varchar(100) not null,
CP char(5) not null,
ciudad varchar(50) not null,
telefono1 varchar(50) not null,
telefono2 varchar(50),
correo varchar(50)
);

create table ordenes(
idOrdenes int primary key,
nombreProducto varchar(40),
precio decimal(6,2) not null,
cantidad tinyint not null,
impuestos char(3) default 0,
importe decimal(6,2) not null,
descuento char(3) default 0,
total decimal(6,2) not null,
fecha datetime,
idEmpleado char(24),
constraint idEmpleado foreign key (idEmpleado)
references empleados(idEmpleado),
idCliente char(10),
constraint idCliente foreign key (idCliente)
references clientes(idCliente),
CodigoProducto char(12),
constraint CodigoProducto foreign key(CodigoProducto)
references productos(CodigoProducto)
);

drop database puntoventa;

use login;
INSERT INTO usuarios (nombre, pass) 
VALUES ('jovanny', SHA2('1234', 256));

describe usuarios;
select * from usuarios;

use puntoVenta;

describe empleados;
INSERT INTO empleados VALUES (
    'jovanny',                 -- idEmpleado
    sha2('1234',256),     		-- pass
    'Jovanny',              -- nombre
    'Lobato',               -- apellido
    'LOGJ040404H5',      	-- rfc
    'Calle Falsa 123',      -- direccion
    '12345',                -- CP
    'Ciudad de México',     -- ciudad
    '5551234567',           -- telefono1
    '5559876543'            -- telefono2
);

INSERT INTO empleados VALUES (
    'lupita',                 -- idEmpleado
    sha2('4321',256),     		-- pass
    'Guadalupe Elizabeth',              -- nombre
    'Camarena',               -- apellido
    'CAMCG040404H5',      	-- rfc
    'Otra calle falsa',      -- direccion
    '38980',                -- CP
    'Cuitzeo',     -- ciudad
    '4451591620',           -- telefono1
    '4451591620'
);

select * from empleados;
delete from empleados where idEmpleado='jovanny';
delete from empleados where idEmpleado = 'lupita';

select * from empleados where idEmpleado = 'lupita' and pass=sha2('4321',256);