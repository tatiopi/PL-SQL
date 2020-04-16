CREATE SEQUENCE secuencia1 INCREMENT BY 1 
MAXVALUE 1000 MIN VALUE CACHE 20;

/*
    CACHE : Cuantos numeros cachea previamente 
*/

select secuencia1.nextval from dual ;

select secuencia1.currval from dual ;