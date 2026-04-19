
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_JURIDICO_SJTO" ("ID_SJTO", "IDNTFCCION_SJTO", "IDNTFCCION_ANTRIOR", "DRCCION", "CDGO_CLNTE", "CDGO_PSTAL", "FCHA_INGRSO", "NMBRE_DPRTMNTO", "NMBRE_MNCPIO", "ID_PRCSOS_JRDCO", "ID_PRCSOS_JRDCO_SJTO") AS
  select b.id_sjto,
	   b.idntfccion_sjto,
	   b.idntfccion_antrior,
	   b.drccion,
	   b.cdgo_clnte,
	   b.cdgo_pstal,
	   b.fcha_ingrso,
	   b.nmbre_dprtmnto,
	   b.nmbre_mncpio,
	   a.id_prcsos_jrdco,
	   a.id_prcsos_jrdco_sjto
  from cb_g_procesos_juridico_sjto a
  join v_si_c_sujetos b
	on b.id_sjto = a.id_sjto;

