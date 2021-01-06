CREATE DEFINER=`root`@`localhost` TRIGGER `cennik_uslug_UPDATE` AFTER UPDATE ON `cennik_uslug` FOR EACH ROW BEGIN
INSERT INTO ostatnie_zmiany(typ_zmiany,data_zmiany) VALUES('cena_pokoi',CURRENT_DATE());
END