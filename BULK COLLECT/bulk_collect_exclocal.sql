declare
    type tty_rowid is table of urowid
        index by binary_integer;

    type tty_cod_cliente is table of t1.cod_cliente%type
        index by binary_integer;

    type tty_des_cliente is table of t1.des_cliente%type
        index by binary_integer;

    type tty_cnt_abonado is table of t3.cnt_abonado%type
        index by binary_integer;

    tab_rowid       tty_rowid;
    tab_cod_cliente tty_cod_cliente;
    tab_des_cliente tty_des_cliente;
    tab_cnt_abonado tty_cnt_abonado;
    v_rows_ok       number := 0;
    v_rows_er       number := 0;
    i               number := 0;

    cursor cur_test  is
         select t1.rowid, t1.cod_cliente, t1.des_cliente, count(*)
           from t1, t2
          where t1.cod_cliente = t2.cod_cliente
        group by t1.rowid, t1.cod_cliente, t1.des_cliente
        order by t1.cod_cliente;

    excp_bulk_error exception;
    pragma exception_init(excp_bulk_error, -24381);
begin
    open cur_test;

    loop
        fetch cur_test
               bulk collect into tab_rowid
                  , tab_cod_cliente
                  , tab_des_cliente
                  , tab_cnt_abonado
            limit 100;

        exit when tab_rowid.count = 0;

        begin
            forall i in 1 .. tab_rowid.count save exceptions
                insert into t3
                     values (
                                tab_cod_cliente(i)
                              , tab_des_cliente(i)
                              , tab_cnt_abonado(i));

            forall i in 1 .. tab_rowid.count
                 update t1
                    set fec_proceso = sysdate
                  where rowid = tab_rowid(i);
        exception
            when excp_bulk_error then
                p('# Handler local ');
                v_rows_ok := sql%rowcount;
                v_rows_er := sql%bulk_exceptions.count;
                p('# Rows[OK] ', v_rows_ok);
                p('# Rows[ER] ', v_rows_er);

                for i in 1 .. v_rows_er
                loop
                    p('# Row         ', sql%bulk_exceptions(i).error_index);
                    p('# Code        ', sql%bulk_exceptions(i).error_code);
                    p('# Descripcion '
                    , sqlerrm(-sql%bulk_exceptions(i).error_code)
                     );
                end loop;

                rollback;
        end;

        commit;
    end loop;

    close cur_test;
exception
    when others then
        rollback;
end;