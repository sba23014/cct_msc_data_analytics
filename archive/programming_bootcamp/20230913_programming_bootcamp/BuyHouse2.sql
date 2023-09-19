DROP DATABASE IF EXISTS Buyhouse2;

CREATE DATABASE Buyhouse2;

USE Buyhouse2;

CREATE TABLE Branch(
Bno VARCHAR(4) NOT NULL, 
Street VARCHAR(40),
Area VARCHAR(20),
City VARCHAR(20), 
Pcode VARCHAR(9) NOT NULL, 
Tel_No VARCHAR(12) NOT NULL, 
Fax_No VARCHAR(20),
PRIMARY KEY (BNo)
);

INSERT INTO Branch VALUES ("B5","22 Deer Rd","Sidcup","London","SW1 2EH","0171-8861212","0171-8861214");
INSERT INTO Branch VALUES ("B3","163 Main St","Partick","Glasgow","G11 9QX","0141-3392178","0141-3394439");
INSERT INTO Branch VALUES ("B4","32 Manse Rd","Leigh","Bristol","BS99 1NZ","0117-9161170","0117-7761114");
INSERT INTO Branch VALUES ("B2","56 Clover Dr",NULL,"London","NW10 6EU","0181-9631030","0181-4537992");
INSERT INTO Branch VALUES ("B7","16 Argyll St",NULL,"Aberdeen","AB2 3SU","0131-4561010","0245-8777912");

CREATE TABLE Staff(
Sno VARCHAR(4) NOT NULL, 
Fname VARCHAR(16) NOT NULL, 
Lname VARCHAR(16) NOT NULL, 
Address VARCHAR(40), 
TelNo VARCHAR(20), 
Position VARCHAR(20) NOT NULL,
Sex VARCHAR(1) NOT NULL,
DOB DATE NOT NULL,
SALARY DECIMAL(9,2),
NIN VARCHAR(9) NOT NULL,
Bno VARCHAR(4) NOT NULL,
PRIMARY KEY (Sno),
FOREIGN KEY (Bno) REFERENCES Branch (Bno) ON UPDATE CASCADE
);

INSERT INTO Staff VALUES ("SL21","John","White","19 Taylor St,London","0171-8445112","Manager","M","1945-10-01",30000,"WK442011B","B5");
INSERT INTO Staff VALUES ("SG37","Ann","Beech","81 George St,Glasgow","0141-8483345","Senior Assistant","F","1960-01-10",12000,"Wl432514C","B3");
INSERT INTO Staff VALUES ("SG14","David","Ford","63 Ashby St,Glasgow","0141-3392177","Deputy","M","1958-03-24",18000,"WL220658D","B3");
INSERT INTO Staff VALUES ("SA9","Mary","Howe","2 Elm Place,Aberdeen",NULL,"Assistant","F","1970-02-19",9000,"WM532187D","B7");
INSERT INTO Staff VALUES ("SG5","Susan","Brand","5 Gt Western Rd,Glasgow","0141-3342001","Manager","F","1940-06-03",24000,"WK588932E","B3");
INSERT INTO Staff VALUES ("SL41","Julie","Lee","28 Malvern St, Kilburn","0181-5543541","Assistant","F","1965-06-13",9000,"WA290573K","B5");

CREATE TABLE Owner(
Ono VARCHAR(4) NOT NULL,
Fname VARCHAR(16) NOT NULL, 
Lname VARCHAR(16) NOT NULL, 
Address VARCHAR(40), 
Tel_No VARCHAR(20) NOT NULL,
PRIMARY KEY (Ono)
);

INSERT INTO Owner VALUES("CO46","Joe","Keogh","2 Fergus Dr, Banchory, Aberdeen AB2 7SZ","01224-861212");
INSERT INTO Owner VALUES("CO87","Carol","Farrel","6 Achray St, Glasgow, G32 9DX","0141-357-7419");
INSERT INTO Owner VALUES("CO40","Tina","Murphy","63 Well St, Shawlands, Glasgow G42","0141-934-1728");
INSERT INTO Owner VALUES("CO93","Tony","Shaw","12 Park Pl, Hillhead, Glasgow G4 OQR","0141-225-7025");

CREATE TABLE Property_For_Rent(
Pno VARCHAR(4) NOT NULL,
Street VARCHAR(40),
Area VARCHAR(20),
City VARCHAR(20), 
Pcode VARCHAR(9) NOT NULL,
Type VARCHAR(9),
Rooms SMALLINT,
Rent DECIMAL(7,2),
Ono VARCHAR(4),
Sno VARCHAR(4),
Bno VARCHAR(4),
PRIMARY KEY (Pno),
FOREIGN KEY (ONo) REFERENCES Owner (ONo) ON UPDATE CASCADE,
FOREIGN KEY (SNo) REFERENCES Staff (SNo) ON UPDATE CASCADE,
FOREIGN KEY (BNo) REFERENCES Branch (BNo) ON UPDATE CASCADE
);

INSERT INTO Property_For_Rent VALUES ("PA14","16 Hollyhead","Dee","Aberdeen","AB7 5SU","House",6,650,"CO46","SA9","B7");
INSERT INTO Property_For_Rent VALUES ("PL94","6 Argyll St","Kilburn","London","NW2","Flat",4,400,"CO87","SL41","B5");
INSERT INTO Property_For_Rent VALUES ("PG04","6 Lawrence St","Partick","Glasgow","G11 9QX","Flat",3,350,"CO40","SG14","B3");
INSERT INTO Property_For_Rent VALUES ("PG36","2 Manor Rd",NULL,"Glasgow","G32 4QX","Flat",3,375,"CO93","SG37","B3");
INSERT INTO Property_For_Rent VALUES ("PG21","18 Dale Rd","Hyndland","Glasgow","G12","House",5,600,"CO87","SG37","B3");
INSERT INTO Property_For_Rent VALUES ("PG16","5 Novar Dr","Hyndland","Glasgow","G12 9AX","Flat",4,450,"CO93","SG14","B3");


CREATE TABLE Renter(
Rno VARCHAR(4) NOT NULL,
Fname VARCHAR(16) NOT NULL, 
Lname VARCHAR(16) NOT NULL, 
Address VARCHAR(40), 
Tel_No VARCHAR(20) NOT NULL,
Pref_Type VARCHAR(12),
Max_Rent DECIMAL(7,2),
PRIMARY KEY (Rno)
);

INSERT INTO Renter VALUES ("CR76","John","Kay","56 High St, Putney, London, SW1 4EH","0171-774-5632","Flat",425);
INSERT INTO Renter VALUES ("CR56","Aline","Stewart","64 Fern Dr. Pollock, Glasgow, G42 OBL","0141-848-1825","Flat",350);
INSERT INTO Renter VALUES ("CR74","Mike","Ritchie","18 Tain St, Gourock., PA1G 1YQ","01475-392178","House",750);
INSERT INTO Renter VALUES ("CR62","Mary","Tregear","5 Tarbot Rd,Kidary, Aberdeen, AB9 3ST","01224-196720","Flat",600);


CREATE TABLE Viewing(
Rno VARCHAR(4) NOT NULL,
Pno VARCHAR(4) NOT NULL,
Date DATE NOT NULL,
Comment VARCHAR(40),
PRIMARY KEY (Rno,Pno),
FOREIGN KEY (Rno) REFERENCES  Renter(Rno) ON UPDATE CASCADE,
FOREIGN KEY (Pno) REFERENCES Property_for_rent(Pno) ON UPDATE CASCADE
);

INSERT INTO Viewing Values("CR56","PA14","1995-05-24","Too Small");
INSERT INTO Viewing Values("CR76","PG04","1995-04-20","Too Remote");
INSERT INTO Viewing Values("CR56","PG04","1995-05-26",NULL);
INSERT INTO Viewing Values("CR62","PA14","1995-05-14","No Dining Room");
INSERT INTO Viewing Values("CR56","PG36","1995-04-28",NULL);
