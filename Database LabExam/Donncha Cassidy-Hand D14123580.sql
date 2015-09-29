-- Drop tables and removes all constraints --
--Q1--

DROP TABLE LightDesignItems CASCADE CONSTRAINTS PURGE;

DROP TABLE LightStock CASCADE CONSTRAINTS PURGE;

DROP TABLE Specification CASCADE CONSTRAINTS PURGE;

DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

CREATE TABLE Customer
(
	customerID           NUMBER(6) NOT NULL ,
	customerName         VARCHAR2(30) NULL ,
  customerPhone        VARCHAR2(20) NULL ,
	customerAddress      VARCHAR2(40) NULL ,
CONSTRAINT  XPKCustomer PRIMARY KEY (customerID)
);


-- Create Tables, identifying the Attributes, Logical Data types, 
-- Primary keys and Foreign Keys --

CREATE TABLE Specification
(
	specificationID      NUMBER (6) NOT NULL ,
	customerID           NUMBER(6) NULL ,
	specDate             DATE NULL ,
	returnDate           DATE NULL ,
  specDesc             VARCHAR2(30) NULL ,
	designerName         VARCHAR2(30) NULL ,
CONSTRAINT  XPKSpecification PRIMARY KEY (specificationID),
CONSTRAINT Customer_Spec_FK FOREIGN KEY (customerID) REFERENCES Customer (customerID)
);

CREATE TABLE LightStock
(
	itemID               NUMBER(6) NOT NULL ,
	ItemDesc             VARCHAR2(30) NULL ,
	ItemPrice            NUMBER(5,2) NULL ,
CONSTRAINT  XPKLightStock PRIMARY KEY (itemID)
);

CREATE TABLE LightDesignItems
(
	specificationID      NUMBER NOT NULL ,
	itemID               NUMBER(6) NOT NULL ,
CONSTRAINT  XPKLightDesignItems PRIMARY KEY (specificationID,itemID),
CONSTRAINT Spec_LightDes_FK FOREIGN KEY (specificationID) REFERENCES Specification (specificationID),
CONSTRAINT Item_LightDes_FK FOREIGN KEY (itemID) REFERENCES LightStock (itemID)
);


-- Insert statements into the following tables --
--Q2--

-- Customer -- 

insert into Customer values(1001, 'D.Smith', '01237230', '11 The Hool, London');
insert into Customer values(1002, 'A.Byrne', '0910202020', 'The Sycamores, Blackrock Rock, Dublin');
insert into Customer values(1003, 'X.Dobbs', '0932020202', 'Windings, Greystones, Wicklow');

--LightStock-- 

insert into LightStock values(1001, 'Floor Lamp', 60.00);
insert into LightStock values(1002, 'Desk Lamp', 40.00);
insert into LightStock values(1003, 'Solar Garden Rock Light', 10.00);
insert into LightStock values(1004, 'Solar Fairy Lights', 20.00);

--Specification --

insert into Specification values(1001, 1001, '01 Jun 2012', '30 Jun 2012', 'Garden Lighting', 'B Golden');
insert into Specification values(1002, 1001, '01 Sep 2012', '14 Dec 2012', 'Hall, stairs, and landing', 'J.Kearns');
insert into Specification values(1003, 1002, '01 Jan 2012', '12 Sep 2012', 'Whole house-12 rooms', 'J.Kearns');

--LightDesignItems--

insert into LightDesignItems values(1001, 1003);
insert into LightDesignItems values(1001, 1004);
insert into LightDesignItems values(1002, 1001);
insert into LightDesignItems values(1002, 1002);
insert into LightDesignItems values(1002, 1004);


--Create Query for the Database--

--Q3--

--a.--

--List of specifications book in 2012 with specDesc been lowercase
SELECT specificationID, customerID, specDate, returnDate, LOWER(specDesc), designerName FROM Specification

WHERE specDate >= '01 Jan 2012'
AND specDate <= '31 Dec 2012' ORDER BY specDate;

--b.--

--Count number of items used by each lighting specification
SELECT specificationID, count(*) 
FROM LightDesignItems
group by SPECIFICATIONID;

--c.--

--Counter number of specifications designed by designer J.Kearns in 2012

SELECT specificationID, customerID, specDate, returnDate, LOWER(specDesc), designerName  FROM Specification

WHERE specDate >= '01 Jan 2012'
AND specDate <= '31 Dec 2012' 
AND designerName = 'J.Kearns'
;

--d.--

--Display the average price of the lighting stock--
SELECT avg(ItemPrice) FROM LIGHTSTOCK


--commit changes--
commit;