
DROP TABLE EventResults CASCADE CONSTRAINTS PURGE;

DROP TABLE Compeditor CASCADE CONSTRAINTS PURGE;

DROP TABLE Event CASCADE CONSTRAINTS PURGE;

DROP TABLE Discipline CASCADE CONSTRAINTS PURGE;

DROP TABLE Sports CASCADE CONSTRAINTS PURGE;

CREATE TABLE Sports
(
	sportCode            NUMERIC NOT NULL ,
	sportName            VARCHAR2(20) NULL ,
CONSTRAINT  XPKSports PRIMARY KEY (sportCode)
);

CREATE TABLE Discipline
(
	disciplineID         INTEGER NOT NULL ,
	disciplineName       VARCHAR2(20) NULL ,
	sportCode            NUMERIC NULL ,
CONSTRAINT  XPKDiscipline PRIMARY KEY (disciplineID),
CONSTRAINT R_8 FOREIGN KEY (sportCode) REFERENCES Sports (sportCode)
);

CREATE TABLE Event
(
	eventID              INTEGER NOT NULL ,
	eventName            VARCHAR2(20) NULL ,
	eventDate            DATE NULL ,
	disciplineID         INTEGER NULL ,
CONSTRAINT  XPKEvent PRIMARY KEY (eventID),
CONSTRAINT R_7 FOREIGN KEY (disciplineID) REFERENCES Discipline (disciplineID)
);

CREATE TABLE Compeditor
(
	compID               VARCHAR2(20) NOT NULL ,
	compName             CHAR(18) NULL ,
	compDOB              CHAR(18) NULL ,
CONSTRAINT  XPKCompeditor PRIMARY KEY (compID)
);

CREATE TABLE EventResults
(
	position             INTEGER NOT NULL ,
	eventID              INTEGER NULL ,
	compID               VARCHAR2(20) NULL ,
CONSTRAINT  XPKEventResults PRIMARY KEY (position),
CONSTRAINT R_9 FOREIGN KEY (eventID) REFERENCES Event (eventID),
CONSTRAINT R_10 FOREIGN KEY (compID) REFERENCES Compeditor (compID)
);
