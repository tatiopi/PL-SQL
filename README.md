# PL-SQL
```
    SQL
    -- DETECTAR DEPENDENCIAS ENTE OBJECTOS

    SELECT * FROM USER_DEPENDENCIES ;

    SELECT * FROM USER_DEPENDENCIES WHERE NAME = 'EMPLOYEES';

    SELECT * FROM USER_DEPENDENCIES WHERE NAME = 'EMP_DETAILS_VIEW'

    SELECT * FROM USER_DEPENDENCIES WHERE NAME = 'UPDATE_JOB_HISTORY' ;

    -- Que objetos dependen de la tabla empleados 

    SELECT * FROM USER_DEPENDENCIES WHERE REFERENCED_NAME = 'EMPLOYEES' ;

```