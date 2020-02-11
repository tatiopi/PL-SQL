SET SERVEROUTPUT ON;

DECLARE
    TYPE departamentos IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    depts    departamentos;
    TYPE empleados IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    emples   empleados;
    
    -- Con varchar!
    TYPE NOMBRE IS TABLE OF EMPLOYEES.FIRST_NAME%TYPE INDEX BY VARCHAR2(2);
    nombres nombre;
BEGIN
    -- Esto no es un array clasico , esto es un array clave - valor
    -- no confundir con los VARRAY 
    -- estamos poniendo claves numericas por que hemos declaro que es BY PLS_INTEGER
    depts(1) := 'HOLA';
    depts(2) := 'ADIOS';
    depts(50) := 'OTRO VALOR';
    depts(-10) := 'SIGUIENTE VALOR';
    
    DBMS_OUTPUT.PUT_LINE(DEPTS(-10));
    
    NOMBRES('AA'):= 'PEDRO';
    DBMS_OUTPUT.PUT_LINE(NOMBRES('AA'));
    
END;