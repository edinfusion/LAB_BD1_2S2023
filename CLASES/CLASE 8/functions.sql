USE ejemplo;
DELIMITER $$
CREATE FUNCTION soloLetras(str VARCHAR(100))
RETURNS BOOLEAN DETERMINISTIC
BEGIN
RETURN IF (str REGEXP '^[a-zA-Zaáéíóú ]*$',true,false);
END $$
DELIMITER ;

select soloLetras("esta es 2 cadena");

DELIMITER $$
CREATE FUNCTION soloNumeros(num VARCHAR(100))
RETURNS BOOLEAN DETERMINISTIC
BEGIN
RETURN IF (num REGEXP '^[0-9]*$',true,false);
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION validarCicloDos(ciclo VARCHAR(2))
RETURNS BOOLEAN DETERMINISTIC
BEGIN
RETURN IF 
(BINARY ciclo = '1S' 
OR BINARY ciclo= '2S' 
OR BINARY ciclo= 'VD' 
OR BINARY ciclo= 'VJ', TRUE, FALSE);
END $$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION validarEmail(email VARCHAR(60))
RETURNS BOOLEAN DETERMINISTIC
BEGIN
RETURN IF 
(email REGEXP '^[a-zA-Z0-9]+@[a-zA-Z]+(\.[a-zA-Z]+)+$',true,false);
END $$
DELIMITER ;