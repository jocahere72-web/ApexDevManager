
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GJ_G_RECURSOS" ("ID_RCRSO", "ID_INSTNCIA_FLJO_PDRE", "ID_INSTNCIA_FLJO_HJO", "ID_SLCTUD", "ID_RCRSO_TIPO_CLNTE", "A_I_R", "CDGO_CLNTE", "CDGO_RCRSO_TPO", "DSCRPCION_RCRSO_TPO", "UNDAD_DRCION", "DRCION", "DIA_TPO", "UNDAD_DRCION_PR", "DRCION_PR", "DIA_TPO_PR", "INDCDOR_A_I_R", "ID_ACTO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "FCHA_NTFCCION", "FCHA_ACTO", "FCHA", "FCHA_FIN_PRYCTDA", "FCHA_FIN", "CDGO_RSPTA", "DSCRPCION") AS
  select  a.id_rcrso,
          a.id_instncia_fljo_pdre,
          a.id_instncia_fljo_hjo,
          a.id_slctud,
          a.id_rcrso_tipo_clnte,
		  a.a_i_r,
		  c.cdgo_clnte,
          c.cdgo_rcrso_tpo,
          c.dscrpcion_rcrso_tpo,
          c.undad_drcion,
          c.drcion,
          c.dia_tpo,
          c.undad_drcion_pr,
          c.drcion_pr,
          c.dia_tpo_pr,
          c.a_i_r indcdor_a_i_r,
          a.id_acto,
          b.nmro_acto,
          b.nmro_acto_dsplay,
          b.id_acto_tpo,
          b.dscrpcion_acto_tpo,
          b.cdgo_acto_orgen,
          b.dscrpcion_acto_orgen,
          b.fcha_ntfccion,
          b.fcha as fcha_acto,
          a.fcha,
		  a.fcha_fin_pryctda,
		  a.fcha_fin,
		  a.cdgo_rspta,
         d.dscrpcion
  from gj_g_recursos      					a
  left join v_gn_g_actos  					b   on a.id_acto                =   b.id_acto
  inner join v_gj_d_recursos_tipo_cliente 	c   on a.id_rcrso_tipo_clnte    =   c.id_rcrso_tipo_clnte
  left join gj_d_recursos_respuesta      	d   on a.cdgo_rspta             =   d.cdgo_rspta
;

