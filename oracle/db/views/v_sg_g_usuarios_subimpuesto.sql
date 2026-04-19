
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_USUARIOS_SUBIMPUESTO" ("ID_USRIO_SBMPSTO", "ID_USRIO", "USER_NAME", "NMBRE_TRCRO", "IDNTFCCION", "ID_FNCNRIO", "ID_TRCRO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ACTVO", "DSCRPCION_ACTVO") AS
  select a.id_usrio_sbmpsto,
		a.id_usrio,
		b.user_name,
		b.nmbre_trcro,
		b.idntfccion,
		b.id_fncnrio,
		b.id_trcro,
		a.id_impsto,
		upper (c.nmbre_impsto || ' [' || c.cdgo_impsto || ']' ) nmbre_impsto,
		a.id_impsto_sbmpsto,
		upper (c.nmbre_impsto_sbmpsto || ' [' || c.cdgo_impsto_sbmpsto || ']' ) nmbre_impsto_sbmpsto,
		a.actvo,
		decode(a.actvo, 'S', 'Si', 'No') dscrpcion_actvo
   from sg_g_usuarios_subimpuesto		a
   join v_sg_g_usuarios					b on a.id_usrio = b.id_usrio
   join v_df_i_impuestos_subimpuesto	c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto;

