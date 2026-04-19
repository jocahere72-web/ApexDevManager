
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_MENU_X_USUARIO" ("ID_USRIO", "USER_NAME", "ID_APLCCION_GRPO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_PRFIL", "NMBRE_PRFIL", "ID_APLCCION", "NMRO_APLCCION", "NMBRE_APLCCION", "ID_MNU", "NMBRE_MNU", "NMRO_PGNA", "PGNAS_BREADCRUM", "ACTVO", "INDCDOR_VSBLE") AS
  select u.id_usrio,
         u.user_name,
         p.id_aplccion_grpo,
         p.cdgo_clnte,
         p.nmbre_clnte,
         p.id_prfil,
         p.nmbre_prfil,
         p.id_aplccion,
         p.nmro_aplccion,
         p.nmbre_aplccion,
         p.id_mnu,
         p.nmbre_mnu,
         p.nmro_pgna,
         p.pgnas_breadcrum,
         p.actvo,
         p.indcdor_vsble
    from v_sg_g_perfiles_usuario    u
    join v_sg_g_menu_x_perfil       p on u.id_prfil = p.id_prfil
order by p.id_aplccion_grpo,
         p.cdgo_clnte,
         u.id_usrio,
         p.id_prfil,
         p.id_aplccion,
         p.id_mnu;

