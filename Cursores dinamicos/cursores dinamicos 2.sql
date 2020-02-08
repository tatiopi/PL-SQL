SET SERVEROUTPUT ON;

DECLARE
    -- c1 esta tipado , obligo a que siemre se 
    -- trabaje con un elemento del tipo deparamentos
    TYPE c1 IS REF CURSOR RETURN DEPARTMENTS%ROWTYPE;
    V1 C1;
    DEPARTAMENTOS DEPARTMENTS%ROWTYPE;
BEGIN
    OPEN v1 FOR SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID > 150;
    FETCH v1 into DEPARTAMENTOS;
    WHILE v1%FOUND LOOP
        dbms_output.put_line(departamentos.department_name);
        FETCH v1 into DEPARTAMENTOS;
    END LOOP ;
    CLOSE v1;
END;