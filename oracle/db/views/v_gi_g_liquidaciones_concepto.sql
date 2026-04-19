
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_LIQUIDACIONES_CONCEPTO" ("ID_LQDCION_CNCPTO", "ID_LQDCION", "ID_IMPSTO_ACTO_CNCPTO", "ID_IMPSTO_ACTO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "GNRA_INTRES_MRA", "FCHA_VNCMNTO", "VLOR_LQDDO", "VLOR_CLCLDO", "TRFA", "BSE_CNCPTO", "TXTO_TRFA", "VLOR_INTRES", "INDCDOR_LMTA_IMPSTO", "DSCRPCION_LMTA_IMPSTO", "FCTOR", "INDCDOR_TRFA_CRCTRSTCAS") AS
  select a.id_lqdcion_cncpto
     , a.id_lqdcion
     , a.id_impsto_acto_cncpto
     , b.id_impsto_acto
     , b.id_cncpto
     , c.cdgo_cncpto
     , c.dscrpcion as dscrpcion_cncpto
     , b.gnra_intres_mra
     , a.fcha_vncmnto
     , a.vlor_lqddo
     , a.vlor_clcldo
     , a.trfa
     , a.bse_cncpto
     , a.txto_trfa
     , a.vlor_intres
     , a.indcdor_lmta_impsto
         , decode( a.indcdor_lmta_impsto , 'S' , 'Si' , 'No' ) as dscrpcion_lmta_impsto
     , a.fctor
     , b.indcdor_trfa_crctrstcas
  from gi_g_liquidaciones_concepto    a
  join df_i_impuestos_acto_concepto   b on a.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto
  join df_i_conceptos                 c   on b.id_cncpto             = c.id_cncpto
;

