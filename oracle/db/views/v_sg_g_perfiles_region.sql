
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_PERFILES_REGION" ("ID_PRFIL_RGION", "ID_PRFIL", "NMBRE_PRFIL", "ID_APLCCION", "NMRO_APLCCION", "NMBRE_APLCCION", "NMRO_PGNA", "ID_RGION", "NMBRE_RGION", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA") AS
  select b.id_prfil_rgion,
         b.id_prfil,
         a.nmbre_prfil,
         b.id_aplccion,
         c.nmro_aplccion,
		 c.nmbre_aplccion,
         b.nmro_pgna,
         b.id_rgion,
         b.nmbre_rgion,
         b.username_digita,
         b.fecha_digita,
         b.username_modifica,
         b.fecha_modifica
    from sg_g_perfiles_region b
    left join sg_g_perfiles        a on b.id_prfil    = a.id_prfil
    left join sg_g_aplicaciones    c on b.id_aplccion = c.id_aplccion;

