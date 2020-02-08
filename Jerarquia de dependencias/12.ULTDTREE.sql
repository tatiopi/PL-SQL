desc user_dependencies ;

SELECT * FROM USER_DEPENDENCIES where referenced_name = 'PRUEBA';

CREATE OR REPLACE PROCEDURE PRUEBA_P
IS 
    X NUMBER;
BEGIN
    SELECt COUNT(*) into x FROM PRUEBA_V;
END;
/


select * from DEPTREE;

-- dentro de la carpeta /oracle/product/18c/dbhomeXE/rdbms/admin/UTLDTREE
-- hay que ejecutarlo (F5) el script 

-- luego para crear la jerarquia ... usamos el siguiente comando

EXECUTE deptree_fill('TABLE' , 'HR' , 'PRUEBA');

SELECT LPAD(SEQ#,NESTED_LEVEL*1+1,'*') ||'  '||TYPE||' '||SCHEMA||' '||NAME FROM DEPTREE;