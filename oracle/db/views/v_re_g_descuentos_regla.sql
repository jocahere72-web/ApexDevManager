
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DESCUENTOS_REGLA" ("ID_DSCNTO_RGLA", "CDGO_CLNTE", "NMBRE_CLNTE", "DSCRPCION", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "FCHA_DSDE", "FCHA_HSTA", "VGNCIA_DSDE", "ID_PRDO_DSDE", "PRDO_DSDE", "VGNCIA_HSTA", "ID_PRDO_HSTA", "PRDO_HSTA", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "ID_CNCPTO_DSCNTO", "CDGO_CNCPTO_DSCNTO", "DSCRPCION_CNCPTO_DSCNTO", "ID_CNCPTO_DSCNTO_GRPO", "CDGO_CNCPTO_DSCNTO_GRPO", "DSCRPCION_CNCPTO_DSCNTO_GRPO", "PRCNTJE_DSCNTO", "PRCNTJE_DSCNTO_ENTRO", "CDGO_DSCNTO_TPO", "DSCRPCION_CDGO_TPO_DSCNTO", "ACTVO", "DSCRPCION_ACTVO", "IND_EXTNDE_TMPO", "IND_APLCA_CNVNIO", "TPO_INTRES_BNCRIO") AS
  select a.id_dscnto_rgla,
    a.cdgo_clnte,
    b.nmbre_clnte,
    a.dscrpcion,
    a.id_impsto,
    c.nmbre_impsto,
    a.id_impsto_sbmpsto,
    d.nmbre_impsto_sbmpsto,
    a.fcha_dsde,
    a.fcha_hsta,
    a.vgncia_dsde,
    a.id_prdo_dsde,
    e.prdo                              prdo_dsde,
    a.vgncia_hsta,
    a.id_prdo_hsta,
    f.prdo                              prdo_hsta,
    a.id_cncpto,
    g.cdgo_cncpto,
    g.dscrpcion                           dscrpcion_cncpto,
    a.id_cncpto_dscnto,
    h.cdgo_cncpto                         cdgo_cncpto_dscnto,
    h.dscrpcion                           dscrpcion_cncpto_dscnto,
    a.id_cncpto_dscnto_grpo,
    i.cdgo_cncpto                         cdgo_cncpto_dscnto_grpo,
    i.dscrpcion                           dscrpcion_cncpto_dscnto_grpo,
    a.prcntje_dscnto,
    (a.prcntje_dscnto * 100)                    prcntje_dscnto_entro,
    a.cdgo_dscnto_tpo,
    decode (a.cdgo_dscnto_tpo, 'DSC','Descuento','INC','Incentivo') dscrpcion_cdgo_tpo_dscnto,
    a.actvo,
    decode (a.actvo, 'S','Sí','N','No')               dscrpcion_actvo,
    a.ind_extnde_tmpo,
    a.ind_aplca_cnvnio,
    a.tpo_intres_bncrio
   from re_g_descuentos_regla   a
   join df_s_clientes       b on  a.cdgo_clnte        = b.cdgo_clnte
   join df_c_impuestos        c on  a.id_impsto       = c.id_impsto
   join df_i_impuestos_subimpuesto  d on  a.id_impsto_sbmpsto   = d.id_impsto_sbmpsto
   left join df_i_periodos      e on  a.id_prdo_dsde      = e.id_prdo
   left join df_i_periodos      f on  a.id_prdo_hsta      = f.id_prdo
   join df_i_conceptos        g on  a.id_cncpto       = g.id_cncpto
   join df_i_conceptos        h on  a.id_cncpto_dscnto    = h.id_cncpto
   join df_i_conceptos        i on  a.id_cncpto_dscnto_grpo = i.id_cncpto;

