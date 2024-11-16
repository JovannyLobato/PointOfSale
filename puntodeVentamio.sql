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



INSERT INTO employees VALUES (
    'jovanny',                 -- EmployeeID
    sha2('1234', 256),         -- password
    'Jovanny',                 -- name
    'Lobato',                  -- surname
    'LOGJ040404H5',            -- rfc
    '123 Fake Street',         -- address
    '12345',                   -- postalCode
    'Mexico City',             -- city
    '5551234567',              -- phone1
    'jovannylobato2004@gmail.com' -- email
);

INSERT INTO employees VALUES (
    'lupita',                  -- EmployeeID
    sha2('4321', 256),         -- password
    'Guadalupe Elizabeth',     -- name
    'Camarena',                -- surname
    'CAMCG040404H5',           -- rfc
    'Another fake street',     -- address
    '38980',                   -- postalCode
    'Cuitzeo',                 -- city
    '4451591620',              -- phone1
    'lupita@gmail.com'         -- email
);




insert into products values("768293841094","Coca-Cola3L",47.00,500);
insert into products values("779284102947","Sabritas",13.00,400);



Alter table products
change column name nam varchar(40) not null;
describe products;



SET SQL_SAFE_UPDATES = 0;
DELETE FROM products;
SET SQL_SAFE_UPDATES = 1;


use pointOfSale;
select * from products;
-- ESTO NO LO EJECUTES
drop database pointOfSale;
use pointOfSale;
select * from employees;
delete from employees where employeeId='jovanny';
delete from employees where employeeId = 'lupita';
describe empleados;
select * from empleados where idEmpleado = 'lupita' and pass=sha2('4321',256);	