use ; northwind
select * from customers;
SELECT CustomerName, City, Country FROM Customers;

select Country from customers;
SELECT DISTINCT Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;
SELECT COUNT(DISTINCT CustomerID) FROM Customers;

SELECT firstname, lastname, birthdate FROM Employees;
SELECT customername, address, city FROM Customers;
SELECT DISTINCT city FROM Suppliers;
SELECT COUNT(DISTINCT city) FROM Customers;

select Customername, City, Country
from Customers
where Country = 'UK';

select CustomerName, City
from Customers
where City ='London';

select CustomerName, Country
from Customers
where Country = 'USA';

select CustomerID
from Customers
where CustomerID > 15;

select customername, City, Country
from customers
where Country = "UK" or City = "berlin";

select *
from products
where productname like 'e%';

select *
from Suppliers
where Country like "%land";

select *
from Employees
where firstname like "_n%";

select *
from customers
where city in('Berlin', 'Paris', 'Madrid');

select *
from orders
where shipperID in('1', '3');

select *
from orders
where customerID in(select customerID from orders);

select customername, customerID
from customers
where customerID in(select customerID from orders);

select orderid, customerid
from orders
where orderid between 10000 and 20000;

select city
from suppliers
order by city desc;

select customername, address
from customers 
order by customerid asc
Limit 10;

select min(price)
from products;

select avg(price)
from products;

select sum(price)
from products;

select count(productID)
from products
where categoryID = 1;

SELECT CustomerName, CONCAT_WS(" , ", Address, PostalCode, City, Country) as Address
FROM Customers;

select *
from customers;

select CustomerName, City
from customers; 

SELECT 
DISTINCT city 
FROM customers;

select ProductName, Price
from products
where Price > 50;

select Country
from customers
where Country = 'USA' or Country = 'UK';

select *
from orders
order by orderdate desc;

select *
from products
where price between 20 and 50;

select *
from customers
where country = 'USA' and city = 'Portland' or city = 'Kirkland'
order by CustomerName asc;

select *
from customers
where country = 'UK' or city = 'London'
order by CustomerName desc;

select *
from products
where CategoryID in (1,2)
order by ProductName asc;

select *
from customers
join orders
on orders.customerID = customers.customerID;

select customers.CustomerID, Orders.OrderID, Orders.OrderDate, 
customers.CustomerName, customers.Country
from Orders
inner join Customers
on Orders.CustomerID = Customers.CustomerID
order by customers.CustomerID;

select employees.firstname, employees.lastname, orders.orderdate, orders.employeeID
from employees
inner join orders 
on employees.employeeID = orders.employeeID
order by employees.employeeID;

select shippername, orderID, orderdate
from shippers
inner join orders
on shippers.shipperID = orders.shipperID
where shippername = 'Speedy Express';

select productname, categoryname
from products
inner join categories
on categories.categoryid = products.categoryid;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders
order by customername;

select orders.orderid, OrderDate, ProductID, Quantity
from orders
join order_details
on orders.orderid = order_details.OrderID;

-- Total Sales for each product
select p.ProductName, Sum(od.Quantity * p.Price) as 'Total Sales'
from products as p
join order_details as od
on p.ProductID = od.ProductID
group by p.ProductName
order by 'Total Sales';

-- number of customers in each city

select City, count(customerID) as 'Total Customers' 
from customers
group by City
order by 'Total Customers' desc;

select city, count(customerid) as numberofcustomers
from customers
group by city
order by numberofcustomers desc;
 
-- Write a query to list each employee and the number of orders they have handled.*/
select FirstName, LastName, count(o.orderid) as 'no of orders'
from orders as o
join employees as e
on o.EmployeeID = e.EmployeeID
group by FirstName, LastName;


-- each product category and the total quantity of products sold in that category

select Categoryname, sum(quantity) as 'Total Sold'
from categories as c
join products as p
on c.categoryID = p.categoryID
join order_details as od
on p.productid = od.productid
group by Categoryname;

-- which supplier provides each product in the inventory

select productname, suppliername, count(quantity) as 'Total Quantity'
from products as p
join suppliers as s
on p.supplierid = s.supplierid
join order_details as od
on p.productid = od.productid
group by productname, suppliername;

-- find category of each product

select productname as Product, categoryname as Category
from products as p
join categories as c
on p.categoryid = c.categoryid;

-- retrieve all products in meat/poultry category

select productname as Product, categoryname as Category
from products as p
join categories as c
on p.categoryid = c.categoryid
where categoryname = 'Meat/Poultry';

-- retrieve the Order ID, Order Date, Customer Name, and Employee Name for all orders

select orderid, orderdate, customername as Customer, CONCAT(firstname, ' ', lastname) as Employee
from orders as o
join employees as e
on o.employeeid = e.employeeid
join customers as c
on o.customerid = c.customerid;

-- retrieve the Product Name, Category Name, and Supplier Name for all products

select productname as Product, categoryname as Category, suppliername as Supplier
from categories as c
join products as p
on c.categoryid = p.categoryid
join suppliers as s
on p.supplierid = s.supplierid;

-- create a report for all the orders of 1996 and their customers

select OrderID, OrderDate, CustomerName
from orders as o
join customers as c
on o.customerid = c.customerid
where year(orderdate) = 1996;

-- retrieve all categories along with the number of products in each category

select categoryname as Category, productname as Product, count(quantity) as 'Total Quantity'
from order_details as od
join products as p
on od.productid = p.productid
join categories as c
on c.categoryid = p.categoryid
group by productname, categoryname;

-- retrieve all products with their prices and the quantity ordered for each product

select productname as Product, Price, count(quantity) as 'Quantity Ordered'
from order_details as od
join products as p
on od.productid = p.productid
group by productname, price;


