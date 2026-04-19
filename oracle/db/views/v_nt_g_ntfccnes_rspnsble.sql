
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_NTFCCNES_RSPNSBLE" ("ID_NTFCCION_RSPNSBLE", "ID_NTFCCION", "ID_MDIO", "ID_ACTO", "ID_NTFCCION_DTLLE", "ID_ACTO_RSPNSBLE", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "NMRO_IDNTFCCION", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "DRCCION_NTFCCION", "ID_PAIS_NTFCCION", "NMBRE_PAIS", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO", "EMAIL", "TLFNO", "ID_NTFCION_MDIO_EVDNCIA", "INDCDOR_NTFCDO") AS
  select  a.id_ntfccion_rspnsble,
            f.id_ntfccion,
			f.id_mdio,
			f.id_acto,
            a.id_ntfccion_dtlle,
            a.id_acto_rspnsble,
            a.cdgo_idntfccion_tpo,
            b.dscrpcion_idntfccion_tpo,
            a.nmro_idntfccion,
            a.prmer_nmbre,
            a.sgndo_nmbre,
            a.prmer_aplldo,
            a.sgndo_aplldo,
            a.drccion_ntfccion,
            a.id_pais_ntfccion,
            c.nmbre_pais,
            a.id_dprtmnto_ntfccion,
            d.nmbre_dprtmnto,
            a.id_mncpio_ntfccion,
            e.nmbre_mncpio,
            a.email,
            a.tlfno,
            a.id_ntfcion_mdio_evdncia,
            a.indcdor_ntfcdo
    from nt_g_ntfccnes_rspnsble a
    inner join v_nt_g_notificaciones_detalle f on a.id_ntfccion_dtlle    = f.id_ntfccion_dtlle
    inner join df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo  = b.cdgo_idntfccion_tpo
    inner join v_df_s_paises                 c on a.id_pais_ntfccion     = c.id_pais
    inner join v_df_s_departamentos          d on a.id_dprtmnto_ntfccion = d.id_dprtmnto
    inner join v_df_s_municipios             e on a.id_mncpio_ntfccion   = e.id_mncpio;

