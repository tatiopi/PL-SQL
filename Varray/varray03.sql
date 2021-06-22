-- Para evitar el uso de extend por demos usar bulk collect (SE RECOMIENDA) siempre y cuando no usemos un bucle para recuperar los datos
DECLARE
   TYPE t_valores IS VARRAY (10) OF valo_valores%ROWTYPE;

   v_valores   t_valores := t_valores ();
BEGIN
   --para evitar usar el extends usamos bulk collect
   SELECT *
     BULK COLLECT INTO v_valores
     FROM valo_valores
    WHERE ROWNUM < 11;

   FOR i IN 1 .. v_valores.COUNT
   LOOP
      comun.imprime (
         v_valores (i).id_eper || ' importe ' || v_valores (i).importe_Valo);
   END LOOP;
END;


-- Con un cursor 

DECLARE
   TYPE t_valores IS VARRAY (10) OF valo_valores%ROWTYPE;

   CURSOR c1
   IS
      SELECT *
        FROM valo_Valores
       WHERE ROWNUM < 11;

   v_valores   t_valores := t_valores ();
   contador    NUMBER := 1;
BEGIN
   FOR x IN c1
   LOOP
      -- Extendemos
      v_valores.EXTEND ();
      v_valores (contador) := x;
      contador := contador + 1;
   END LOOP;

   FOR i IN 1 .. v_valores.COUNT
   LOOP
      comun.imprime (
         v_valores (i).id_eper || ' importe ' || v_valores (i).importe_Valo);
   END LOOP;
END;