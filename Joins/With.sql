WITH SUMA_PARTIDAS AS ( SELECT * FROM IMPO_IMPORTES where id_padre_impo = 1114548488 )
SELECT * FROM SUMA_PARTIDAS;

WITH SUMA_PARTIDAS_PR AS ( SELECT * FROM IMPO_IMPORTES where id_padre_impo = 1114548488 and cod_importe = 'PR' ),
     SUMA_PARTIDAS_IC AS ( SELECT * FROM IMPO_IMPORTES where id_padre_impo = 1114548488 and cod_importe = 'IC' )
SELECT * FROM SUMA_PARTIDAS_PR;
