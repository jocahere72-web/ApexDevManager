
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_CARTERA_ACTUAL" ("ID_CNVNIO_CRTRA", "ID_CNVNIO", "NMRO_CNVNIO", "FCHA_SLCTUD", "FCHA_APRBCION", "VGNCIA", "ID_PRDO", "PRDO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION", "VLOR_SLDO_CPTAL", "VLOR_INTRES", "VLOR_TTAL", "FCHA_APLCCION", "NMRO_ACTO_DSPLAY", "NMRO_ACTO", "ID_SJTO_IMPSTO", "CDGO_CNVNIO_ESTDO", "ID_ORGEN", "CDGO_MVMNTO_ORGEN") AS
  select a.id_cnvnio_crtra,
       a.id_cnvnio,
       b.nmro_cnvnio,
       b.fcha_slctud,
       b.fcha_aprbcion,
       a.vgncia,
       a.id_prdo,
       c.prdo,
       a.id_cncpto,
       d.cdgo_cncpto,
       d.dscrpcion,
       f.vlor_sldo_cptal,
       f.vlor_intres,
       (f.vlor_sldo_cptal + f.vlor_intres) vlor_ttal,
       b.fcha_aplccion,
       e.nmro_acto_dsplay,
       e.nmro_acto,
       b.id_sjto_impsto,
       b.cdgo_cnvnio_estdo,
       a.id_orgen,
       a.cdgo_mvmnto_orgen
  from gf_g_convenios_cartera a
  join gf_g_convenios b
    on a.id_cnvnio = b.id_cnvnio
  join df_i_periodos c
    on a.id_prdo = c.id_prdo
  join df_i_conceptos d
    on a.id_cncpto = d.id_cncpto
  left join v_gn_g_actos e
    on b.id_acto = e.id_acto
  join v_gf_g_cartera_x_concepto f
    on f.cdgo_clnte = b.cdgo_clnte
   and f.id_sjto_impsto = b.id_sjto_impsto
   and f.vgncia = a.vgncia
   and f.id_prdo = a.id_prdo
   and f.id_cncpto = a.id_cncpto
-- where b.id_cnvnio = 7514
 order by a.vgncia, prdo, cdgo_cncpto
;

