
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_EXENCIONES_SLCTUD_MTVO" ("ID_EXNCION_SLCTUD_MTVO", "ID_EXNCION_SLCTUD", "ID_EXNCION_MTVO", "NMTCNCO_MTVO", "MTVO", "ID_DCRTO", "NMRO_DCRTO", "DSCRPCION_DCRTO", "NMTCNCO_DCRTO") AS
  (
select   a.id_exncion_slctud_mtvo
        , a.id_exncion_slctud
        , a.id_exncion_mtvo
        , b.nmtcnco             nmtcnco_mtvo
        , b.mtvo
        , c.id_dcrto
        , c.nmro_dcrto
        , c.dscrpcion_dcrto
        , c.nmtcnco             nmtcnco_dcrto
from gf_g_exenciones_slctud_mtvo    a
    join v_df_i_exenciones_motivo b on a.id_exncion_mtvo    = b.id_exncion_mtvo
    join v_df_i_exenciones        c on b.id_exncion         = c.id_exncion);

