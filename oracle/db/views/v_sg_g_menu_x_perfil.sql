
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_MENU_X_PERFIL" ("ID_PRFIL_MNU", "ID_APLCCION_GRPO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_PRFIL", "NMBRE_PRFIL", "ID_APLCCION", "NMRO_APLCCION", "NMBRE_APLCCION", "ID_MNU", "NMBRE_MNU", "NMRO_PGNA", "PGNAS_BREADCRUM", "ACTVO", "INDCDOR_VSBLE", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA") AS
  select m.id_prfil_mnu,
         a.id_aplccion_grpo,
         a.cdgo_clnte,
         a.nmbre_clnte,
         m.id_prfil,
         p.nmbre_prfil,
         a.id_aplccion,
         a.nmro_aplccion,
         a.nmbre_aplccion,
         m.id_mnu,
         n.nmbre_mnu,
         n.nmro_pgna,
         n.pgnas_breadcrum,
         n.actvo,
         n.indcdor_vsble,
         m.username_digita,
         m.fecha_digita,
         m.username_modifica,
         m.fecha_modifica
   from sg_g_perfiles_menu          m
   join sg_g_perfiles               p on m.id_prfil = p.id_prfil
   join sg_g_menu                   n on m.id_mnu = n.id_mnu
   join v_sg_g_aplicaciones_cliente a on n.id_aplccion = a.id_aplccion
  where a.actvo = 'S'
order by a.id_aplccion_grpo,
         m.id_prfil,
         a.id_aplccion,
		 m.id_mnu;

