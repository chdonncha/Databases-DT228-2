DROP TABLE AnimalSale CASCADE CONSTRAINTS PURGE;

DROP TABLE Animal CASCADE CONSTRAINTS PURGE;

DROP TABLE Species CASCADE CONSTRAINTS PURGE;

DROP TABLE Customer CASCADE CONSTRAINTS PURGE;



CREATE TABLE Customer
(
	custID               INTEGER NOT NULL ,
	custName             VARCHAR2(30) NULL ,
	custPhone            INTEGER NULL ,
	custEmail            VARCHAR2(20) NULL ,
CONSTRAINT  XPKCustomer PRIMARY KEY (custID)
);

CREATE TABLE Species
(
	SpeciesCode          VARCHAR2(20) NOT NULL ,
	speciesName          VARCHAR2(30) NULL ,
	speciesPrice         DECIMAL(19,4) NULL ,
CONSTRAINT  XPKSpecies PRIMARY KEY (SpeciesCode)
);

CREATE TABLE Animal
(
	animalID             VARCHAR2(20) NOT NULL ,
	SpeciesCode          VARCHAR2(20) NOT NULL ,
	dateShopPurchased    CHAR(18) NULL ,
	animalName           VARCHAR2(30) NULL ,
CONSTRAINT  XPKAnimal PRIMARY KEY (animalID),
CONSTRAINT animal_species_fk FOREIGN KEY (SpeciesCode) REFERENCES Species (SpeciesCode)
);

CREATE TABLE AnimalSale
(
	custID               INTEGER NOT NULL ,
	animalID             VARCHAR2(20) NOT NULL ,
	saleDate             DATE NULL ,
CONSTRAINT  XPKAnimalSale PRIMARY KEY (custID,animalID),
CONSTRAINT animalsale_cusID_fk FOREIGN KEY (custID) REFERENCES Customer (custID),
CONSTRAINT animalsale_animalID_fk FOREIGN KEY (animalID) REFERENCES Animal (animalID)
);

insert into animal values(1, 'Dog', '9.99');

insert into species values(1, 'Dog', '9.99');
insert into species values(2, 'Cat', '10.20');
insert into species values(3, 'Mouse', '5.00');
insert into species values(4, 'Snake', '20.00');

insert into customer values(1, 'D.Smith', 01237230, 'dsmith@yahoo.co.uk');
