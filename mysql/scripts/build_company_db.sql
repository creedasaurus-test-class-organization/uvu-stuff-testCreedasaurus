CREATE DATABASE Company;

USE Company;

/**
Create Customers
**/
CREATE TABLE Customers (
    cust_id CHAR(10) PRIMARY KEY,
    cust_name CHAR(50),
    cust_address CHAR(50),
    cust_city CHAR(50),
    cust_state CHAR(5),
    cust_zip CHAR(10),
    cust_country CHAR(50),
    cust_contact CHAR(50),
    cust_email CHAR(255)
);

/**
Insert Customers
**/
INSERT Customers
VALUES 
('1000000001', 'Village Toys', '200 Maple Lane', 'Detroit','MI','44444','USA','John Smith','sales@villagetoys.com'),
('1000000002', 'Kids Place', '333 South Lake Drive', 'Columbus', 'OH', '43333', 'USA', 'Michelle Green', NULL),
('1000000003', 'Fun4All', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'jjones@fun4all.com'),
('1000000004','Fun4All','829 Riverside Drive','Phoenix','AZ','88888','USA','Denise L. Stephens','dstephens@fun4all.com'),
('1000000005', 'The Toy Store', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'Kim Howard', NULL);

/**
Create Vendors
**/
CREATE TABLE Vendors (
    vend_id CHAR(10) PRIMARY KEY,
    vend_name CHAR(50),
    vend_address CHAR(50),
    vend_city CHAR(50),
    vend_state CHAR(5),
    vend_zip CHAR(10),
    vend_country CHAR(50)
);

/**
Insert Vendors
**/
INSERT Vendors
VALUES ('BRS01', 'Bears R Us', '123 Main Street', 'Bear Town', 'MI', '44444', 'USA'),
       ('BRE02', 'Bear Emporium', '500 Park Street', 'Anytown', 'OH', '44333', 'USA'),
       ('DLL01', 'Doll House Inc.', '555 High Street', 'Dollsville', 'CA', '99999', 'USA'),
       ('FRB01', 'Furball Inc.', '1000 5th Avenue', 'New York', 'NY', '11111', 'USA'),
       ('FNG01', 'Fun and Games', '42 Galaxy Road', 'London', NULL, 'N16 6PS', 'England'),
       ('JTS01', 'Jouets et ours', '1 Rue Amusement', 'Paris', NULL, '45678', 'France');

/**
Create Customers
**/
CREATE TABLE Orders (
    order_num INT PRIMARY KEY,
    order_date DATETIME,
    cust_id CHAR(10)
);

INSERT Orders
VALUES (20005, '2012-05-01', '1000000001'),
       (20006, '2012-01-12', '1000000003'),
       (20007, '2012-01-30', '1000000004'),
       (20008, '2012-02-03', '1000000005'),
       (20009, '2012-02-08', '1000000001');
CREATE TABLE Products (
    prod_id CHAR(10) PRIMARY KEY,
    vend_id CHAR(10),
    prod_name CHAR(255),
    prod_price DECIMAL(8 , 2 ),
    prod_desc TEXT
);

INSERT Products
VALUES ('BR01', 'BRS01', '8 inch teddy bear', 5.99, '8 inch teddy bear, comes with cap and jacket'),
       ('BR02', 'BRS01', '12 inch teddy bear', 8.99, '12 inch teddy bear, comes with cap and jacket'),
       ('BR03', 'BRS01', '18 inch teddy bear', 11.99, '18 inch teddy bear, comes with cap and jacket'),
       ('BNBG01',
        'DLL01',
        'Fish bean bag toy',
        3.49,
        'Fish bean bag toy, complete with bean bag worms with which to feed it'),
       ('BNBG02', 'DLL01', 'Bird bean bag toy', 3.49, 'Bird bean bag toy, eggs are not included'),
       ('BNBG03', 'DLL01', 'Rabbit bean bag toy', 3.49, 'Rabbit bean bag toy, comes with bean bag carrots'),
       ('RGAN01', 'DLL01', 'Raggedy Ann', 4.99, '18 inch Raggedy Ann doll'),
       ('RYL01', 'FNG01', 'King doll', 9.49, '12 inch king doll with royal garments and crown'),
       ('RYL02', 'FNG01', 'Queen doll', 9.49, '12 inch queen doll with royal garments and crown');

CREATE TABLE OrderItems (
    order_num INT,
    order_item INT,
    prod_id CHAR(10),
    quantity INT,
    item_price DECIMAL(8 , 2 )
);
ALTER TABLE OrderItems
  ADD PRIMARY KEY (order_num, order_item);
INSERT OrderItems
VALUES (20005, 1, 'BR01', 100, 5.49),
       (20005, 2, 'BR03', 100, 10.99),
       (20006, 1, 'BR01', 20, 5.99),
       (20006, 2, 'BR02', 10, 8.99),
       (20006, 3, 'BR03', 10, 11.99),
       (20007, 1, 'BR03', 50, 11.49),
       (20007, 2, 'BNBG01', 100, 2.99),
       (20007, 3, 'BNBG02', 100, 2.99),
       (20007, 4, 'BNBG03', 100, 2.99),
       (20007, 5, 'RGAN01', 50, 4.49),
       (20008, 1, 'RGAN01', 5, 4.99),
       (20008, 2, 'BR03', 5, 11.99),
       (20008, 3, 'BNBG01', 10, 3.49),
       (20008, 4, 'BNBG02', 10, 3.49),
       (20008, 5, 'BNBG03', 10, 3.49),
       (20009, 1, 'BNBG01', 250, 2.49),
       (20009, 2, 'BNBG02', 250, 2.49),
       (20009, 3, 'BNBG03', 250, 2.49);