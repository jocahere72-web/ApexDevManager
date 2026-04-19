
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GD_D_TRD_SERIE" ("ID_TRD_SRIE", "ID_TRD", "CDGO_CLNTE", "ID_SRIE", "CDGO_SRIE", "NMBRE_SRIE", "FCHA_INCIO_SRIE", "FCHA_FIN_SRIE", "OBSRVCION_SRIE", "ACTVO_SRIE", "ID_SBSRIE", "CDGO_SBSRIE", "NMBRE_SBSRIE", "FCHA_INCIO_SBSRIE", "FCHA_FIN_SBSRIE", "OBSRVCION_SBSRIE", "ACTVO_SBSRIE", "TMPO_GSTION", "TMPO_CNTRAL", "TMPO_HSTRCO", "INDCDOR_DSPCCION_CT", "INDCDOR_DSPCCION_E", "INDCDOR_DSPCCION_S", "INDCDOR_DSPCCION_MD", "OBSRVCION", "FCHA") AS
  select a.id_trd_srie
        , a.id_trd
        , b.cdgo_clnte
        , a.id_srie
        , b.cdgo_srie
        , b.nmbre_srie
        , b.fcha_incio fcha_incio_srie
        , b.fcha_fin fcha_fin_srie
        , b.obsrvcion obsrvcion_srie
        , b.actvo actvo_srie
        , a.id_sbsrie
        , c.cdgo_srie cdgo_sbsrie
        , c.nmbre_srie nmbre_sbsrie
        , c.fcha_incio fcha_incio_sbsrie
        , c.fcha_fin fcha_fin_sbsrie
        , c.obsrvcion obsrvcion_sbsrie
        , c.actvo actvo_sbsrie
        , a.tmpo_gstion
        , a.tmpo_cntral
        , a.tmpo_hstrco
        , a.indcdor_dspccion_ct
        , a.indcdor_dspccion_e
        , a.indcdor_dspccion_s
        , a.indcdor_dspccion_md
        , a.obsrvcion
        , a.fcha
     from gd_d_trd_serie a
	 join gd_d_series b
       on b.id_srie = a.id_srie
left join gd_d_series c
       on c.id_srie = a.id_sbsrie;

