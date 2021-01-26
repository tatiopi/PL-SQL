DECLARE
   CURSOR c1
   IS
      SELECT * FROM valo_valores;

   v1   valo_valores%ROWTYPE;
BEGIN
   OPEN c1;
   FETCH c1 INTO v1;
   comun.imprime (v1.id_eper);

   FETCH c1 INTO v1;
   comun.imprime (v1.id_eper);
   CLOSE c1;
END;

