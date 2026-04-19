
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_AJUSTE_DETALLE" ("ID_AJSTE_DTLLE", "ID_AJSTE", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CONCEPTO", "ID_PRDO", "PRDO", "DSCRPCION_PERIODO", "VGNCIA", "TPO_AJSTE", "DSCRPCION_TPO_AJSTE", "SLDO_CPTAL", "VLOR_INTRES", "VLOR_AJSTE", "FCHA", "SALDO_TOTAL", "FCHA_PRYCCION_INTRES", "INTRES_CPTAL_MRTRIO", "INTRES_AJSTE_MRTRIO") AS
  select
    a.id_ajste_dtlle,
    a.id_ajste,
    a.id_cncpto,
    b.cdgo_cncpto,
    b.dscrpcion dscrpcion_concepto,
    a.id_prdo,
    c.prdo,
    c.dscrpcion dscrpcion_periodo,
    a.vgncia,
    x.tpo_ajste,
   case
     when  x.tpo_ajste = 'CR' then
     'Credito'
     else
      'Debito'
    end dscrpcion_tpo_ajste,
    a.sldo_cptal,
    a.vlor_intres,
    a.vlor_ajste,
    x.fcha,
    case
     when  x.tpo_ajste = 'CR' and ajste_dtlle_tpo <> 'M' then
     (a.sldo_cptal-a.vlor_ajste)
   when  x.tpo_ajste = 'DB' and ajste_dtlle_tpo <> 'M' then
      (a.sldo_cptal+a.vlor_ajste)
   else
     0
    end saldo_total,
    a.fcha_pryccion_intres,
    a.intres_cptal_mrtrio,
    a.intres_ajste_mrtrio
 from gf_g_ajustes x
 join gf_g_ajuste_detalle a
  on x.id_ajste = a.id_ajste
 join df_i_conceptos b
   on a.id_cncpto = b.id_cncpto
  and x.cdgo_clnte = b.cdgo_clnte
 join df_i_periodos c
   on a.id_prdo = c.id_prdo
  and x.cdgo_clnte = c.cdgo_clnte
;

