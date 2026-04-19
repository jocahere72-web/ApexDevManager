
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_PERFILES_BOTON" ("ID_PRFIL_BTON", "ID_PRFIL", "NMBRE_PRFIL", "ID_APLCCION", "NMRO_APLCCION", "NMBRE_APLCCION", "NMRO_PGNA", "ID_BTON", "NMBRE_BTON", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA") AS
  select b.id_prfil_bton,
         b.id_prfil,
         c.nmbre_prfil,
         b.id_aplccion,
         d.nmro_aplccion,
         d.nmbre_aplccion,
         b.nmro_pgna,
         b.id_bton,
         b.nmbre_bton,
         b.username_digita,
         b.fecha_digita,
         b.username_modifica,
         b.fecha_modifica
  from sg_g_perfiles_boton    b
  join sg_g_perfiles     c on b.id_prfil    = c.id_prfil
  join sg_g_aplicaciones d on b.id_aplccion = d.id_aplccion;

