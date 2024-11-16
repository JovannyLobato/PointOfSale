create database puntoVenta;
use puntoVenta;
create table proveedores(
idProveedor char(4) primary key,
nombreCompania varchar(40) not null,
nombreProveedor varchar(40) not null,
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
idEmpleado varchar(10) primary key,
nombre varchar(50) not null,
apellido varchar(50) not null,
rfc char(13) not null,
direccion varchar(100) not null,
CP char(5) not null,
ciudad varchar(50),
telefono1 char(12) not null,
telefono2 char(12)
);

create table clientes(
idCliente char(10) primary key,
nombre varchar(50) not null,
apellido varchar(50) not null,
direccion varchar(100) not null,
CP char(5) not null,
ciudad varchar(50) not null,
contacto1 varchar(50) not null,
contacto2 varchar(50),
contacto3 varchar(50)
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
idEmpleado char(10),
constraint idEmpleado foreign key (idEmpleado)
references empleados(idEmpleado),
idCliente char(10),
constraint idCliente foreign key (idCliente)
references clientes(idCliente),
CodigoProducto char(12),
constraint CodigoProducto foreign key(CodigoProducto)
references productos(CodigoProducto)
);