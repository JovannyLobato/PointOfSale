-- si ya tienen una base de datos pointodsale, recomiendo usar el drop
-- drop database pointofsale;
create database pointOfSale;
use pointOfSale;

create table employees (
    EmployeeID varchar(10) primary key,
    pass char(64) not null,
    nam varchar(50) not null,
    surname varchar(50),
    rfc char(13) unique,
    address varchar(100),
    postalCode char(5),
    city varchar(50),
    phone1 char(12) not null,
    email varchar(50) not null
);

create table customers (
    CustomerID char(10) primary key,
    nam varchar(50) not null,
    surname varchar(100) not null,
    address varchar(100),
    postalCode char(5),
    city varchar(50),
    phone char(12) not null,
    email varchar(50) not null
);

CREATE TABLE orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    date DATETIME,
    EmployeeID CHAR(10),
    CONSTRAINT fk_EmployeeID FOREIGN KEY (EmployeeID)
    REFERENCES employees(EmployeeID),
    CustomerID CHAR(10),
    CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID)
    REFERENCES customers(CustomerID)
);

-- bebidas, comida, fruta y verduras, cereales, lacteos, limpieza, higiene personal 
create table categories (
	categoryID int primary key auto_increment,
    categoriname varchar(50) not null,
    descript varchar(100)
);

-- Tabla de productos
CREATE TABLE products (
    ProductCode CHAR(12) PRIMARY KEY unique,
    categoryID int not null,
    nam VARCHAR(40) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    quantityAvailable INT NOT NULL,
    constraint fk_cateogoryID foreign key (categoryid)
    references categories(categoryid)
);

-- Tabla intermedia para detallar productos en cada orden
CREATE TABLE order_details (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductCode CHAR(12),
    quantity TINYINT NOT NULL,
    price DECIMAL(6,2) NOT NULL, -- Precio del producto en el momento de la orden
    total DECIMAL(6,2) AS (price * quantity) STORED, -- Total calculado
    CONSTRAINT fk_OrderID FOREIGN KEY (OrderID)
    REFERENCES orders(OrderID),
    CONSTRAINT fk_ProductCode FOREIGN KEY (ProductCode)
    REFERENCES products(ProductCode)
);

insert into employees values
('s22120001',sha2('pass1',256),'Luis Manuel','Cardenas Ibarra','CAIL041104HMG','Maria Calderon #52','38880','Moroleon','445 139 6514','s22120001@alumnos.itsur.edu.mx'),
('s22120002',sha2('pass2',256),'Jovanny','Lobato Garcia','GALJ040404HUG','Delia #3','38980','Uriangato','445 455 5701','s22120002@alumnos.itsur.edu.mx'),
('s22120003',sha2('pass3',256),'Braulio Aaron','Solorio Morales','SOMB020816HPM','Av. Independencia #167','58500','Puruandiro','438 121 5420','s22120003@alumnos.itsur.edu.mx'),
('s22120004',sha2('pass4',256),'Yareli Yoselin','Gaona Ceja','GACY041002MUG','Magisterio #19','38983','Uriangato','445 143 3563','s22120004@alumnos.itsur.edu.mx');


insert into categories (categoriname, descript) values
('Bebidas','Liquidos refrescantes'),
('Comida','Alimentos saludables'),
('Frutas y verduras','Para crecer grandes y fuertes'),
('Cereales','Granos y legumbres'),
('Lacteos','Derivados de la leche'),
('Limpieza','Ideal para la limpieza del hogar'),
('Higiene personal','Una buena higiene es una buena salud');

   
INSERT INTO products (productcode, categoryID, nam, price, quantityAvailable)
VALUES
-- Productos de categoría 1
('934815812361', 1, 'Jugo de mango BOING 500ml', 10.50, 3100),
('934815812362', 1, 'Agua de Limon Del Valle 500ml', 15.30, 1800),
('934815812363', 1, 'Fuze tea 600ml', 20.00, 1500),
('934815812364', 1, 'Jumex Frutzzo 1L', 25.75, 2500),
('934815812365', 1, 'Ciel Exprim Limón y Menta 1L', 30.40, 1200),
('934815812366', 1, 'Frutsu 200ml', 13.00, 2200),
('934815812367', 1, 'Coca-Cola 355ml', 17.00, 2000),
-- Productos de categoría 2
('934815822361', 2, 'Arroz Basmati 1kg', 45.25, 3000),
('934815822362', 2, 'Pechuga de pollo 650g', 78.60, 2800),
('934815822363', 2, 'Jamón de pechuga de pavo 275g', 53.45, 3200),
('934815822374', 2, 'Aceite de oliva 1L', 62.00, 2500),
('934816822375', 2, 'Costillas de cerdo 500g', 67.50, 1900),
('934816822376', 2, 'Filetes de pescado 450g', 56.75, 1800),
('934816822377', 2, 'Avena 1kg', 50.75, 2000),
-- Productos de categoría 3
('934816832371', 3, 'Manzana 1k', 50.10, 1999),
('934816832372', 3, 'Mango 1k', 30.30, 2600),
('934816832373', 3, 'Pimientos Morrones 1k', 60.00, 2100),
('934816832374', 3, 'Aguacate 1k', 65.20, 2000),
('934816832375', 3, 'Cereza 1k', 70.40, 1800),
('934816832376', 3, 'Lechuga 1k', 45.00, 3200),
('934816832377', 3, 'Tomate 1k', 52.00, 3000),
-- Productos de categoría 4
('934816842371', 4, 'Lentejas 1k', 30.50, 2250),
('934816842382', 4, 'Frijol 1k', 32.30, 1800),
('934817842383', 4, 'Garbanzo seco 1k', 26.20, 2300),
('934817842384', 4, 'Quinoa 750g', 40.00, 2000),
('934817842385', 4, 'Trigo', 45.30, 1500),
('934817842386', 4, 'Sorgo 1k', 38.75, 1200),
-- Productos de categoría 5
('934817852381', 5, 'Leche 1L', 27.00, 2000),
('934817852382', 5, 'Queso crema 220g', 38.60, 1400),
('934817852383', 5, 'Yogur griego natural 400 g', 60.20, 1500),
('934817852384', 5, 'Queso cotija 250g', 55.50, 1800),
('934817852385', 5, 'Yogurt Danone 450ml', 33.30, 1000),
('934817852396', 5, 'Leche evaporada 360ml', 40.00, 2500),
-- Productos de categoría 6
('934818862391', 6, 'Detergente en polvo Ariel 500g', 32.75, 3100),
('934818862392', 6, 'Limpiador multiusos Fabuloso 500ml', 28.20, 2250),
('934818862393', 6, 'Jabón liquido para trastes Dawn 750ml', 40.10, 1900),
('934818862394', 6, 'Cloro Clorox 1L', 35.30, 2400),
('934818862395', 6, 'Desengrasante Mr. Musculo 500g', 43.50, 2900),
('934818862396', 6, 'Fregona', 37.50, 3200),
-- Productos de categoría 7
('934818872391', 7, 'Enjuague bucal Listerine 600ml', 61.00, 5000),
('934818872392', 7, 'Desodorante en aerosol Nivea 150ml', 45.20, 2600),
('934818872393', 7, 'Jabon de banio (barra) Dove', 29.30, 3600),
('934818872394', 7, 'Shampoo Sedal 225ml', 20.50, 2000),
('934818872405', 7, 'Espuma de afeitar Gillette 250ml', 70.75, 1789),
('934818872406', 7, 'Pasta de dientes Colgate', 52.75, 1800);

   
delimiter |

create procedure insert_random_customers(i int)
begin
	declare j int default 0;
    declare randomName varchar(50);
    declare randomLastName1 varchar(50);
    declare randomLastName2 varchar(50);
    declare finalLastname varchar(50);
    declare randomAddress varchar(100);
    declare randomCity varchar(50);
    declare idcustomer int default 10;
    
    create temporary table listNames(
    `names` varchar (50)
    );
    
    create temporary table listLastNames(
    lastNames varchar (100)
    );
    
    create temporary table listAddress(
    address varchar(100)
    );
    
    create temporary table listCitys(
    citys varchar(50)
    );
    
    insert into listNames values
    ('Juan'), ('Andres'), ('Maria'), ('Carla'),('José'), ('Alfredo'),('Milagros'),('Lupita'),
    ('Manuel Sebastian'),('Luis Martin'),('Maria Guadalupe'),('Leah Fernanda'),('Elliot Samuel'),('Clinton Alejandro'),('Valeria Sofia'),('Ana Isabella'),
    ('Mateo'), ('Daniel'), ('Camila'), ('Martina'),('Nicolas'), ('Lucas'),('Gabriela'),('Mariana'),
    ('Diego Santiago'), ('Javier Andrés'), ('Fernanda Emilia'), ('Paula Elena'),('Rodrigo Adrian'), ('Oscar Rafael'),('Claudia Lorena'),('Natalia Laura');
    
    insert into listLastNames values
    ('Cardenas'), ('Zavala'), ('Martinez'), ('Hernandez'),('Perez'), ('Sanchez'),('Lara'),('Torres'),
    ('Castillo'),('Cruz'),('Silva'),('Lopez'),('Amezcua'),('Gutierrez'), ('Guzman'),('Quintana'),('Rojas'),
    ('Garcia'), ('Rodriguez'), ('Escobar'),('Fernandez'),('Ramirez'), ('Flores'),('Diaz'),('Morales'),
    ('Salinas'),('Jimenez'),('Castro'),('Varas'),('Mendoza'),('Ortiz'), ('Navarro'),('Montes'),('Peredes');
    
   INSERT INTO listAddress (address) VALUES
	('Hidalgo'),('Av. Morelos'),('Matamoros'),('Emiliano Zapata'),('Pípila'),('Guadalupe Victoria'),('Juarez'),('Reforma'),
    ('Madero'),('Zaragoza'),('5 de Mayo'),('20 de Noviembre'), ('Independencia'), ('Morelos'),('Allende'),('Benito Juarez'),
    ('Carranza'), ('Guerrero'),('Iturbide'),('Libertad'),('Victoria'),('Revolucion'), ('Insurgentes'),('Francisco Villa'),
    ('Constitucion'),('Pino Suarez'),('Niños Heroes'),('Alvaro Obregon'), ('Lazaro Cardenas'),('Cortes'),('Colon'), ('Primavera'),
    ('Venustiano Carranza'),('Francisco I. Madero'), ('Progreso'),('Angel Flores'),('16 de Septiembre'),('Primero de Mayo'),
    ('Lerdo de Tejada'),('Miguel Aleman'), ('Constituyentes'),('Bosques'),('America'),('Manuel Avila Camacho'),('Pnacho Villa'),
    ('Jose Maria Morelos y Pavon'),	('Porfirio Diaz'),('Universidad'),('Arboledas'),('Ejercito Nacional'),('La Paz');
    
    INSERT INTO listCitys (citys) VALUES
	('Ciudad de Mexico'),('Toluca'),('Puebla'),('Cuernavaca'),('Querataro'),('San Luis Potosi'),('Leon'),('Guanajuato'), ('Morelia'),('Aguas Calientes'),('Zacatecas'),
    ('Monterrey'),('Saltillo'),('Torreon'),('Durango'),('Chihuahua'), ('Ciudad Juarez'),('Tijuana'),('Mexicali'),('Ensenada'),('Hemosillo'),('Nogales'),('Zapopan'),
    ('Puerto Vallarta'), ('Colima'),('Manzanillo'),('Cancun'),('Playa del Carmen'),('Tulum'),('Merida'),('Campeche'),('Chetumal'),('Oaxaca de Juarez'), ('Puerto Escondido'),
    ('Tuxtla Gutierrez'),('San Cristobal Colon'),('Veracruz'),('Xalapa'),('Coatzacoalcos'),('Nuevo Laredo'),('Reynosa'),('Matamoros'),('Tequila'),('Guadalajara'),('Patzcuaro'),
    ('Valle de Bravo'),('San Miguel de Allende'),('Taxco');
    
    while j<i do
		select `names` into randomName from listNames
        order by rand() limit 1;
        
        select lastNames into randomLastName1 from listLastNames
        order by rand() limit 1;
        
        select lastNames into randomLastName2 from listLastNames
        order by rand() limit 1;
        
        select address into randomAddress from listAddress
        order by rand() limit 1;
        
        select citys into randomCity from listCitys
        order by rand() limit 1;
        
        INSERT INTO customers (CustomerID, nam, surname, address, postalCode, city, phone, email)VALUES 
		(concat('CU2473',idcustomer),
        randomName, 
        concat(randomLastName1,' ',randomLastName2),
        concat(randomAddress,floor(1 + (rand()*300))), 
        floor(10000 + (rand()*90000)), 
        randomCity, 
        concat(floor(400 + (rand()*600)),' ',floor(100 + (rand()*800)),' ',floor(1000 + (rand()*8000))), 
        concat('cu2473',floor(1 + (rand()*30)),'@gmail.com'));
        set j=j+1;
        set idcustomer=idcustomer+1;
    end while;
    
    drop temporary table listNames;
    drop temporary table listLastNames;
    drop temporary table listAddress;
    drop temporary table listCitys;
end|

create procedure insert_random_orders(num int)
begin
	declare i int default 0;
    
    while i<num DO
		insert into orders (date,employeeid,customerid)values(
		concat('2024-',floor(1 + (rand()*12)),'-',floor(1 + (rand()*28))),
		concat('s2212000',floor(1 + (rand()*4))),
		concat('CU2473',floor(10 + (rand()*50))));
        set i=i+1;
    end while;
end|

create procedure insert_random_orderDetails(i int)
begin
	declare j int default 0;
	declare idOrder int;
	declare codeProduct char(12);
    declare precio decimal(6,2);
    
    while j<i do
    select orderid into idOrder from orders
    order by rand() limit 1;
    
    select productcode into codeProduct from products
    order by rand() limit 1;
    
    select price into precio from products where codeProduct=productCode;
    
    insert into order_details(orderId,productCode, quantity, price) values
		(idOrder,codeProduct,floor(1 + (rand()*30)),precio);
	set j=j+1;
    end while;
end|

delimiter ;

call insert_random_customers(50);
call insert_random_orders(300);
call insert_random_orderDetails(5000);

create view SalesReport_Junuary as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-01-01' and '2024-01-31'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_February as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-02-01' and '2024-02-29'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_March as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-03-01' and '2024-03-31'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_April as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-04-01' and '2024-04-30'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_May as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-05-01' and '2024-05-31'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_June as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-06-01' and '2024-06-30'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_July as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-07-01' and '2024-07-31'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_August as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-08-01' and '2024-08-31'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_September as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-09-01' and '2024-09-30'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_October as
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-10-01' and '2024-10-31'
group by od.orderid order by od.orderid asc, o.date asc; 


create view SalesReport_November as 
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-11-01' and '2024-11-30'
group by od.orderid order by od.orderid asc, o.date asc; 

create view SalesReport_December as 
select od.orderid as `num.Orden`, o.date as Fecha, c.nam as Cliente, e.nam as Empleado, count(od.total) as Total, count(od.orderid) as `cant.Detalles` from
order_details od join orders o on o.orderid=od.orderid join customers c on c.customerid=o.customerid
join employees e on e.employeeid = o.employeeid where o.date between '2024-12-01' and '2024-12-31'
group by od.orderid order by od.orderid asc, o.date asc; 

select * from SalesReport_December;
