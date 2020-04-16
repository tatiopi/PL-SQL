select * from regions;

insert into regions
 values (300, 'AMERICA');

insert into regions
 values (400, 'ASIA');

-- hacemos un hito aqui
savepoint a;

select * from regions;

insert into regions
 values (500, 'ANTARTIDA');

insert into regions
 values (600, 'AFRICA');

-- cuando hacemos un rollback hacia A no estamos haciendo un rollback , es decir AMERICA y ASIAS no han hecho commit 

rollback to savepoint a;

-- si ahora hago un rollback otra vez los cambios de 'AMERICA' y 'ASIA' desaparecen

rollback;