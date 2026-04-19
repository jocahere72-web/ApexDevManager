
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CARTERA_X_VIGENCIA" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "VGNCIA", "ID_PRDO", "PRDO", "CDGO_PRDCDAD", "DSCRPCION_PRDCDAD", "CDGO_MVMNTO_ORGN", "ID_ORGEN", "FCHA_ULTMO_MVMNTO", "CDGO_MVNT_FNCRO_ESTDO", "DSCRPCION_MVNT_FNCRO_ESTDO", "INDCDOR_MVMNTO_BLQDO", "DSCRPCION_INDCDOR_MVMNTO_BLQDO", "VLOR_SLDO_CPTAL", "VLOR_INTRES", "ID_SJTO_SCRSAL", "CDNA") AS
  select
         a.cdgo_clnte,
    a.id_impsto,
    a.id_impsto_sbmpsto,
    a.id_sjto_impsto,
    a.vgncia,
    a.id_prdo,
    b.prdo,
    b.cdgo_prdcdad,
    b.dscrpcion_prdcdad,
    a.cdgo_mvmnto_orgn,
    a.id_orgen,
    max(a.fcha_ultmo_mvmnto)fcha_ultmo_mvmnto,
    a.cdgo_mvnt_fncro_estdo,
    d.dscrpcion                       dscrpcion_mvnt_fncro_estdo,
    a.indcdor_mvmnto_blqdo,
    decode(a.indcdor_mvmnto_blqdo, 'S', 'Si', 'N', 'No')  dscrpcion_indcdor_mvmnto_blqdo,
    sum(a.vlor_sldo_cptal) vlor_sldo_cptal,
    sum(a.vlor_intres) vlor_intres,
    a.id_sjto_scrsal,
        a.cdna
   from gf_g_mvmntos_cncpto_cnslddo   a
   join v_df_i_periodos         b on a.id_prdo          = b.id_prdo
   join df_i_conceptos          c on a.id_cncpto        = c.id_cncpto
   join gf_d_mvmnto_fncro_estdo     d on a.cdgo_mvnt_fncro_estdo  = d.cdgo_mvnt_fncro_estdo
  where a.cdgo_mvnt_fncro_estdo = 'NO'
  or    (a.cdgo_mvnt_fncro_estdo = 'AN' and a.cdgo_mvmnto_orgn = 'FS')
  or     a.cdgo_mvnt_fncro_estdo = 'RC'
  or     a.cdgo_mvnt_fncro_estdo = 'CN'
group by
        a.cdgo_clnte,
    a.id_impsto,
    a.id_impsto_sbmpsto,
    a.id_sjto_impsto,
    a.vgncia,
    a.id_prdo,
    b.prdo,
    b.cdgo_prdcdad,
    b.dscrpcion_prdcdad,
    a.cdgo_mvmnto_orgn,
    a.id_orgen,
    a.cdgo_mvnt_fncro_estdo,
    d.dscrpcion,
    a.indcdor_mvmnto_blqdo,
    a.id_sjto_scrsal,
        a.cdna;

