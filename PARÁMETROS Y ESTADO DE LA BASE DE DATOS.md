# PL-SQL
```SQL
 -- estado,versión, nombre, cuando se levanto, el nombre de la máquina
 SELECT * FROM v$instance;
 
 -- ultimas sentecinas ejecutadas
 SELECT DISTINCT vs.sql_text, vs.sharable_mem, 
       vs.persistent_mem, vs.runtime_mem,  vs.sorts,
       vs.executions, vs.parse_calls, vs.module,  
       vs.buffer_gets, vs.disk_reads, vs.version_count, 
       vs.users_opening, vs.loads,  
       to_char(to_date(vs.first_load_time,
       'YYYY-MM-DD/HH24:MI:SS'),'MM/DD  HH24:MI:SS') first_load_time,  
       rawtohex(vs.address) address, vs.hash_value hash_value , 
       rows_processed  , vs.command_type, vs.parsing_user_id  , 
       OPTIMIZER_MODE  , au.USERNAME parseuser  
  FROM v$sqlarea vs , all_users au   
 WHERE (parsing_user_id != 0)  
   AND (au.user_id(+)=vs.parsing_user_id)  
   AND au.USERNAME = 'MESTEVE'
   AND (executions >= 1)
 ORDER BY buffer_gets/executions DESC;
 
```

