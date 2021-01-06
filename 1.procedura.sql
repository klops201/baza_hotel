CREATE DEFINER=`root`@`localhost` PROCEDURE `dane`(IN ID INT)
BEGIN
SELECT * FROM klient WHERE id_klienta = ID;
END