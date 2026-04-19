
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_SECUESTRE_GESTION" ("CDGO_CLNTE", "ID_SCSTRE_GSTION", "ID_INSTNCIA_FLJO", "FCHA_SCSTRE", "FCHA_DLGNCIA", "ID_SCSTRE", "NOMBRE_SECUESTRE", "ID_SCSTRS_AUXLR", "NOMBRE_AUX_SECUESTRE", "ID_SLCTD_OFCIO", "NMRO_ACTO_OFCIO", "FCHA_OFCIO", "NMRO_RSLCION_EMB", "FCHA_RSLCION_EMB", "ID_EMBRGOS_CRTRA", "ID_EMBRGOS_RSLCION", "ACTVO") AS
  select a.cdgo_clnte,
        a.id_scstre_gstion,
        a.id_instncia_fljo,
        a.fcha_scstre,
        a.fcha_dlgncia,
        a.id_scstre,
        b.nmbre_cmplto as nombre_secuestre,
        a.id_scstrs_auxlr,
        c.nmbre_trcro as nombre_aux_secuestre,
        a.id_slctd_ofcio,
        d.nmro_acto_ofcio,
        d.fcha_ofcio,
        d.nmro_rslcion_emb,
        d.fcha_rslcion_emb,
        d.id_embrgos_crtra,
        d.id_embrgos_rslcion,
        a.actvo
 from mc_g_secuestre_gestion a
inner join v_mc_d_secuestres b on b.id_scstre = a.id_scstre
inner join v_mc_d_secuestres_auxiliar c on c.id_scstrs_auxlr = a.id_scstrs_auxlr
inner join v_mc_g_solicitudes_y_oficios d on d.id_slctd_ofcio = a.id_slctd_ofcio;

