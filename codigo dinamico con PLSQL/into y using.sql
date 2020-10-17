CREATE OR REPLACE FUNCTION num_emple (departamento NUMBER)
   RETURN NUMBER
IS
   comando         VARCHAR2 (200);
   num_empleados   NUMBER;
BEGIN
   --se deben poner los : puntos para indicarle que es una variable binding
   comando :=
      'SELECT COUNT(*) FROM EMPLOYEES WHERE DEPARMENT_ID= :DEPERATAMENTO';

   EXECUTE IMMEDIATE comando INTO num_empleados USING departamento;

   RETURN num_empleados;
END;

DECLARE
   depart   NUMBER;
   emple    NUMBER;
BEGIN
   depart := 10;
   emple := num_emple (depart);
   comun.imprime ('hay ' || emple || ' en el departamento ' || depart);
END;