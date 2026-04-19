
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_CRTRA_DTRMNCION_AGRPADO" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_DTRMNCION", "NMRO_ACTO", "FCHA_DTRMNCION", "FCHA_NTFCCION", "ID_SJTO_IMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "ID_SJTO_ESTDO", "MTRCLA_INMBLRIA", "IDNTFCCION_RSPNSBLE", "PRPTRIO", "FCTRA_TTLO", "CDGO_MVNT_FNCRO_ESTDO", "VGNCIAS", "VLOR_SLDO_TTAL_INCIAL", "VLOR_SLDO_CPTAL", "VLOR_INTRES", "VLOR_SLDO_TTAL") AS
  select d.cdgo_clnte,
       d.id_impsto,
       d.id_impsto_sbmpsto,
       d.id_dtrmncion,
       a.nmro_acto,
       d.fcha_dtrmncion,
       a.fcha_ntfccion,
       i.id_sjto_impsto,
       i.id_sjto,
       i.idntfccion_sjto,
       i.id_sjto_estdo,
       p.mtrcla_inmblria,
       r.idntfccion idntfccion_rspnsble,
       r.prmer_nmbre prptrio,
       d.fctra_ttlo,
       listagg(distinct v.cdgo_mvnt_fncro_estdo, ', ') within group(order by v.cdgo_mvnt_fncro_estdo) as cdgo_mvnt_fncro_estdo,
       listagg(distinct v.vgncia, ', ') within group(order by v.vgncia) as vgncias,
       sum(t.vlor_cptal + t.vlor_intres) as vlor_sldo_ttal_incial,
       sum(v.vlor_sldo_cptal) as vlor_sldo_cptal,
       sum(v.vlor_intres) as vlor_intres,
       sum(v.vlor_sldo_cptal + v.vlor_intres) as vlor_sldo_ttal
  from gi_g_determinaciones d
  join gi_g_determinacion_detalle t
    on d.id_dtrmncion = t.id_dtrmncion
  join v_si_i_sujetos_impuesto i
    on i.id_sjto_impsto = d.id_sjto_impsto
   and i.id_impsto = d.id_impsto
   --and i.id_sjto_estdo = 1
   and i.cdgo_clnte = d.cdgo_clnte
  join v_gf_g_cartera_x_concepto v
    on d.id_sjto_impsto = v.id_sjto_impsto
   and d.cdgo_clnte = v.cdgo_clnte
   and v.id_impsto = d.id_impsto
   and v.vgncia = t.vgncia
   and v.id_prdo = t.id_prdo
   and v.id_cncpto = t.id_cncpto
   and v.id_sjto_impsto = t.id_sjto_impsto
  join si_i_sujetos_responsable r
    on r.id_sjto_impsto = i.id_sjto_impsto
   and r.prncpal_s_n = 'S'
  join gn_g_actos a
    on a.id_acto = d.id_acto
  left join si_i_predios p on p.id_sjto_impsto = d.id_sjto_impsto
 group by d.cdgo_clnte,
          d.id_impsto,
          d.id_impsto_sbmpsto,
          d.id_dtrmncion,
          a.nmro_acto,
          d.fcha_dtrmncion,
          a.fcha_ntfccion,
          i.id_sjto_impsto,
          i.id_sjto,
          i.idntfccion_sjto,
          i.id_sjto_estdo,
          r.idntfccion,
          r.prmer_nmbre,
          d.fctra_ttlo,
          p.mtrcla_inmblria
;

