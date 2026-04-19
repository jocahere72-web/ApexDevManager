
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_SIMU_SUJETO_PERSUASIVO" ("ID_PRCSOS_SMU_LTE", "ID_PRCSOS_SMU_SJTO", "IDNTFCCION", "DRCCION", "VLOR_TTAL_DDA", "FCHA_INGRSO", "INDCDOR_PRCSDO", "ID_SJTO", "CDGO_ORGN_SJTO", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "ACTVO", "EMAIL", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_PRCSO_TPO") AS
  SELECT /*+ INDEX(b idx_si_sujetos_id) */ -- Forzamos el uso del índice en SI_C_SUJETOS
       a.id_prcsos_smu_lte,
       a.id_prcsos_smu_sjto,
       b.idntfccion,
       b.drccion,
       a.vlor_ttal_dda,
       TO_CHAR(a.fcha_ingrso, 'dd/mm/yyyy') AS fcha_ingrso,
       a.indcdor_prcsdo,
       a.id_sjto,
       'EX' AS cdgo_orgn_sjto,
       b.id_dprtmnto,
       c.nmbre_dprtmnto,
       b.id_mncpio,
       d.nmbre_mncpio,
       a.actvo,
       g.email,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       h.id_prcso_tpo
  FROM cb_g_procesos_simu_sujeto a
  INNER JOIN cb_g_procesos_simu_lote h ON h.id_prcsos_smu_lte = a.id_prcsos_smu_lte and h.id_prcso_tpo = 1
  INNER JOIN si_c_sujetos b ON b.id_sjto = a.id_sjto
  INNER JOIN df_s_departamentos c ON c.id_dprtmnto = b.id_dprtmnto
  INNER JOIN df_s_municipios d ON d.id_mncpio = b.id_mncpio
  LEFT JOIN gn_g_candidatos_carga_prssvo g
    ON g.id_lte_prcso = a.id_prcsos_smu_lte
   AND g.idntfccion = b.idntfccion

UNION ALL

-- PARTE 2: Sujetos inexistentes (NE)
SELECT a.id_prcsos_smu_lte,
       a.id_prcsos_smu_sjto_inxstnte AS id_prcsos_smu_sjto,
       '999999999999' AS idntfccion,
       NULL AS drccion,
       0 AS vlor_ttal_dda,
       TO_CHAR(a.fcha_ingrso, 'dd/mm/yyyy') AS fcha_ingrso,
       a.indcdor_prcsdo,
       a.id_sjto_inxstnte AS id_sjto,
       'NE' AS cdgo_orgn_sjto,
       NULL AS id_dprtmnto,
       NULL AS nmbre_dprtmnto,
       NULL AS id_mncpio,
       NULL AS nmbre_mncpio,
       'S' AS actvo,
       '' AS email,
       NULL AS id_impsto,
       NULL AS id_impsto_sbmpsto,
       NULL AS id_prcso_tpo
  FROM cb_g_prcss_sm_sjto_inxstnte a;

