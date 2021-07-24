Create database Bagit;
use Bagit;

Create table Suppliers(
supplier_id int not null auto_increment,
supplier_name varchar(60),
telephone varchar(60),
product_name varchar(60),
primary key(supplier_id)
);


Create table Products(
product_id int not null auto_increment,
product_name varchar(50),
product_avl int,
product_sld int,
supplier_id int,
barcode_id int,
primary key(product_id, barcode_id),
foreign key (supplier_id) references Suppliers(supplier_id)
);

Create table ProductSupplier(
product_id int not null,
supplier_id int not null,
foreign key (product_id) references Products(product_id),
foreign key (supplier_id) references Suppliers(supplier_id)
);

Create table Category(
category_id int not null auto_increment,
category_name varchar(50),
product_id int,
primary key(category_id),
foreign key (product_id) references Products(product_id)
);




Create table Warehouse(
warehouse_id int not null auto_increment,
supplier_id int,
product_id int,
product_avl int,
product_sld int,
period_sld date,
primary key(warehouse_id),
foreign key (supplier_id) references Suppliers(supplier_id),
foreign key (product_id) references Products(product_id)
);

Create table Employee(
employee_id int not null,
employee_name varchar(60),
telephone varchar(60),
DOB date,
SSN int,
email varchar(60),
primary key(employee_id)
);

Create table Orders(
order_id int not null auto_increment,
warehouse_id int not null,
price decimal,
date date,
time time,
primary key(order_id),
foreign key (warehouse_id) references Warehouse(warehouse_id)
);


Create table Details(
order_id int not null,
detail_id int not null auto_increment,
product_id int,
quantity int,
total_price double,
delivery_id int not null,
primary key(detail_id, delivery_id),
foreign key (order_id) references Orders(order_id),
foreign key (product_id) references Products(product_id)
);

Create table DetailOrder(
order_id  int not null,
detail_id int not null,
delivery_id int not null,
foreign key (order_id) references Orders(order_id),
FOREIGN KEY (detail_id, delivery_id) REFERENCES Details(detail_id, delivery_id)
);


Create table Customer(
customer_id int not null auto_increment,
customer_name varchar(60),
telephone varchar(60),
primary key(customer_id)
);



Create table Payment(
payment_id int not null auto_increment,
customer_id int,
payment_price decimal(6,2),
payment_mode enum("cash","MoMo","Card"),
payment_date date,
primary key(payment_id),
foreign key (customer_id) references Customer(customer_id)
);



Create table SalesRep(
employee_id int,
SalesRep_salary decimal not null,
foreign key (employee_id) references Employee(employee_id)
);



Create table Manager(
employee_id int,
manager_bonus decimal,
foreign key (employee_id) references Employee(employee_id)
);



Create table WarehouseManager(
employee_id int,
WarehouseManager_allowances decimal not null,
foreign key (employee_id) references Employee(employee_id)
);


INSERT INTO Suppliers(supplier_name,telephone,product_name) VALUES ("Adinkra", "0233746321","Ideal Milk");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Jane Veggies", "0234857321","Lettuce");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Bread Boutique", "0236946321","Brown bread");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("FanMilk", "024359821","Vanilla Ice cream");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Kirkland", "0278758921","500ml bottled water");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Gye Nyame Wholesale Eggs", "0248758921","Crates of eggs");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Blueskies", "0552467659","500ml bottled orange fruit juice");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Kawa Moca", "0203684527","1.5kg Coffee bags");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Accra Brewries", "0203671058","750ml Club beer");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("BeePers", "0201472865","1.5l bottled honey");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Aba's wholesale soaps", "0273579518","Propa liquid soap");
INSERT INTO Suppliers(supplier_name,telephone,product_name)  VALUES ("Listowell's supplies", "0243526431","0.5kg sugar");


INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("Ideal Milk",23,50,1,21);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("Lettuce",11,21,2,22);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("Brown bread",5,10,3,25);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("Vanilla Ice cream",2,12,4,28);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("500ml bottled water",100,112,5,26);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("Crates of eggs",55,67,6,27);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("500ml bottled orange fruit juice",10,108,7,29);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("1.5kg Coffee bags",21,36,8,30);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("750ml Club beer",150,211,9,32);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("1.5l bottled honey",150,154,10,31);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("Propa liquid soap",160,190,11,33);
INSERT INTO Products(product_name,product_avl,product_sld,supplier_id,barcode_id) VALUES ("0.5kg sugar",15,110,12,35);

INSERT INTO Category(category_name,product_id)  VALUES ("Dairy",1);
INSERT INTO Category(category_name,product_id)  VALUES ("Vegetable",2);
INSERT INTO Category(category_name,product_id)  VALUES ("Bread",3);
INSERT INTO Category(category_name,product_id)  VALUES ("Dairy",4);
INSERT INTO Category(category_name,product_id)  VALUES ("Water",5);
INSERT INTO Category(category_name,product_id)  VALUES ("Dairy",6);
INSERT INTO Category(category_name,product_id)  VALUES ("Beverage",7);
INSERT INTO Category(category_name,product_id)  VALUES ("Beverage",8);
INSERT INTO Category(category_name,product_id)  VALUES ("Beverage",9);
INSERT INTO Category(category_name,product_id)  VALUES ("Sweetener",10);
INSERT INTO Category(category_name,product_id)  VALUES ("Cleaning supplies",11);
INSERT INTO Category(category_name,product_id)  VALUES ("Sweetener",12);

INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (1,1,23,50,"2021-05-13");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (2,2,11,21,"2020-03-09");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (3,3,5,10,"2021-10-01");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (4,4,2,12,"2020-03-14");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (5,5,100,112,"2020-07-08");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (6,6,55,67,"2020-06-15");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (7,7,10,108,"2020-08-25");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (8,8,21,36,"2020-12-04");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (9,9,150,211,"2020-10-18");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (10,10,150,154,"2020-07-30");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (11,11,160,190,"2020-02-19");
INSERT INTO Warehouse(supplier_id,product_id,product_avl,product_sld,period_sld) VALUES (12,12,15,110,"2020-11-09");


INSERT INTO Orders(warehouse_id,price,date,time) VALUES (1,5.00,"2021-04-13","12:04:56");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (2,4.00,"2020-04-11","08:05:46");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (3,8.00,"2020-04-1","13:15:36");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (4,10.00,"2020-03-21","09:00:06");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (5,3.00,"2020-03-15","15:34:34");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (6,20.00,"2020-04-26","12:45:37");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (7,9.00,"2020-06-24","09:30:48");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (8,28.00,"2020-05-19","13:47:36");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (9,18.00,"2020-11-25","15:15:49");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (10,15.00,"2020-08-19","11:06:01");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (11,12.00,"2020-02-11","10:09:08");
INSERT INTO Orders(warehouse_id,price,date,time) VALUES (12,18.00,"2020-01-15","16:00:09");


INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (001,"Kofi Aboagye", 0278374698,"1991-07-19",2345,"kofia@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (002,"Ellis Koomson", 0244474698,"1998-05-23",2455,"ellisk@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (003,"Daphne Hilary", 0278587698,"1999-12-17",2675,"daphil@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (011,"Seth Ntim", 0265834692,"1999-11-19",3345,"setim@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (005,"Liane Jane", 0278375649,"2000-06-13",2349,"janeli@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (006,"Estella Attoh", 0278375649,"1998-05-06",2349,"ella@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (007,"Daniel Obeng", 0554897185,"1983-07-19",2349,"danny@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (008,"Vanessa Dankyi", 0276847845,"1993-10-15",2349,"vanny@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (009,"Jack Appiah", 0202497685,"1987-02-20",2349,"jack@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (010,"Tina Adjei", 0276974857,"1992-01-30",2349,"tina@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (013,"Aba Forson", 0269741875,"1995-11-11",2349,"aba@gmail.com");
INSERT INTO Employee(employee_id,employee_name,telephone,DOB,SSN,email) VALUES (012,"Robyn Williams", 0248795845,"1997-12-13",2349,"robyn@gmail.com");

INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (1,1,300,1000.00,10);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (2,2,250,1450.00,11);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (3,3,360,1300.80,12);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (4,4,140,670.00,13);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (5,5,120,980.50,14);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (6,6,450,1500.00,15);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (7,7,120,800.00,16);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (8,8,150,500.00,17);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (9,9,360,1200.00,18);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (10,10,720,2000.00,19);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (11,11,100,200.00,20);
INSERT INTO Details(order_id,product_id,quantity,total_price,delivery_id) VALUES (12,12,180,400.00,21);


INSERT INTO Customer(customer_name,telephone) VALUES ("Kwame Ato",0554327586);
INSERT INTO Customer(customer_name,telephone) VALUES ("Lizbeth Cole",0574827586);
INSERT INTO Customer(customer_name,telephone) VALUES ("Mary Otchere",0248576586);
INSERT INTO Customer(customer_name,telephone) VALUES ("Yaw Kross",0244327586);
INSERT INTO Customer(customer_name,telephone) VALUES ("Delilah Jones",0234757586);
INSERT INTO Customer(customer_name,telephone) VALUES ("Emmanuel Asare",0268715879);
INSERT INTO Customer(customer_name,telephone) VALUES ("Sam John",0278157515);
INSERT INTO Customer(customer_name,telephone) VALUES ("Vera Akwei",0559748328);
INSERT INTO Customer(customer_name,telephone) VALUES ("John Kennedy",023982785);
INSERT INTO Customer(customer_name,telephone) VALUES ("Eyram Adjovi",0279823579);
INSERT INTO Customer(customer_name,telephone) VALUES ("Nii Amon Atukweifio",0268794125);
INSERT INTO Customer(customer_name,telephone) VALUES ("Erica Sackey",0279842578);

INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (1,7.00,"Cash","2020-04-14");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (2,4.00,"MoMo","2020-04-20");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (3,8.00,"Cash","2020-04-14");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (4,20.00,"Card","2020-04-15");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (5,9.00,"Cash","2020-04-11");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (6,19.00,"Cash","2020-05-19");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (7,25.00,"Momo","2020-08-12");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (8,18.00,"Momo","2020-09-13");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (9,12.00,"Momo","2020-03-21");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (10,5.00,"Cash","2020-01-31");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (11,97.00,"Cash","2020-02-15");
INSERT INTO Payment(customer_id,payment_price,payment_mode,payment_date) VALUES (12,150.00,"Card","2020-10-24");

INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (001,1450.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (002,1250.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (003,2000.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (011,1300.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (005,2500.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (006,1500.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (007,2100.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (008,1600.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (009,2500.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (010,2200.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (013,1750.00);
INSERT INTO SalesRep(employee_id,SalesRep_salary) VALUES (012,1200.00);

INSERT INTO Manager(employee_id,manager_bonus) VALUES (005,500.00);
INSERT INTO Manager(employee_id,manager_bonus) VALUES (002,400.00);
INSERT INTO Manager(employee_id,manager_bonus) VALUES (007,200.00);
INSERT INTO Manager(employee_id,manager_bonus) VALUES (003,300.00);
INSERT INTO Manager(employee_id,manager_bonus) VALUES (009,500.00);


INSERT INTO WarehouseManager(employee_id,WarehouseManager_allowances) VALUES (011,200.00);
INSERT INTO WarehouseManager(employee_id,WarehouseManager_allowances) VALUES (001,150.00);



USE bagit;
 SELECT Products.barcode_id, Products.product_name, Products.product_id, Category.category_id
 FROM Products
 INNER JOIN Category ON Products.product_id = Category.product_id;
 
 SELECT Products.product_name,Category.category_name, Category.category_id
 FROM Products
 INNER JOIN Category ON Products.product_id = Category.product_id
 GROUP BY product_name;

Select SUM(product_avl), AVG(product_sld)
FROM Warehouse
Where period_sld like '%03%';

SELECT Suppliers.supplier_name, COUNT(Products.product_id) AS NumberOfProducts FROM Products
RIGHT JOIN Suppliers ON Products.supplier_id = Suppliers.supplier_id
GROUP BY supplier_name;

SELECT Details.delivery_id,Products.product_name, Details.product_id, Details.quantity,Details.total_price
FROM Details
LEFT JOIN Products ON Products.product_id = details.product_id
WHERE delivery_id > 0;

SELECT Orders.warehouse_id,Orders.date, Orders.time,Details.quantity, Details.total_price, Details.delivery_id
FROM   Details,Orders
WHERE  Orders.date IN
   (SELECT Orders.date
   FROM Orders
   WHERE date like '%2021%');