# Assigement 1 :-
-- Create Database  
create database Assigement_1;

-- Create Table
use Assigement_1; 
create table SalesPeople (
Snum  int(10) primary key,
Sname varchar(40) unique,
City varchar(50),
Comm int(10)
);

-- Insert Record 
insert into SalesPeople(Snum,Sname,City,Comm)
values(1001,"Peel", "London",12),
	 (1002,"Serres", "Sanjose",13),
     (1004, "Motika"," London",11),
     (1007," Rifkin"," Barcelona",15),
     (1003,"Axelrod","Newyork",10);

# Create table Customers 
use Assigement_1;
create table Customers (
Cnum int primary key, 
Cname varchar(30),
City varchar(50) Not null,
Snum int,
foreign key(Snum) references SalesPeople(Snum)
);
# Insert record 
insert into Customers(Cnum,Cname,City,Snum)
values(2001,"Hoffman","London",1001),
(2002,"Giovanni", "Rome",1003),
(2003,"Liu"," Sanjose", 1002),
(2004,"Grass","Berlin",1002),
(2006,"Clemens","London",1001),
(2008,"Cisneros"," Sanjose",1007),
(2007,"Pereira"," Rome",1004);

# Create Orders Table
 
create table Orders(
Onum int primary key ,
Amount decimal(8,2),
Order_date DATE,
Cnum int,
Snum int,
foreign key(Cnum) references Customers(Cnum),
foreign key(Snum) references SalesPeople(Snum)
);

# Insert Record in Orders 
insert into  Orders(Onum,Amount,Order_date,Cnum,Snum)
values(3001,18.69,'1990/10/03',2008,1007),
      (3003,767.19,'1990/10/03',2001,1001),
      (3002,1900.10,'1990/10/03', 2007,1004),
      (3005,5160.45,'1990/10/03', 2003,1002),
      (3006,1098.16,'1990/10/03', 2008,1007),
      (3009,1713.23 ,'1990/10/04', 2002 ,1003),
      (3007,75.75,'1990/10/04',2004,1002),
      (3008,4273.00,'1990/10/05',2006, 1001),
      (3010,1309.95,'1990/10/06',2004,1002),
      (3011,9891.88,'1990/10/06',2006,1001);
select * from orders;
select * from customers;
select * from SalesPeople;

# 1 statement:- Count the number of SalesPerson whose name begin with 'a/'A'
select Sname,count(*) as  Result from SalesPeople where Sname like"A%" or Sname like"a%"; 

# 2 statement :- Display all the SalesPerson whose orders worth is more than Rs 2000
select  Onum,Sname,Amount from SalesPeople inner join orders on SalesPeople.Snum=Orders.Snum where  
Amount > 2000.00 ;  

# 3 statement :- Count the no of sales person belonging to Newyork
select Snum,Sname,count(Sname) as total_row from SalesPeople where City="Newyork"; 

# 4 Statement :- Display the number of Salespeople Belonging to London and belonging to Paris
select * from SalesPeople where City='London' and City="Paris";

# 5 Statement :- Display 
select Sname,Order_date,count(Orders.snum) as no_of_orders from salespeople inner join orders on SalesPeople.Snum=Orders.Snum
group by Orders.Order_date,Orders.snum;

select * from orders;











