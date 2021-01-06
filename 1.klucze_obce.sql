ALTER TABLE rezerwacja
ADD foreign key(id_klienta)REFERENCES klient(id_klienta);

ALTER TABLE rezerwacja
ADD foreign key(nr_pokoju)REFERENCES pokoj(nr_pokoju);

ALTER TABLE pokoj
ADD foreign key(id_klienta)REFERENCES klient(id_klienta);

ALTER TABLE uslugi_extra
ADD foreign key(nr_rezerwacji)REFERENCES rezerwacja(nr_rezerwacji);

ALTER TABLE platnosc
ADD foreign key(kod_uslugi)REFERENCES uslugi_extra(kod_uslugi);