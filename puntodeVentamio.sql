create database pointOfSale;
use pointOfSale;



create table employees (
    EmployeeID varchar(24) primary key,
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
    surname varchar(50) not null,
    address varchar(100),
    postalCode char(5),
    city varchar(50),
    phone char(12) not null,
    email varchar(50) not null
);

CREATE TABLE orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    orderNumber INT,
    date DATETIME,
    EmployeeID CHAR(10),
    CONSTRAINT fk_EmployeeID FOREIGN KEY (EmployeeID)
    REFERENCES employees(EmployeeID),
    CustomerID CHAR(10),
    CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID)
    REFERENCES customers(CustomerID)
);

-- Tabla de productos
CREATE TABLE products (
    ProductCode CHAR(12) PRIMARY KEY unique,
    nam VARCHAR(40) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    quantityAvailable INT NOT NULL
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


--  asdfasdf

insert into employees values
('s22120001',sha2('pass1',256),'Luis Manuel','Cardenas Ibarra','CAIL041104HMG','Maria Calderon #52','38880','Moroleon','445 139 6514','s22120001@alumnos.itsur.edu.mx'),
('s22120002',sha2('pass2',256),'Jovanny','Lobato Garcia','GALJ040404HUG','Delia #3','38980','Uriangato','445 455 5701','s22120002@alumnos.itsur.edu.mx'),
('s22120003',sha2('pass3',256),'Braulio Aaron','Solorio Morales','SOMB020816HPM','Av. Independencia #167','58500','Puruandiro','438 121 5420','s22120003@alumnos.itsur.edu.mx'),
('s22120004',sha2('pass4',256),'Yareli Yoselin','Gaona Ceja','GACY041002MUG','Magisterio #19','38983','Uriangato','445 143 3563','s22120004@alumnos.itsur.edu.mx');

delimiter |
-- store procedure para insertar customers aleatorios
create procedure insert_customers(i int)
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
	('Calle Falsa 123'),('Avenida Imaginaria 456'),('Camino Perdido 789'),('Plaza del Sol 101'),('Callejón Misterioso 202'),('Ruta Eterna 303'),
	('Sendero Azul 404'),('Calle Oculta 505'),('Avenida Dorada 606'),('Camino Verde 707'),('Pasaje Rojo 808'),('Sendero Viento 909'),
	('Avenida del Río 1001'),('Camino de Cristal 1102'),('Calle del Silencio 1203'),('Avenida Estrella 1304'),('Sendero del Alba 1405'),
	('Callejón del Trueno 1506'),('Plaza de la Luna 1607'),('Avenida Horizonte 1708'),('Calle Real 1809'),('Avenida Cristal 1901'),
    ('Sendero Azul 2002'),('Calle del Mar 2103'),('Camino Amarillo 2204'),('Pasaje Gris 2305'),('Calle Brisa 2406'),('Avenida del Faro 2507'),
	('Sendero del Sol 2608'),('Camino Oculto 2709'),('Calle Aurora 2801'),('Avenida del Norte 2902'),('Sendero Dorado 3003'),('Plaza del Encuentro 3104'),
	('Calle de la Paz 3205'),('Camino Oscuro 3306'),('Avenida del Tiempo 3407'),('Callejón del Eco 3508'),('Camino Verde 3609'),('Sendero Infinito 3701'),
	('Avenida de las Flores 3802'),('Calle del Trueno 3903'),('Ruta Solar 4004'),('Camino de Niebla 4105'),('Avenida del Sueño 4206'),('Calle del Destino 4307'),
	('Sendero Perdido 4408'),('Camino Lunar 4509'),('Plaza de los Suspiros 4601'),('Avenida Estrella Fugaz 4702');
    
    INSERT INTO listCitys (citys) VALUES
	('Ciudad Inventada'),('Pueblo Fantasía'),('Aldea Oculta'),('Ciudad Espejismo'),('Barrio Mágico'),('Villa Eterna'),('Zona Mística'),('Región Fantástica'),
	('Pueblo Brillante'),('Barrio Tranquilo'),('Zona Antares'),('Colonia Serena'),('Pueblo Laguna'),('Ciudad Prisma'),('Villa Callada'),('Pueblo Nebulosa'),
	('Aldea Amanecer'),('Barrio Relámpago'),('Ciudad de Noches'),('Pueblo Claro'),('Zona Imperial'),('Región Prisma'),('Colonia Cielo'),('Barrio Oceánico'),
	('Villa Dorada'),('Ciudad Neutra'),('Pueblo Aire'),('Ciudad Luz'),('Región Calor'),('Barrio Misterio'),('Aldea Polar'),('Pueblo Glaciar'),('Barrio Rico'),
	('Ciudad Reunión'),('Región Serena'),('Villa Noche'),('Pueblo Relativo'),('Ciudad Resonancia'),('Región Bosque'),('Barrio Horizonte'),('Ciudad Primavera'),
	('Pueblo Relámpago'),('Aldea Brillante'),('Región Misteriosa'),('Pueblo Ilusión'),('Villa Fortuna'),('Ciudad Laberinto'),('Barrio de la Noche'),('Pueblo Nostalgia'),
	('Región Constelación');
    
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
        randomAddress, 
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


-- store procedure para insertar ordenes aleatorias
create procedure insert_orders(num int)
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
delimiter ;

call insert_customers(50);
call insert_orders(3000);




insert into products values("768293841094","Coca-Cola3L",47.00,500);
insert into products values("779284102947","Sabritas",13.00,400);
