
CREATE OR REPLACE PACKAGE paq1 IS
    FUNCTION f1 RETURN NUMBER;

    PROCEDURE p1;
    PROCEDURE p2;

END;
/

SELECT
    s.status,
    s.*
FROM
    user_objects s
WHERE
    s.object_name LIKE 'PAQ%';
    
-- Posteriormente he añadido en la cabecera el procedure p2 y he compilado
-- luego he intentado compilar el body y me ha dado error pro que no estaba 
-- creada ese procedure , dejandome el status en INVALID

CREATE OR REPLACE PACKAGE BODY paq1 IS
    FUNCTION f1 RETURN NUMBER IS
    BEGIN
        RETURN 0;
    END f1;

    PROCEDURE p1 IS
    BEGIN
        NULL;
    END;
    
    PROCEDURE p2 IS
    BEGIN
        NULL;
    END;
    
    PROCEDURE p3 IS
    BEGIN
        NULL;
    END;

END PAQ1;
/

-- RECOMPILAR un paquete

ALTER PACKAGE paq1 COMPILE ;
ALTER PACKAGE paq1 COMPILE BODY ;