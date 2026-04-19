
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_PLUSVALIA_PROCSO_DTLLE" ("ID_PLSVLIA_DTLLE", "ID_PRCSO_PLSVLIA", "CDGO_PRDIAL", "AREA_OBJTO", "MTRCLA_INMBLRIA_ARCHVO", "PRPTRIO", "VLOR_P1", "VLOR_P2", "AREA", "CLSFCCION_ZNA", "CMNA", "DRCCION", "HCHO_GNRDOR", "PRDIO_FRA_ESTDIO", "VLOR_PLSVLIA", "VLOR_TTAL_PLSVLIA", "VLOR_PLSVLIA_ACTLZDA", "RGSTRO_ERROR", "DSCRPCION_ERROR", "ESTDO_RGSTRO", "ID_IMPSTO_ACTO", "HCHO_GNRDOR_PNTAL", "ID_SJTO_IMPSTO", "ID_LQDCION", "ID_DCMNTO", "CDGO_PLSV_ESTDO", "ID_ACTO", "ID_PLNTLLA", "CNSCTVO_PZYSLVO", "TPO_PLSVLIA", "TRFA", "VLOR_PLSVLIA_IPC", "TXTO_TRFA", "ID_USO_LQDDO", "DSCRPCION_USO_LQDDO", "UDP", "FCHA_RGSTRO", "INDCDOR_PGDA", "RSPNSBLE", "IDNTFCCION", "MTRCLA_INMBLRIA", "RFNCIA_CTSTRAL", "NMRO_RDCDO") AS
  select a.id_plsvlia_dtlle,
       a.id_prcso_plsvlia,
       a.cdgo_prdial,
       a.area_objto,
       a.mtrcla_inmblria mtrcla_inmblria_archvo,
       a.prptrio,
       a.vlor_p1,
       a.vlor_p2,
       a.area,
       a.clsfccion_zna,
       a.cmna,
       a.drccion,
       a.hcho_gnrdor,
       a.prdio_fra_estdio,
       a.vlor_plsvlia,
       a.vlor_ttal_plsvlia,
       a.vlor_plsvlia_actlzda,
       a.rgstro_error,
       a.dscrpcion_error,
       a.estdo_rgstro,
       a.id_impsto_acto,
       c.nmbre_impsto_acto hcho_gnrdor_pntal,
       a.id_sjto_impsto,
       a.id_lqdcion,
       a.id_dcmnto,
       a.cdgo_plsv_estdo,
       a.id_acto,
       a.id_plntlla,
       a.cnsctvo_pzyslvo,
       a.tpo_plsvlia,
       a.trfa,
       a.vlor_plsvlia_ipc,
       a.txto_trfa,
       a.id_uso_lqddo,
       d.dscrpcion dscrpcion_uso_lqddo,
       a.udp,
       a.fcha_rgstro,
       decode(a.indcdor_pgda, 'S', 'Si', 'N', 'No') indcdor_pgda,
       (c.prmer_nmbre || c.sgndo_nmbre || c.prmer_aplldo || c.sgndo_aplldo) as rspnsble,
       c.idntfccion_rspnsble as idntfccion,
       nvl(a.mtrcla_inmblria, 'NO DEFINIDO') as mtrcla_inmblria,
       b.idntfccion_sjto as rfncia_ctstral,
       a.nmro_rdcdo
  from gi_g_plusvalia_procso_dtlle a
  left join v_si_i_sujetos_impuesto b
    on a.id_sjto_impsto = b.id_sjto_impsto
  left join v_si_i_sujetos_responsable c
    on b.id_sjto_impsto = c.id_sjto_impsto
   and c.prncpal_s_n = 'S'
  left join v_df_i_impuestos_acto c
    on a.id_impsto_acto = c.id_impsto_acto
   and c.cdgo_impsto = 'PLU'
  left join gi_d_plusvalia_uso_lqddo d
    on a.id_uso_lqddo = d.id_uso_lqddo
;

