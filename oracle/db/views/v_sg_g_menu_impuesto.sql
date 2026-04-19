
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_MENU_IMPUESTO" ("ID_MNU_IMPSTO", "CDGO_CLNTE", "ID_MNU", "NMBRE_MNU", "ID_APLCCION_GRPO", "ID_IMPSTO", "NMBRE_IMPSTO", "CDGO_IMPSTO", "ACTVO", "DSCRPCION_ACTVO") AS
  select a.id_mnu_impsto,
		b.cdgo_clnte,
		a.id_mnu,
		b.nmbre_mnu,
		b.id_aplccion_grpo,
		a.id_impsto,
		c.nmbre_impsto,
		c.cdgo_impsto,
		a.actvo,
		decode (a.actvo, 'S','Si','N','No') dscrpcion_actvo
   from sg_g_menu_impuesto	a
   join v_sg_g_menu			b on a.id_mnu 		= b.id_mnu
   join df_c_impuestos		c on a.id_impsto	= c.id_impsto;

