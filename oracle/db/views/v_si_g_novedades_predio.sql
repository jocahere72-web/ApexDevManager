
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_NOVEDADES_PREDIO" ("ID_NVDAD_PRDIO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_ENTDAD_NVDAD", "DSCRPCION_ENTDAD_NVDAD", "ID_ACTO_TPO", "CDGO_ACTO_TPO", "DSCRPCION_ACTO_TPO", "NMRO_DCMTO_SPRTE", "FCHA_DCMNTO_SPRTE", "FCHA_INCIO_APLCCION", "OBSRVCION", "INDCDOR_RLQDCION", "ID_INSTNCIA_FLJO", "ID_INSTNCIA_FLJO_PDRE", "ID_SLCTUD", "FCHA_RGSTRO", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "ID_FNCNRIO") AS
  select a.id_nvdad_prdio
     , a.cdgo_clnte
     , b.nmbre_clnte
 	 , a.id_impsto
     , c.nmbre_impsto
     , a.id_impsto_sbmpsto
     , d.nmbre_impsto_sbmpsto
     , a.id_entdad_nvdad
     , e.dscrpcion as dscrpcion_entdad_nvdad
     , a.id_acto_tpo
     , f.cdgo_acto_tpo
     , f.dscrpcion as dscrpcion_acto_tpo
     , a.nmro_dcmto_sprte
     , a.fcha_dcmnto_sprte
     , a.fcha_incio_aplccion
     , a.obsrvcion
	 , a.indcdor_rlqdcion
     , a.id_instncia_fljo
     , a.id_instncia_fljo_pdre
     , a.id_slctud
     , a.fcha_rgstro
     , a.id_usrio
     , g.idntfccion
     , g.nmbre_trcro
     , g.id_fncnrio
  from si_g_novedades_predio 		a
  join df_s_clientes 				b on a.cdgo_clnte 		 = b.cdgo_clnte
  join df_c_impuestos 				c on a.id_impsto 		 = c.id_impsto
  join df_i_impuestos_subimpuesto 	d on a.id_impsto_sbmpsto = d.id_impsto_sbmpsto
  join df_i_entidades_novedad 		e on a.id_entdad_nvdad 	 = e.id_entdad_nvdad
  join gn_d_actos_tipo 				f on a.id_acto_tpo 		 = f.id_acto_tpo
  join v_sg_g_usuarios 				g on a.id_usrio 		 = g.id_usrio;

