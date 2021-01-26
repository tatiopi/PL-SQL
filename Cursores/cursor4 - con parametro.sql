DECLARE
   CURSOR c1 (importe NUMBER)
   IS
      SELECT *
        FROM valo_Valores
       WHERE importe_valo > importe AND ROWNUM < 10;

   v_valo   valo_valores%ROWTYPE;
BEGIN
   OPEN c1 (500000);

   LOOP
      FETCH c1 INTO v_valo;

      EXIT WHEN c1%NOTFOUND;

      comun.imprime (v_valo.id_eper);
   END LOOP;

   CLOSE c1;
END;