
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_MENU" ("ID_MNU", "CDGO_CLNTE", "ID_APLCCION_GRPO", "NMBRE_APLCCION_GRPO", "ID_APLCCION", "NMBRE_APLCCION", "NMRO_APLCCION", "NMBRE_MNU", "DSCRPCION_MNU", "ID_MNU_PDRE", "NMBRE_MNU_APDRE", "DSTNO_TPO", "DSCRPCION_DSTNO_TPO", "NMRO_PGNA", "PRMTRO_CMPO", "PRMTRO_VLOR", "URL", "ORDEN", "ACTVO", "ACTIVO", "CLEAR_CACHE", "LIMPIAR_CACHE", "INDCDOR_VSBLE", "VISIBLE", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA") AS
  select a.id_mnu,
         e.cdgo_clnte,
         e.id_aplccion_grpo,
         e.nmbre_aplccion_grpo,
         a.id_aplccion,
         b.nmbre_aplccion,
         b.nmro_aplccion,
         a.nmbre_mnu,
         a.dscrpcion_mnu,
         a.id_mnu_pdre,
		 c.nmbre_mnu 									nmbre_mnu_apdre,
         a.dstno_tpo,
		 d.dscrpcion_dstno_tpo,
         a.nmro_pgna,
         a.prmtro_cmpo,
         a.prmtro_vlor,
         a.url,
         a.orden,
         a.actvo,
		 decode (a.actvo, 'S','Si','N','No') 			activo,
         a.clear_cache,
		 decode (a.clear_cache, 'S','Si','N','No')		limpiar_cache,
         a.indcdor_vsble,
		 decode (a.indcdor_vsble, 'S','Si','N','No')	visible,
		 a.username_digita,
		 a.fecha_digita,
		 a.username_modifica,
		 a.fecha_modifica
    from sg_g_menu          			a
	join sg_g_aplicaciones 				b on a.id_aplccion	= b.id_aplccion
	join v_sg_g_aplicaciones_cliente	e on a.id_aplccion	= e.id_aplccion
    left join sg_g_menu          		c on a.id_mnu_pdre 	= c.id_mnu
    left join sg_d_destinos_tipo 		d on a.dstno_tpo   	= d.dstno_tpo
order by e.id_aplccion_grpo, e.cdgo_clnte, a.id_aplccion, a.id_mnu;

