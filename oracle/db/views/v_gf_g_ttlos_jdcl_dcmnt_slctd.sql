
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TTLOS_JDCL_DCMNT_SLCTD" ("CDGO_TTLO_JDCIAL_SLCTUD_TPO", "DSCRPCION", "FCHA_SLCTUD", "ID_USRIO", "NMBRE_TRCRO", "INDCDOR_SLCTUD_APRBDA", "DSCRPCION_INDCDOR_SLCTUD_APRBD", "FCHA_RSPSTA", "DCMNTO", "NMRO_ACTO_DSPLAY", "NMRO_ACTO", "FCHA", "ID_TTLO_JDCIAL_SLCTUD", "ID_TTLO_JDCIAL_DCMNTO", "ID_ACTO", "INDCDOR_ACTO_CNFRMCION", "ID_RPRTE", "ID_PLNTLLA", "CDGO_ACTO_TPO") AS
  select e.cdgo_ttlo_jdcial_slctud_tpo,
		e.dscrpcion,
		e.fcha_slctud,
		e.id_usrio,
		e.nmbre_trcro,
		e.indcdor_slctud_aprbda,
		e.dscrpcion_indcdor_slctud_aprbd,
		e.fcha_rspsta,
        a.dcmnto,
        d.nmro_acto_dsplay,
        d.nmro_acto,
        d.fcha,
        b.id_ttlo_jdcial_slctud,
        a.id_ttlo_jdcial_dcmnto,
        a.id_acto,
		a.indcdor_acto_cnfrmcion,
        a.id_rprte,
        a.id_plntlla,
        f.cdgo_acto_tpo
     from gf_g_titulos_jdcial_dcmnto a
     join gf_g_ttlos_jdcl_dcmnt_slctd b on a.id_ttlo_jdcial_dcmnto = b.id_ttlo_jdcial_dcmnto
     join (select c.id_ttlo_jdcial_slctud
             from gf_g_ttlos_jdcl_dcmnt_slctd b
             join gf_g_ttlos_jdcl_slctd_dtll c on b.id_ttlo_jdcial_slctud = c.id_ttlo_jdcial_slctud
             group by c.id_ttlo_jdcial_slctud) c on b.id_ttlo_jdcial_slctud = c.id_ttlo_jdcial_slctud
left join v_gn_g_actos d on d.id_acto = a.id_acto
     join v_gf_g_titulos_jdcial_slctud e on e.id_ttlo_jdcial_slctud = c.id_ttlo_jdcial_slctud
     join gn_d_actos_tipo f on d.id_acto_tpo = f.id_acto_tpo;

