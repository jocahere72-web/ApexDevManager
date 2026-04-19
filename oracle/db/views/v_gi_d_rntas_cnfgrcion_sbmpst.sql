
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_RNTAS_CNFGRCION_SBMPST" ("ID_RNTA_CNFGRCION_SBMPSTO", "ID_RNTA_CNFGRCION", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "INDCDOR_USA_MXTO", "DSCRPCION_INDCDOR_USA_MXTO", "PRCNTJE_LQDCION_PRVDO", "PRCNTJE_LQDCION_PBLCO", "INDCDOR_USA_EXTRNJRO", "DSCRPCION_INDCDOR_USA_EXTRNJRO", "TPO_DIAS", "DSCRPCION_TPO_DIAS", "DIAS_MRGN_MRA", "LBEL_FCHA_EXPDCION", "ID_FLJO", "DSCRPCION_FLJO", "NMRO_DCMNTOS", "INTRVLO_DIAS", "INDCDOR_CNTRTO_GSLNA", "DSCRPCION_INDCDOR_CNTRTO_GSLNA", "INDCDOR_MNJA_CNTRTO_ESE", "DSC_INDCDOR_MNJA_CNTRTO_ESE", "INDCDOR_LQDCCION_ADCNAL", "DSC_INDCDOR_LQDCCION_ADCNAL", "INDCDOR_EXNCION", "DSCRPCION_INDCDOR_EXNCION", "ID_IMPSTO_ACTO_EXNCION", "CDGO_IMPSTO_ACTO_EXNCION", "NMBRE_IMPSTO_ACTO_EXNCION", "INDCDOR_RQRE_ENTDAD", "DSCRPCION_INDCDOR_RQRE_ENTDAD", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA", "USER_ULTMA_ACTLZCION", "FCHA_ULTMA_ACTLZCION", "INDCDOR_VLDA_PRDO", "DSCRPCION_VLDA_PRDO", "INDCDOR_NRMLZA_CRTRA", "DSCRPCION__NRMLZA_CRTRA", "CDGO_PRDCDAD", "INDCDOR_MNJA_SCRSAL", "DSCRPCION_MNJA_SCRSAL", "INDCDOR_VLOR_AUX_LQDCION", "DSCRPCION_VLOR_AUX_LQDCION", "LBEL_VLOR_AUX_LQDCION", "INDCDOR_ACMLA_BSE") AS
  select a.id_rnta_cnfgrcion_sbmpsto,
         a.id_rnta_cnfgrcion,
         b.cdgo_clnte,
         b.nmbre_clnte,
         b.id_impsto,
         b.nmbre_impsto,
         a.id_impsto_sbmpsto,
         c.cdgo_impsto_sbmpsto,
         c.nmbre_impsto_sbmpsto,
         a.indcdor_usa_mxto,
         decode(a.indcdor_usa_mxto, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_usa_mxto,
         case
           when a.indcdor_usa_mxto = 'S' then
            a.prcntje_lqdcion_prvdo
           else
            0
         end as prcntje_lqdcion_prvdo,
         case
           when a.indcdor_usa_mxto = 'S' then
            a.prcntje_lqdcion_pblco
           else
            0
         end as prcntje_lqdcion_pblco,
         a.indcdor_usa_extrnjro,
         decode(a.indcdor_usa_extrnjro, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_usa_extrnjro,
         a.tpo_dias,
         decode(a.tpo_dias, 'C', 'Calendario', 'H', 'H¿bil') dscrpcion_tpo_dias,
         a.dias_mrgn_mra,
         a.lbel_fcha_expdcion,
         a.id_fljo,
         d.dscrpcion_fljo,
         a.nmro_dcmntos,
         a.intrvlo_dias,
         a.indcdor_cntrto_gslna,
         decode(a.indcdor_cntrto_gslna, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_cntrto_gslna,
         a.indcdor_mnja_cntrto_ese,
         decode(a.indcdor_mnja_cntrto_ese, 'S', 'Si', 'N', 'No') dsc_indcdor_mnja_cntrto_ese,
         a.indcdor_lqdccion_adcnal,
         decode(a.indcdor_lqdccion_adcnal, 'S', 'Si¿', 'N', 'No') dsc_indcdor_lqdccion_adcnal,
         a.indcdor_exncion,
         decode(a.indcdor_exncion, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_exncion,
         a.id_impsto_acto_exncion,
         e.cdgo_impsto_acto cdgo_impsto_acto_exncion,
         e.nmbre_impsto_acto nmbre_impsto_acto_exncion,
         a.indcdor_rqre_entdad,
         decode(a.indcdor_rqre_entdad, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_rqre_entdad,
         a.user_dgta,
         a.fcha_dgta,
         a.user_mdfca,
         a.fcha_mdfca,
         nvl(a.user_mdfca, a.user_dgta) user_ultma_actlzcion,
         nvl(a.fcha_mdfca, a.fcha_dgta) fcha_ultma_actlzcion,
         a.indcdor_vlda_prdo,
         decode(a.indcdor_vlda_prdo, 'S', 'Si', 'N', 'No') dscrpcion_vlda_prdo,
         a.indcdor_nrmlza_crtra,
         decode(a.indcdor_nrmlza_crtra, 'S', 'Si', 'N', 'No') dscrpcion__nrmlza_crtra,
         a.cdgo_prdcdad,
         a.indcdor_mnja_scrsal,
         decode(a.indcdor_mnja_scrsal, 'S', 'Si', 'N', 'No') dscrpcion_mnja_scrsal,
         a.indcdor_vlor_aux_lqdcion,
         decode(a.indcdor_vlor_aux_lqdcion, 'S', 'Si', 'N', 'No') dscrpcion_vlor_aux_lqdcion,
         a.lbel_vlor_aux_lqdcion,
         a.indcdor_acmla_bse
    from gi_d_rntas_cnfgrcion_sbmpst a
    join v_gi_d_rentas_configuracion b
      on a.id_rnta_cnfgrcion = b.id_rnta_cnfgrcion
    join df_i_impuestos_subimpuesto c
      on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto
    join wf_d_flujos d
      on a.id_fljo = d.id_fljo
    left join v_df_i_impuestos_acto e
      on a.id_impsto_acto_exncion = e.id_impsto_acto
;

