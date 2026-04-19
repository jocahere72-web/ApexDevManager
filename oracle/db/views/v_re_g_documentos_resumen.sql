
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_RESUMEN" ("ID_DCMNTO", "NMRO_DCMNTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "VLOR_CPTAL", "VLOR_INTRES", "VLOR_DSCNTO", "VLOR_TTAL") AS
  select a.id_dcmnto,
		a.nmro_dcmnto,
		a.id_sjto_impsto,
		a.idntfccion_sjto,
		sum(nvl(a.vlor_cptal,0))vlor_cptal,
		sum(nvl(a.vlor_intres,0)) vlor_intres,
		sum(nvl(a.vlor_dscnto,0)) vlor_dscnto,
		sum(nvl(a.vlor_cptal,0)) + sum(nvl(a.vlor_intres,0)) - sum(nvl(a.vlor_dscnto,0)) as vlor_ttal
  from ( select a.id_dcmnto,
				a.nmro_dcmnto,
				a.id_sjto_impsto,
				a.idntfccion_sjto,
				case when b.cdgo_cncpto_tpo = 'C' then sum (b.vlor_dbe) end as vlor_cptal,
				case when b.cdgo_cncpto_tpo = 'I' then sum (b.vlor_dbe) end as vlor_intres,
				case when b.cdgo_cncpto_tpo = 'D' then sum (b.vlor_hber) end as vlor_dscnto
		   from v_re_g_documentos a
		   join re_g_documentos_detalle b on a.id_dcmnto = b.id_dcmnto
	--	  where a.id_dcmnto = 1126
	   group by a.id_dcmnto,
				a.nmro_dcmnto,
				a.id_sjto_impsto,
				a.idntfccion_sjto,
				b.cdgo_cncpto_tpo
		) a
group by a.id_dcmnto,
		a.nmro_dcmnto,
		a.id_sjto_impsto,
		a.idntfccion_sjto;

