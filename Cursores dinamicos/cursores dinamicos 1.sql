-- REF_CURSORS
-- Un cursor variable son referencias a otros cursores
-- es por tanto un puntero a un cursor
SET SERVEROUTPUT ON;

DECLARE
    -- CURSOR C1 is SELECT * FROM EMPLOYEES (pl-sql cursor normal )
    TYPE cursor_variable IS REF CURSOR;
    v1              cursor_variable;
    empleados       employees%rowtype;
    departamentos   departments%rowtype;
BEGIN
    -- para los cursores de tipo REF CURSOR hay que usar el FOR para asignarle la sql que tiene que 
    -- ejecutar , no como en los cursores normales que se pueden realizar en la declaracion como tienes
    -- de ejemplo arriba con la variable c1
    OPEN v1 FOR SELECT
                    *
                FROM
                    employees;

    FETCH v1 INTO empleados;
    dbms_output.put_line(empleados.salary);
    CLOSE v1;
    OPEN v1 FOR SELECT
                    *
                FROM
                    departments;

    FETCH v1 INTO departamentos;
    dbms_output.put_line(departamentos.department_name);
    CLOSE v1;
    
    -- PASEANDO POR TODOS LOS DEPARAMENTOS;
    OPEN v1 FOR SELECT
                    *
                FROM
                    departments;
    LOOP
        EXIT WHEN v1%notfound;
        FETCH v1 INTO departamentos ;
        dbms_output.put_line(departamentos.department_name);
    END LOOP;

    CLOSE v1;
END;