CREATE TABLE cennik_uslug (
typ_uslugi INT NOT NULL AUTO_INCREMENT,
bufet_1doba VARCHAR(15) ,
miejsce_parkingowe_1doba VARCHAR(10),
basen_1godzina VARCHAR(10),
silownia_1godzina VARCHAR(10),
sala_kinowa_1seans VARCHAR(10),
PRIMARY KEY (typ_uslugi)
);
INSERT INTO cennik_uslug (bufet_1doba,miejsce_parkingowe_1doba,basen_1godzina,silownia_1godzina,sala_kinowa_1seans)
VALUES ('50 zl','50 zl','21,50 zl','7,50 zl','25 zl');

CREATE TABLE cennik_pokoi (
typ_pokoju INT NOT NULL AUTO_INCREMENT,
standard VARCHAR(15) ,
doba_pokoj_1os VARCHAR(10),
doba_pokoj_2os VARCHAR(10),
doba_pokoj_3os VARCHAR(10),
doba_pokoj_4os VARCHAR(10),
dziecko VARCHAR(10),
PRIMARY KEY (typ_pokoju)
);
INSERT INTO cennik_pokoi  (standard,doba_pokoj_1os,doba_pokoj_2os,doba_pokoj_3os,doba_pokoj_4os,dziecko)
VALUES ('niski','100 zl','180 zl','260 zl','340 zl','50 zl'),
('sredni','120 zl','220 zl','320 zl','420 zl','50 zl'),
('wysoki','140 zl','260 zl','380 zl','500 zl','50 zl');

CREATE TABLE uslugi_extra (
kod_uslugi INT NOT NULL AUTO_INCREMENT,
nr_rezerwacji INT NOT NULL,
bufet VARCHAR(4) NOT NULL,
miejsce_parkingowe VARCHAR(4) NOT NULL,
basen VARCHAR(4) NOT NULL,
silownia VARCHAR(4) NOT NULL,
sala_kinowa VARCHAR(4) NOT NULL,
PRIMARY KEY (kod_uslugi)
);
INSERT INTO uslugi_extra (nr_rezerwacji,bufet,miejsce_parkingowe,basen,silownia,sala_kinowa)
VALUES (2,'nie','tak','nie','tak','nie'),
(15,'nie','nie','tak','nie','nie'),
(7,'nie','tak','nie','nie','nie'),
(5,'nie','tak','tak','nie','tak'),
(12,'tak','tak','nie','nie','tak'),
(3,'tak','tak','tak','nie','tak'),
(9,'nie','tak','nie','nie','nie'),
(11,'tak','tak','tak','nie','nie'),
(6,'nie','nie','nie','tak','tak'),
(14,'nie','tak','nie','nie','nie'),
(10,'tak','nie','nie','tak','nie'),
(1,'nie','tak','nie','nie','tak'),
(13,'tak','nie','tak','nie','nie'),
(4,'tak','nie','nie','tak','tak'),
(8,'nie','nie','nie','tak','nie');

CREATE TABLE rezerwacja (
nr_rezerwacji INT NOT NULL AUTO_INCREMENT,
nr_pokoju INT ,
id_klienta INT,
dzieci VARCHAR(4),
ilosc_dzieci INT,
pobyt_od DATE,
pobyt_do DATE,
PRIMARY KEY (nr_rezerwacji)
);
INSERT INTO rezerwacja (nr_pokoju,id_klienta,dzieci,ilosc_dzieci,pobyt_od,pobyt_do)
VALUES (2,3,'nie',0,'2020-12-06','2020-12-12'),(3,15,'nie',0,'2020-11-30','2020-12-02'),
(15,9,'nie',0,'2020-11-13','2020-11-15'),(6,13,'tak',2,'2020-11-12','2020-11-17'),
(12,1,'tak',1,'2020-12-01','2020-12-07'),(13,4,'nie',0,'2020-12-15','2020-12-20'),
(8,5,'nie',0,'2020-12-27','2020-12-30'),(5,12,'nie',0,'2020-11-25','2020-11-27'),
(10,14,'nie',0,'2020-12-03','2020-12-05'),(14,7,'tak',1,'2020-11-05','2020-11-10'),
(11,11,'nie',0,'2020-11-17','2020-11-20'),(1,2,'tak',1,'2020-11-09','2020-11-10'),
(4,6,'nie',0,'2020-12-04','2020-12-07'),(7,8,'nie',0,'2020-11-20','2020-11-25'),
(9,10,'nie',0,'2020-11-01','2020-11-06');

CREATE TABLE pokoj (
nr_pokoju INT NOT NULL AUTO_INCREMENT,
id_klienta INT,
pojemnosc INT,
standard VARCHAR(50),
PRIMARY KEY (nr_pokoju)
);
INSERT INTO pokoj (id_klienta,pojemnosc,standard)
VALUES (2,2,'wysoki'),(3,3,'sredni'),(15,1,'wysoki'),(6,3,'wysoki'),
(12,2,'niski'),(13,4,'niski'),(8,2,'wysoki'),(5,2,'sredni'),(10,2,'sredni'),
(14,1,'sredni'),(11,1,'wysoki'),(1,3,'niski'),(4,4,'sredni'),(7,2,'niski'),
(9,2,'wysoki');

CREATE TABLE platnosc (
id_platnosci INT NOT NULL AUTO_INCREMENT,
kod_uslugi INT NOT NULL,
koszt_pln FLOAT NOT NULL,
forma_platnosci VARCHAR(30) NOT NULL,
status_platnosci VARCHAR(30) NOT NULL,
PRIMARY KEY (id_platnosci)
);
INSERT INTO platnosc (kod_uslugi,koszt_pln,forma_platnosci,status_platnosci)
VALUES (12,2370,'gotowka','zakonczono'),
(1,355,'karta platnicza','zakonczono'),
(6,813,'gotowka','zakonczono'),
(14,2212.50,'karta platnicza','oczekuje'),
(4,2189,'karta platnicza','zakonczono'),
(9,2262.5,'karta platnicza','zakonczono'),
(3,810,'gotowka','zakonczono'),
(15,375,'gotowka','zakonczono '),
(7,340,'karta platnicza','oczekuje'),
(11,1237.5,'karta platnicza','zakonczono'),
(8,784.5,'karta platnicza','zakonczono'),
(5,435,'karta platnicza','zakonczono'),
(13,1354.5,'gotowka','zakonczono'),
(2,1550,'karta platnicza','oczekuje'),
(10,1207.5,'karta platnicza','zakonczono');

CREATE TABLE OSTATNIE_ZMIANY (
nr_zmiany INT NOT NULL AUTO_INCREMENT,
typ_zmiany VARCHAR(15) ,
data_zmiany DATE,
PRIMARY KEY (nr_zmiany));
INSERT INTO OSTATNIE_ZMIANY (typ_zmiany,data_zmiany)
VALUES ('cena_uslug','2020-10-15'),('cena_pokoi','2020-11-10'),('cena_uslug','2020-12-23');

CREATE TABLE klient (
id_klienta INT NOT NULL AUTO_INCREMENT,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
data_ur DATE NOT NULL,
miasto VARCHAR(50) NOT NULL,
kraj VARCHAR(50) NOT NULL,
telefon VARCHAR(30),
PRIMARY KEY (id_klienta)
);
INSERT INTO klient (imie,nazwisko,data_ur,miasto,kraj,telefon)
VALUES ('Magda','Stasiak','1988-10-12','Warszawa','Polska','567-204-786'),
('Klaudiusz','Jaworski','1990-09-23','Biala Podlaska','Polska','647-982-107'),
('Andrzej','Maciejewski','1993-07-26','Sosnowiec','Polska','364-069-683'),
('Adrianna','Kowal','1988-11-09','Ostroleka','Polska','274-962-193'),
('Bratislav','Ajlec','1990-03-31','Kresnice','Slowenia','560-950-224'),
('Gracjan','Kowal','2000-03-10','Kalisz','Polska','879-003-456'),
('Lena','Borowska','1999-10-19','Gliwice','Polska','090-684-239'),
('Mandy','Klein','1976-10-13','Albersweiler ','Niemcy','040-96-50-86'),
('Boguslaw','Tomczyk','1985-07-03','Siedlce','Polska','365-882-336'),
('Jagoda','Lis','1989-04-08','Przemysl','Polska','097-357-660'),
('William','Vertefeuille','1968-10-12','Lorient','Francja','04-33-79-30-35'),
('Jakub','Matuszewski','1983-06-04','Jaworzno','Polska','978-366-230'),
('Lena','Szczepanska','1965-10-20','Myslowice','Polska','456-089-534'),
('Julie','Leblanc','1981-09-23','Albi','Francja','03-52-37-11-08'),
('Weronika','Pawlak','1978-01-02','Torun','Polska','673-497-217');

