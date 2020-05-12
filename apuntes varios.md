# Sacar codigo de un PL en formato BLOB
``` SQL
select dbms_metadata.get_ddl('PACKAGE_BODY', 'CUENTA_GESTION_CONTABLE', 'EXPLOTACION') from dual;
``` 

# ¿ Codigo que se esta ejecutando en un proceso lanzado ?

``` SQL
select x.sid
      ,x.serial#
      ,x.username
      ,x.sql_id
      ,x.sql_child_number
      ,optimizer_mode
      ,hash_value
      ,address
      ,sql_text
from   v$sqlarea sqlarea
      ,v$session x
where  x.sql_hash_value = sqlarea.hash_value
and    x.sql_address    = sqlarea.address
and    x.username       is not null;
```

# Pivotar una tabla
``` SQL
select * from (
    select sum(importe_anco) importe, tipo_recargo_anco , id_subo
            from anco_anotaciones_contables a
           where anulada_anco = 'N'
             and id_padre_anco in ( select id_eper
                                      from aramos.ktmp_valores_liquidados)
             and cod_prco in ('10101', '10102')
             and cod_ocon in ('ICS')
         group by tipo_recargo_anco, id_subo 
         order by id_subo 
)
pivot 
(
   sum(importe)
   for tipo_recargo_anco in ('R5','R1','R2')
)
order by id_subo
```

### Matar un job en ejecución y matar la sesion de ese mismo job
``` SQL
select 'alter system kill session '''||sid||','||serial#||''';' from v$session where sid in (select sid from dba_jobs_running)
select 'exec dbms_job.remove('||job||');' from dba_jobs_running;
```

### Matar un Job (Edu)
``` SQL
dbms_scheduler.drop_job(job_name => 'folder_maker3');
``` 

### Detectar bloqueos
``` SQL
SELECT DECODE (L.TYPE,  'TM', 'TABLE',  'TX', 'Record(s)') TYPE_LOCK,
       DECODE (L.REQUEST, 0, 'NO', 'YES') WAIT,
       S.OSUSER OSUSER_LOCKER,
       S.PROCESS PROCESS_LOCKER,
       S.USERNAME DBUSER_LOCKER,
       O.OBJECT_NAME OBJECT_NAME,
       O.OBJECT_TYPE OBJECT_TYPE,
       CONCAT (' ', s.PROGRAM) PROGRAM,
       O.OWNER OWNER,
       SERIAL#,
       s.STATUS,
       s.sid
  FROM v$lock l, dba_objects o, v$session s
 WHERE l.ID1 = o.OBJECT_ID AND s.SID = l.SID AND l.TYPE IN ('TM', 'TX');
```
### Solo las N primeros registros (A partir de la version 12C)
```SQL
select v.fecha_ultimo_valo, v.importe_valo, v.recargo_prov_valo, v.importe_iva_valo, v.ref_externa_valo, v.*
from   valo_valores v
where  v.cod_conc = 'AF'  order by v.cod_conc  fetch first 3 rows only
```

### Solo los N primeros registros pero cogiendo todos los que estan en ese Rango  (A partir de la version 12C)
Tenemos por ejemplo una select para las 10 mayores ventas , si en la posicion 10 son 1500€ de ventas pero hay 2 que tienen ese importe ,los sacara los 2 
```SQL
select first_name , salary from employees order by salary desc fetch first 10 rows ties
```
### Solo los N primeros registros saltandose X registros  (A partir de la version 12C)
```SQL
select first_name , salary from employees order by salary desc offset 5 rows fetch first 10 rows ties
```
### Sacar el 20% primero de esas filas  (A partir de la version 12C)
```SQL
select first_name , salary from employees order by salary fetch first 10 percent rows only;
```
### Hacer un JOB que ejecuta un comando
```SQL
BEGIN     
    DBMS_CREDENTIAL.CREATE_CREDENTIAL(
      credential_name  =>  'credintial',   ----- credintial name give by u
      username         =>  'oracle',          ----- os username
      password         =>  'oracle');    ----- os password
     
    DBMS_SCHEDULER.CREATE_JOB (
        JOB_NAME=>'folder_maker',       --- job name
        JOB_ACTION=>'/usr/bin/mkdir',    --- executable file with path
        JOB_TYPE=>'executable',        -----   job type
        NUMBER_OF_ARGUMENTS=>1,  --  parameters in numbers                  
        AUTO_DROP =>false,
        CREDENTIAL_NAME=>'credintial'   -- give credentials name which you have created before "credintial"
        );
    dbms_scheduler.set_job_argument_value('folder_maker',1,'/utils/utlfiles/newdir');
    DBMS_SCHEDULER.RUN_JOB('folder_maker');
    --commit;
END;
```
### Job Bloqueado o ROTO (By DJ Edu)
``` SQL 
-- Deshabilitar, Impedir la siguiente ejecución ,
dbms_job.broken(234,'true');
```
