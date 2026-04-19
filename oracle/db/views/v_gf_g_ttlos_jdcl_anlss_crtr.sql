
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TTLOS_JDCL_ANLSS_CRTR" ("ID_TTLO_JDCIAL_ANLSIS_CRTRA", "ID_TTLO_JDCIAL_ANLSIS", "ID_TTLO_JDCIAL_ANLSIS_IMPSTO", "ID_TTLO_JDCIAL", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "VGNCIA", "ID_PRDO", "PRDO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION") AS
  select a.id_ttlo_jdcial_anlsis_crtra,
		b.id_ttlo_jdcial_anlsis,
		b.id_ttlo_jdcial_anlsis_impsto,
		b.id_ttlo_jdcial,
		b.id_impsto,
		b.nmbre_impsto,
		b.id_impsto_sbmpsto,
		b.nmbre_impsto_sbmpsto,
		a.vgncia,
		a.id_prdo,
		c.prdo,
		a.id_cncpto,
		d.cdgo_cncpto,
		d.dscrpcion
   from gf_g_ttlos_jdcl_anlss_crtr		a
   join v_gf_g_ttlos_jdcl_anlss_impst	b on a.id_ttlo_jdcial_anlsis_impsto		= b.id_ttlo_jdcial_anlsis_impsto
   join df_i_periodos					c on a.id_prdo					= c.id_prdo
   join df_i_conceptos					d on a.id_cncpto				= d.id_cncpto;

