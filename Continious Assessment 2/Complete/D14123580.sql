-- Drop each table and remove constraints --

-- drop table Employee and remove all constraints associated with it --
DROP TABLE Employee CASCADE CONSTRAINTS PURGE
;

-- drop table StockAllocated and remove all constraints associated with it -
DROP TABLE StockAllocated CASCADE CONSTRAINTS PURGE
;


-- drop table StockOrderItem and remove all constraints associated with it -
DROP TABLE StockOrderItem CASCADE CONSTRAINTS PURGE
;


-- drop table Stock and remove all constraints associated with it -
DROP TABLE Stock CASCADE CONSTRAINTS PURGE
;


-- drop table StockCategory and remove all constraints associated with it -
DROP TABLE StockCategory CASCADE CONSTRAINTS PURGE
;


-- drop table Department and remove all constraints associated with it -
DROP TABLE Department CASCADE CONSTRAINTS PURGE
;


-- drop table SupplierPayment and remove all constraints associated with it -
DROP TABLE SupplierPayment CASCADE CONSTRAINTS PURGE
;
 
 
-- drop table StockOrder and remove all constraints associated with it -
DROP TABLE StockOrder CASCADE CONSTRAINTS PURGE
;


-- drop table Supplier and remove all constraints associated with it -
DROP TABLE Supplier CASCADE CONSTRAINTS PURGE
;


-- drop table LightingSpec and remove all constraints associated with it -
DROP TABLE LightingSpec CASCADE CONSTRAINTS PURGE
;


-- drop table LightingSystem and remove all constraints associated with it -
DROP TABLE LightingSystem CASCADE CONSTRAINTS PURGE
;


-- drop table Customer and remove all constraints associated with it -
DROP TABLE Customer CASCADE CONSTRAINTS PURGE
;


-- drop table Customer_Payment and remove all constraints associated with it -
DROP TABLE Customer_Payment CASCADE CONSTRAINTS PURGE
;

-- Create tables and populate columns --

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE Customer_Payment 
( 
	PaymentNo          VARCHAR2(6)  NOT NULL ,
	CustomerPayDate    DATE  NULL ,
	CustomerPayPrice   NUMBER(6,2)  NULL ,
	CONSTRAINT Customer_Payment_PK PRIMARY KEY   (PaymentNo )
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE Customer
( 
	CustomerID         VARCHAR2(6)  NOT NULL ,
	customerName       VARCHAR2(30)  NULL ,
	customerPhone      VARCHAR2(20)  NULL ,
	customerAddress    VARCHAR2(40)  NULL ,
	CONSTRAINT Customer_PK PRIMARY KEY   (CustomerID )
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE LightingSystem
( 
	ContractID         VARCHAR2(6)  NOT NULL ,
	PaymentNo          VARCHAR2(6)  NULL ,
	CustomerID         VARCHAR2(6)  NULL ,
	ReturnDate         DATE  NULL ,
	StartDate          DATE  NULL ,
	CONSTRAINT LightingSystem_PK PRIMARY KEY   (ContractID ),
	CONSTRAINT PayNo_CusP_LightS_FK FOREIGN KEY (PaymentNo) REFERENCES Customer_Payment(PaymentNo),
  CONSTRAINT CustID_Cust_LightS_FK FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT CustID_Cust_LightS_FK2 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE LightingSpec
( 
	ContractID         VARCHAR2(6)  NOT NULL ,
	LightingArea       VARCHAR2(30)  NULL ,
	CONSTRAINT LightingSpec_PK PRIMARY KEY   (ContractID ),
	CONSTRAINT ConID_LightSys_LightSpec_FK FOREIGN KEY (ContractID) REFERENCES LightingSystem(ContractID)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE Supplier
( 
	SupplierID         VARCHAR2(6)  NOT NULL ,
	SupplierName       VARCHAR2(40)  NULL ,
	SupplierAddress    VARCHAR2(60)  NULL ,
	CONSTRAINT Supplier_PK PRIMARY KEY   (SupplierID )
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE StockOrder
( 
	OrderID            VARCHAR2(6)  NOT NULL ,
	SupplierID         VARCHAR2(6)  NULL ,
	DeliveryDate       DATE  NULL ,
	OrderDate          DATE  NULL ,
	CONSTRAINT StockOrder_PK PRIMARY KEY   (OrderID ),
	CONSTRAINT SupID_Sup_SOrder_FK FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE SupplierPayment
( 
	SupplierPaymentNo  VARCHAR2(6)  NOT NULL ,
	OrderID            VARCHAR2(6)  NULL ,
	SupplierPayPrice   NUMBER(6,2)  NULL ,
	SupplierPayDate    DATE  NULL ,
	CONSTRAINT SupplierPayment_PK PRIMARY KEY   (SupplierPaymentNo ),
	CONSTRAINT OrderID_SOrder_SupPay_FK FOREIGN KEY (OrderID) REFERENCES StockOrder(OrderID)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE Department
( 
	DepartmentID       VARCHAR2(6)  NOT NULL ,
	DepartmentDesc     VARCHAR2(20)  NULL ,
	CONSTRAINT Department_PK PRIMARY KEY   (DepartmentID )
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE StockCategory
( 
	CategoryID         VARCHAR2(6)  NOT NULL ,
	DepartmentID       VARCHAR2(6)  NULL ,
	CategoryDesc       VARCHAR2(20)  NULL ,
	CONSTRAINT StockCategory_PK PRIMARY KEY   (CategoryID ),
	CONSTRAINT DepID_Dep_SCate_FK FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE Stock
( 
	StockCode          VARCHAR2(6)  NOT NULL ,
	CategoryID         VARCHAR2(6)  NULL ,
	StockDesc          VARCHAR2(30)  NULL ,
	StockQuantity      NUMBER(6)  NULL ,
	CONSTRAINT Stock_PK PRIMARY KEY   (StockCode ),
	CONSTRAINT CateID_SCate_Stock_FK FOREIGN KEY (CategoryID) REFERENCES StockCategory(CategoryID)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE StockOrderItem
( 
	StockCode          VARCHAR2(6)  NOT NULL ,
	OrderID            VARCHAR2(6)  NOT NULL ,
	StockOrderQuantity NUMBER(6)  NULL ,
	CONSTRAINT StockOrderItem_PK PRIMARY KEY   (StockCode ,OrderID ),
	CONSTRAINT SCode_Stock_SOrderItem_FK FOREIGN KEY (StockCode) REFERENCES Stock(StockCode),
CONSTRAINT OrderID_SOrder_SOrderItem_FK FOREIGN KEY (OrderID) REFERENCES StockOrder(OrderID)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE StockAllocated
( 
	ContractID         VARCHAR2(6)  NOT NULL ,
	StockCode          VARCHAR2(6)  NOT NULL ,
	NumberofUnits      NUMBER  NULL ,
	PricePerUnit       NUMBER(5,2)  NULL ,
	CONSTRAINT StockAllocated_PK PRIMARY KEY   (ContractID ,StockCode ),
	CONSTRAINT ConID_Light_SAllo_FK FOREIGN KEY (ContractID) REFERENCES LightingSystem(ContractID),
CONSTRAINT SCode_Stock_SAllo_FK FOREIGN KEY (StockCode) REFERENCES Stock(StockCode)
)
;

-- Create table Customer_Payment, create specified columns, value types and constraints -- 

CREATE TABLE Employee
( 
	EmployeeID         VARCHAR2(6)  NOT NULL ,
	DepartmentID       VARCHAR2(6)  NOT NULL ,
	ContractID         VARCHAR2(6)  NULL ,
	EmployeeName       VARCHAR2(30)  NULL ,
	CONSTRAINT Employee_PK PRIMARY KEY   (EmployeeID ,DepartmentID ),
	CONSTRAINT ConID_Light_Emp_FK FOREIGN KEY (ContractID) REFERENCES LightingSystem(ContractID),
 CONSTRAINT DepID_Dep_Emp_FK FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 CONSTRAINT DepID_Dep_Emp_FK2 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
)
;

-- insert data into rows --

-- insert data into table Customer --
insert into Customer values('C1001', 'C.Baker', '01237230', '11 Tempest View, Dublin');
insert into Customer values('C1002', 'W.Lawrence', '01394895', '9 CastleTown, Wexford');
insert into Customer values('C1003', 'R.Schmidt', '01297830', '221 Wicklow Heights, Wicklow');
insert into Customer values('C1004', 'J.Robertson', '01697230', '83 Templeroan Ave, Dublin');
insert into Customer values('C1005', 'A.Nelson', '01239560', '52 Prospect, Dublin');
insert into Customer values('C1006', 'W.Scott', '01230969', '18 Ballyboden, Wicklow');
insert into Customer values('C1007', 'J.Wagner', '01264238', '112 Blackrock, Wexford');
insert into Customer values('C1008', 'W.Walker', '01658230', '99 Longmile Road, Dublin');
insert into Customer values('C1009', 'P.Richards', '01937730', '201 Kimmage, Dublin');
insert into Customer values('C1010', 'H.Marshall', '01277730', '29 Teranure Green, Dublin');

-- insert data into table Customer_Payment --
insert into Customer_Payment values('P1001', '22 Sep 2001', '1000.00');
insert into Customer_Payment values('P1002', '05 Dec 2001', '250.00');
insert into Customer_Payment values('P1003', '07 Jan 2001', '300.00');
insert into Customer_Payment values('P1004', '09 Jun 2001', '400.00');
insert into Customer_Payment values('P1005', '12 Dec 2001', '200.00');
insert into Customer_Payment values('P1006', '15 Sep 2001', '600.00');
insert into Customer_Payment values('P1007', '20 Sep 2001', '250.00');
insert into Customer_Payment values('P1008', '21 Dec 2001', '750.00');
insert into Customer_Payment values('P1009', '15 Dec 2001', '1250.00');
insert into Customer_Payment values('P1010', '14 Jan 2002', '500.00');
insert into Customer_Payment values('P1011', '17 Dec 2002', '250.00');
insert into Customer_Payment values('P1012', '20 Sep 2002', '200.00');
insert into Customer_Payment values('P1013', '28 Sep 2002', '400.00');
insert into Customer_Payment values('P1014', '22 Dec 2002', '900.00');
insert into Customer_Payment values('P1015', '19 Mar 2002', '1000.00');

-- insert data into table LightingSystem --
insert into LightingSystem values('CO1001', 'P1001', 'C1001', '09 Sep 2001','17 Sep 2001');
insert into LightingSystem values('CO1002', 'P1002', 'C1002', '01 Dec 2001','03 Dec 2001');
insert into LightingSystem values('CO1003', 'P1003', 'C1003', '02 Jan 2001','05 Jan 2001');
insert into LightingSystem values('CO1004', 'P1004', 'C1004', '01 Jun 2001','08 Jun 2001');
insert into LightingSystem values('CO1005', 'P1005', 'C1005', '02 Dec 2001','08 Dec 2001');
insert into LightingSystem values('CO1006', 'P1006', 'C1006', '04 Sep 2001','12 Sep 2001');
insert into LightingSystem values('CO1007', 'P1007', 'C1007', '08 Sep 2001','14 Sep 2001');
insert into LightingSystem values('CO1008', 'P1008', 'C1008', '05 Dec 2001','17 Dec 2001');
insert into LightingSystem values('CO1009', 'P1009', 'C1009', '09 Dec 2001','12 Dec 2001');
insert into LightingSystem values('CO1010', 'P1010', 'C1010', '05 Jan 2001','08 Jan 2001');
insert into LightingSystem values('CO1011', 'P1011', 'C1006', '07 Dec 2002','13 Dec 2002');
insert into LightingSystem values('CO1012', 'P1012', 'C1001', '09 Sep 2002','12 Sep 2002');
insert into LightingSystem values('CO1013', 'P1013', 'C1003', '12 Sep 2002','18 Sep 2002');
insert into LightingSystem values('CO1014', 'P1014', 'C1009', '16 Dec 2002','20 Dec 2002');
insert into LightingSystem values('CO1015', 'P1015', 'C1001', '13 Mar 2002','16 Mar 2002');

-- insert data into table LightingSpec --
insert into LightingSpec values('CO1001', 'Garden Lighting');
insert into LightingSpec values('CO1002', 'Hall, Stairs, and Landing');
insert into LightingSpec values('CO1003', 'Hall');
insert into LightingSpec values('CO1004', 'LivingRoom');
insert into LightingSpec values('CO1005', 'Garden Lighting');
insert into LightingSpec values('CO1006', 'Landing');
insert into LightingSpec values('CO1007', 'Kitchen');
insert into LightingSpec values('CO1008', 'LivingRoom, Kitchen');
insert into LightingSpec values('CO1009', 'Landing, Stairs');
insert into LightingSpec values('CO1010', 'Hall');
insert into LightingSpec values('CO1011', 'Landing, Kitche');
insert into LightingSpec values('CO1012', 'Hall');
insert into LightingSpec values('CO1013', 'Garden Lighting');
insert into LightingSpec values('CO1014', 'Landing');
insert into LightingSpec values('CO1015', 'Stairs');

-- insert data into table Department --
insert into Department values('D1001', 'Design');
insert into Department values('D1002', 'Fitters');
insert into Department values('D1003', 'Shop floor');
insert into Department values('D1004', 'Electricians');

-- insert data into table StockCategory --
insert into StockCategory values('CA1001', 'D1002', 'Light');
insert into StockCategory values('CA1002', 'D1004', 'Electrical');
insert into StockCategory values('CA1003', 'D1003', 'Sundry');

-- insert data into table Stock --
insert into Stock values('L1001', 'CA1001', 'Recessed lights', '70');
insert into Stock values('L1002', 'CA1002', '1.5m fitting', '30');
insert into Stock values('L1003', 'CA1001', 'Wall light', '100');
insert into Stock values('L1004', 'CA1001', 'Centre light', '50');
insert into Stock values('L1005', 'CA1001', 'Recessed lights', '125');
insert into Stock values('L1006', 'CA1003', 'Set of twist bulbs 40w', '90');
insert into Stock values('L1007', 'CA1002', 'Domestic wiring drum', '175');
insert into Stock values('L1008', 'CA1002', 'Outdoor wiring drum', '65');
insert into Stock values('L1009', 'CA1002', 'Outdoor sockets', '80');
insert into Stock values('L1010', 'CA1002', '3.5m fitting', '75');

-- insert data into table Supplier --
insert into Supplier values('SU1001', 'Electrical Wholesale', 'Unit 50, John Good Industrial Estate, D 19');
insert into Supplier values('SU1002', 'Lighting Ltd', '15 Parkmore Industrial Estate, D 12');
insert into Supplier values('SU1003', 'Sundry Goods', '2 Sandyford Industrial Estate, D 18');

-- insert data into table StockOrder --
insert into StockOrder values('OR1001', 'SU1001', '13 Jan 2001', ' 17 Jan 2001');
insert into StockOrder values('OR1002', 'SU1001', '05 Feb 2001', ' 09 Feb 2001');
insert into StockOrder values('OR1003', 'SU1002', '02 Mar 2001', ' 11 Mar 2001');
insert into StockOrder values('OR1004', 'SU1003', '19 Apr 2001', ' 25 Apr 2001');
insert into StockOrder values('OR1005', 'SU1002', '08 July 2001', ' 13 July 2001');
insert into StockOrder values('OR1006', 'SU1001', '22 Nov 2001', ' 27 Nov 2001');
insert into StockOrder values('OR1007', 'SU1003', '03 Dec 2001', ' 11 Dec 2001');
insert into StockOrder values('OR1008', 'SU1003', '11 Jan 2002', ' 18 Jan 2002');
insert into StockOrder values('OR1009', 'SU1002', '06 Feb 2002', ' 16 Feb 2002');
insert into StockOrder values('OR1010', 'SU1002', '14 Mar 2002', ' 20 Mar 2002');

-- insert data into table Employee --
insert into Employee values('EM1001', 'D1001', 'CO1001', 'Carolyn Wheeler');
insert into Employee values('EM1002', 'D1001', 'CO1001', 'Adam Marshall');
insert into Employee values('EM1003', 'D1002', 'CO1003', 'Theresa Hamilton');
insert into Employee values('EM1004', 'D1002', 'CO1002', 'Jeffrey Mccoy');
insert into Employee values('EM1005', 'D1002', 'CO1005', 'Todd Reed');
insert into Employee values('EM1006', 'D1003', 'CO1008', 'Diane Walker');
insert into Employee values('EM1008', 'D1003', 'CO1009', 'Virginia Bryant');
insert into Employee values('EM1009', 'D1004', 'CO1012', 'Kenneth Willis');
insert into Employee values('EM1010', 'D1004', 'CO1009', 'Lillian Allen');

-- insert data into table SupplierPayment --
insert into SupplierPayment values('SP1001', 'OR1001', '2000.00', '18 Jan 2001');
insert into SupplierPayment values('SP1002', 'OR1002', '1500.00', '10 Feb 2001');
insert into SupplierPayment values('SP1003', 'OR1003', '1750.00', '12 Mar 2001');
insert into SupplierPayment values('SP1004', 'OR1004', '700.00', '25 Apr 2001');
insert into SupplierPayment values('SP1005', 'OR1005', '2500.00', '15 July 2001');
insert into SupplierPayment values('SP1006', 'OR1006', '1600.00', '28 Nov 2001');
insert into SupplierPayment values('SP1007', 'OR1007', '900.00', '13 Dec 2001');
insert into SupplierPayment values('SP1008', 'OR1008', '1200.00', '25 Jan 2002');
insert into SupplierPayment values('SP1009', 'OR1009', '1800.00', '19 Feb 2002');
insert into SupplierPayment values('SP1010', 'OR1010', '2900.00', '27 Mar 2002');

-- insert data into table StockAllocated --
insert into StockAllocated values('CO1001', 'L1001', '10', '30');
insert into StockAllocated values('CO1002', 'L1001', '10', '25');
insert into StockAllocated values('CO1003', 'L1002', '12', '13.50');
insert into StockAllocated values('CO1004', 'L1004', '6', '4.99');
insert into StockAllocated values('CO1005', 'L1010', '10', '30');
insert into StockAllocated values('CO1006', 'L1006', '10', '15.99');
insert into StockAllocated values('CO1007', 'L1008', '2', '150');
insert into StockAllocated values('CO1008', 'L1001', '2', '299');
insert into StockAllocated values('CO1009', 'L1002', '10', '15');
insert into StockAllocated values('CO1010', 'L1001', '10', '45');

-- insert data into table StockOrderItem --
insert into StockOrderItem values('L1001', 'OR1001', '10');
insert into StockOrderItem values('L1003', 'OR1002', '25');
insert into StockOrderItem values('L1005', 'OR1003', '60');
insert into StockOrderItem values('L1004', 'OR1004', '50');
insert into StockOrderItem values('L1010', 'OR1005', '99');
insert into StockOrderItem values('L1001', 'OR1006', '30');
insert into StockOrderItem values('L1001', 'OR1007', '150');
insert into StockOrderItem values('L1002', 'OR1008', '60');
insert into StockOrderItem values('L1002', 'OR1009', '20');
insert into StockOrderItem values('L1007', 'OR1010', '117');


-- Queries --

select EmployeeName from employee;

select AVG(CustomerPayPrice) from Customer_Payment;

-- Inner Join two tables --
select DeliveryDate 
from StockOrderItem o
inner join StockOrder a
on o.OrderID=a.OrderID
ORDER BY a.OrderDate;

-- Inner Join three tables --

select l.ContractID, e.EmployeeID, d.DepartmentDesc
from LightingSystem l
inner join Employee e
on l.ContractID=e.ContractID
inner join Department d 
on e.DepartmentID=d.DepartmentID
ORDER BY l.ContractID
;

-- Left Outer Join tables --

SELECT Customer.customerName, LightingSystem.ContractID
FROM Customer
LEFT JOIN LightingSystem
ON Customer.CustomerID=LightingSystem.CustomerID
ORDER BY Customer.customerName;

-- Right Outer Join Tables --

SELECT Department.DepartmentID, Employee.EmployeeName
FROM Department
RIGHT JOIN Employee
ON Department.DepartmentID=Employee.DepartmentID
ORDER BY Employee.DepartmentID;

-- Alterations --

-- update table--
UPDATE Customer
SET customerName='C.Black'
WHERE CustomerName='C.Baker';

-- Add column to the table and a value constraint --
ALTER TABLE Customer
ADD customerCity VARCHAR2(30) default 'Dublin';

-- Modify a column on a table --
ALTER TABLE Customer
MODIFY customerCity VARCHAR2(20) default 'Dublin';

-- Drop column in a table --
ALTER TABLE Customer
DROP COLUMN customerCity;

-- Drop constraint on a table --
ALTER TABLE LightingSystem
DROP CONSTRAINT PayNo_CusP_LightS_FK;
