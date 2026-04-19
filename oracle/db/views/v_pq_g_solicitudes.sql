
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_PQ_G_SOLICITUDES" ("ID_SLCTUD", "CDGO_CLNTE", "ID_ESTDO", "DSCRPCION_ESTDO", "ID_TPO", "DSCRPCION_TPO", "ID_USRIO", "NMBRE_TRCRO", "ID_RDCDOR", "NMRO_FLIO", "IDNTFCCION_RDCDOR", "NMBRE_RDCDOR", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "IDNTFCCION", "IDNTFCCION_SJTO_FRMTDA", "ID_UNDAD_PRDCTRA", "ANIO", "NMRO_RDCDO", "NMRO_RDCDO_DSPLAY", "FCHA_RDCDO", "ID_SLCTUD_BSE", "FCHA_REAL", "FCHA_PRYCTDA", "FCHA_LMTE_LEY", "ID_SJTO_IMPSTO", "ID_INSTNCIA_FLJO", "ID_PRSNTCION_TPO", "DSCRPCION_TPO_PRSNTCION", "PRCSO", "CDGO_FLJO", "ID_FLJO", "DSCRPCION_FLJO", "ESTDO_INSTNCIA", "ID_INSTNCIA_FLJO_GNRDO", "PRCSO_GNRDO", "CDGO_FLJO_GNRDO", "ID_FLJO_GNRDO", "DSCRPCION_FLJO_GNRDO", "ESTDO_INSTNCIA_GNRDO", "ID_MTVO", "DSCRPCION_MTVO", "CDGO_RSPSTA", "DSCRPCION_RSPSTA", "ETAPA", "ETAPA_GENERADA", "FCHA_INCIO", "FCHA_FIN_PLNDA", "FCHA_FIN_REAL", "OBSRVCION_RSPSTA", "INDCDOR_DCMNTO_PNDNTE", "EDTA_SLCTUD") AS
  select s.id_slctud
         , s.cdgo_clnte
         , s.id_estdo
         , e.dscrpcion dscrpcion_estdo
         , s.id_tpo
         , t.dscrpcion dscrpcion_tpo
         , s.id_usrio
         , u.nmbre_trcro
         , s.id_rdcdor
         , s.nmro_flio
         , r.idntfccion idntfccion_rdcdor
         , upper(r.prmer_nmbre || ' ' || r.prmer_aplldo) nmbre_rdcdor
         , sms.id_impsto
         , i.nmbre_impsto
         , sms.id_impsto_sbmpsto
         , i.nmbre_impsto_sbmpsto
         , sms.idntfccion idntfccion
         , case
              when length(sms.idntfccion) = 15 then
                 pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => sms.idntfccion, p_frmto => 'xx-xx-xxxx-xxxx-xxx' , p_crcter_dlmtdor => '-' )
              when length(sms.idntfccion) = 25 then
                 pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => sms.idntfccion, p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx' , p_crcter_dlmtdor => '-' )
           end as idntfccion_sjto_frmtda
         , s.id_undad_prdctra id_undad_prdctra
         , s.anio
         , s.nmro_rdcdo
         , s.nmro_rdcdo_dsplay
         , s.fcha_rdcdo
         , s.id_slctud_bse
         , s.fcha_real
         , s.fcha_pryctda
         , s.fcha_lmte_ley
         , sms.id_sjto_impsto
         , s.id_instncia_fljo
         , s.id_prsntcion_tpo
         , p.dscrpcion dscrpcion_tpo_prsntcion
         , g.prcso prcso
         , g.cdgo_fljo
         , g.id_fljo
         , g.dscrpcion_fljo
         , g.estdo_instncia
         , g.id_instncia_fljo_gnrdo
         , g.prcso_gnrdo
         , g.cdgo_fljo_gnrdo
         , g.id_fljo_gnrdo
         , g.dscrpcion_fljo_gnrdo
         , g.estdo_instncia_gnrdo
         , m.id_mtvo
         , m.dscrpcion dscrpcion_mtvo
         , rs.cdgo_rspsta
         , rs.dscrpcion dscrpcion_rspsta
         , pkg_pl_workflow_1_0.fnc_co_instancias_tarea(p_id_instncia_fljo => s.id_instncia_fljo) etapa
         , ta.nmbre_trea etapa_generada
         , x.fcha_incio
         , x.fcha_fin_plnda
         , x.fcha_fin_real
         , s.obsrvcion_rspsta
         , s.indcdor_dcmnto_pndnte
         , m.edta_slctud
     from pq_g_solicitudes              s
     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio
     join pq_d_estados                  e   on e.id_estdo = s.id_estdo
     join pq_d_tipos                    t   on t.id_tpo = s.id_tpo
     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor
     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud
     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo
left join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo
     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo
left join v_df_i_impuestos_subimpuesto  i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto
left join pq_d_respuestas               rs  on rs.cdgo_rspsta = s.cdgo_rspsta
left join v_wf_g_instancias_flujo_gnrdo g   on g.id_instncia_fljo = s.id_instncia_fljo
left join wf_g_instancias_transicion    x   on x.id_instncia_fljo = g.id_instncia_fljo_gnrdo and x.id_estdo_trnscion in (1,2)
left join v_wf_d_flujos_tarea           ta  on ta.id_fljo_trea = x.id_fljo_trea_orgen
;

