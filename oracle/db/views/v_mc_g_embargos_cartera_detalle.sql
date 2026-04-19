
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBARGOS_CARTERA_DETALLE" ("CNSCTVO_EMBRGO", "FCHA_ACTO", "ID_PRCSOS_JRDCO", "NMRO_PRCSO_JRDCO", "ID_EMBRGOS_CRTRA_DTLLE", "ID_EMBRGOS_CRTRA", "ID_SJTO_IMPSTO", "VGNCIA", "ID_PRDO", "ID_CNCPTO", "VLOR_CPTAL", "VLOR_INTRES", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_MVMNTO_ORGN", "ID_ORGEN", "ID_MVMNTO_FNCRO") AS
  select b.nmro_acto cnsctvo_embrgo,
       b.fcha_acto,
       d.id_prcsos_jrdco,
       d.nmro_prcso_jrdco,
       a.id_embrgos_crtra_dtlle,
       a.id_embrgos_crtra,
       a.id_sjto_impsto,
       a.vgncia,
       a.id_prdo,
       a.id_cncpto,
       a.vlor_cptal,
       a.vlor_intres,
       a.cdgo_clnte,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       a.cdgo_mvmnto_orgn,
       a.id_orgen,
       a.id_mvmnto_fncro
  from mc_g_embargos_cartera_detalle a
  join mc_g_embargos_resolucion b on a.id_embrgos_crtra = b.id_embrgos_crtra
  join mc_g_embrgos_crt_prc_jrd c on a.id_embrgos_crtra = c.id_embrgos_crtra
  join cb_g_procesos_juridico d on c.id_prcsos_jrdco = d.id_prcsos_jrdco;

