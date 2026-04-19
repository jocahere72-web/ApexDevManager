
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_DTLLE_CNCPTO" ("ID_DCMNTO", "NMRO_DCMNTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "ID_CNCPTO", "VLOR_CPTAL", "VLOR_INTRES", "VLOR_DSCNTO", "VLOR_TTAL") AS
  select a.id_dcmnto,
		   a.nmro_dcmnto,
		   a.id_sjto_impsto,
		   a.idntfccion_sjto,
           a.id_cncpto,
		   a.vlor_cptal,
		   a.vlor_intres,
		   a.vlor_dscnto,
		   a.vlor_cptal + a.vlor_intres - a.vlor_dscnto as vlor_ttal
	 from ( with w_re_g_documentos_detalle as ( select sum(vlor_dbe)  as vlor_dbe,
													   sum(vlor_hber) as vlor_hber,
													   id_cncpto,
													   id_dcmnto
												  from re_g_documentos_detalle
											  group by id_cncpto,
													   id_dcmnto
											   )
			 select a.id_dcmnto,
					nvl(sum(a.vlor_dbe),0) vlor_cptal,
					b.nmro_dcmnto,
					b.id_sjto_impsto,
					b.idntfccion_sjto,
                    a.id_cncpto,
					sum( nvl( e.vlor_dbe , 0 )) as vlor_intres,
					sum( nvl( g.vlor_hber , 0 )) as vlor_dscnto
			   from re_g_documentos_detalle a
			   join v_re_g_documentos b
				 on a.id_dcmnto          = b.id_dcmnto
			   join gf_g_movimientos_detalle c
				 on a.id_mvmnto_dtlle    = c.id_mvmnto_dtlle
			   join v_df_i_impuestos_acto_concepto d
				 on b.id_impsto 	        = d.id_impsto
				and b.id_impsto_sbmpsto     = d.id_impsto_sbmpsto
				and c.vgncia    		    = d.vgncia
				and c.id_prdo   		    = d.id_prdo
				and a.id_cncpto             = d.id_cncpto
		  left join w_re_g_documentos_detalle e
				 on a.id_dcmnto             = e.id_dcmnto
				and d.id_cncpto_intres_mra  = e.id_cncpto
		  left join df_i_conceptos f
				 on b.id_impsto             = f.id_impsto
				and a.id_cncpto             = f.id_cncpto_rlcnal
				and f.cdgo_cncpto_tpo       = 'CRD'
				and f.actvo                 = 'S'
		  left join w_re_g_documentos_detalle g
				 on a.id_dcmnto             = g.id_dcmnto
				and f.id_cncpto             = g.id_cncpto
			  -- where a.id_dcmnto             = '75'
		   group by a.id_dcmnto,
					b.nmro_dcmnto,
					b.id_sjto_impsto,
					b.idntfccion_sjto,
					a.id_cncpto
		 ) a;

