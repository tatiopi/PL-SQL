 /***
  Las relaciones que tengo entre los objetos de mi esquema , es decir que los llaman , no nos referimos a la FK
 sale el objeto que quiero ver y a quien hace referncia , es decir en este ejemplo
 seria las tablas y pl y funciones a los que llamo desde OPERACIONES_ CONTABLES 
 ***/

select *
from user_dependencies
where name = 'OPERACIONES_CONTABLES';
 
 /***
 Estos serian aquellos objetos que tienen llamadas a mi PL operaciones contables
 ***/ 
  
select *
from user_dependencies
where referenced_name = 'OPERACIONES_CONTABLES';