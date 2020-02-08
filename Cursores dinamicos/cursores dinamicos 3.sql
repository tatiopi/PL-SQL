CREATE OR REPLACE PACKAGE PAQ1
AS 
    TYPE C_VARIABLE IS REF CURSOR;
    -- si usamos variables del tipo C_VARIABLE como parametros de una funcion
    -- tenemos que ponerles el IN OUT de forma obligatoria
    FUNCTION DEVOLVER_DATOS (C1 IN OUT C_VARIABLE, X NUMBER ) RETURN VARCHAR2;
END;
/



CREATE OR REPLACE PACKAGE BODY PAQ1
AS 
    -- si usamos variables del tipo C_VARIABLE como parametros de una funcion
    -- tenemos que ponerles el IN OUT de forma obligatoria
    FUNCTION DEVOLVER_DATOS (C1 IN OUT C_VARIABLE, X NUMBER )
    RETURN VARCHAR2
    IS 
        DEPARAMENTOS DEPARTMENTS%ROWTYPE;
        EMPLEADOS EMPLOYEES%ROWTYPE;
    BEGIN
        IF X=1 THEN
            OPEN c1 FOR SELECT * FROM EMPLOYEES;
            FETCH c1 INTO EMPLEADOS;
            RETURN EMPLEADOS.FIRST_NAME;
        ELSE
            OPEN c1 FOR SELECT * FROM EMPLOYEES;
            FETCH c1 into DEPARAMENTOS;
            RETURN DEPARAMENTOS.DEPARTMENT_NAME;
        END IF;
    END;
END;
/

SET SERVEROUTPUT ON;

DECLARE
    DATOS PAQ1.C_VARIABLE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(PAQ1.DEVOLVER_DATOS(DATOS,1));
END;
