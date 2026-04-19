
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_MOVIMIENTOS_FINANCIERO" ("ID_MVMNTO_FNCRO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "CDGO_SJTO", "DSCRPCION_SJTO_TPO", "IDNTFCCION_SJT", "IDNTFCCION_ANTRIOR", "ID_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "VGNCIA", "ID_PRDO", "PRDO", "DSCRPCION_PRDO", "CDGO_MVMNTO_ORGN", "DSCRPCION_MVMNTO_ORGN", "ID_ORGEN", "CDGO_PRDCDAD", "DSCRPCION_PRDCDAD", "NMRO_MVMNTO_FNCRO", "FCHA_MVMNTO", "CDGO_MVNT_FNCRO_ESTDO", "DSCRPCION_MVNT_FNCRO_ESTDO", "INDCDOR_MVMNTO_BLQDO", "DSCRPCION_INDCDOR_MVMNTO_BLQDO", "ID_MVMNTO_TRZA_BLQUEO", "ID_USRIO_BLQUEO", "FCHA_BLQUEO", "CDGO_TRZA_ORGN_BLQUEO", "DSCRIPCION_TRZA_ORGN_BLQUEO", "NMBRE_TBLA_BLQUEO", "NMBRE_CLMNA_BLQUEO", "ID_ORGEN_TRZA_BLQUEO", "OBSRVCION_BLQUEO", "ID_MVMNTO_TRZA_ULTMA", "ID_USRIO_ULTMA", "FCHA_ULTMA", "CDGO_TRZA_ORGN_ULTMA", "DSCRIPCION_TRZA_ORGN_ULTMA", "NMBRE_TBLA_ULTMA", "NMBRE_CLMNA_ULTMA", "ID_ORGEN_TRZA_ULTMA", "OBSRVCION_ULTMA", "ID_SJTO_SCRSAL", "NMBRE_SCRSAL") AS
  select a.id_mvmnto_fncro
     , a.cdgo_clnte
     , b.nmbre_clnte
     , a.id_impsto
     , c.nmbre_impsto
     , a.id_impsto_sbmpsto
     , d.nmbre_impsto_sbmpsto
     , a.id_sjto_impsto,
     (select e.cdgo_sjto_tpo from v_si_i_sujetos_impuesto    e
      where a.id_sjto_impsto       = e.id_sjto_impsto) cdgo_sjto ,
     (select e.dscrpcion_sjto_tpo from v_si_i_sujetos_impuesto    e
      where a.id_sjto_impsto       = e.id_sjto_impsto) dscrpcion_sjto_tpo,
      (select e.idntfccion_sjto from v_si_i_sujetos_impuesto    e
      where a.id_sjto_impsto       = e.id_sjto_impsto)  idntfccion_sjt,
      (select e.idntfccion_antrior from v_si_i_sujetos_impuesto    e
      where a.id_sjto_impsto       = e.id_sjto_impsto) idntfccion_antrior  ,
      (select e.id_sjto_estdo from v_si_i_sujetos_impuesto    e
      where a.id_sjto_impsto       = e.id_sjto_impsto) id_sjto_estdo,
      (select e.dscrpcion_sjto_estdo from v_si_i_sujetos_impuesto    e
      where a.id_sjto_impsto       = e.id_sjto_impsto) dscrpcion_sjto_estdo
     , a.vgncia
     , a.id_prdo
     , g.prdo
     , g.dscrpcion                        dscrpcion_prdo
     , a.cdgo_mvmnto_orgn
     , h.dscrpcion                        dscrpcion_mvmnto_orgn
    , a.id_orgen
     , a.cdgo_prdcdad
     , j.dscrpcion                        dscrpcion_prdcdad
     , a.nmro_mvmnto_fncro
     , a.fcha_mvmnto
     , a.cdgo_mvnt_fncro_estdo
     , i.dscrpcion                        dscrpcion_mvnt_fncro_estdo
     , a.indcdor_mvmnto_blqdo
     , decode(a.indcdor_mvmnto_blqdo, 'S', 'Si', 'N', 'No')   dscrpcion_indcdor_mvmnto_blqdo
     -- Bloqueo Traza
     , a.id_mvmnto_trza_blqueo
     , k.id_usrio                       id_usrio_blqueo
     , k.fcha                         fcha_blqueo
    , k.cdgo_trza_orgn                      cdgo_trza_orgn_blqueo
    , k.dscripcion                        dscripcion_trza_orgn_blqueo
    , k.nmbre_tbla                        nmbre_tbla_blqueo
    , k.nmbre_clmna                       nmbre_clmna_blqueo
    , k.id_orgen                          id_orgen_trza_blqueo
    , k.obsrvcion                       obsrvcion_blqueo
     -- Ultima Traza
     , a.id_mvmnto_trza_ultma
     , l.id_usrio                       id_usrio_ultma
     , l.fcha                         fcha_ultma
    , l.cdgo_trza_orgn                      cdgo_trza_orgn_ultma
    , l.dscripcion                        dscripcion_trza_orgn_ultma
    , l.nmbre_tbla                        nmbre_tbla_ultma
    , l.nmbre_clmna                       nmbre_clmna_ultma
    , l.id_orgen                        id_orgen_trza_ultma
    , l.obsrvcion                       obsrvcion_ultma
    , a.id_sjto_scrsal
    , (select nmbre from si_i_sujetos_sucursal s where a.id_sjto_scrsal = s.id_sjto_scrsal)  nmbre_scrsal
   from gf_g_movimientos_financiero  a
  join df_s_clientes          b on a.cdgo_clnte         = b.cdgo_clnte
  join df_c_impuestos         c on a.id_impsto          = c.id_impsto
  join df_i_impuestos_subimpuesto   d on a.id_impsto_sbmpsto      = d.id_impsto_sbmpsto
  join df_s_vigencias         f on a.vgncia           = f.vgncia
  join df_i_periodos          g on a.id_prdo          = g.id_prdo
  join gf_d_movimiento_origen     h on a.cdgo_mvmnto_orgn     = h.cdgo_mvmnto_orgn
  join gf_d_mvmnto_fncro_estdo    i on a.cdgo_mvnt_fncro_estdo    = i.cdgo_mvnt_fncro_estdo
  join df_s_periodicidad        j on a.cdgo_prdcdad       = j.cdgo_prdcdad
  left join v_gf_g_movimientos_traza  k on a.id_mvmnto_trza_blqueo    = k.id_mvmnto_trza
  left join v_gf_g_movimientos_traza  l on a.id_mvmnto_trza_ultma   = l.id_mvmnto_trza;

