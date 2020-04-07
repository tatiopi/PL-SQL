DECLARE
	v_row ANCO_ANOTACIONES_CONTABLES%ROWTYPE;

begin
	 select *
	   into v_row
	   from anco_anotaciones_contables
	  where id_anco = 258384018; ---10004

	v_row.id_anco		  := sequ_anco_anotaciones_contable.nextval;
	v_row.cod_prco		  := '10041';
	v_row.id_anco_anulado := 199046623;

	insert into anco_anotaciones_contables
	 values v_row;

	 select *
	   into v_row
	   from anco_anotaciones_contables
	  where id_anco = 258384019; ---10004

	v_row.id_anco		  := sequ_anco_anotaciones_contable.nextval;
	v_row.cod_prco		  := '10051';
	v_row.id_anco_anulado := 199046625;

	insert into anco_anotaciones_contables
	 values v_row;
end;
