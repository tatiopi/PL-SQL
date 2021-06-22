declare
	-- 2) no tienen un limite establecido
	-- 3) se diferencian de los asociativos por que no tienen index by
	-- 4) permite huecos dispersas
	type t_valor is table of valo_valores%rowtype;

	-- Tambien se instancian como los varray
	v_valor t_valor := t_valor();
begin
	 select *
	   bulk collect into v_valor
	   from valo_valores
	  where cod_conc = 'AP'
		and rownum < 11;

	for i in v_valor.first .. v_valor.last
	loop
		comun.imprime(v_valor(i).id_eper);
	end loop;

	comun.imprime('el primero valor : ' || v_valor.first);
	comun.imprime('el siguiente valor : ' || v_valor.next(1));
	comun.imprime('el ultimo valor : ' || v_valor.last);

	v_valor.delete(2);

    /* Cuando elimino un elemento tengo huecos y si intento recorrerlo sin mas da un error al intentar acceder */

	comun.imprime('----------------------------------');

	for i in v_valor.first .. v_valor.last
	loop
		if v_valor.exists(i) then
			comun.imprime(v_valor(i).id_eper);
		end if;
	end loop;
end;