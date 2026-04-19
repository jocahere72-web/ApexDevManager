
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_SIMU_SUJETO" ("ID_PRCSOS_SMU_LTE", "ID_PRCSOS_SMU_SJTO", "IDNTFCCION", "DRCCION", "VLOR_TTAL_DDA", "FCHA_INGRSO", "INDCDOR_PRCSDO", "ID_SJTO", "CDGO_ORGN_SJTO", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "ACTVO", "EMAIL", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_PRCSO_TPO") AS
  select a.id_prcsos_smu_lte,
       a.id_prcsos_smu_sjto,
       /*pkg_gn_generalidades.fnc_cl_formato_texto(p_txto           => b.idntfccion,
                                                 p_frmto          => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx',
                                                 p_crcter_dlmtdor => '-') idntfccion,*/
       b.idntfccion,
       b.drccion,
       a.vlor_ttal_dda,
       to_char(a.fcha_ingrso, 'dd/mm/yyyy') as fcha_ingrso,
       a.indcdor_prcsdo,
       a.id_sjto,
       'EX' as cdgo_orgn_sjto,
       b.id_dprtmnto,
       c.nmbre_dprtmnto,
       b.id_mncpio,
       d.nmbre_mncpio,
       a.actvo,
       g.email,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       h.id_prcso_tpo
  from cb_g_procesos_simu_sujeto a
  join si_c_sujetos b
    on b.id_sjto = a.id_sjto
  join df_s_departamentos c
    on c.id_dprtmnto = b.id_dprtmnto
  join df_s_municipios d
    on d.id_mncpio = b.id_mncpio
  left join gn_g_candidatos_carga_prssvo g
    on g.id_lte_prcso = a.id_prcsos_smu_lte
   and b.idntfccion = g.idntfccion
  join cb_g_procesos_simu_lote h
    on h.id_prcsos_smu_lte = a.id_prcsos_smu_lte
union
select a.id_prcsos_smu_lte,
       a.id_prcsos_smu_sjto_inxstnte as id_prcsos_smu_sjto,
       '999999999999' as idntfccion,
       null as drccion,
       0 as vlor_ttal_dda,
       to_char(a.fcha_ingrso, 'dd/mm/yyyy') as fcha_ingrso,
       a.indcdor_prcsdo,
       a.id_sjto_inxstnte as id_sjto,
       'NE' as cdgo_orgn_sjto,
       null as id_dprtmnto,
       null as nmbre_dprtmnto,
       null as id_mncpio,
       null as nmbre_mncpio,
       'S' as actvo,
       '' as email,
       null as id_impsto,
       null as id_impsto_sbmpsto,
       null as id_prcso_tpo
  from cb_g_prcss_sm_sjto_inxstnte a;

