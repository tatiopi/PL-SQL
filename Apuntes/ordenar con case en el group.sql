 select *
   from impo_importes
  where id_padre_impo = 192559852
  
  order by case cod_importe 
            when 'PR' then 1
            when 'IC' then 2 
            when 'BP' then 3
            when 'ID' then 4
            else
                5
            end ;