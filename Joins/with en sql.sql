with contar_ingresos as
		 ( select count(id_impo) contador, id_padre_impo
			 from impo_importes
		  group by id_padre_impo)
 select contador, id_padre_impo
   from contar_ingresos
   where contador > 2
   

select count(id_impo) contador, id_padre_impo
             from impo_importes
          group by id_padre_impo
having count(id_impo)> 2          

-- with permite mas de una tabla "temporal"

