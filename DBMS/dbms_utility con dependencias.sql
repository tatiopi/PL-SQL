--DBMS_UTILITY

SET SERVEROUTPUT ON;

-- SACA LO MISMO QUE UTLDTREE
EXECUTE DBMS_UTILITY.GET_DEPENDENCY('TABLE' ,'HR' ,'PRUEBA');

-- 3º argumento que le indica el tipo de objeto
/*
    1 = TABLE / PROCEDURE/ TYPE
    2 = BODY
    3 = TRIGGER 
    4 = INDEX
    5 = CLUSTER
    8 = LOB
    9 = DIRECTORY
    10 = QUEUE
*/

-- intentar convertir en valido si esta en estado invalido
-- Los comandos ALTER , DROP , CREATE no se pueden utilizar dentro de PL SQL , dentro de un bloque
-- con lo siguiente si que puedo , metodo muy interesante para validar objetos
EXECUTE DBMS_UTILITY.VALIDATE('HR' , 'PRUEBA' , 1);

-- 2º parametro (no es obligatorio)
-- FALSE : SOLO LOS ELEMENTOS INVALIDOS
-- TRUE : TODO
-- 3º parametro (no es obligatorio)
-- Reutilizar los ultimos settings de lo que estoy compilando
EXECUTE DBMS_UTILITY.COMPILE_SCHEMA('HR' , COMPILE_ALL => FALSE ,REUSE_SETTINGS => TRUE);
