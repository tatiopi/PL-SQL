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

select 'alter system kill session '''||sid||','||serial#||''';' from v$session where sid in (select sid from dba_jobs_running)
select 'exec dbms_job.remove('||job||');' from dba_jobs_running;

