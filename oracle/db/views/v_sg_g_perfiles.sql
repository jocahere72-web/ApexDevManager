
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_PERFILES" ("ID_PRFIL", "CDGO_CLNTE", "NMBRE_PRFIL", "ACTVO", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA") AS
  select id_prfil,
		 cdgo_clnte,
         nmbre_prfil,
         actvo,
         username_digita,
         fecha_digita,
         username_modifica,
         fecha_modifica
   from sg_g_perfiles
order by cdgo_clnte, id_prfil;

