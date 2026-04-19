
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_APLICACIONES" ("ID_APLCCION", "NMRO_APLCCION", "NMBRE_APLCCION", "DSCRPCION_APLCCION", "ORDEN", "ACTVO", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA") AS
  select id_aplccion,
		     nmro_aplccion,
         nmbre_aplccion,
         dscrpcion_aplccion,
         orden,
         actvo,
         username_digita,
         fecha_digita,
         username_modifica,
         fecha_modifica
    from sg_g_aplicaciones
order by id_aplccion;

