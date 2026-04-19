
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JDCIAL_SLCTUD" ("ID_TTLO_JDCIAL_SLCTUD", "CDGO_TTLO_JDCIAL_SLCTUD_TPO", "DSCRPCION", "FCHA_SLCTUD", "ID_USRIO", "IDNTFCCION", "NMBRE_TRCRO", "EMAIL", "TLFNO", "INDCDOR_SLCTUD_APRBDA", "DSCRPCION_INDCDOR_SLCTUD_APRBD", "FCHA_RSPSTA", "INDCDOR_SLCTUD_CNFRMCION") AS
  select a.id_ttlo_jdcial_slctud,
    a.cdgo_ttlo_jdcial_slctud_tpo,
    b.dscrpcion,
    a.fcha_slctud,
    a.id_usrio,
    c.idntfccion,
    c.nmbre_trcro,
    c.email,
    c.tlfno,
    a.indcdor_slctud_aprbda,
    decode (a.indcdor_slctud_aprbda, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_slctud_aprbd,
    a.fcha_rspsta,
        a.indcdor_slctud_cnfrmcion
   from gf_g_titulos_jdcial_slctud      a
   join gf_d_ttlos_jdcial_slctud_tp     b on a.cdgo_ttlo_jdcial_slctud_tpo  = b.cdgo_ttlo_jdcial_slctud_tpo
   join v_sg_g_usuarios           c on a.id_usrio           = c.id_usrio;

