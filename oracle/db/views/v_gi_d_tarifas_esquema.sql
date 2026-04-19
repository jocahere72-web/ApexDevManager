
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_TARIFAS_ESQUEMA" ("ID_TRFA_ESQMA", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_IMPSTO_ACTO", "CDGO_IMPSTO_ACTO", "NMBRE_IMPSTO_ACTO", "UNCO", "DSCRPCION_TPO_DIAS", "DIAS_MRGN_MRA", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "ID_IMPSTO_ACTO_CNCPTO", "VGNCIA", "ID_PRDO", "PRDO", "GNRA_INTRES_MRA", "INDCDOR_TRFA_CRCTRSTCAS", "FCHA_VNCMNTO", "ORDEN", "INDCDOR_CNCPTO_OBLGTRIO", "ID_CNCPTO_BSE", "CDGO_CNCPTO_BSE", "DSCRPCION_CNCPTO_BSE", "ID_IMPSTO_ACTO_CNCPTO_BSE", "VGNCIA_BSE", "ID_PRDO_BSE", "GNRA_INTRES_MRA_BSE", "INDCDOR_TRFA_CRCTRSTCAS_BSE", "FCHA_VNCMNTO_BSE", "VLOR_TRFA", "DVSOR_TRFA", "CDGO_INDCDOR_TPO", "FCHA_DSDE_CDGO_INDCDOR_TPO", "FCHA_HSTA_CDGO_INDCDOR_TPO", "VLOR_CDGO_INDCDOR_TPO", "VLOR_TRFA_CLCLDO", "TXTO_TRFA", "INDCDOR_USA_BSE", "DSCRPCION_INDCDOR_USA_BSE", "INDCDOR_BSE_USA_VLOR_FJO", "DSCRP_INDCDOR_BSE_USA_VLOR_FJO", "CDGO_INDCDOR_TPO_BSE", "FCHA_DSDE_CDGO_INDCDOR_TPO_BSE", "FCHA_HSTA_CDGO_INDCDOR_TPO_BSE", "VLOR_CDGO_INDCDOR_TPO_BSE", "BSE_INCIAL", "VLOR_BSE_INCIAL", "TXTO_BSE_INCIAL", "BSE_FNAL", "VLOR_BSE_FNAL", "TXTO_BSE_FNAL", "INDCDOR_LQDCION_USA_VLOR_FJO", "DSCRP_INDCDOR_LQD_USA_VLOR_FJO", "CDGO_INDCDOR_TPO_LQDCCION", "FCHA_DSDE_CDGO_INDCDOR_TPO_LQD", "FCHA_HSTA_CDGO_INDCDOR_TPO_LQD", "VLOR_CDGO_INDCDOR_TPO_LQD", "LQDCION_MNMA", "VLOR_LQDCION_MNMA", "VLOR_LQDCION_MXMA", "LQDCION_MXMA", "VLOR_LQDCCION_MXMA", "INDCDR_USA_FCHA_LQDCION", "DSCRP_INDCDR_USA_FCHA_LQDCION", "CDGO_RDNDEO_EXPRSION", "EXPRSION_RDNDEO", "DSCRPCION_RDNDEO", "FCHA_INCIAL", "FCHA_FNAL", "ID_TP_BS_SNCN_DCL_VGN_FRM", "CDGO_PRDCDAD", "INDCDOR_ECNMCO_ACTUAL", "PRCNTJE_BSE_LQDCION", "INDCDOR_UTLZA_BSE_PNTUAL", "INDCDOR_RQRE_FCTOR") AS
  select a.id_trfa_esqma,
         a.cdgo_clnte,
         b.nmbre_clnte,
         a.id_impsto,
         c.cdgo_impsto,
         c.nmbre_impsto,
         a.id_impsto_sbmpsto,
         c.cdgo_impsto_sbmpsto,
         c.nmbre_impsto_sbmpsto,
         a.id_impsto_acto,
         c.cdgo_impsto_acto,
         c.nmbre_impsto_acto,
         decode(e.unco, 'S', 0, rownum) unco,
         c.dscrpcion_tpo_dias,
         c.dias_mrgn_mra
         -- Concepto
        ,
         a.id_cncpto,
         d.cdgo_cncpto,
         d.dscrpcion               dscrpcion_cncpto,
         e.id_impsto_acto_cncpto,
         e.vgncia,
         e.id_prdo,
         e.prdo,
         e.gnra_intres_mra,
         e.indcdor_trfa_crctrstcas,
         e.fcha_vncmnto,
         e.orden,
         e.indcdor_cncpto_oblgtrio
         -- Concepto Base
        ,
         a.id_cncpto_bse,
         f.cdgo_cncpto             cdgo_cncpto_bse,
         f.dscrpcion               dscrpcion_cncpto_bse,
         g.id_impsto_acto_cncpto   id_impsto_acto_cncpto_bse,
         g.vgncia                  vgncia_bse,
         g.id_prdo                 id_prdo_bse,
         g.gnra_intres_mra         gnra_intres_mra_bse,
         g.indcdor_trfa_crctrstcas indcdor_trfa_crctrstcas_bse,
         g.fcha_vncmnto            fcha_vncmnto_bse

         -- Tarifa
        ,
         a.vlor_trfa,
         a.dvsor_trfa,
         a.cdgo_indcdor_tpo,
         h.fcha_dsde        fcha_dsde_cdgo_indcdor_tpo,
         h.fcha_hsta        fcha_hsta_cdgo_indcdor_tpo
         --, h.vlor                            vlor_cdgo_indcdor_tpo
        ,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            h.vlor
           else
            l.vlor
         end as vlor_cdgo_indcdor_tpo
         --, (a.vlor_trfa / a.dvsor_trfa) * nvl(h.vlor,1)          vlor_trfa_clcldo
        ,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            (a.vlor_trfa / a.dvsor_trfa) * nvl(h.vlor, 1)
           else
            (a.vlor_trfa / a.dvsor_trfa) * nvl(l.vlor, 1)
         end as vlor_trfa_clcldo,
         a.txto_trfa

         -- Base
        ,
         a.indcdor_usa_bse,
         decode(a.indcdor_usa_bse, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_usa_bse,
         a.indcdor_bse_usa_vlor_fjo,
         decode(a.indcdor_bse_usa_vlor_fjo, 'S', 'Si', 'N', 'No') dscrp_indcdor_bse_usa_vlor_fjo,
         a.cdgo_indcdor_tpo_bse,
         i.fcha_dsde fcha_dsde_cdgo_indcdor_tpo_bse,
         i.fcha_hsta fcha_hsta_cdgo_indcdor_tpo_bse,
         i.vlor vlor_cdgo_indcdor_tpo_bse,
         a.bse_incial,
         case
           when a.indcdor_bse_usa_vlor_fjo = 'N' and
                a.cdgo_indcdor_tpo_bse is not null then
            i.vlor * a.bse_incial
           else
            a.bse_incial
         end as vlor_bse_incial,
         case
           when a.indcdor_bse_usa_vlor_fjo = 'N' and
                a.cdgo_indcdor_tpo_bse is not null then
            to_char(a.bse_incial, '999G999G999G999G999G999G999G999') || ' ' ||
            cdgo_indcdor_tpo_bse
           else
            to_char(a.bse_incial, '999G999G999G999G999G999G999G999')
         end as txto_bse_incial,
         a.bse_fnal,
         case
           when a.indcdor_bse_usa_vlor_fjo = 'N' and
                a.cdgo_indcdor_tpo_bse is not null then
            i.vlor * a.bse_fnal
           else
            a.bse_fnal
         end as vlor_bse_fnal

        ,
         case
           when a.indcdor_bse_usa_vlor_fjo = 'N' and
                a.cdgo_indcdor_tpo_bse is not null then
            to_char(a.bse_fnal, '999G999G999G999G999G999G999G999') || ' ' ||
            cdgo_indcdor_tpo_bse
           else
            to_char(a.bse_fnal, '999G999G999G999G999G999G999G999')
         end as txto_bse_fnal
         -- Liquidacion
        ,
         a.indcdor_lqdcion_usa_vlor_fjo,
         decode(a.indcdor_lqdcion_usa_vlor_fjo, 'S', 'Si', 'N', 'No') dscrp_indcdor_lqd_usa_vlor_fjo,
         a.cdgo_indcdor_tpo_lqdccion,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            j.fcha_dsde
           else
            l.fcha_dsde
         end as fcha_dsde_cdgo_indcdor_tpo_lqd

        ,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            j.fcha_hsta
           else
            l.fcha_hsta
         end as fcha_hsta_cdgo_indcdor_tpo_lqd,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            j.vlor
           else
            l.vlor
         end as vlor_cdgo_indcdor_tpo_lqd,
         a.lqdcion_mnma,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            case
              when a.indcdor_lqdcion_usa_vlor_fjo = 'N' and
                   a.cdgo_indcdor_tpo_lqdccion is not null then
               j.vlor * a.lqdcion_mnma
              else
               a.lqdcion_mnma
            end
           else
            case
              when a.indcdor_lqdcion_usa_vlor_fjo = 'N' and
                   a.cdgo_indcdor_tpo_lqdccion is not null then
               l.vlor * a.lqdcion_mnma
              else
               a.lqdcion_mxma
            end
         end as vlor_lqdcion_mnma

        ,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            case
              when a.indcdor_lqdcion_usa_vlor_fjo = 'N' and
                   a.cdgo_indcdor_tpo_lqdccion is not null then
               j.vlor * a.lqdcion_mxma
              else
               a.lqdcion_mxma
            end
           else
            case
              when a.indcdor_lqdcion_usa_vlor_fjo = 'N' and
                   a.cdgo_indcdor_tpo_lqdccion is not null then
               l.vlor * a.lqdcion_mxma
              else
               a.lqdcion_mxma
            end

         end as vlor_lqdcion_mxma,
         a.lqdcion_mxma

        ,
         case
           when a.indcdor_ecnmco_actual = 'N' then
            (a.lqdcion_mxma * nvl(j.vlor, 1))
           else
            (a.lqdcion_mxma * nvl(l.vlor, 1))
         end as vlor_lqdccion_mxma,
         a.indcdr_usa_fcha_lqdcion,
         decode(a.indcdr_usa_fcha_lqdcion, 'S', 'Si', 'N', 'No') dscrp_indcdr_usa_fcha_lqdcion
         -- Redondeo
        ,
         a.cdgo_rdndeo_exprsion,
         k.exprsion                  exprsion_rdndeo,
         k.dscrpcion                 dscrpcion_rdndeo,
         a.fcha_incial,
         a.fcha_fnal,
         a.id_tp_bs_sncn_dcl_vgn_frm,
         e.cdgo_prdcdad,
         a.indcdor_ecnmco_actual,
         a.prcntje_bse_lqdcion,
		 a.indcdor_utlza_bse_pntual,  --Req0026754
         a.indcdor_rqre_fctor --Req0026754
    from gi_d_tarifas_esquema a
    join df_s_clientes b
      on a.cdgo_clnte = b.cdgo_clnte
    join v_df_i_impuestos_acto c
      on a.id_impsto_acto = c.id_impsto_acto
  -- Concepto
    join df_i_conceptos d
      on a.id_cncpto = d.id_cncpto
    left join v_df_i_impuestos_acto_concepto e
      on a.id_impsto_acto = e.id_impsto_acto
     and a.id_cncpto = e.id_cncpto
     and e.vgncia between extract(year from to_date(a.fcha_incial)) and
         extract(year from to_date(a.fcha_fnal))
  -- Concepto base
    left join df_i_conceptos f
      on a.id_cncpto_bse = f.id_cncpto
    left join df_i_impuestos_acto_concepto g
      on a.id_impsto_acto = g.id_impsto_acto
     and a.id_cncpto_bse = g.id_cncpto
     and g.vgncia between extract(year from to_date(a.fcha_incial)) and
         extract(year from to_date(a.fcha_fnal))
  -- Indicador Economico de la tarifa
    left join df_s_indicadores_economico h
      on a.cdgo_indcdor_tpo = h.cdgo_indcdor_tpo
     and (trunc(h.fcha_dsde) between trunc(a.fcha_incial) and
         trunc(a.fcha_fnal) or (trunc(a.fcha_incial) between
         trunc(h.fcha_dsde) and trunc(h.fcha_hsta)))
  -- Indicador Economico de la base
    left join df_s_indicadores_economico i
      on a.cdgo_indcdor_tpo_bse = i.cdgo_indcdor_tpo
     and (trunc(i.fcha_dsde) between trunc(a.fcha_incial) and
         trunc(a.fcha_fnal) or (trunc(a.fcha_incial) between
         trunc(i.fcha_dsde) and trunc(i.fcha_hsta)))
  -- Indicador Economico de la liquidacion
    left join df_s_indicadores_economico j
      on a.cdgo_indcdor_tpo_lqdccion = j.cdgo_indcdor_tpo
     and (trunc(j.fcha_dsde) between trunc(a.fcha_incial) and
         trunc(a.fcha_fnal) or (trunc(a.fcha_incial) between
         trunc(j.fcha_dsde) and trunc(j.fcha_hsta)))
    join (select trunc(to_date('01/01/' || to_char(sysdate, 'yyyy'),
                               'dd/mm/yyyy')) as fcha_dsde,
                 trunc(to_date('31/12/' || to_char(sysdate, 'yyyy'),
                               'dd/mm/yyyy')) as fcha_hsta
            from dual) x
      on x.fcha_dsde < trunc(sysdate)

  -- Indicador Economico de la liquidacion  2
    left join df_s_indicadores_economico l
      on a.cdgo_indcdor_tpo_lqdccion = l.cdgo_indcdor_tpo
     and (trunc(l.fcha_dsde) between (x.fcha_dsde) and (x.fcha_hsta))
  -- Redondeo
    join df_s_redondeos_expresion k
      on a.cdgo_rdndeo_exprsion = k.cdgo_rdndeo_exprsion
;

