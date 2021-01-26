DECLARE
   CURSOR c1
   IS
      SELECT *
        FROM valo_valores
       WHERE ROWNUM < 11;

   v1   valo_valores%ROWTYPE;
BEGIN
   -- BUCLE FOR
   FOR cur IN c1
   LOOP
      comun.imprime (cur.id_eper);
   END LOOP;
END;