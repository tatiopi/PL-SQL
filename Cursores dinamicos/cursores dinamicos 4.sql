SET SERVEROUTPUT ON;

DECLARE 
    TYPE CURSOR_VARIABLE IS REF CURSOR RETURN EMPLOYEES%ROWTYPE;
    V1 CURSOR_VARIABLE;
    V2 CURSOR_VARIABLE;
    
    EMPLEADOS EMPLOYEES%ROWTYPE;
BEGIN   
    OPEN v1 FOR SELECT * FROM EMPLOYEES ORDER BY FIRST_NAME;
    FETCH v1 into EMPLEADOS;
    DBMS_OUTPUT.PUT_LINE(EMPLEADOS.FIRST_NAME || ' ' ||  EMPLEADOS.SALARY);
    
    -- ASIGNAMOS V1 A V2
    V2:=V1;
    FETCH V2 into empleados;
    
    -- !!! devuelve el empleado 2 por que apunta al mismo sitio V1 
    
    DBMS_OUTPUT.PUT_LINE(EMPLEADOS.FIRST_NAME || ' ' ||  EMPLEADOS.SALARY);

    CLOSE v1;
END;

--SYS_REFCURSOR :
    -- esta en el paquete estandar
    -- siempre que hemos querido hacer un ref cursor hemos hecho 2 pasos
    -- declarar el tipo cursor del tipo REF_CURSOR
        --TYPE CURSOR_VARIABLE IS REF CURSOR RETURN EMPLOYEES%ROWTYPE;
    -- y luego declaramos la variable con el tipo anterior 
    -- con esto nos saltamos el paso de tener que hacer TYPE CURSOR IS REF CURSOR ;
    
DECLARE
    v1 SYS_REFCURSOR;
    DEPARTAMENTOS DEPARTMENTS%ROWTYPE;
BEGIN
    OPEN V1 FOR SELECT *FROM DEPARTMENTS;
    FETCH V1 INTO DEPARTAMENTOS ;
    WHILE V1%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(DEPARTAMENTOS.DEPARTMENT_NAME);
        FETCH V1 INTO DEPARTAMENTOS ;
    END LOOP;
END;

