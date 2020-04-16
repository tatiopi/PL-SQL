/******************************************************************************************
    PRIMARY KEYS
    UNIQUE
    CONSTRAINT
********************************************************************************************/

create table valo_valores  (
    id_eper number , 
    nombre varchar2(100) default 'Jhon Doe',
    fecha_valo date default sysdate 
) ;

-- añadiendo primary key (constraint de columna) y not null  (contraint de columna)
create table valo_valores (
    id_eper number primary key ,
    nombre  varchar2(100) not null 
);

--  constraint de tabla 
create table apli_aplicaciones (
    id_impo number(10),
    imp_id_impo number(10),
    primary key(id_impo , imp_id_impo)      --constraint
);

-- claves unicas (pueden estar a null)
create table  impo_importes (
    id_padre_impo number(17) ,
    id_impo number(10) primary key,
    importe_impo number(10),
    id_cobr number unique ,
);

create table valo_valores (
    id_eper number primary key ,
    nombre  varchar2(100) not null  ,
    nif varchar(9) unique
);

create table valo_valores (
    id_eper number primary key ,
    nombre  varchar2(100) not null  ,
    nif varchar(9) ,
    constraint uk_nif unique(nif)   --esto es mas para administradores
);


-- si intentamos insertar id_impo  con un id_cobr repetido nos va a fallar por que es unique

/******************************************************************************************
    FOREIGN KEYS
********************************************************************************************/

create table  impo_importes (
    id_padre_impo number(17) ,
    id_impo number(10) primary key,
    importe_impo number(10),
    id_cobr number unique ,
);


-- a nivel de campo
create table apli_aplicaciones (
    id_apli number(10) primary key,
    id_impo number(10) references impo_importes(id_impo),
    imp_id_impo number(10) references impo_importes(id_impo),
);

-- a nivel de tabla
create table apli_aplicaciones (
    id_apli number(10) primary key,
    id_impo number(10) ,
    imp_id_impo number(10) ,
    constraint fk_impo_apli FOREIGN KEY (id_impo,imp_id_impo) REFERENCES impo_importes (id_impo)
);

/******************************************************************************************
    CHECK
********************************************************************************************/

create table apli_aplicaciones (
    id_apli number(10) primary key,
    id_impo number(10) ,
    imp_id_impo number(10) ,
    cod_importe varchar2(2) 
    constraint fk_impo_apli FOREIGN KEY (id_impo,imp_id_impo) REFERENCES impo_importes (id_impo),
    constraint ckc_cod_importe check (cod_importe in ('R1','R2','R5'))
);

create table valo_valores (
    id_eper number primary key ,
    nombre  varchar2(100) not null  ,
    nif varchar(9) ,
    constraint ckc_nombre check(nombre=UPPER(nombre)) -- tiene que estar en mayusculas
);

