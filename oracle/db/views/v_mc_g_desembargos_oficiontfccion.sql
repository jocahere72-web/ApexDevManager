
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_DESEMBARGOS_OFICIONTFCCION" ("ID_DSMBRGO_OFCIO", "ID_DSMBRGOS_RSLCION", "ID_ACTO", "NMRO_ACTO", "FCHA_ACTO", "RSLCION_DSMBRGO", "FCHA_RSLCION_DSMBRGO", "ENTIDAD", "IDNTFCCION", "RSPNSBLE", "DRCCION_NTFCCION", "NMRO_ACTO_OFCIO", "FCHA_OFCIO", "NMRO_RSLCION_EMB", "FCHA_RSLCION_EMB", "ID_SLCTD_OFCIO", "ID_EMBRGOS_CRTRA", "ID_ENTDDES") AS
  SELECT
        a.id_dsmbrgo_ofcio,
        a.id_dsmbrgos_rslcion,
        a.id_acto,
        a.nmro_acto,
        a.fcha_acto,
        b.nmro_acto   AS rslcion_dsmbrgo,
        b.fcha_acto   AS fcha_rslcion_dsmbrgo,
        c.dscrpcion   AS entidad,
        c.idntfccion,
        c.rspnsble,
        c.drccion_ntfccion,
        c.nmro_acto_ofcio,
        c.fcha_ofcio,
        c.nmro_rslcion_emb,
        c.fcha_rslcion_emb,
        c.id_slctd_ofcio,
        c.id_embrgos_crtra,
        c.id_entddes
    FROM
        mc_g_desembargos_oficio        a
        JOIN mc_g_desembargos_resolucion    b ON a.id_dsmbrgos_rslcion = b.id_dsmbrgos_rslcion
        JOIN v_mc_g_solicitudes_y_oficios   c ON c.id_slctd_ofcio = a.id_slctd_ofcio
        JOIN v_mc_g_embargos_resolucion     d ON d.id_embrgos_rslcion = c.id_embrgos_rslcion
                                             AND d.cdgo_estdos_crtra NOT IN (
            'n'
        );

