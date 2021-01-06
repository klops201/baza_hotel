#pogldad na zamowione dodatkowe uslugi,jesli klient mialby watpliwosc np. skad wysoki koszt pobytu#
CREATE VIEW widok1 AS 
SELECT platnosc.id_platnosci,uslugi_extra.nr_rezerwacji,uslugi_extra.bufet,uslugi_extra.miejsce_parkingowe,uslugi_extra.basen,uslugi_extra.silownia,uslugi_extra.sala_kinowa
FROM platnosc INNER JOIN uslugi_extra ON uslugi_extra.kod_uslugi=platnosc.kod_uslugi;

#dane dla obslugi hotelu | obcokrajowcow obsluguje tylko personel z odpowiednimi kwalifikacjami jezykowymi#
CREATE VIEW widok2 AS 
SELECT rezerwacja.nr_pokoju, klient.imie,klient.nazwisko,klient.kraj
FROM rezerwacja LEFT JOIN klient ON rezerwacja.id_klienta=klient.id_klienta
WHERE klient.kraj NOT LIKE 'Polska';

#identyfikacja kto zalega z zaplata/komu system nie zaksiegowal oplat za pobyt#
CREATE VIEW widok3 AS 
SELECT rezerwacja.nr_pokoju, rezerwacja.id_klienta
FROM uslugi_extra INNER JOIN rezerwacja ON rezerwacja.nr_rezerwacji=uslugi_extra.nr_rezerwacji
INNER JOIN platnosc ON uslugi_extra.kod_uslugi=platnosc.kod_uslugi
WHERE platnosc.status_platnosci LIKE 'oczekuje';

#podglad na dane odnosnie pobytu klienta(czas/pokoj)#
CREATE VIEW widok4 AS 
SELECT rezerwacja.nr_pokoju, rezerwacja.id_klienta, rezerwacja.ilosc_dzieci, rezerwacja.pobyt_od,rezerwacja.pobyt_do,pokoj.pojemnosc, pokoj.standard
FROM pokoj RIGHT OUTER JOIN rezerwacja ON rezerwacja.nr_pokoju=pokoj.nr_pokoju ;

#dane statystyczne firmy#
CREATE VIEW widok5 AS 
SELECT 
COUNT(*) AS 'LiczbaZakwaterowan',
MAX(koszt_pln) AS 'NajdrozszyPobyt_pln',
AVG(koszt_pln) AS 'SredniKosztPobytu_pln',
MIN(koszt_pln) AS 'NajtanszyPobyt_pln'
FROM platnosc;

#kontakt do rodzica, jakby cos sie stalo dziecku bez opieki#
CREATE VIEW widok6 AS 
SELECT imie,nazwisko,telefon
FROM klient
WHERE id_klienta IN (SELECT id_klienta
FROM rezerwacja 
WHERE dzieci LIKE 'tak');

#dane statystyczne firmy#
CREATE VIEW widok7 AS 
SELECT kraj,COUNT(kraj) AS 'L_OsobZakwaterowanychZdanegoKraju'
FROM klient
GROUP BY kraj;

#dla osob ktore obchodza urodziny w styczniu, naliczany jest specjalny noworoczny rabat#
CREATE VIEW widok8 AS 
SELECT nr_pokoju,nr_rezerwacji
FROM rezerwacja
WHERE id_klienta IN (SELECT id_klienta
FROM klient
WHERE (MONTH(data_ur)=1));


#dane do ksiegowosci#
CREATE VIEW widok9 AS 
SELECT 
COUNT(*) AS 'LiczbaZakwaterowan',
SUM(koszt_pln) AS 'suma_przychodu'
FROM platnosc;

#klientom ,ktorzy korzystaje z basenu lub silowni dostarcza sie do pokoju dodatkowe wyposazenie(klapki,recznik itp.)#
CREATE VIEW widok10 AS 
SELECT nr_pokoju
FROM rezerwacja
WHERE nr_rezerwacji IN (SELECT nr_rezerwacji
FROM uslugi_extra
WHERE silownia LIKE 'tak' OR basen LIKE 'tak');

#pelny cennik#
CREATE VIEW widok11 AS 
SELECT *
FROM cennik_pokoi LEFT OUTER JOIN cennik_uslug
ON cennik_pokoi.typ_pokoju=cennik_uslug.typ_uslugi;
