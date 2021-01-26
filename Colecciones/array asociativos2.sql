DECLARE
    TYPE DEPARTAMENTOS IS TABLE OF DEPARTMENTS.DEPARTMENT_NAME%TYPE
        INDEX BY PLS_INTEGER;
    
    TYPE EMPLEADOS IS TABLE OF EMPLOYEES%ROWTYPE INDEX BY PLS_INTEGER;

    DEPTS DEPARTAMENTOS;
    EMPLS EMPLEADOS;

    CURSOR CUR_DEPT IS SELECT * FROM DEPARTMENTS;

    CURSOR CURS_EMP IS SELECT * FROM EMPLOYEES WHERE SALARY > 5000;

    X PLS_INTEGER := 1 ;
    Z PLS_INTEGER := 1 ;
BEGIN
    -- TIPO SIMPLE
    DEPTS(1):='INFORMATICA';
    DEPTS(2):='RRHH';
    
    -- TIPO COMPUESTO
    SELECT * INTO EMPLS(1) FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
    
    DBMS_OUTPUT.PUT_LINE(EMPLS(1).FIRST_NAME);
    
    --- EXISTS (N) 
    --- COUNT
    --- FIRST
    --- LAST
    --- PRIOR(N) : DEVUELVE EL INDICE ANTERIOR A N
    --- NEXT (N)  
    --- DELETE 
    --- DELETE (N)
    --- DELETE (M,N)
    -- TRIM 
    
    DBMS_OUTPUT.PUT_LINE(DEPTS.LAST);
    DBMS_OUTPUT.PUT_LINE(DEPTS.FIRST);
    
    IF DEPTS.EXISTS(3) THEN
        DBMS_OUTPUT.PUT_LINE(DEPTS(3));    
    END IF;

    -- RECORRER CON UN BUCLE UN ARRAY ASOCIATIVO
    BEGIN
      FOR DEP1 in CUR_DEPT LOOP
        DEPTS(X) := DEP1.DEPARTMENT_NAME;
        X:=X+1;
      END LOOP;
    END;

  
    
END;
    
