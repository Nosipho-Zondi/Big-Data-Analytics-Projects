create database InventoryDB;
use InventoryDB;

/*creating items table*/
use InventoryDB;
create table Items(ItemID int primary key,
ItemName varchar(20),
Category varchar(20),
Price int,
StockQuantity int);

/*inserting values to items table*/
use InventoryDB;
insert into Items values(001, 'Desk', 'Furniture', 300.00, 20) ;
insert into Items values(002, 'Chair', 'Furniture', 150.00, 50) ;
insert into Items values(003, 'Notebook', 'Stationery', 10.00, 100) ;
insert into Items values(004, 'Pen', 'Stationery', 2.00, 200) ;
insert into Items values(005, 'Monitor', 'Electronics', 250.00, 30) ;

/*creating customers table*/
use InventoryDB;
create table Customers(CustomerID int Primary Key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(60),
Phone varchar(20));

/*inserting values into customers table*/
use InventoryDB;
insert into Customers values(101, 'Mandla', 'Xaba', 'mandla.xaba@gmail.com ', '081-456-7890');
insert into Customers values(102, 'Mlondi', 'Nzama', 'mlondi.nzama@gmail.com', '073-567-8901');
insert into Customers values(103, 'Noluthando', 'Ncube', 'nolu.ncube@gmail.com', '068-678-9012');

/*creating orders table*/
use InventoryDB;
go
create table Orders(
OrderID int primary key,
CustomerID int,  
OrderDate date,
TotalAmount int,
foreign key (CustomerID) references Customers(CustomerID)
);

/*inserting values into orderstable*/
use InventoryDB;
insert into Orders values(001, 101, '2024-07-01', 600.00);
insert into Orders values(002, 102, '2024-07-02', 300.00);
insert into Orders values(003, 103, '2024-07-03', 150.00); 

/*creating order items table*/
use InventoryDB;
create table OrderItems(OrderItemID int primary key,
    OrderID int foreign key references Orders(OrderID),
    ItemID int foreign key references Items(ItemID),
    Quantity int,
    LineTotal int
);

/*inserting values into order items*/
Use InventoryDB;
insert into OrderItems  values(001, 001, 001, 2, 600.00);
insert into OrderItems  values(002, 001, 003, 5, 50.00);
insert into OrderItems  values(003, 002, 002, 2, 300.00);
insert into OrderItems  values(004, 003, 004, 10, 20.00);

use InventoryDB;
drop table if exists OrderItems;

/* Display All Orders  */
select * from Orders;

/*Update Items */
  use InventoryDB;
go
update Items
set Price = Price * 1.10  
where ItemID IN (
    select ItemID
    from Items
    where Category = 'Furniture'
);

/*Order Summary by Item */
use InventoryDB;
go

update Items
set Price = Price * 1.10 
where ItemID IN (
select ItemID
from Items
where Category = 'Furniture'
);


/* Best-Selling Item */
use InventoryDB;
go

create procedure GetBestSellingItem
as
begin
select top 1
I.ItemName,
SUM(StockQuantity * Price) as TotalSalesAmount
from OrderItems OI
join Items I on I.ItemID = I.ItemID
group by I.ItemID, I.ItemName
order by TotalSalesAmount desc;
end
go

/*Order Summary by Customer*/
use InventoryDB;
go

create procedure GetTotalSpentByCustomer
as
begin
select 
c.CustomerID,
c.FirstName,
SUM(o.TotalAmount) as TotalAmountSpent
from Customers c
join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.FirstName
order by TotalAmountSpent desc;
end
go

/*Customer with Highest Orders */
use InventoryDB;
go

create view TopCustomer
as
select top 1
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) as TotalAmount
from Customers c
join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.FirstName, c.LastName
order by TotalAmount desc;
go

select * from items
select * from customers
select * from orders
select * from orderitems
