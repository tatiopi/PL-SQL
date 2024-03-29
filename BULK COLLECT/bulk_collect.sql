create table t1
(
    cod_cliente number(10)
  , des_cliente varchar2(10)
  , fec_proceso date
);
create table t2
(
    num_abonado number(10)
  , des_abonado varchar2(10)
  , cod_cliente number(10)
);
create table t3
(
    cod_cliente number(10)
  , des_cliente varchar2(10)
  , cnt_abonado number(10)
);

insert into t1
     select rownum, 'C' || lpad(rownum, 9, 0), null
       from dual
    connect by level <= 5000;
insert into t2
     select rownum, 'A' || lpad(rownum, 9, 0), mod(rownum - 1, 5000) + 1
       from dual
    connect by level <= 20000;
commit;

--caso 1: sin manejo de excepciones

declare
    type tty_rowid is table of urowid
        index by binary_integer;

    type tty_cod_cliente is table of t3.cod_cliente%type
        index by binary_integer;

    type tty_des_cliente is table of t3.des_cliente%type
        index by binary_integer;

    type tty_cnt_abonado is table of t3.cnt_abonado%type
        index by binary_integer;

    tab_rowid       tty_rowid;
    tab_cod_cliente tty_cod_cliente;
    tab_des_cliente tty_des_cliente;
    tab_cnt_abonado tty_cnt_abonado;

    i               number := 0;

    cursor cur_test  is
         select t1.rowid, t1.cod_cliente, t1.des_cliente, count(*)
           from t1, t2
          where t1.cod_cliente = t2.cod_cliente
        group by t1.rowid, t1.cod_cliente, t1.des_cliente;
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

        forall i in 1 .. tab_rowid.count
            insert into t3
                 values (
                            tab_cod_cliente(i)
                          , tab_des_cliente(i)
                          , tab_cnt_abonado(i));

        forall i in 1 .. tab_rowid.count
             update t1
                set fec_proceso = sysdate
              where rowid = tab_rowid(i);

        commit;
    end loop;

    close cur_test;
exception
    when others then
        rollback;
end;