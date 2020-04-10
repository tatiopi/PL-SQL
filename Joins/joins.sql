 -- usando join on
 select *
   from impo_importes i join valo_valores v on i.id_padre_impo = v.id_eper
  where id_padre_impo = 70948440;

-- usando join using 
 select *
   from impo_importes i join valo_valores v using (v.id_eper)
  where v.id_eper = 70948440;

-- join multiples tablas
 select *
   from impo_importes i
		join cobr_cobros c on i.id_cobr = c.id_cobr
		join valo_valores v on v.id_eper = i.id_padre_impo
  where id_padre_impo = 70948440;

-- join vs where

 select i.id_padre_impo
	  , i.id_impo
	  , i.id_cobr
	  , c.cod_fopa
	  , i.cod_importe
	  , i.importe_impo
	  , i.id_fiin
	  , sum(nvl(decode(ii.cod_importe, 'PR', importe_apli, 0), 0)) ap_pr
	  , sum(nvl(decode(ii.cod_importe, 'PR', recargo_ext, 0), 0)) rec_ext
	  , sum(nvl(decode(ii.cod_importe, 'PR', intereses_ext, 0), 0)) int_ext
	  , sum(nvl(decode(ii.cod_importe, 'PR', recargo_prov_apli, 0), 0))
			rec_prov
	  , sum(nvl(decode(ii.cod_importe, 'R5', importe_apli, 0), 0)) ap_r5
	  , sum(nvl(decode(ii.cod_importe, 'R1', importe_apli, 0), 0)) ap_r1
	  , sum(nvl(decode(ii.cod_importe, 'R2', importe_apli, 0), 0)) ap_r2
	  , sum(nvl(decode(ii.cod_importe, 'ID', importe_apli, 0), 0)) ap_id
	  , sum(nvl(decode(ii.cod_importe, 'CO', importe_apli, 0), 0)) ap_co
	  , sum(nvl(decode(ii.cod_importe, 'DD', importe_apli, 0), 0)) ap_dd
   from impo_importes i
		join apli_aplicaciones a on (i.id_impo = a.id_impo)
		join impo_importes ii on (ii.id_impo = a.imp_id_impo)
		join cobr_cobros c on (c.id_cobr = i.id_cobr)
  where i.id_padre_impo = 70948440
group by i.id_padre_impo
	   , i.id_impo
	   , i.id_cobr
	   , c.cod_fopa
	   , i.cod_importe
	   , i.importe_impo
	   , i.id_fiin;

 select i.id_padre_impo
	  , i.id_impo
	  , i.id_cobr
	  , c.cod_fopa
	  , i.cod_importe
	  , i.importe_impo
	  , i.id_fiin
	  , sum(nvl(decode(ii.cod_importe, 'PR', importe_apli, 0), 0)) ap_pr
	  , sum(nvl(decode(ii.cod_importe, 'PR', recargo_ext, 0), 0)) rec_ext
	  , sum(nvl(decode(ii.cod_importe, 'PR', intereses_ext, 0), 0)) int_ext
	  , sum(nvl(decode(ii.cod_importe, 'PR', recargo_prov_apli, 0), 0))
			rec_prov
	  , sum(nvl(decode(ii.cod_importe, 'R5', importe_apli, 0), 0)) ap_r5
	  , sum(nvl(decode(ii.cod_importe, 'R1', importe_apli, 0), 0)) ap_r1
	  , sum(nvl(decode(ii.cod_importe, 'R2', importe_apli, 0), 0)) ap_r2
	  , sum(nvl(decode(ii.cod_importe, 'ID', importe_apli, 0), 0)) ap_id
	  , sum(nvl(decode(ii.cod_importe, 'CO', importe_apli, 0), 0)) ap_co
	  , sum(nvl(decode(ii.cod_importe, 'DD', importe_apli, 0), 0)) ap_dd
   from impo_importes i, apli_aplicaciones a, impo_importes ii, cobr_cobros c
  where i.id_padre_impo = 70948440
	and a.id_impo = i.id_impo
	and ii.id_impo = a.imp_id_impo
	and c.id_cobr(+) = i.id_cobr
group by i.id_padre_impo
	   , i.id_impo
	   , i.id_cobr
	   , c.cod_fopa
	   , i.cod_importe
	   , i.importe_impo
	   , i.id_fiin
order by i.id_padre_impo, i.id_impo;