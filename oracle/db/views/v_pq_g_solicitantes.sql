
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_PQ_G_SOLICITANTES" ("ID_SLCTNTE", "ID_SLCTUD", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "NMBRE_SLCTNTE", "DRCCION_NTFCCION", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "UBCCION", "CDGO_RSPNSBLE_TPO", "DSCRPCION_RSPNSBLE_TPO", "EMAIL", "TLFNO", "CLLAR", "NTFCA_EMIL") AS
  select a.id_slctnte,
    a.id_slctud,
    b.nmtcnco_idntfccion_tpo cdgo_idntfccion_tpo,
    b.dscrpcion_idntfccion_tpo,
    a.idntfccion,
    a.prmer_nmbre,
    a.sgndo_nmbre,
    a.prmer_aplldo,
    a.sgndo_aplldo,
    upper(a.prmer_nmbre || ' ' || nvl2(a.sgndo_nmbre, a.sgndo_nmbre || ' ' ,'') || a.prmer_aplldo || ' ' ||nvl2(a.sgndo_aplldo, a.sgndo_aplldo || ' ' ,''))  nmbre_slctnte,
    a.drccion_ntfccion,
    a.id_pais_ntfccion,
    c.nmbre_pais         nmbre_pais_ntfccion,
    a.id_dprtmnto_ntfccion,
    c.nmbre_dprtmnto       nmbre_dprtmnto_ntfccion,
    a.id_mncpio_ntfccion,
    c.nmbre_mncpio         nmbre_mncpio_ntfccion,
    upper(c.nmbre_pais || '-' || c.nmbre_dprtmnto || '-' || c.nmbre_mncpio)  ubccion,
    a.cdgo_rspnsble_tpo,
    r.dscrpcion_rspnsble_tpo,
    a.email,
    a.tlfno,
    a.cllar,
    a.ntfca_emil
    from pq_g_solicitantes            a
    join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo  = b.cdgo_idntfccion_tpo
    join df_s_responsables_tipo       r on a.cdgo_rspnsble_tpo  = r.cdgo_rspnsble_tpo
    join v_df_s_municipios      c on a.id_mncpio_ntfccion = c.id_mncpio
;

