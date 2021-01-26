DECLARE
   CURSOR c1
   IS
      SELECT *
        FROM valo_valores
       WHERE ROWNUM < 11;

   v1   valo_valores%ROWTYPE;
BEGIN
   OPEN c1;

   LOOP
      FETCH c1 INTO v1;

      EXIT WHEN c1%NOTFOUND;
      comun.imprime (v1.id_eper);
   END LOOP;

   CLOSE c1;
END;