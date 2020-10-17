--create table pru1 (CODIGO NUMBER , DATOS VAinsert into pru1 values (1,'DATOS1');RCHAR2(100));

INSERT INTO pru1
     VALUES (1, 'DATOS1');

INSERT INTO pru1
     VALUES (2, 'DATOS1');

INSERT INTO pru1
     VALUES (3, 'DATOS1');

CREATE OR REPLACE FUNCTION ejemplo_dml (condicion varchar2)
   RETURN NUMBER
   AUTHID CURRENT_USER
IS
   comando   VARCHAR2 (100);
   filas     NUMBER;
BEGIN
   comando := 'delete from pru1 where ' || condicion;
   comun.imprime (comando);

   EXECUTE IMMEDIATE (comando);

   filas := SQL%ROWCOUNT;
   comun.imprime (filas);
   RETURN filas;
END;

declare
   condicion varchar2(100);
   num_filas number;
BEGIN
   condicion := 'CODIGO=1';
   num_filas := ejemplo_dml(condicion);
   comun.imprime('se han borrado ' || num_filas ||  ' filas ');
END;

SELECT * FROM pru1;