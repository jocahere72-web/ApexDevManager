
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TTLOS_JDCL_ANLSS_IMPST" ("ID_TTLO_JDCIAL_ANLSIS_IMPSTO", "ID_TTLO_JDCIAL_ANLSIS", "ID_TTLO_JDCIAL", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA") AS
  select a.id_ttlo_jdcial_anlsis_impsto,
		a.id_ttlo_jdcial_anlsis,
		b.id_ttlo_jdcial,
		a.id_impsto,
		c.nmbre_impsto,
		a.id_impsto_sbmpsto,
		c.nmbre_impsto_sbmpsto,
		d.id_sjto,
		a.id_sjto_impsto,
		d.idntfccion_sjto,
		d.idntfccion_sjto_frmtda
   from gf_g_ttlos_jdcl_anlss_impst 	a
   join gf_g_titulos_jdcial_anlsis		b on a.id_ttlo_jdcial_anlsis	= b.id_ttlo_jdcial_anlsis
   join v_df_i_impuestos_subimpuesto	c on a.id_impsto_sbmpsto		= c.id_impsto_sbmpsto
   join v_si_i_sujetos_impuesto			d on a.id_sjto_impsto			= d.id_sjto_impsto;

