DECLARE
   TYPE emple_type IS RECORD
   (
      nombre_completo   VARCHAR2 (100),
      salario           NUMBER,
      impuestos         NUMBER
   );

   TYPE empleado IS TABLE OF emple_type
      INDEX BY PLS_INTEGER;

   empleados   empleado;
   condicion   NUMBER;
   comando     VARCHAR2 (300);
BEGIN
   condicion := 500;
   comando := q'[SELECT FIRST_NAME  || ' ' || LAST_NAME_SALARY , SALARY*15/100 from employees  where salary > :CONDICION ORDER BY SALARY DESC]';

   EXECUTE IMMEDIATE COMANDO BULK COLLECT INTO EMPLEADOS USING condicion;

   FOR x IN 1 .. empleados.COUNT ()
   LOOP
      --
      comun.imprime (
            empleados (x).nombre_completo
         || ' '
         || empleados (x).salario
         || ' '
         || empleados.impuestos);
   END LOOP;
END;