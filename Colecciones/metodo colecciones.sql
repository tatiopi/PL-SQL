
  
   TYPE SUMA_SALARIOS IS RECORD 
      (
         NOMBRE DEPARTMENTS.DEPARTMENT_NAME%TYPE,
         SUMA_SALARIOS NUMBER
      );

  TYPE SUMA_SAL IS TABLE OF SUMA_SALARIOS INDEX BY PLS_INTEGER;
 
  
  SALARIOS SUMA_SAL;
  
BEGIN
     SELECT DEPARTMENT_NAME,SUM(SALARY)
     BULK COLLECT INTO SALARIOS
     FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID)
     GROUP BY DEPARTMENT_NAME;
    
     FOR I IN 1..SALARIOS.COUNT() LOOP
        DBMS_OUTPUT.PUT_LINE(SALARIOS(I).NOMBRE||' '||SALARIOS(I).SUMA_SALARIOS);
     END LOOP;
     
     DBMS_OUTPUT.PUT_LINE('NÚMERO EMPLEADOS:'||SALARIOS.COUNT());
     DBMS_OUTPUT.PUT_LINE('PRIMER REGISTRO:'||SALARIOS.FIRST());
     DBMS_OUTPUT.PUT_LINE('ULTIMO REGISTRO:'||SALARIOS.LAST());
     IF SALARIOS.EXISTS(20) THEN
        DBMS_OUTPUT.PUT_LINE('EXISTE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO EXISTE');
    END IF;
    SALARIOS.DELETE(1);
    DBMS_OUTPUT.PUT_LINE('PRIMER REGISTRO:'||SALARIOS.FIRST());
    DBMS_OUTPUT.PUT_LINE(SALARIOS.PRIOR(3));
	DBMS_OUTPUT.PUT_LINE(SALARIOS.NEXT(3));
    SALARIOS.DELETE(4);
	DBMS_OUTPUT.PUT_LINE(SALARIOS.PRIOR(3));
	DBMS_OUTPUT.PUT_LINE(SALARIOS.NEXT(3));
END;
/


DECLARE
   TYPE suma_conceptos IS RECORD
   (
      importe    valo_valores.importe_Valo%TYPE,
      cod_conc   valo_valores.cod_conc%TYPE
   );

   TYPE t_suma_concepto IS TABLE OF suma_conceptos
      INDEX BY PLS_INTEGER;

   suma_concepto   t_suma_concepto;
BEGIN
     SELECT SUM (importe_valo), cod_conc
       BULK COLLECT INTO suma_concepto
       FROM valo_valores
   GROUP BY cod_conc;

   FOR i IN 1 .. suma_concepto.COUNT
   LOOP
      comun.imprime (
            'concepto '
         || suma_concepto (i).cod_conc
         || ' importe total '
         || suma_concepto (i).importe);
   END LOOP;
END;