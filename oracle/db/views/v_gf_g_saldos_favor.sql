
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_SALDOS_FAVOR" ("ID_SLDO_FVOR", "VLOR_SLDO_FVOR", "INDCDOR_RCNCDO", "INDCDOR_RGSTRO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_ORGEN", "CDGO_SLDO_FVOR_TPO", "NMBRE_SLDO_FVOR_TPO", "TBLA_SLDO_FVOR_TPO", "OBSRVCION", "FCHA_RGSTRO", "FCHA_RCNCMNTO", "ID_USRIO", "ESTDO", "VLOR_CMPNSCION", "VLOR_DVLCION", "SLDO_FVOR_DSPNBLE", "ID_PRCSO_CRGA") AS
  select a.id_sldo_fvor,
       a.vlor_sldo_fvor,
       a.indcdor_rcncdo,
       a.indcdor_rgstro,
       a.cdgo_clnte,
       b.nmbre_clnte,
       a.id_impsto,
       c.nmbre_impsto,
       a.id_impsto_sbmpsto,
       a.id_sjto_impsto,
       d.nmbre_impsto_sbmpsto,
       a.id_orgen,
       a.cdgo_sldo_fvor_tpo,
       e.nmbre as nmbre_sldo_fvor_tpo,
       e.nmbre_tbla as tbla_sldo_fvor_tpo,
       a.obsrvcion,
       a.fcha_rgstro,
       a.fcha_rcncmnto,
       a.id_usrio,
       a.estdo,
       sum(nvl(f.vlor_cmpnscion, 0)) vlor_cmpnscion,
       sum(nvl(g.vlor_dvlcion, 0)) vlor_dvlcion,
       a.vlor_sldo_fvor - sum(nvl(f.vlor_cmpnscion, 0)) -
       sum(nvl(g.vlor_dvlcion, 0)) as sldo_fvor_dspnble,
       a.id_prcso_crga
  from gf_g_saldos_favor a
  join df_s_clientes b
    on a.cdgo_clnte = b.cdgo_clnte
  join df_c_impuestos c
    on a.id_impsto = c.id_impsto
  join df_i_impuestos_subimpuesto d
    on a.id_impsto_sbmpsto = d.id_impsto_sbmpsto
  join gf_d_saldos_favor_tipo e
    on a.cdgo_sldo_fvor_tpo = e.cdgo_sldo_fvor_tpo
  left join (select a.id_sldo_fvor, sum(a.vlor_cmpnscion) as vlor_cmpnscion
               from gf_g_sldos_fvr_cmpnscn_dtll a
              group by a.id_sldo_fvor) f
    on a.id_sldo_fvor = f.id_sldo_fvor
  left join (select a.id_sldo_fvor, sum(a.vlor_dvlcion) as vlor_dvlcion
               from gf_g_sldos_fvr_dvlcion_dtll a
              group by a.id_sldo_fvor) g
    on a.id_sldo_fvor = g.id_sldo_fvor
 group by a.id_sldo_fvor,
          a.vlor_sldo_fvor,
          a.indcdor_rcncdo,
          a.indcdor_rgstro,
          a.cdgo_clnte,
          b.nmbre_clnte,
          a.id_impsto,
          c.nmbre_impsto,
          a.id_impsto_sbmpsto,
          a.id_sjto_impsto,
          d.nmbre_impsto_sbmpsto,
          a.id_orgen,
          a.cdgo_sldo_fvor_tpo,
          e.nmbre,
          e.nmbre_tbla,
          a.obsrvcion,
          a.fcha_rgstro,
          a.fcha_rcncmnto,
          a.id_usrio,
          a.id_prcso_crga,
          a.estdo
;

