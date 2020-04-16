-- tabla origen
create table apli_aplicaciones (
    id_apli number(10) primary key,
    id_impo number(10) references impo_importes(id_impo),
    imp_id_impo number(10) references impo_importes(id_impo),
);

-- añadir colummna

alter table apli_aplicaciones ADD importe_apli number(17);

alter table apli_aplicaciones ADD tipo_recargo_apli number(17) not null;

-- modificar columna 
-- lo puedo modificar de tipo de dato si no tiene datos insertados aun
alter table apli_aplicaciones MODIFY profesor varchar2(18);

-- borrar la columna id_apli

alter table apli_aplicaciones drop (id_apli);

-- hacer readonly una  tabla , es decir no se puede insertar ni borrar mientras este puesta en read ony

alter table apli_aplicaciones READ ONLY ;

alter table apli_aplicaciones READ WRITE ;

-- borrar una tabla y updatea a null los campos en otras tablas
drop table cursos cascade constraints 
