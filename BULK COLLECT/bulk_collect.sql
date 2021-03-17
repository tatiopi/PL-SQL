DECLARE

   TYPE arr_valores IS TABLE OF VALO_VALORES%ROWTYPE;

   v_valores   arr_valores;
   
   CURSOR c_valores
   IS
      SELECT *
        FROM valo_valores
       WHERE anyo_cargo_carg >= 2018;


BEGIN
    DELETE FROM ktmp_valores ;

   -- INSERTAR EN LA TABLA TEMPORAL TODOS LOS VALORES
   OPEN c_valores;

   LOOP
      FETCH c_valores BULK COLLECT INTO v_valores LIMIT 10000;

      FORALL i IN 1 .. v_valores.COUNT SAVE EXCEPTIONS
         INSERT INTO ktmp_valores
              VALUES v_valores (i);

      EXIT WHEN c_valores%NOTFOUND;
   END LOOP;
END;