declare
	-- 1) nested tables
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
end;