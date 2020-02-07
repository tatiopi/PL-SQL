-- nos permite ver las propiedades de la tabla , nombre , nulo y tipo
desc user_objects

SELECT s.status , s.* FROM USER_OBJECTS s ;

--- posibles estados :
--- VALID , INVALID

SELECT STATUS ,COUNT(*) FROM user_objects group by status  ;

CREATE TABLE PRUEBA (c1 NUMBER , c2 NUMBER);

SELECT  * FROM user_objects  where object_name like 'PRUEBA%' ;  -- estado valido

CREATE VIEW PRUEBA_V AS SELECT C1 FROM PRUEBA ;

SELECT  * FROM user_objects  where object_name like 'PRUEBA%' ;  -- estado valido

-- vamos a modificar la tabla original 

ALTER TABLE PRUEBA MODIFY c2 varchar2(100);

SELECT  * FROM user_objects  where object_name like 'PRUEBA%' ;  -- estado valido

ALTER TABLE PRUEBA MODIFY c2 varchar2(100);

SELECT  * FROM user_objects  where object_name like 'PRUEBA%' ;  -- estado valido

-- sigue estando valido por que no hemos modificado el campo c1 
-- ya que desde la version 11 oracle distinguie si el cambio es sobre 
-- campos que afectan a la tabla 

ALTER TABLE PRUEBA MODIFY c1 varchar2(100);

SELECT o.status, o.* FROM user_objects o where object_name like 'PRUEBA%' ;  -- estado invalido

-- hago una select de prueba_v

select * from prueba_v ;
 
-- magia? el estatus vuelve a ser correcto...oracle si puede lo intenta arreglar EL

ALTER TABLE PRUEBA DROP COLUMN C1;

SELECT o.status, o.* FROM user_objects o where object_name like 'PRUEBA%' ;  -- estado invalido

-- pum ahora si que da error : ORA-04063: view "HR.PRUEBA_V" tiene errores

select * from prueba_v ;
