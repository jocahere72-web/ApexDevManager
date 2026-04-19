
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_PROCESOS_PERSUASIVO_SJTO" ("ID_SJTO", "IDNTFCCION", "DRCCION", "CDGO_CLNTE", "FCHA_INGRSO", "NMBRE_DPRTMNTO", "NMBRE_MNCPIO", "ID_PRCSOS_PRSSVO", "ID_PRCSOS_PRSSVO_SJTO", "CDGO_SJTO_ORGEN", "DSCRPCION_SJTO_ORGEN") AS
  select b.id_sjto,
     b.idntfccion,
     b.drccion,
     c.cdgo_clnte,
     b.fcha_ingrso,
     b.nmbre_dprtmnto,
     b.nmbre_mncpio,
     a.id_prcsos_prssvo,
     a.id_prcsos_prssvo_sjto,
     a.cdgo_sjto_orgen,
     decode(a.cdgo_sjto_orgen, 'NE', 'No Existente', 'EX', 'Existente')as dscrpcion_sjto_orgen
  from cb_g_procesos_persuasivo_sjto a
  join v_cb_g_procesos_simu_sujeto b on b.id_sjto          = a.id_sjto_orgen
  join cb_g_procesos_persuasivo    c on a.id_prcsos_prssvo = c.id_prcsos_prssvo;

