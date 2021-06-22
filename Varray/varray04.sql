-- selects para comprobar los tipos que hemos creado

select * from user_types ;

select * from user_varrays ;

-- para crear un nuevo tipo usando los varray
CREATE OR REPLACE TYPE DATO IS VARRAY(100) OF VARCHAR2(100);

-- como usarlo
DECLARE
   datos   dato;
BEGIN
   datos :=
      dato ('1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10');
   comun.imprime (datos (1));
END;

DECLARE
   datos   dato;
BEGIN
   datos :=
      dato ('1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10');
   comun.imprime (datos (1));
END;

-- Creamos una tabla 

CREATE TABLE PRUEBA_VARRAY
(
   C1   NUMBER,
   C2   DATO,
   C3   VARCHAR2 (60)
);

INSERT INTO PRUEBA_VARRAY
     VALUES (1, DATO ('UNO', 'DOS', 'TRES'), 'HOLA');
     
INSERT INTO PRUEBA_VARRAY
     VALUES (21, DATO ('AA1', 'BB1', 'CC1'), 'OTRO');     

-- RECUPERAR LA INFORMACION
SELECT * FROM PRUEBA_VARRAY;

-- Recuperar la columna c2 del varray prueba_varray y le doy el alias t2
SELECT c1, t2.*
  FROM PRUEBA_VARRAY, TABLE (PRUEBA_VARRAY.c2) t2;