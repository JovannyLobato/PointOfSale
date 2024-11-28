drop database pointofsale;
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

create procedure insert_orderDetails(i int)
begin
	declare j int;
	declare idOrder int;
	declare codeProducts char(12);
    declare precio decimal(6,2);
    
    while j<i do
    select orderid into idOrder from orders
    order by rand() limit 1;
    
    select productocode into codeProduct from products
    order by rand() limit 1;
    
    select price into precio from product
    order by rand() limit 1;
    
    insert into order_details(idOrder,productCode, quantity, price) values
		(idOrder,codeProduct,floor(1 + (rand()*30)),precio);
    end while;
end|

delimiter ;

call insert_customers(50);
call insert_orders(3000);
select * from orders;
