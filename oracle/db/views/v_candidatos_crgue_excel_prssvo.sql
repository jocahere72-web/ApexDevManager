
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CANDIDATOS_CRGUE_EXCEL_PRSSVO" ("CDGO_CLNTE", "FCHA_LTE", "ID_SJTO", "IDNTFCCION_SJTO", "FNCNRIO", "VGNCIA", "ID_PRDO", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "RESP", "CDGO_TPO_PR", "ID_LTE", "ID_LTE2", "ID_SJTO_RSPNSBLE", "EMAIL") AS
  SELECT a.cdgo_clnte,
       '' as fcha_lte,
       '' as id_sjto,
       c.idntfccion_sjto,
       '' as fncnrio,
       a.vgncia,
       a.id_prdo,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       '' as resp,
       '' as cdgo_tpo_pr,
       '' as id_lte,
       '' as id_lte2,
       r.id_sjto_rspnsble,
       r.email
  FROM v_gf_g_cartera_x_concepto a
  JOIN v_si_i_sujetos_impuesto c
    ON a.id_sjto_impsto = c.id_sjto_impsto
   and c.id_sjto_estdo = 1
  join si_i_sujetos_responsable r
    on r.id_sjto_impsto = c.id_sjto_impsto
   and r.actvo = 'S'
 where a.vlor_sldo_cptal + a.vlor_intres > 0
   and not exists (select 1
          from cb_g_procesos_persuasivo_sjto s
         where s.id_sjto_orgen = c.id_sjto)
   and not exists (select 'x'
          from cb_g_procesos_jrdco_mvmnto m
         where m.id_sjto_impsto = a.id_sjto_impsto
           and m.vgncia = a.vgncia
           and m.id_prdo = a.id_prdo
           and m.id_cncpto = a.id_cncpto)
 group by a.cdgo_clnte,
          c.idntfccion_sjto,
          a.vgncia,
          a.id_prdo,
          a.id_impsto,
          a.id_impsto_sbmpsto,
          r.id_sjto_rspnsble,
          r.email
 order by c.idntfccion_sjto, a.vgncia, a.id_prdo;

