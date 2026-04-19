
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GJ_G_RECURSOS_ACCION" ("ID_RCRSO_ACCION", "ID_RCRSO", "ID_INSTNCIA_FLJO_PDRE", "ID_INSTNCIA_FLJO_HJO", "ID_SLCTUD", "ID_RCRSO_TIPO_CLNTE", "ID_RCRSO_TPO_ACCION", "ID_ACTO", "CDGO_CLNTE", "DSCRPCION", "ID_FLJO", "INDCDOR_AJSTE", "DSCRPCION_FLJO", "ID_INSTNCIA_FLJO_HJO_GNRDO", "ESTDO_INSTNCIA", "FCHA_INCIO", "FCHA_FIN_PLNDA", "FCHA_FIN_OPTMA", "INDCDOR_EXTSO", "OBSRVCION", "ID_AJSTE_MTVO", "ID_INSTNCIA_FLJO_INDC", "ID_RCRSO_ACCION_ANTRIOR") AS
  select  a.id_rcrso_accion,
          a.id_rcrso,
          b.id_instncia_fljo_pdre,
          b.id_instncia_fljo_hjo,
          b.id_slctud,
          b.id_rcrso_tipo_clnte,
          a.id_rcrso_tpo_accion,
          b.id_acto,
          b.cdgo_clnte,
          d.dscrpcion,
          c.id_fljo,
		  c.indcdor_ajste,
          e.dscrpcion_fljo,
          a.id_instncia_fljo_hjo id_instncia_fljo_hjo_gnrdo,
		  f.estdo_instncia,
          f.fcha_incio,
          f.fcha_fin_plnda,
          f.fcha_fin_optma,
		  a.indcdor_extso,
		  a.obsrvcion,
		  a.id_ajste_mtvo,
		  a.id_instncia_fljo_indc,
		  a.id_rcrso_accion_antrior
  from gj_g_recursos_accion				a
  inner join gj_g_recursos 			 	b on a.id_rcrso 			= b.id_rcrso
  inner join gj_d_recursos_tipo_accion 	c on a.id_rcrso_tpo_accion 	= c.id_rcrso_tpo_accion
  inner join gj_d_acciones 				d on c.id_accion 			= d.id_accion
  inner join wf_d_flujos 				e on c.id_fljo 				= e.id_fljo
  left  join v_wf_g_instancias_flujo    f on a.id_instncia_fljo_hjo = f.id_instncia_fljo
;

