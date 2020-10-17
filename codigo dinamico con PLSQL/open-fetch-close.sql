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

   --crear cursor variable
   type v_cursor is REF cursor ;
   c1 v_cursor ;
BEGIN
   condicion := 500;
   comando := q'[SELECT FIRST_NAME  || ' ' || LAST_NAME_SALARY , SALARY*15/100 from employees  where salary > :CONDICION ORDER BY SALARY DESC]';

   --EXECUTE IMMEDIATE COMANDO BULK COLLECT INTO EMPLEADOS USING condicion;
   OPEN v_cursor FOR comando USING condicion ;
   FETCH c1 bulk COLLECT into empleados;


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

/*************************** EJEMPLO con GTT ****************************/

DECLARE
   TYPE valo_type IS RECORD
   (
      id_eper             NUMBER,
      int_sus_valo        NUMBER,
      fecha_ultimo_valo   VARCHAR2(3000)
   );

   TYPE valo IS TABLE OF valo_type
      INDEX BY PLS_INTEGER;

   valores     valo;
   condicion   NUMBER;
   comando     VARCHAR2 (300);
   type v_cursor  is REF cursor ;
   c1 v_cursor;
BEGIN
   condicion := 3000000;
   comando :=
      q'[SELECT id_Eper , int_sus_valo, fecha_ultimo_valo from valo_valores where importe_valo > :condicion and rownum < 30]';

   --EXECUTE IMMEDIATE COMANDO BULK COLLECT INTO valores USING condicion;
   OPEN c1 FOR comando using condicion;
   FETCH c1 bulk collect into valores ;

   FOR x IN 1 .. valores.COUNT ()
   LOOP
      --
      comun.imprime (
            valores (x).id_Eper
         || ' '
         || valores (x).int_sus_valo);
   END LOOP;
END;
