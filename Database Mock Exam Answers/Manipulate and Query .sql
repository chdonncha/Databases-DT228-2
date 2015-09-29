---------------------------------------------------------------------------------------------------------------------------
						SQL Query & Manipulate Examples.
---------------------------------------------------------------------------------------------------------------------------				
						
               						Lab Class Exam Mock

---------------------------------------------------------------------------------------------------------------------------	


--List details of all animals in stock purchased in 2014, sorted in order of animal name with animal names in uppercase.

	SELECT animalid, UPPER(animalname), dateshoppurchased, speciesCode from animal 
	WHERE dateshoppurchased between '01 JAN 2014' AND '01 JAN 2015' ORDER BY ANIMALNAME;


--------------------------------------------------------------------------------------------------------------------------


/* If you use like '%14%'  then this will match dates with a day value of 14 as well as a year value of 14*/

/*Count the number of animals sold by Peter’s Pets. 
  Format the output so that it reads “The number of animals sold is “ followed by the number.*/

	SELECT 'The number of animals ever sold by Peters Pets is ', COUNT(*) FROM ANIMALSALE ;


---------------------------------------------------------------------------------------------------------------------------


	/* You can use the concat function here also*/

--o	Count the number of each species of animal sold in 2012.

	Select custid, count(*) from animalsale 
	WHERE saledate between '01 jan 2012' and '31 dec 2012' group by custid;


---------------------------------------------------------------------------------------------------------------------------


--o	Find the average price of an animal sold by Peters Pets.

	select avg(speciesprice) from species;


---------------------------------------------------------------------------------------------------------------------------


--o	Alter the customer table to add a column address of type varchar2(30).

	alter table customer add (address varchar2(30));


---------------------------------------------------------------------------------------------------------------------------


--o	Alter the customer table to add a column that the email address must be unique.

	alter table customer add constraint email_uniq unique(custemail);


---------------------------------------------------------------------------------------------------------------------------

						Olympics SQL Database Query Examples

---------------------------------------------------------------------------------------------------------------------------


--List all details of all spots--

	select * from SPORT;


---------------------------------------------------------------------------------------------------------------------------


--List all details of Discipline--

	select * from DISCIPLINE;


---------------------------------------------------------------------------------------------------------------------------


--List details of all events that were scheduled between the 3rd and 11th of June--

	select * from EVENT

	WHERE EVENTDATE >= '03-JUNE-12'
	AND EVENTDATE <= '11-JUNE-12';


---------------------------------------------------------------------------------------------------------------------------


--Find details of all competitors with the letter a in their name--

	select * from COMPETITOR;


---------------------------------------------------------------------------------------------------------------------------