-- insert all - sin condiciones : Por cada fila de la subconsulta se inserta una fila en la tabla destino
-- insert all - con condiciones : Por cada fila de la subconsulta se inserta una fila en la tabla destino basada en la codndicion
-- insert first - con condiciones : Por cada fila de la subconsulta se inserta una fila en la primera tabla que cumpla la condicion
-- pivoting insert - convertir una fila no relacional en una fila normalizada


CREATE TABLE NOM_EMPLES (COD_EMPLE NUMBER , FIRST_NAME VARCHAR2(100));

CREATE TABLE SALARIOS (COD_EMPLE NUMBER , SALARIO NUMBER);

-- **********
-- insert all
-- **********

insert all
    into NOM_EMPLES VALUES (EMPLOYEE_ID , FIRST_NAME)
    into SALARIOS VALUES (EMPLOYEE_ID, SALARY)
    -- por cada fila que devuelva esta select se hara insercciones
select *  FROM EMPLOYEES;

select * from NOM_EMPLES

-- **********************
-- insert all condicional
-- **********************


CREATE TABLE EMPLES_JEFES (COD_EMPLE NUMBER , NOMBRE VARCHAR2(100) , SALARIO NUMBER);

CREATE TABLE EMPLES_MANDOS (COD_EMPLE NUMBER , NOMBRE VARCHAR2(100) , SALARIO NUMBER , DEPARTAMENTO NUMBER);

CREATE TABLE EMPLES_NORMALES (COD_EMPLE NUMBER , NOMBRE VARCHAR2(100) , SALARIO NUMBER , RESPONSABLE NUMBER);

insert all
    when salary > 10000 THEN
        INTO EMPLES_JEFES VALUES(EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME , SALARY )
    when salary between 8000 and 10000 THEN
        INTO EMPLES_MANDOS VALUES(EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME, SALARY , DEPARTMENT_ID )
    when salary < 8000 THEN
        INTO EMPLES_NORMALES VALUES(EMPLOYEE_ID ,  FIRST_NAME || ' ' || LAST_NAME , SALARY , MANAGER_ID )
SELECT * FROM EMPLOYEES ;         

insert all
    when salary > 10000 THEN
        INTO EMPLES_JEFES VALUES(EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME , SALARY )
    when salary between 8000 and 10000 THEN
        INTO EMPLES_MANDOS VALUES(EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME, SALARY , DEPARTMENT_ID )
    when salary < 8000 THEN
        INTO EMPLES_NORMALES VALUES(EMPLOYEE_ID ,  FIRST_NAME || ' ' || LAST_NAME , SALARY , MANAGER_ID )
    when DEPARTMENT_ID = 100 THEN
        INTO FINANCIERO VALUES(EMPLOYEE_ID ,  FIRST_NAME || ' ' || LAST_NAME , SALARY , MANAGER_ID )
SELECT * FROM EMPLOYEES ;   

-- ************
-- insert first
-- ************