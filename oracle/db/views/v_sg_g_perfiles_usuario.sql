
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_PERFILES_USUARIO" ("ID_PRFIL_USRIO", "CDGO_CLNTE", "ID_PRFIL", "NMBRE_PRFIL", "ID_USRIO", "USER_NAME", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA") AS
  select a.id_prfil_usrio,
         b.cdgo_clnte,
         a.id_prfil,
         b.nmbre_prfil,
         a.id_usrio,
         c.user_name,
         a.username_digita,
         a.fecha_digita,
         a.username_modifica,
         a.fecha_modifica
  from sg_g_perfiles_usuario a
  join sg_g_perfiles         b on a.id_prfil = b.id_prfil
  join sg_g_usuarios         c on a.id_usrio = c.id_usrio;

