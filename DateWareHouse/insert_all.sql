-- insert all - sin condiciones : Por cada fila de la subconsulta se inserta una fila en la tabla destino
-- insert all - con condiciones : Por cada fila de la subconsulta se inserta una fila en la tabla destino basada en la codndicion
-- insert first - con condiciones : Por cada fila de la subconsulta se inserta una fila en la primera tabla que cumpla la condicion
-- pivoting insert - convertir una fila no relacional en una fila normalizada


CREATE TABLE NOM_EMPLES (COD_EMPLE NUMBER , FIRST_NAME VARCHAR2(100));

CREATE TABLE SALARIOS (COD_EMPLE NUMBER , SALARIO NUMBER);

-- insert all

INSERT ALL 
    INTO NOM_EMPLES VALUES (EMPLOYEE_ID , FIRST_NAME)
    INTO SALARIOS VALUES(EMPLOYEE_ID , SALARY)
-- por cada fila que devuelva esta select se hara insercciones
SELECT * FROM EMPLOYEES;
