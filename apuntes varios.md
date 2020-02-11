-- Sacar codigo de un PL en formato BLOB

select dbms_metadata.get_ddl('PACKAGE_BODY', 'CUENTA_GESTION_CONTABLE', 'EXPLOTACION') from dual;

