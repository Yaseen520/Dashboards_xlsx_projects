   # 10-03-25(Day 1) 
/*Important 
1  Save the File in .SQL
2  Each Statement end with ;
3  My SQL is not Case sensitive
4  Single Line Comment # --
5  Multiple Line Comments /* --------------*/

/*Data Types
1 String  Char Varchar
2 Numeric Small ,Medium ,Large ,Float, Double 
3 Date YYYY-MM-DD
Date Time YYYY-MM-DD HH:MM:SS
Timestamp YYYY-MM-DD HH:MM:SS */

   # 11-03-25(Day 2)
  /*  SQL Commands can be majorly classified in five categories.

1. DDL (Data Definition Language)-Create ,Alter,Drop,Truncate

2. DML (Data Manipulation Language) Insert Delete update

3. TCL (Transaction Control Language)Commit ,Rollback ,Save point 

4. DCL (Data Control Language)  Grant Revoke 

5. DQL (Data Query Language) Select  */  
/* 1 Create Database 10Marchsqlbatch Create table Employee with EmpID int,
EmpName varchar(30),Salary int,DOJ Date
2 Insert 5 records in Employee Table 
3 Show the Employee Table */
# Data -Rows Column-Table-Databases-Schema
Create database  10MarchSQLBatch;
use 10MarchSQLBatch;# or Double Click Databases
Create Table Employee(
EmpID int,
EmpName varchar(30),
Salary int,
DOJ Date);#yyyy-mm-dd
# Insert 5 records
insert into Employee
values(1,"Surya",10000,'2025-03-10'),
      (2,"Saurabh",20000,'2025-02-10'),
      (3,"Vishnu",30000,'2025-01-11'),
      (4,"Himanshi",40000,'2025-08-16'),
      (5,"Waseem",50000,'2025-03-13');
# Show Record
Select * from Employee;    
  
                 #12-03-25(Day3)
#drop database 10marchsqlbatch;
 /* 1 Update Empid 1 to 6  
    2 Delete EmpID 5 from Employee Table
    3 Truncate table Employee
    4 Drop table Employee*/
   # Set SQL_Safe_updates=0 To update data in any Table 
update  employee
set Empid=6 
where Empid=1;
Select * from Employee;
delete from employee 
where EmpID=5;
truncate Table Employee;# Delete all records
drop table Employee; # Delete entire Table 
# drop Add Rename Modify(Change Datatype)- Alter Table 
/* 1 Create Table Customer with customerID as Int,CustomerName varchar,Gender  Varchar,City Varchar
   2 Insert 5 records into customer Table 
   3 Show the Result
   4 update 1st customer to 6 
   5 delete 6th Customer
   6 add Country Column
   7 drop country column
   8 rename customerID to Cid
   9 Change data type of cid to varchar(10)
   10 Truncate tableCustomer
   11 Drop table customer 
    */
 Create table customer(
  customerid int,
  customername varchar(50),
  gender varchar(10),
  city varchar(50)); 
  insert into customer
  values (1,"A","F","Delhi"),
		(2,"B","M","Mumbai"),
        (3,"C","F","Pune"),
        (4,"D","M","Hydrabad"),
        (5,"E","M","Bangalore");
Select * from customer;
update  customer
set customerid=6
where customerid=1;	
delete from customer 
where customerid=6;          
Alter table customer 
add column country varchar(10);    
Alter table customer
drop column country;    
Alter table customer    
rename column customerid to cid;
Alter table customer
rename Column customername to name;
Alter table customer
modify Column  cid varchar(50);   
Alter table customer
modify Column  cid int;  
describe customer; 
describe Employee;# Detail information of datatype describe Tablename
#drop table employee;   
truncate table customer;
drop table customer;    
Select * from customer; 
 Describe customer;# Show data types  
 /*
1 Create table hotel with 
hotelID int ,
Name varchar(50) 
Roomprice int
City varchar(50)
Country varchar(20) 
2 insert  5 records
3 Show result
4 update Roomprice for hotalid 1 to 10000
5 delete 3 record
6 drop column Country
7 add column rating varchar(5) 
8 mofify roomprice to float(7,2)
9Rename roomprice toprice
10 truncate table
11 drop table 
*/  
create table hotel(
hotelID int ,
Name varchar(50) ,
Roomprice int ,
City varchar(20),
Country varchar(20) );
insert into hotel
values (1,"Holidayinn",6000,"Delhi","India","****"),
	(2,"IBIS",8000,"Mumbai","India","***"),
    (3,"Grand",7000,"Pune","India","**"),
    (4,"Taj",9000,"Pune","India","***"),
    (5,"Sayaji",10000,"Pune","India","*****")
    ;
select * from hotel;
update  hotel
set roomprice=10000
where hotelid=1;
delete from  hotel
where hotelid=3;
Alter table hotel
drop Column country;
Alter table hotel
add Column rating varchar(5);
describe hotel;
Alter table hotel
modify roomprice float(7,2);# Float(no of Char,after decimal)
Alter table hotel
rename column hotelid to id ;
truncate table hotel;
drop table hotel;
select * from hotel;
drop table if exists hotel;
/*
1 Create table hotel with 
hotelID int primarykey,
Name varchar(50) not null 
Roomprice int check(Roomprice>5000)
City Enum("Pune","Mumbai")
Country varchar(20) default ("India")
2 insert  3 records
3 Show result
4 update Roomprice for hotalid 1 to 10000
5 delete 3 record
6 drop column Country
7 add column rating varchar(5) default"*****"
8 mofify roomprice to float(7,2)
9Rename roomprice toprice
10 truncate table
11 drop table 
*/   
Create table hotel( 
hotelID int primary key auto_increment,
Name varchar(50) not null,
Roomprice int check(Roomprice>5000),
City Enum("Pune","Mumbai"),
Country varchar(20) default ("India")); 
insert into hotel(Name,Roomprice,City)
values("Taj",20000,"Mumbai"),
      ("IBIS",8000,"Pune"),
      ("Sayaji",9000,"Mumbai");# Valid Entry
Select * from Hotel;
insert into hotel(HotelID,Name,Roomprice,City)
values(1,"Taj",20000,"Mumbai");  # Not Valid Duplicate 
insert into hotel(Name,Roomprice,City)
values("Taj",20000,"Bangalore");# not valid Enum
insert into hotel(Name,Roomprice,City)
values("Taj",200,"Mumbai");# Not Valid Check 
insert into hotel(HotelID,Name,Roomprice,City)
values("NUll","Taj",20000,"Mumbai"); # Not Null 
update  hotel
set roomprice=10000
where hotelid=1;
delete from  hotel
where hotelid=3;
Alter table hotel
drop Column country;
Alter table hotel
add Column rating varchar(5);
describe hotel;
Alter table hotel
modify roomprice float(7,2);# Float(no of Char,after decimal)
Alter table hotel
rename column hotelid to id ;
truncate table hotel;
drop table hotel;
Select HotelID,Name from Hotel;

#HW
/*1 Create table student with 
sid as int primary key
sname as varchar(20) not null 
age int check(age>18)
gender enum("M","F"),
city varchar(50) default "Pune"
2 insert 3 records into student
3 Show result with all constraints with invalid entry*/ 
create table student(
sid int primary  key,
sname varchar(20) not null,
age int check(age>18),
gender enum("M","F"),
city varchar(50) default "Pune");
insert into student 
values(101,"Ajay",20,"M","Mumbai"),
	  (102,"Sonam",21,"F","Delhi"),
      (103,"Akashay",22,"M","Nagpur");
Select * from Student;
# Invalid entry
# Duplicate
insert into student 
values(101,"Ajay",20,"M","Mumbai");
# Null      
insert into student 
values(null,"Ajay",20,"M","Mumbai");
#Check
insert into student 
values(104,"Ajay",10,"M","Mumbai");
#default
insert into student 
values(101,"Ajay",20,"M");
#enum
insert into student 
values(105,"Ajay",20,"Male","Mumbai");      
#valid entry for default
insert into student(sid,sname,age,gender) 
values(104,"Deepak",20,"M");
 /*1  Create table Product with
 productid int primary key auto increment,
 Name varchar(30),
 Cost int 
 2 Insert 5 records and Show result
 3 Find total Cost ,Average Cost ,Max Cost,Min Cost,Total Products from product Table 
 4 delete 5th product 
 5 update Product id 1 to 100
 6 add column Country varchar(10) default India
 7 Drop Country
 8 truncate Table Product
 9 Drop Table product */
 Create table product(
productid int primary key auto_increment,
name varchar(50),
cost int); 
  insert into product(name,Cost)
  values ("A",10000),
		("B",20000),
        ("C",30000),
        ("D",40000),
        ("E",50000);
Select * from product;
describe product;


# Sum Average Max Min Count Count Distinct-Cards
Select Sum(cost) As "Total Cost",
       Avg(cost) As "Average Cost",
       Max(Cost) As "Maximum Cost",
       Min(Cost) As "Minimum Cost",
       count(Cost) As "Total Products" from product;
       
delete from product 
where productid=5;   
update  product
set productid=100
where productid=1;	       
Alter table product 
add column country varchar(10) default "India";    
Alter table product
drop column country;    

truncate table product;
drop table product;    
Select * from product; 
#Lab Day2 
/*Create the database ExcelR and create the Employee 
table with following columns.
	Emp_ID INT
	Emp_Name VARCHAR (100)
	Age INT 
	Company VARCHAR (100) DeFault "ExcelR"
	DOJ DATE
Add the below information.
	(1, “A”, 26, “TCS”, “2020-05-17)
(2, “B”, 33, “Infosys, “2010-02-13)
	(3, “C”, 35, “IBM”, “2015-08-26)
Show Records */
Drop Database ExcelR;
Create Database ExcelR;
Create Table ExcelR(
Emp_ID INT Primary Key auto_increment,
	Emp_Name VARCHAR(100) ,
	Age INT Check(Age>18),
	Company VARCHAR(100) Default "ExcelR",
	DOJ DATE
    ); 
    drop Table ExcelR;
Use ExcelR;
Create Table Emp(
Emp_ID INT Primary Key auto_increment,
	Emp_Name VARCHAR(100) ,
	Age INT Check(Age>18),
	Company VARCHAR(100) Default "ExcelR",
	DOJ DATE
    ); 
    Insert Into Emp
    values(1, "A", 26, "TCS", "2020-05-17")
,(2,  "B", 33, "Infosys", "2010-02-13")
,(3, "C", 35, "IBM", "2015-08-26");
Select * from Emp;
Drop Table Emp;
    Insert Into Emp(Emp_Name,Age,DOJ)
    values("D",25, "2023-05-17");#Valid
      Insert Into Emp(Emp_Name,Age,DOJ)
    values("E",10, "2023-05-17");# Not Valid Check Constraints
          Insert Into Emp(Emp_Name,Age,DOJ)
    values("F",28, "2023-02-10");#Valid
       Insert Into Emp(Emp_Name,Age,DOJ)
    values(Null,28, "2023-02-10");#Valid
 #17-03-25(Day 5)
  #  Primary key Foreign Key
  /* 1 create table employee with Empid int primary key,name varchar 
  insert 5 records into employee table & Show the result 
  2 create department table with deptID int primary key,Deptname varchar,empid int with foreign key 
  insert 3 records into department table and Show result
  3 Add ON Delete Cascade & on update cascade in department table  
  4 delete employee 3 from employee Table 
  5 update empid =100 where empid=1 */  
  Drop Table Employee ;
  Create table Employee (
  Empid int primary key,
  name varchar(20));
  insert into Employee 
  values (1,"Ravi"),
         (2,"Surya"),
         (3,"Ajay"),
         (4,"Monika"),
         (5,"Sayali");
  Select * from Employee;
  # Department Table 
  Drop table department;
  Create table department(
  DeptID int Primary Key,
  DeptName varchar(50),
  Empid int,
  foreign key(EmpID) # EmpID from Department 
  references Employee(EmpID)
  ON DELETE CASCADE 
  ON UPDATE CASCADE);# EmpID from Employee
  insert into Department 
  Values (101,"Sales",2),(102,"Marketing",3),(103,"Finance",1);
  Select * from Department ;
  Describe department;
  Drop Table Employee;# Drop Parent Table 
  Drop Table Department;# First Drop Child Table  
 # Delete 3rd EmpID  From Employee and Departent Table 
  delete from Employee
  where EmpiD=3;
  Select * From Employee;
  Select * from Department;
  # Update EmpID 1 to 100
  update Employee 
  Set EmpID=100
  where EmpiD=1;
# Insert into Department Empid 10
Insert into Department
Values(104,"HR",10);# Not Valid
# Insert into Department Empid 4
Insert into Department
Values(104,"HR",4);#  Valid
Insert into Employee
Values (7,"Dipti");
Insert into Department
Values(105,"TDM",7);
Insert into Department
Values(106,"TDM",6);
     # 18-04-25(Day 6)
 Use Classicmodels;# or Double Click on Classicmodes Database    
 Select * from Employees;
 Select email,employeenumber from Employees;
 Describe Employees;
 
#Aggregate Functions
/*Find total orders, Total Quantity ,MaxPriceEach, MinQuantity,
Averagepriceeach,Distinctorders from order details using Classic models*/
Select * from orderdetails;
Select count(ordernumber) As 'Total Orders', 
       sum(quantityOrdered) As 'Total Quantity',
       Max(priceEach) As 'Maximum Price',
       Min(quantityordered) As 'Minimum Quantity',
       Avg(priceEach) As 'Average Price',
       Count(distinct(ordernumber)) As 'Distinct Order' 
       from orderdetails ;
/*Find the Total Customer, Total Amount, Average Amount ,
Max Amount, Min Amount, Distinct Customer from payments
 table using classic models database */
 Select count(customernumber) as "Total Customer",
	   Sum(Amount) as "Total Amount",
       round(Avg(Amount),2) as "Average Amount",
       Max(Amount) as "Max Amount",
       Min(Amount) as "Min Amount",
       Count(Distinct(customernumber)) as "Distinct Customer" from payments;
# Start With End With Contain----Like Not Like  
# Find Country from Customers which starts with A
Select * from Customers;
  Select Distinct(Country)  from Customers
  where Country like "A%"; 
# Find Country from Customers which ends with A 
  Select Distinct(Country)  from Customers
  where Country like "%a"; 
# Find Country from Customers which contains  A  
 Select Distinct(Country)  from Customers
  where Country like "%A%"; 
# Country is Australia
   Select Distinct(Country) from Customers
  where Country="Australia"; 
# Find Country from Customers which not starts with A 
  Select Distinct(Country)  from Customers
  where Country not like "A%"; 
# Find Country from Customers which  not ends with A 
 Select Distinct(Country)  from Customers
  where Country not like "%A";  
# Find Country from Customers which does not contains  A  
 Select Distinct(Country)  from Customers
  where Country not like "%A%"; 
#Find the country which starts with A,B,C 
Select Distinct(country) from customers
where Country  like "A%" or Country  like "B%" or Country  like "C%" ;  
#Find the country which not starts with A,B,C 
Select Distinct(country) from customers
where Country  not like "A%" AND Country not like "B%" AND Country not like "C%" ;  
#Day3 Lab
#Find the country names beginning with letter F, letter G and letter H from customers table. 
Select Distinct(country) from customers
where Country  like "F%" or Country  like "G%" or Country  like "H%" ;
#  Day4 Lab 
#Use classic models. Categorize the customers into High, Medium and Low values with respect to creditLimit column as per following conditions.
#•	High: credit Limit > 100000
#•	Medium: credit Limit between 25000 and 100000
#•	Low: credit Limit < 25000
#Group by Order By Limit
#find top 5 customer on the basis of Total Amount from Payments Data
Select * from Payments;
Select Customernumber,Sum(Amount) As 'Total Amount' from Payments
group by customernumber
order by sum(Amount) Desc# ASc Ascending DESC Descending 
limit 5; 
#find bottom 5 customer on the basis of Total Amount from Payments Data
Select Customernumber,Amount As 'Total Amount' from Payments
group by customernumber;
Select Customernumber,Sum(Amount) As 'Total Amount' from Payments
group by customernumber
order by sum(Amount) # ASc Ascending  Bottom DESC Descending Top
limit 5; 
             #19-03-25(Day 7)
#find Top & bottom  5 customer on the basis of Total Amount from Payments Data using Union
(Select Customernumber,sum(amount) As 'Total Amount' from Payments
group  by customernumber
order by sum(amount) DESC
Limit 5)
UNION # Combine top and bottom together
(Select Customernumber,sum(amount) As 'Total Amount' from Payments
group  by customernumber
order by sum(amount) ASC
Limit 5);
/*Find Top & Bottom  5 order number on the basis of sum of Quantity ordered using 
order details table use Classic models database  */ 
(Select ordernumber,sum(quantityordered) as 'Total Quantity' from orderdetails
group by ordernumber
order by sum(quantityordered) DESC
limit 5)
UNION
(Select ordernumber,sum(quantityordered) as 'Total Quantity' from orderdetails
group by ordernumber
order by sum(quantityordered)
limit 5);
#Show Order Number whose total quantity is more than 625 from orderdetails 
Select ordernumber,sum(quantityordered) As TotalQuantity from orderdetails
group by ordernumber
having  TotalQuantity > 625;
#Show Order Number whose total quantity is less than 500 from orderdetails 
Select ordernumber,sum(quantityordered) As TotalQuantity from orderdetails
group by ordernumber
having  TotalQuantity < 500;
# Having < > <= >= and Where Clause 
# Show productcode whose quantity in stock is more than 7000 from products Table  
Select * from products;
Select productcode,sum(quantityInStock) AS 'Total Quantity' from products
group by productcode
having 'Total Quantity' >7000
order by TotalQuantity DESC
limit 5;
# Show List of Customers from France from Customers -Using Where Clause
Select * from Customers;	
Select CustomerName,Country from Customers
where Country ='France';	
# Show List of Customers from France ,UK and USA from Customers -Using Where Clause
Select customername,country  from customers
having country="France" or country="UK" or Country="USA"
order by  Country ;
# Show List of Customers not from France ,UK and USA from Customers -Using Where Clause
Select customername,country  from customers
where country<>"France" AND country<>"UK" AND Country<>"USA"
order by  Country ;
Select customername,country  from customers
where country not In("France","UK","USA")
order by  Country ;

# Show List of Customers from France ,UK and USA from Customers -Using in Clause

Select customername,country  from customers
where country In("France","UK","USA")
order by  Country ;

#Show Order Number whose total quantity is Equal to 629 from orderdetails 
Select ordernumber,Sum(quantityordered) As Total_Quantity from orderdetails
Group by ordernumber
having  Total_Quantity=629;
/*Show Customernumber,Customername,Creditlimit ,Country Where Creditlimit 
 is more than 100000 and Country is France  from Customers */
 Select Customernumber,Customername,sum(Creditlimit) ,Country from Customers
 group by Customernumber
 having sum(Creditlimit)>100000 and Country ="France";
#Show 3rd Customernumber with highest Total Amount from payments
Select * from payments;
Select customernumber,Sum(Amount) from payments
Group by Customernumber
order by Sum(Amount) DESC
Limit 2,1;# 3 ( position,Count )2,1
#Show 10th ,11th,12th Customernumbers with highest Total Amount from payments
Select customernumber,Sum(Amount) from payments
Group by Customernumber
order by Sum(Amount) DESC
Limit 9,3;
#Show Countrywise Count of Customer from customers Table 
Select * from Customers;
Select Country,Count(Customernumber) from Customers
group by Country 
order by Count(Customernumber) DESC;
#Show Top 3 Country on the basic Count of Customer from customers Table 
Select * from Customers;
Select Country,Count(Customernumber) from Customers
group by Country 
order by Count(Customernumber) DESC
limit 3;

#Show 3rd ,5th ,10th  Country on the basis Count of Customer from customers Table
(Select Country,Count(Customernumber) from Customers
group by Country 
order by Count(Customernumber) DESC
limit 2,1)
UNION
(Select Country,Count(Customernumber) from Customers
group by Country 
order by Count(Customernumber) DESC
limit 4,1)
UNION
(Select Country,Count(Customernumber) from Customers
group by Country 
order by Count(Customernumber) DESC
limit 9,1);
#Lab Day 4  Conditional  Status 
/*Use classicmodels. Categorize the customers into High, Medium and Low values
 with respect to creditLimit column as per following conditions.
•	High: creditLimit > 100000
•	Medium: creditLimit between 25000 and 100000
•	Low: creditLimit < 25000  */
Select * from Customers;
Select customernumber, CreditLimit from customers;
Select customernumber, CreditLimit,
CASE
When CreditLimit > 100000 Then  "High"
When CreditLimit between 25000 and 100000 THEN "Medium"
Else
"Low"
End As "Customerlevel"
From customers
order by CreditLimit Desc;
#Lab Day 5
#Use classicmodels. Find the total amount for each month of each year from payments table.
Select * from Payments;
Select year(paymentDate) As Year ,Monthname(paymentDate) AS Month,Sum(Amount) as Total_Amount from payments
group by year,month
order by year,month;
/*Use classicmodels. Categorize the customers into * rating 
 with respect to creditLimit column as per following conditions.
•	*****: creditLimit > 200000
•	****: creditLimit between 100001 and 200000
•	***: creditLimit between 50000 and 100000 
    **:  creditLimit < 50000   */
Select customernumber, CreditLimit,
CASE
When CreditLimit > 200000 Then  "*****"
When CreditLimit between 100001 and 200000 THEN "****"
When CreditLimit between 50000 and 100000 THEN "***"
Else
"**"
End As "CustomerRating"
From customers
order by CreditLimit Desc;
            #20-03-25(Day 8)
  # Date Function YYYY-MM-DD HH:MM:SS 
  #Date
  Select Date('2025-03-20 08:30:30') As Result;
  #Time
  Select Time('2025-03-20 08:30:30') As Result;
  #TimeStamp
  Select Timestamp('2025-03-20 08:30:30') As Result;
  #Current_Date
  Select current_date();
  # Current_Time
  Select current_time() As Result;
  #Current_timestamp
  Select current_timestamp()As Result;# UTC TimeZone
  # Now
  Select now() AS 'Output';
  #Year
  Select Year(current_timestamp()) As "Year";
  Select PaymentDate,Year(PaymentDate)As Year,MonthName(PaymentDate) As Month From Payments;
  
  # Quarter
  Select Quarter('2020-12-09') As Result;
  # Find the Quarterly total Payment from Payments table use Classicmodels Database
  Select PaymentDate ,Quarter(PaymentDate)As Quarter from Payments;
  Select concat("Q",Quarter(PaymentDate))As Quarter,Sum(Amount) As Total_Amount From Payments
  Group by Quarter
  Order by Quarter;
  #Month
  Select Month(now()) AS Result;
  # Monthname
    Select Monthname(now()) AS Result;
  #Week 
    Select concat("Week",Week(now())) AS Result;
    Select Week(now()) AS Week;#Completed  Week in Year 
    Select weekday('2025-03-24') As Result;# Current Day  From Week Monday =0 
    Select weekofyear('2025-03-22') As Result;# Current Week in Year
  # Day
  Select Day(Now()) As Result;
  # Dayname
  Select dayname(now()) As Result;
  
  #Hour
  Select Hour(Now()) As Result;
  # Minute
  Select Minute(Now()) As Result;
  # Second 
  Select Second(Now()) As Result;
  #DateAdd 0 Current + Next  - Previous 
  Select date_Add(now(),Interval 2 Day) As Result;# 2025-03-22
  Select date_Add(now(),Interval -2 Day) As Result;# 2025-03-18
  Select date_Add(now(),Interval 2 Month) As Result;# 2025-05-20
  Select date_Add(now(),Interval -2 Month) As Result;# 2025-01-20
  Select date_Add(now(),Interval 2 Year) As Result;# 2027-03-20
  Select date_Add(now(),Interval -2 Year) As Result;# 2023-03-20
  Select Year(paymentdate),Year(date_Add(paymentdate,Interval 1 Year)) As PreviousYear,
  Amount from Payments;
  # CurDate
  Select Curdate() As Result;
  Select Curtime() As Result;
  # Timestampdiff
  #Difference Between 2 Days  Year Month Day 
  Select timestampdiff(Day,'2025-03-20','2025-03-25') As Result;
  /*1 Find how many days will it take to ship the each order from 
orders table using timestampdiff function*/
Select * from Orders;
Select Ordernumber,orderdate,shippeddate,
timestampdiff(Day,orderdate,Shippeddate) As No_of_Days from orders;

/*2 Show top 5 orders which take more time to Ship thev product orders  */
Select Ordernumber,orderdate,shippeddate,
Concat(timestampdiff(Day,orderdate,Shippeddate)," Days") As No_of_Days from orders
order by No_of_Days  DESC
Limit  5;
               #21-03-25(Day 9)
  # Format
/*d-dd m-mm y-yy Y-yyyy
  D-ddth 
  b-Short month name
  h Hour(12hours)
  H Hour(24hours)
  i (minute)
  s (second)
  p AM/PM*/
  Select now() ;
  Select Format(1234.5670,2) As result;
  Select date_format(now(),"%d-%m-%y") As Result ;#21-03-25
  Select date_format(now(),"%Y") As Result ;#2025
    Select date_format(now(),"%b") As Result ;#2025
      Select date_format(now(),"%M") As Result ;#2025
      Select date_format(now(),"%M") As Result ;#2025
       Select format(date'2025-03-25',"YY-MM-dd") As Result;# Not Valid
       Select date_format("2025-03-10 13:10:50","%h:%i:%s %p") As Result ;#Date with time 
    #Text Function 
    
   # ASCII A 65 B 66 .....a-97 b-98 c-99......
   select ASCII("-122334454") As Result;
   Select ASCII("India is my Country") As Result;
   select ASCII("$") As Result;
   # CHAR Length
   Select char_length("India") As Result;
   Select Customername,char_length(customername) from Customers;
   # Upper
   Select Customername,upper(Customername) from Customers;
   # Lower 
   Select Customername,lower(Customername) from Customers;
   # Trim 
   Select "       Dipti Sinha             ",Trim("       Dipti Sinha             ") as Result;
   
   #LTrim
      Select "       Dipti Sinha             ",LTrim("       Dipti Sinha             ") as Result;
   # Rtrim
      Select "       Dipti Sinha             ",RTrim("       Dipti Sinha             ") as Result;
   # CONCAT
   Select contactFirstName,contactLastName,
   Concat(contactFirstName," ",contactLastName) As ContactfullName from Customers;
   # Syntax  Instr(str,Substr) Locate(substr,Str) Position(substr in Str) Use Any one 
   
   # INSTR
   Select instr("Dipti Sinha"," ") As Result;
   Select Customername,instr(customername," ") As Result from Customers;
   # Locate
      Select Locate(" ","Dipti Sinha") As Result;
   # Position
      Select Position(" " in "Dipti Sinha") As Result;
   # SubString(String,Position,No of Value)
   Select substring("www.google.com",1,3)As Result;#www
      Select substring("www.google.com",5,6)As Result;#google
         Select substring("www.google.com",4,1)As Result;#.
            Select substring("www.google.com",12,3)As Result;#com
               Select substring("www.google.com",-3,3)As Result;#com
                  Select substring("www.google.com",-10,6)As Result;#google
                       Select substring("www.google.com",-14,3)As Result;#www
                  
   # Substring Index
      Select substring_index("www.google.com",".",1)As Result;#www
        Select substring_index("www.google.com",".",2)As Result;#www.google
          Select substring_index("www.google.com",".",3)As Result;#www.google.com
            Select substring_index("www.google.com",".",-2)As Result;#google.com
            Select Customername,
            substring_index(customername," ",1) As FirstName,
            substring_index(customername," ",-1) As LastName from Customers;
            
 Select "Surya Kumar Yadav" As Name ,substring_index("Surya Kumar Yadav"," ",1) As FirstName,
 Substring_index(substring_index("Surya Kumar Yadav"," ",2)," ",-1) As MidName,
 substring_index("Surya Kumar Yadav"," ",-1) As LastName;           
   # Reverse
   Select "LQSyM",Reverse("LQSyM") ;
   # Left
   Select "ExcelR Mumbai",Left("ExcelR Mumbai",6) As Result;
   # Right
      Select "ExcelR Mumbai",Right("ExcelR Mumbai",6) As Result;
   # Mid 
   Select "Surya Kumar Yadav",Mid("Surya Kumar Yadav",7,5) As Result;
  
   # Replace(Str,old Substr,New Substr)
   Select Replace("ExcelR Mumbai","Mumbai","Pune") As Result;
   Select Replace("United States of America","United States of America","USA") As Result;
         #24-03-25(Day10)
   # LPAD 
   Select lpad("Raj",7,"Emp ") As Result;# Left Padding
   # Rpad 
   Select rpad("Dipti",13," Sinha") As result;#Right Padding
   Select contactFirstName,contactLastName,
rpad(contactFirstName,length(contactFirstName)+length(Concat(" ",contactLastName)),
Concat(" ",contactLastName)) As FullName
   from Customers;
   Select contactFirstName,contactLastName,
lpad(contactLastName,length(contactLastName)+length(Concat(contactFirstName," ")),
Concat(contactFirstName," ")) As FullName
   from Customers;
         /*Joins 
 1 Left Join Left+common
 2  Right Join Right+Common
 3 Inner Join  Common
 4 Full Outer Join Left+Right+Common
 5 Cross Join 
 6 Self Join */
/*1  Create table Students with Studentid int primary key
 ,Name Varchar not null,insert 5 records in students Table and Show result
2  Create table Module with ID  int primary key ,Modulename varchar not null,
studentid int insert 5 records and show result 
3 Show the result for inner,Left,Right,Full join using Stiudent and Module Table 
*/
Use 10marchsqlbatch;  
Create table students(
studentid int primary key ,
Name Varchar(20) not null);
Insert into students
values (1,"Deepak"),(2,"Abhishek"),(3,"Rahul"),(4,"Pooja"),(5,"Sonam");
Select * from Students;
Create Table Module(
Id int primary key,
MName varchar(20) not null,
studentid  int);
insert into Module
values (101,"Excel",1),
(102,"Tableau",2),
(103,"PowerBI",3),
(104,"MYSQL",6),
(105,"Python",7);
select * from Module;
# Inner Join
Select Name,Mname from Students
inner Join module
using (studentID);
#Left Join
Select * from Students
Left Join module
using (studentID);
Select * from Students
Right Join module
using (studentID);
#Full Join 
Select * from Students
Full Join module
using (studentID);# Not Valid

Select StudentID,Name,ID,Mname from Students
Left Join module
using (studentID)
UNION
Select StudentID,Name,ID,Mname from Students
Right Join module
using (studentID);# Valid

# Cross Join 
 /*Create the table Laptop with Laptop Name and Colour Table with Colourname 
 insert 3 records in both table and Show result with Cross Join*/
Use 10marchsqlbatch;
Create Table Laptop (
LaptopName varchar(10));
insert into Laptop
Values ("Acer"),("Lenova"),("Dell");
Select * from Laptop;
Create Table Colour(
Colourname varchar(10));
insert into Colour 
values ("Black"),("Silver"),("White"),("Golden");
insert into Colour 
values ("gray");
Select * from Colour; 
Select * from Laptop 
Cross join colour
order by laptopname; 
   # Self Join
 /*Create table organization with EmpId int primary key ,Empname Varchar(30),
 Age int,ManagerID int ,Managername varchar(20) 
 insert 5 records and Show result with Self Join Employee with Manager */
 Create table  organization(
 EmpId int primary key,
 Empname Varchar(30),
 Age int,
 ManagerID int ,
 Managername varchar(20));
 insert into organization
 values (1,"A",34,3,"Ravi"),
		(2,"B",27,4,"Shubham"),
        (3,"C",30,10,"Himanshi"),
        (4,"D",45,1,"Anjali"),
        (5,"E",35,2,"Reema");
  Select * from Organization;
  #Inner
  Select T1.EmpID,T1.EmpName,T2.ManagerID,T2.Managername from organization   T1 inner Join organization  T2  
  on T1.EmpID=T2.ManagerID;
  #Left
  Select T1.EmpID,T1.EmpName,T2.ManagerID,T2.Managername from organization  T1
  Left Join organization As T2  
  on T1.EmpID=T2.ManagerID;
  # Right 
  Select T1.EmpID,T1.EmpName,T2.ManagerID,T2.Managername from organization   T1
  Right Join organization  T2  
  on T1.EmpID=T2.ManagerID;
  #Full 
  Select T1.EmpID,T1.EmpName,T2.ManagerID,T2.Managername from organization  T1
  Right Join organization As T2  
  on T1.EmpID=T2.ManagerID
  Union
  Select T1.EmpID,T1.EmpName,T2.ManagerID,T2.Managername from organization  T1
  Left Join organization As T2  
  on T1.EmpID=T2.ManagerID;
  
  #Day7

/*Use classicmodels. Show the total sales done by each customer using below tables and sort it by highest to lowest sales.
Sales = SUM(priceEach * quantityOrdered)
•	Customers
•	Orders
•	Orderdetails
*/
Use Classicmodels;
Select CustomerNumber,CustomerName,sum(Quantityordered*priceeach) As Sales from customers
inner join orders
using(customernumber)
inner join orderdetails
using (ordernumber)
group by Customernumber
order by Sales DESC;
#Top 5 Customer on the basis of Sales
Use Classicmodels;
Select CustomerNumber,CustomerName,sum(Quantityordered*priceeach) As Sales from customers
inner join orders
using(customernumber)
inner join orderdetails
using (ordernumber)
group by Customernumber
order by Sales DESC
limit 5;
            #25-03-25(Day 11)
 /*Window Function
nameofFunction(expression)over(patition by order by )
1 Aggregate
Sum Avg Max Min Count
2 Ranking
Row_number,Rank,denserank,cum_dist,percentrank
3 Analytical
First_Value,Last_value,nth_value,Lead,lag,ntile */    
 /* Find the Aggregate value for Quantityordered for  each order 
 using Window function from orderdetails */ 
 # Agg
 Select Distinct(ordernumber),
 sum(quantityordered)over(partition by ordernumber) As Total_Quantity,
 Avg(quantityordered)over(partition by ordernumber) As Average_Quantity,
 Max(quantityordered)over(partition by ordernumber) As Maximum_Quantity,
 Min(quantityordered)over(partition by ordernumber) As Minimum_Quantity,
 count(quantityordered)over(partition by ordernumber) As No_of_Quantity 
 from orderdetails;
 Select ordernumber,Sum(quantityordered) As Total_Quantity from orderdetails
 group by ordernumber
 order by ordernumber;
 
 Select Distinct(ordernumber),
 sum(quantityordered)over(partition by ordernumber) As Total_Quantity
 from orderdetails;
Select Row_number(),Customernumber from payments;# Not Valid only work with windows Function 
 # Find All ranking Function for each customer on the basis of Amount from Payments
 Select * from Payments;
 Select Row_number()over() As Srno,customernumber,Amount from payments;
 Select customernumber,amount,
 row_number()over(partition by Customernumber order by Amount DESC) As "SrNO",
  rank()over(partition by Customernumber order by Amount DESC) As "Ranking",
   dense_rank()over(partition by Customernumber order by Amount DESC) As "Dense Ranking",
round(cume_dist()over(partition by Customernumber order by Amount DESC),2) As "Cumulative Distribution",
 round(percent_rank()over(partition by Customernumber order by Amount DESC),2) As "Percent Ranking"
    from  Payments;
               #26-03-25(Day11)
# Find All Analytical  Function for each customer on the basis of Amount from Payments
 Select * from Payments;  
 Select customernumber,Amount,
 first_value(Amount)over(partition by customernumber) As "1st Value",
 last_value(Amount)over(partition by customernumber) As "Last Value",
 nth_value(Amount,2)over(partition by customernumber) As "2nd Value",
 lag(Amount)over(partition by customernumber) As "Previous Value",
 lead(Amount)over(partition by customernumber) As "Next Value"
 from payments;
 # ntile -Create own partition
 Select Count(*) from orderdetails;#2996
 Select ntile(1500)over() as ntileparition from orderdetails;
 Select  ordernumber,priceeach,
 ntile(2996)over() as ntilefun from orderdetails;
 #first_value(priceeach)over(partition by ntile(1000)over()) from orderdetails;#not valid
 Select Count(*) from Orderdetails;
   # HW -Find all Window function for each order on the basis of priceeach from orderdetails
   Select * from  orderdetails;
   # Refer Subquery-View-CTE-Index SQl file  
           #28-03-25(Day12)  
           /* Transation Control Language (TCL Command)
1 Commit 
2 Roll  Back 
3 Save Point 
Table -Autocommit Transation
Records-Non Autocommit Transation
Q -1 Create table Participants with ID int Primary key,Name Varchar(20) Not Null,Age int 
   2 Insert 5 records in Participants & Show Result
   3 Update Age of 3rd Participant to 20
   4 Delete 5th Participant  
   5 Show result with TCL Command */
Create table participants(
ID int Primary key,
Name Varchar(20) Not Null,
Age int);#Auto commit Trasation
Truncate Table participants;
Select * from participants;
Create table participants(
ID int Primary key,
Name Varchar(20) Not Null,
Age int);#Auto commit Trasation
Start Transaction;
insert into participants
values (1,"Ravi",24),
       (2,"Abhishek",28),
       (3,"Sarika",21),
       (4,"Anshul",26),
       (5,"Aparna",27);
savepoint insert_participants;
Select * from participants; 
update participants
set age=20
where id=3;
savepoint update_participants;
delete from participants
where id=5;
savepoint delete_participants;
Commit;#Ctrl+S
Rollback;#CTRL+Z
# Rollback to Delete  update and insert is possible if not commit
rollback to delete_participants;
rollback to update_participants;
rollback to insert_participants;
set SQL_safe_updates=0;
Start Transaction;
insert into participants
values (1,"Ravi",24),
       (2,"Abhishek",28),
       (3,"Sarika",21),
       (4,"Anshul",26),
       (5,"Aparna",27);
savepoint insert_participants;
Select * from participants; 
update participants
set age=20
where id=3;
savepoint update_participants;
delete from participants
where id=5;
savepoint delete_participants;
Commit;
Rollback;
rollback to delete_participants;
rollback to update_participants;
rollback to insert_participants;
set SQL_safe_updates=0;
# Holiday HW   29-03-25
  #Day 9 
/*Use ExcelR. Create Emp_TCL table with below fields.
•	Emp_ID (Primary Key)
•	Name
•	Age
Write the insert query, update query and delete query under Start Transaction. Use savepoint for each transaction. 
Check Rollback and Rollback to savepoint.*/    
       


   
   
   
   
   
   
   
   
   
   