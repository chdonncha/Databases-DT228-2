-- Peter's Pet Store SQL to create and populate tables

/* Drop Table statements are included for each table to ensure that 
when you create the tables no tables with the same name exist. This is 
particularly important if you need to make changes to the table definitions
and re-run this script */
DROP TABLE AnimalSale CASCADE CONSTRAINTS PURGE;

DROP TABLE Animal CASCADE CONSTRAINTS PURGE;

DROP TABLE Species CASCADE CONSTRAINTS PURGE;

DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

/* Create table statements
All foreign keys are named for the two tables involved in the relationship followed by fk
table1_table2_fk
Tables are created in the following order:
1st layer : Those with no foreign keys are created first
2nd layer: Tables that depend only on these tables i.e. have foreign key relationships to 1st layer
3rd layer: Tables that depend on 2nd layer or combination of 1st and 2nd layer
*/
-- Create table customer - holds details of all customers of Peter's Pets
CREATE TABLE Customer
(
	custID               NUMBER(6) NOT NULL ,
	custName             VARCHAR2(30) NULL ,
	custPhone            VARCHAR2(20) NULL ,
	custEmail            VARCHAR2(20) NULL ,
CONSTRAINT  Customer_PK PRIMARY KEY (custID)
);

-- Create table Species - holds details of all species stocked by Peter's Pets
CREATE TABLE Species
(
	speciesCode          NUMBER(6) NOT NULL ,
	speciesName          VARCHAR2(30) NULL ,
	speciesPrice         NUMBER(5,2) NULL , -- note the specification. This means number is 5 digits, 2 of
											-- which are after the decimal place. DO NOT USE DECIMAL here.
CONSTRAINT  Species_PK PRIMARY KEY (speciesCode)
);

-- Create table Animal - holds details of all animals (past and present) stocked by Peter's Pets
CREATE TABLE Animal
(
	animalID             NUMBER(6) NOT NULL ,
	animalName           VARCHAR2(30) NULL ,
	dateShopPurchased    DATE NULL ,
	speciesCode          NUMBER(6) NULL ,
CONSTRAINT  Animal_PK PRIMARY KEY (animalID),
CONSTRAINT Species_Animal_FK FOREIGN KEY (speciesCode) REFERENCES Species (speciesCode) ON DELETE SET NULL
);

-- Create table AnimalSale - holds details on sales of all animals to all customers. Each animal may be sold max.
-- once. Each customer can buy zero or more animals.
CREATE TABLE AnimalSale
(
	custID               NUMBER(6) NOT NULL ,
	animalID             NUMBER(6) NOT NULL ,
	saleDate             DATE NULL ,
CONSTRAINT  AnimalSale_PK PRIMARY KEY (custID,animalID),
CONSTRAINT Customer_AnimalSale_FK FOREIGN KEY (custID) REFERENCES Customer (custID),
CONSTRAINT Animal_AnimalSale_FK FOREIGN KEY (animalID) REFERENCES Animal (animalID)
);

-- Insert statements to populate the tables
-- Species inserted first
insert into species values(1, 'Dog', 9.99);
insert into species values (2, 'Cat', 10.20);
insert into species values(3, 'Mouse', 5.00);
insert into species values(4, 'Snake', 20.00);
-- Customers inserted next
insert into customer values(1, 'D. Smith', '01 237230', 'dsmith@yahoo.co.uk	');
insert into customer values(2, 'B. Byrne', '071 237820', 'bb@gmail.com');
insert into customer values(3, 'X. Dobbs', '093 2020202', 'xdobbs@mail.com');
-- Animals inserted next
insert into animal values(1, 'Tiny', '01 JUN 2010',1);
insert into animal values (2, 'Prince', '01 JUN 2010',1);
insert into animal values(3, 'Bonnie', '01 MAR 2014',1);
insert into animal values(4, 'CJ', '01 MAR 2014',2);
insert into animal values(5, 'Sid', '01 JUN 2014',2);
insert into animal values(6, 'Danger', '04 SEP 2014',3);
insert into animal values(7, 'Sid', '01 MAR 2014',4);
-- Animal sales inserted finally
insert into animalsale values(2,2,'11 Jun 2012');
insert into animalsale values(2,4,'12 MAR 2014');
insert into animalsale values(1,1,'01 Jun 2012');
insert into animalsale values(3,5,'04 SEP 2014');
insert into animalsale values(2,6,'12 MAR 2014');
-- Commit included to persist the data
commit;