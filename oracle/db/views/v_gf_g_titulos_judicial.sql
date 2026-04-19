
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JUDICIAL" ("ID_TTLO_JDCIAL", "CDGO_CLNTE", "ID_TTLO_JDCIAL_CRGDO", "NMRO_TTLO_JDCIAL", "FCHA_CNSTTCION", "VLOR", "ID_TTLO_JDCIAL_AREA", "ID_AREA", "NMBRE_AREA", "CDGO_IDNTFCCION_TPO_DMNDDO", "IDNTFCCION_DMNDDO", "NMBRE_DMNDDO", "NMRO_TTLO_PDRE", "ID_TTLO_PDRE", "FCHA_CNSTTCION_PDRE", "VLOR_PDRE", "CDGO_ENTDAD_CNSGNNTE", "NMBRE_BNCO", "ID_BNCO_CNSGNNTE", "NMBRE_BNCO_CNSGNNTE", "CDGO_TTLO_JDCIAL_ESTDO", "DSCRPCION_TTLO_ESTDO", "CLOR", "ID_EMBRGO_RSLCION", "CNSCTVO_EMBRGO", "ID_INSTNCIA_FLJO_PDRE", "ID_INSTNCIA_FLJO", "ID_SLCTUD", "NMRO_RDCDO_DSPLAY", "FCHA_RDCDO", "IDNTFCCION_SLCTNTE", "NMBRE_SLCTNTE", "CDGO_TTLO_JDCIAL_ESTDO_INCIAL", "DSCRPCION_TTLO_ESTDO_INCIAL", "INDCDOR_MGDO", "ID_FNCNRIO", "NMBRE_TRCRO") AS
  select a.id_ttlo_jdcial,
    a.cdgo_clnte,
    a.id_ttlo_jdcial_crgdo,
    a.nmro_ttlo_jdcial,
    a.fcha_cnsttcion,
    a.vlor,
    a.id_ttlo_jdcial_area,
    c.id_area,
    c.nmbre_area,
    a.cdgo_idntfccion_tpo_dmnddo,
    ltrim(a.idntfccion_dmnddo,'0') as idntfccion_dmnddo,
    a.nmbre_dmnddo,
    a.nmro_ttlo_pdre,
    a.id_ttlo_pdre,
    d.fcha_cnsttcion        fcha_cnsttcion_pdre,
    d.vlor              vlor_pdre,
    a.cdgo_entdad_cnsgnnte,
    e.nmbre_bnco,
    a.id_bnco_cnsgnnte,
    f.nmbre_bnco          nmbre_bnco_cnsgnnte,
    a.cdgo_ttlo_jdcial_estdo,
    b.dscrpcion           dscrpcion_ttlo_estdo,
    b.clor,
    a.id_embrgo_rslcion,
    a.cnsctvo_embrgo,
    a.id_instncia_fljo_pdre,
    a.id_instncia_fljo,
    a.id_slctud,
    g.nmro_rdcdo_dsplay,
    g.fcha_rdcdo,
    h.idntfccion          idntfccion_slctnte,
    upper(h.prmer_nmbre || ' ' || nvl2(h.sgndo_nmbre, h.sgndo_nmbre || ' ' ,'') || h.prmer_aplldo || ' ' ||nvl2(h.sgndo_aplldo, h.sgndo_aplldo || ' ' ,''))  nmbre_slctnte,
    a.cdgo_ttlo_jdcial_estdo_incial,
    i.dscrpcion           dscrpcion_ttlo_estdo_incial,
    a.indcdor_mgdo,
    a.id_fncnrio,
    u.nmbre_trcro
   from gf_g_titulos_judicial       a
   join gf_d_titulos_judicial_estdo     b on a.cdgo_ttlo_jdcial_estdo = b.cdgo_ttlo_jdcial_estdo
   left join gf_d_titulos_judicial_estdo     i on a.cdgo_ttlo_jdcial_estdo_incial  = i.cdgo_ttlo_jdcial_estdo
   left join v_gf_d_titulos_judicial_area c on a.id_ttlo_jdcial_area    = c.id_ttlo_jdcial_area
   left join gf_g_titulos_judicial      d on a.id_ttlo_pdre       = d.id_ttlo_jdcial
   left join df_c_bancos          e on a.cdgo_clnte         = e.cdgo_clnte and a.cdgo_entdad_cnsgnnte = e.cdgo_bnco
   left join df_c_bancos          f on a.id_bnco_cnsgnnte     = f.id_bnco
   left join pq_g_solicitudes       g on a.id_slctud        = g.id_slctud
   left join pq_g_solicitantes        h on a.id_slctud        = h.id_slctud
   left join v_sg_g_usuarios u on u.id_fncnrio=a.id_fncnrio;

