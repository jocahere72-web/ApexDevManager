
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_SECUESTRE_DILIGENCIA" ("ID_SCSTRE_GSTION", "ID_SCSTRE_DLGNCIA", "FCHA_DLGNCIA", "IDNTFCCION_DPSTRIO", "NMBRE_DPSTRIO", "OBSRVCION", "HNRRIOS_SCSTRE", "FCHA_SCSTRE", "ID_INSTNCIA_FLJO", "CDGO_CLNTE", "ID_SCSTRE", "ID_SCSTRS_AUXLR", "ID_SLCTD_OFCIO") AS
  select a.id_scstre_gstion,
        a.id_scstre_dlgncia,
        a.fcha_dlgncia,
        a.idntfccion_dpstrio,
        a.nmbre_dpstrio,
        a.obsrvcion,
        a.hnrrios_scstre,
        b.fcha_scstre,
        b.id_instncia_fljo,
        b.cdgo_clnte,
        b.id_scstre,
        b.id_scstrs_auxlr,
        b.id_slctd_ofcio
from mc_g_secuestre_diligencia a
inner join mc_g_secuestre_gestion b on b.id_scstre_gstion = a.id_scstre_gstion;

