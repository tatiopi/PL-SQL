create or replace procedure crear_tabla (nombre_tabla    varchar2,
                                         columnas        varchar2)
   -- SE EJECUTA CON EL USUARIO ACTUAL O DEFINER CON EL USUARIO QUE CREO
   authid current_user                                              -- DEFINER
is
   comando varchar2(100);
begin
   comando := 'CREATE TABLE ' || nombre_tabla || '(' || columnas || ')'; 
   comun.imprime(comando);
   execute immediate comando ;
end;
/

begin
   crear_tabla ('PRU1', 'CODIGO NUMBER , DATOS VARCHAR2(100)');
end;
/