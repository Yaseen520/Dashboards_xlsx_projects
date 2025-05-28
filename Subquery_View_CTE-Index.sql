                               #26-03-25(Day11)
                               #View (Imaginary Table )
/*Syntax Create View NameofView As
   ...............
   ...........;*/
Create Database 
Create table
Create View   
drop View
Alter View  
   
Use Classicmodels;	
Drop View Top5customer;		
Create View Top5Customer As
 Select  distinct(customernumber),Customername,count(ordernumber) from customers
 inner join orders
 using (customernumber)
 inner join orderdetails
 using(ordernumber)
 group by customernumber
 order by count(ordernumber) Desc
 Limit 5;
 # Alter View to Show Top 3 Customer
 Alter View Top5customer As
 Select  distinct(customernumber),Customername,count(ordernumber) from customers
 inner join orders
 using (customernumber)
 inner join orderdetails
 using(ordernumber)
 group by customernumber
 order by count(ordernumber) Desc
 Limit 3;
 Select * from top5customer;
 Drop View top5customer;
 /*Use classicmodels. Create a view territory_status mentioning the details about 
 no. of employees in each territory.
Tables to be used: Offices, Employees*/
Select * from Offices;
Select * from Employees;
# Normal Query
Select territory,count(employeenumber) from Employees
inner join offices
using(officecode)
group by territory
order by Count(employeenumber) DESC; 
# View Query
Create View territory_Status As 
Select territory,count(Employeenumber) As "No. of Employees" from Offices 
inner join Employees 
using (Officecode)
group by Territory 
order by count(Employeenumber)  DESC;
Select * from territory_Status;
# Alter Territory Status view to show top 2 territory
Alter View territory_Status As 
Select territory,count(Employeenumber) As "No. of Employees" from Offices 
inner join Employees 
using (Officecode)
group by Territory 
order by count(Employeenumber)  DESC
Limit 2;
# Drop View
Drop View Territory_Status;

/*Create View Product Category Sales provide insights sales performance by product category 
Include Productline From Productline Table Total Sales orderquantity,Order detail price
 ,No of Orders 
Containing Products from Category (products,Orders,Orderdetails Product line) */ 
Create View Product_Category_Sales As 
Select productline,Sum(Quantityordered*Priceeach) As Total_Sales,Count(Distinct(ordernumber)) As "No of Orders"
from orders 
inner join orderdetails
using(ordernumber)

inner join products
using(productcode)

inner join productlines 
using(productline)

group by productline
order by  Sum(Quantityordered*Priceeach) DESC;
Select * from Product_Category_Sales;
#Alter View Product_Category_Sales to show top 5 Product_Category_Sales
Alter View Product_Category_Sales As 
Select productline,Sum(Quantityordered*Priceeach) As Total_Sales,Count(Distinct(ordernumber)) As "No of Orders"
from orders 
inner join orderdetails
using(ordernumber)

inner join products
using(productcode)

inner join productlines 
using(productline)

group by productline
order by  Sum(Quantityordered*Priceeach) DESC
Limit 5;
# Drop View 
Drop View Product_Category_Sales;
# Create View Yearly Amount from Payments
Create View Yearly_Amount As
Select Year(paymentDate) As Year ,Sum(Amount) As TotalAmount from Payments
Group by Year(paymentdate)
order by Sum(Amount) Desc; 
Alter View Yearly_Amount As
Select Year(paymentDate) As Year ,Sum(Amount) As TotalAmount from Payments
Group by Year(paymentdate)
order by Sum(Amount) Desc
Limit 2;
                    #CTE-common table expression 
#Syntax
/*With NameofCTE As (
) 
Select * from NameofCTE ;*/
# Show top 5 Total order quantity for each customer using Customers,Order,Orderdetails Using CTE
Use Classicmodels;
With Totalquantity As (
Select Customernumber,Customername,Sum(quantityordered) as Total_Quantity from customers 
inner  join orders
using(customernumber)
inner join orderdetails
using(ordernumber)
Group by customerNumber
order by Total_Quantity DESC
Limit 5
) 
Select * from Totalquantity;

#Find top 5 Customer on the basis of Creditlimit  using CTE from Customers
With Super5customer AS(
Select Customernumber,Customername,Creditlimit from Customers
order by creditlimit DESC
limit 5)
Select * from Super5customer;
Select Customernumber,Customername,Creditlimit from Customers
order by creditlimit DESC
limit 5;
#Find Bottom 5 Customer on the basis of Creditlimit  using CTE from Customers
With Bottom5customer AS (
Select CustomerName,Creditlimit from Customers
Order by Creditlimit 
Limit 5 
)
Select * from Bottom5customer;
# Top  5 and Bottom 5 Customers Using Union
create Table Top5 AS (
Select CustomerName,Creditlimit from Customers
Order by Creditlimit DESC 
Limit 5 
);
Select * from top5;
Create Table Bottom5 AS (
Select CustomerName,Creditlimit from Customers
Order by Creditlimit 
Limit 5 
);
Select * from Bottom5;


Select * from Top5 
union Select * from bottom5;


#Show Percent_Rank and Cume_Dist for each product on the basis of Total Sales Value


Select * from products ;
SELECT  p.productCode,
        p.productName,
        p.TotalSales,
        Round(PERCENT_RANK() OVER (ORDER BY p.TotalSales DESC),2) AS TotalSales_percent_rank,
        Round(CUME_DIST() OVER (ORDER BY p.TotalSales DESC),2)AS TotalSales_cume_dist,
        Rank() Over(ORDER BY p.TotalSales DESC) As TotalSales_Rank
FROM    (
            SELECT  productCode,
                    productName,
                    SUM(quantityOrdered*priceEach) AS TotalSales
            FROM    products
                   INNER JOIN orderdetails USING (productCode)
                    
            GROUP BY    productCode
            ORDER BY    TotalSales DESC
        ) AS P;
        
#COLASCE Return the first non-null value in a list:

SELECT COALESCE(Null, null, null,'excelr.com',NULL,Null,1) as result;#1
SELECT COALESCE(NULL,Null, 1, 2, 'excelr.com') As Result;#1
Select Distinct(coalesce(Customers.Customernumber,orders.Customernumber)) As customernumber 
from customers inner join Orders
using(customernumber);# inner Join
Select Distinct(ifnull(Customers.Customernumber,orders.Customernumber)) As customernumber 
from customers inner join Orders
using(customernumber);# inner Join
Select isnull(state) from customers;
SELECT Distinct(State) ,coalesce(State,"-")from Customers;        
# Cast-Convert Value to date Datatype
Select cast("10101010" As Date) As date ;
select cast("20250327"As Date);

#IFNULL Return Specified value if the express is null
Select ifnull("Dipti","-");
Select ifnull(null,"-");
select ordernumber,comments,ifnull(comments,"-")  As NewComment from orders;
select ordernumber,coalesce(comments,"-") from orders;
#IS Null -Check weather the expression is null Null-1 Not null-0

Select isnull("Dipti");
Select Comments from orders;
Select Comments,coalesce(Comments,"-") As NewComments from Orders;
Select Comments,ifnull(Comments,"-") As NewComments from Orders;
#Index
Select Count(*) As Total_Row from Customers;#122
Select Count(*) As Total_Row from Customers where Country="France";#12
Explain Select * from Customers where Country="Canada";#122
                    #Index 
# Clustered-Primary Key  auto created  Non Clustered Indexes Manually Created
Show indexes from payments;# indexes
describe payments;# Data type
Show indexes from adhardata;
Show Indexes from Customers;
Show indexes from Offices;
Select Count(*) from offices;
Show Indexes from orderdetails;
Show indexes from adhardata;
Show Indexes from orders;
Show indexes from offices;
describe products;
Show indexes from payments;
Show indexes from products;
Select * from Customers;
select count(*) from customers;#122
Create index stateIndex On Customers(State);
Explain Select * from Customers where state="CA";
Explain Select * from Customers where state="NV";
Create  index City On Customers(City);
Explain Select * from Customers where City="NYC";
Drop Index Stateindex on Customers;
Drop Index City on Customers;
Use Classicmodels;
Drop Index CountryIndex on Customers;

Create Index CountyIndex on customers(Country);
Explain Select * from Customers where Country="Norway";
Explain Select * from Customers where Country="USA";
Create Index statusIndex on orders(status);
Explain Select * from orders where Status="Cancelled";
Select Count(*) from orders;#326
Show indexes from Orders;
Select Count(*) from orders where status="Shipped";
Create Index ProductlineIndex on Products(productline);
Select Count(*) from Products;
Explain Select * from Products Where productline="Motorcycles";
Explain Select * from Customers where Country="France";
                     
                         #Function
Use 10marchsqlbatch;
Drop Table Department;
 Drop Table Employee;
 Create Table  Employee(
 EmployeeID Int Primary Key,
 Name VARCHAR(50),
 Salary INT,
 DOB DATE);
 Insert into  Employee
 Values (1001,"A",10000,"1990-01-01"),
 (1002,"B",2000,"2000-01-01"),
 (1003,"C",30000,"1990-12-05");
  Insert into  Employee
 Values (1004,"A",10000,"2000-01-01");
 Select * from Employee;
 
 DELIMITER //
 
 Create Function CalculateAge(XYZ Date)
 returns INT
 deterministic
 
 Begin

 Return YEAR(Now())-YEAR(XYZ);# Year(now())
 
 End //
 
 Select EmployeeID,Name,Salary,DOB,CalculateAge(DOB) AS Age from Employee;
 Select * from Employee;
 
 
/*Cursor is a Temporary Memory or Temporary Work Station. 
It is Allocated by Database Server at the Time of Performing DML(Data Manipulation Language) operations on the Table by the User. Cursors are used to store Database Tables. 

Types of Cursor
1 Implicit Cursors: Implicit Cursors are also known as Default Cursors of SQL SERVER.
 These Cursors are allocated by SQL SERVER when the user performs DML operations.
2 Explicit Cursors: Explicit Cursors are Created by Users whenever the user requires them.
 Explicit Cursors are used for Fetching data from Table in Row-By-Row Manner.
 Syntax:

DECLARE cursor_name CURSOR FOR SELECT * FROM table_name
DECLARE A1 CURSOR FOR SELECT * FROM Customers;
Open Cursor_Connection
Open A1;#Ex

Syntax:

 FETCH NEXT/FIRST/LAST/PRIOR/ABSOLUTE n/RELATIVE n FROM cursor_name
 FEACH Next from A1;#Ex*/
 
  #Assignment 12.1
  /*Calculate Yearwise Monthnamewise Count of orders and Year YOY percentage Format YOY in No Decimal 
  & Show in % Sign*/ 
  Use Classicmodels;
SELECT 
	YEAR(orderDate) AS "Year", 
    MONTHNAME(orderDate) AS "Month",
    COUNT(orderNumber) AS "Total Orders",
    CONCAT(ROUND(((COUNT(orderNumber) - LAG(COUNT(orderNumber),1) OVER()) / LAG(COUNT(orderNumber),1) OVER())*100), "%") AS "% YoY Change"
FROM Orders
GROUP BY Year, Month;
 Use Classicmodels;
(Select Customername,Creditlimit from Customers
order by creditlimit DESC
Limit 5)
Union
(Select Customername,Creditlimit from Customers
where creditlimit>0
order by creditlimit 

Limit 5);


#13

Select Customernumber,CustomerName from customers
Where customernumber not in (Select  customernumber from orders);



                


# Functions
Create Table Emp(
EmpID int Primary key,
Name Varchar(50),
Salary int,
DOB Date);
Insert into Emp
values(1001,"A",50000,"2000-01-01"),
(1002,"A",60000,"1998-12-27"),
(1003,"A",70000,"2003-12-27"),
(1004,"A",40000,"2000-12-01");

Select * from emp;

Delimiter //
Create function CalculateAge(xyz date)
returns int
deterministic
Begin
Declare TodaysDate Date;
Select Current_Date() into TodaysDate ;
Return Year(TodaysDate )-Year(xyz);
END //

Select EmpID,Name,DOB,CalculateAge(DOB) from Emp;
#Day12 -2
Delimiter //
Create function CalculateAgeNew(xyz date)
returns Varchar(100)
deterministic
Begin
Return Concat(timestampdiff(Year,xyz,now()) ," Years ",
timestampdiff(Month,xyz,now())%timestampdiff(Year,xyz,now())," Months");
END //

Select EmpID,Name,DOB,CalculateAgenew(DOB) from Emp;

# Create Function Cost and Show Product code and Cost
Delimiter //
Create function Cost(quantity int,price int)
returns int
deterministic
Begin
return  Quantity*price;
END //
Drop Function Cost;
Select Productcode,quantityordered,priceeach,Cost(quantityordered,priceeach) 
As Cost from orderdetails;

# Create Function Cube ans Show the Number and Cube of the Number

Create Table Value(
Number int);
Insert into Value
Values (1),(2),(3),(4),(5);
Select * from value;
Delimiter //
Create function Cube1(a int)
returns int
deterministic
Begin
return  a*a*a;
END //
Select number,cube1(number) As Cube_Of_Number from Value;

# Create Function NoofDays and Show Ordernumber,Orderdate,Shipeddate ,Noofdays using Function
Delimiter //
Create function Noofdays(a Date,b date)
returns int
deterministic
Begin
return  Day(a)-day(b);
END //
Select Ordernumber,Orderdate,Shippeddate ,
Noofdays(Shippeddate,orderdate) As TotalDays from orders;

                #Sub Query
  # Execute Sub Query then Execute Main Query               
    Select (Select )            
# Find the Customer Who placed Order using SubQuery

Select Customernumber,Customername From Customers 
Where Customernumber in (Select Customernumber from orders);

/*Find Ordernumber,Quantityorderd from orderdetails Where Quantityorderd 
 is greater than average Quantity  */
 Select ordernumber,Quantityordered from orderdetails
 where quantityordered > avg(quantityordered);#not valid
 
 # Nested Select 
 Select Distinct(Ordernumber),Quantityordered from orderdetails
 where Quantityordered >  (Select Avg(Quantityordered) from orderdetails);
 
/* Find Customer Whose amount is more then average Amount from payments Table using Sub Query*/
Select Customernumber,paymentdate,Amount from payments
where Amount>= (Select Avg(Amount) from payments);

Select Customernumber ,amount from payments;
Select Customernumber ,sum(amount) from payments
group by Customernumber;








