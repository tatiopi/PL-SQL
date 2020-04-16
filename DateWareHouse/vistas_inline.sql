-- vistas inline : crear joins complejas de forma dinamica.
select importe_impo , id_padre_impo from ( 
    select sum(importe_impo) , id_padre_impo
    from impo_importes 
    where id_padre_impo in ( select id_Eper from xktmp_valores) 
    group by id_padre_impo
)

insert into (select * from regiones) values ('6' , 'AUSTRALIA');

update (select * from regiones where region _id > 3)
set region_name = lower(region_name);