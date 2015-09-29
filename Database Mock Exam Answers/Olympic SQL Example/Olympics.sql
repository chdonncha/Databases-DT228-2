Create table Sport (
sportCode Number(4) PRIMARY KEY,
sportName varchar2(30));

Create table Discipline (
disciplineID Number(4) PRIMARY KEY,
disciplineName varchar2(30),
sportCode	Number(4),
Constraint disc_sport_fk FOREIGN KEY (sportCode) REFERENCES Sport(sportCode));

Create table Event(
eventID Number(4) PRIMARY KEY,
eventName varchar2(30),
eventDate Date,
disciplineID Number(4), 
Constraint event_disc_fk FOREIGN KEY (disciplineID) REFERENCES Discipline (disciplineID));

Create table Competitor(
compID NUMBER(4) PRIMARY KEY,
compName varchar2(3),
compDOB date);

Create table EventResults(
eventID number(4),
compID  number(4),
Position number(4),
PRIMARY KEY (eventID, compID),
Constraint eventres_event_fk FOREIGN KEY (eventID) REFERENCES Event (eventID),
Constraint eventres_comp_fk FOREIGN KEY (compID) REFERENCES Competitor (compID));

insert into sport values(1, 'Volleyball');
insert into sport values (2, 'Cycling');
insert into sport values (3, 'Aquatics');
insert into discipline values (1, 'Beach',1);
insert into discipline values (2, 'Water', 2);
insert into discipline values (3, 'Track', 2);
insert into discipline values (4, 'Road', 2);
insert into discipline values (5,'Swimming', 3);
insert into discipline values (6, 'Syncrhonised Swimming', 3);

insert into event values (1, 'Mens Final',  '12 Jun 2012',1);
insert into event values (1, 'Womens Final',  '13 June 2012',1);
insert into event values (1, 'Mens Final',  '12 Jun 2012',2);
insert into event values (2, 'Womens Final', '13 June 2012',2);

insert into event values (3, 'Kerrin Men Final', '01 Jun 2012',3);
insert into event values (4, 'Omnium Men Final', '03 Jun 2012',3);
insert into event values (5, 'Kerrin Women Final',  '01 Jun 2012',3);
insert into event values (6, 'Omnium Women Final',  '03 Jun 2012',3);
insert into event values (7, 'Individual Men Final',  '21 Jun 2012',4);
insert into event values (8, 'Team Men Final', '23 Jun 2012',4);
insert into event values (9, 'Individual Women Final',  '14 Jun 2012',4);
insert into event values (10, 'Team Women Final', '08 Jun 2012',4);

insert into event(EVENTID, EVENTNAME, EVENTDATE, DISCIPLINEID) values (11, '100m Backstroke Final','09 Jun 2012',5);
insert into event values (12, '50m butterfly women Final','04 Jun 2012',5 );
insert into event values (13, '800m freestyle men Final','06 Jun 2012',5 );

insert into event values (14, 'Duet Women Final', '09 Jun 2012',5 );
insert into event values (15, 'Team Women Final', '10 Jun 2012',5);

insert into competitor values (1, 'J Black', '12 DEC 1990');
insert into competitor values (2, 'K White', '04 APR 1984');
insert into competitor values (3, 'B Green', '01 MAY 1992');


insert into EVENTRESULTS values (3, 1, 5);
insert into EVENTRESULTS VALUES (4, 1, 3);
insert into EVENTRESULTS VALUES (7, 1, 7);
insert into EVENTRESULTS VALUES (5, 2, 1);
insert into EVENTRESULTS VALUES (6, 2, 2);
insert into EVENTRESULTS VALUES (12, 3, 8);
insert into EVENTRESULTS VALUES (14, 3, 1);
insert into EVENTRESULTS values (5,3,8);
commit;