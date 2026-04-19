
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_CAJA_DETALLE" ("ID_RCDO_CJA_DTLLE", "ID_RCDO_CJA", "ESTDO_CJA", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "IDNTFCCION_ANTRIOR", "ID_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "CDGO_RCDO_ORGN_TPO", "ID_ORGEN", "NMRO_DCMNTO", "FCHA_RCDO", "FCHA_INGRSO_BNCO", "VLOR_REAL_RCBDO", "VLOR_CMBIO", "OBSRVCION", "CDGO_RCDO_ESTDO", "DSCRPCION_RCDO_ESTDO", "FCHA_APLICCION", "DSCRPCION_RCDO_ORGN_TPO") AS
  select	a.id_rcdo_cja_dtlle
		, a.id_rcdo_cja
		, decode(b.estdo_aprtra, 'A', 'Abierta', 'C', 'Cerrada') as estdo_cja
		, a.id_impsto
		, c.cdgo_impsto
		, c.nmbre_impsto
		, a.id_impsto_sbmpsto
        , d.nmbre_impsto_sbmpsto
		, a.id_sjto_impsto
		, g.cdgo_sjto_tpo
		, g.dscrpcion_sjto_tpo
		, g.idntfccion_sjto
		, g.idntfccion_sjto_frmtda
		, g.idntfccion_antrior
		, g.id_sjto_estdo
		, g.dscrpcion_sjto_estdo
		, a.cdgo_rcdo_orgn_tpo
		, a.id_orgen
		, case when a.cdgo_rcdo_orgn_tpo = 'DC' then
				( select d.nmro_dcmnto  from re_g_documentos    d where d.id_dcmnto   = a.id_orgen )
			   when a.cdgo_rcdo_orgn_tpo = 'DL' then
				( select d.nmro_cnsctvo from gi_g_declaraciones d where d.id_dclrcion = a.id_orgen )
		  end as nmro_dcmnto
		, a.fcha_rcdo
		, a.fcha_ingrso_bnco
        , a.vlor_real_rcbdo
        , a.vlor_cmbio
		, a.obsrvcion
		, a.cdgo_rcdo_estdo
		, e.dscrpcion as dscrpcion_rcdo_estdo
		, a.fcha_apliccion
		, f.dscrpcion as dscrpcion_rcdo_orgn_tpo
from	re_g_recaudos_caja_detalle	a
join	re_g_recaudos_caja			b	on	b.id_rcdo_cja 		 = 	a.id_rcdo_cja
join	df_c_impuestos				c	on	c.id_impsto			 =	a.id_impsto
										and	c.cdgo_clnte		 =	b.cdgo_clnte
join	df_i_impuestos_subimpuesto	d	on	d.id_impsto_sbmpsto	 =	a.id_impsto_sbmpsto
										and d.cdgo_clnte		 =	b.cdgo_clnte
										and d.id_impsto			 =	c.id_impsto
join 	re_d_recaudo_estado 		e 	on 	a.cdgo_rcdo_estdo    =  e.cdgo_rcdo_estdo
join 	re_d_recaudo_origen_tipo 	f 	on 	a.cdgo_rcdo_orgn_tpo =  f.cdgo_rcdo_orgn_tpo
join 	v_si_i_sujetos_impuesto 	g   on  a.id_sjto_impsto     =  g.id_sjto_impsto
;

