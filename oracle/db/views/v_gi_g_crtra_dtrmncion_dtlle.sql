
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_CRTRA_DTRMNCION_DTLLE" ("CDGO_CLNTE", "ID_DTRMNCION", "FCHA_DTRMNCION", "NMRO_ACTO", "VGNCIA_DTRMNCION", "FCHA_NTFCCION", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "VGNCIA", "ID_PRDO", "ID_CNCPTO", "CDGO_MVMNTO_ORGN", "ID_ORGEN", "ID_MVMNTO_FNCRO", "VLOR_SLDO_CPTAL", "VLOR_INTRES", "VLOR_SLDO_TTAL", "CDGO_MVNT_FNCRO_ESTDO", "FCTRA_TTLO") AS
  select d.cdgo_clnte,
       d.id_dtrmncion,
       d.fcha_dtrmncion,
       a.nmro_acto,
       TO_CHAR(d.fcha_dtrmncion, 'YYYY') vgncia_dtrmncion,
       a.fcha_ntfccion,
       d.id_impsto,
       d.id_impsto_sbmpsto,
       i.id_sjto_impsto,
       i.id_sjto,
       i.idntfccion_sjto,
       v.vgncia,
       v.id_prdo,
       v.id_cncpto,
       v.cdgo_mvmnto_orgn,
       v.id_orgen,
       v.id_mvmnto_fncro,
       v.vlor_sldo_cptal,
       v.vlor_intres,
       v.vlor_sldo_cptal + v.vlor_intres vlor_sldo_ttal,
       v.cdgo_mvnt_fncro_estdo,
       d.fctra_ttlo
  from gi_g_determinaciones d
  join gi_g_determinacion_detalle t
    on d.id_dtrmncion = t.id_dtrmncion
  join v_si_i_sujetos_impuesto i
    on i.id_sjto_impsto = d.id_sjto_impsto
   and i.id_impsto = d.id_impsto
   and i.id_sjto_estdo = 1
   and i.cdgo_clnte = d.cdgo_clnte
  join gn_g_actos a
    on a.id_acto = d.id_acto
  join v_gf_g_cartera_x_concepto v
    on d.id_sjto_impsto = v.id_sjto_impsto
   and d.cdgo_clnte = v.cdgo_clnte
   and v.id_impsto = d.id_impsto
   and v.vgncia = t.vgncia
   and v.id_prdo = t.id_prdo
   and v.id_orgen = t.id_orgen
   and v.id_cncpto = t.id_cncpto
;

