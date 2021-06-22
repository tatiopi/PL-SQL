DECLARE
   TYPE v1 IS VARRAY (50) OF VARCHAR2 (100);

   var1   v1 := v1 ('HOLA', 'BUENAS', 'TARDES');
BEGIN
   comun.imprime (var1 (1));
   var1 (1) := 'HOLA2';
   comun.imprime (var1 (1));
   -- tamaño del varray
   comun.imprime (var1.COUNT);
   -- limite maximo del varray
   comun.imprime (var1.LIMIT);
   -- ampliar en tamaño de 1
   var1.EXTEND ();
   comun.imprime (var1.COUNT);
   -- ampliar en tamaño N pero nunca nmas del tamaño maximo (limit);
   var1.EXTEND (5);
   comun.imprime ('posiciones disponibles: ' || var1.COUNT);
END;