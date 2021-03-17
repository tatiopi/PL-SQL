--Oracle toma las I/O por bloques
--El Clustering Factor nos dice que tan ordenado se encuentran los registros de la tabla en base a los valores del índice.
--Si el CF es proximo al numero de bloques significa que los valores (columnas a las que apunta el indice) de la tabla estan ordenados favoreciendo el index scan.
--Si el CF es proximo al numero de filas significa que los valores (columnas a las que apunta el indice) de la tabla estan desordenados favoreciendo el full table scan.
 
 select ui.index_name, ui.clustering_factor, ut.num_rows, ut.blocks
   from user_indexes ui join user_tables ut on ui.table_name = ut.table_name
  where ui.table_name = 'VALO_VALORES'

