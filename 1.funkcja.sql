CREATE DEFINER=`root`@`localhost` FUNCTION `jaki_standard`(nr_pokoju INT) RETURNS varchar(20) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE standard varchar(20);
IF (nr_pokoju='1' or nr_pokoju='7' or nr_pokoju='15') then
SET standard='wysoki';
ELSEIF (nr_pokoju='2') then
SET  standard='sredni';
ELSEIF (nr_pokoju='3' or nr_pokoju='11') then
SET  standard='wysoki';
ELSEIF (nr_pokoju='4') then
SET  standard='wysoki';
ELSEIF (nr_pokoju='5' or nr_pokoju='14') then
SET  standard='niski';
ELSEIF (nr_pokoju='6') then
SET  standard='niski';
ELSEIF (nr_pokoju='8' or nr_pokoju='9') then
SET  standard='sredni';
ELSEIF (nr_pokoju='10') then
SET standard='sredni';
ELSEIF (nr_pokoju='12') then
SET  standard='niski';
ELSEIF (nr_pokoju='13') then
SET  standard='sredni';
END IF;

RETURN standard;
END