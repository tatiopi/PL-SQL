/************* VARRAY **********************/
-- Se pueden extender
-- Se pueden usar como columnas de una tabla

/************* VARRAY *****************************/

DECLARE
   TYPE v1 IS VARRAY (50) OF VARCHAR2 (100);

   -- Primero hay que inicializar usando el constructor
   --*************************
   --instanciar sin posiciones
   --*************************
   -- var1 v1 := v1();
   --************************************
   -- instanciar con elementos del 1 al 3
   --*************************************
   var1   v1 := v1 ('HOLA', 'BUENAS', 'TARDES');
BEGIN
   comun.imprime (var1 (1));
   var1 (1) := 'HOLA2';
   comun.imprime (var1 (1));
END;

/************* FIN VARRAY *********************/