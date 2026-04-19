
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_IDENTIFICACIONES_TIPO" ("CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "NMTCNCO_IDNTFCCION_TPO", "NMBRE_IDNTFCCION_TPO") AS
  select cdgo_idntfccion_tpo,
      dscrpcion_idntfccion_tpo,
       nmtcnco_idntfccion_tpo,
	   nmtcnco_idntfccion_tpo || ' - ' || dscrpcion_idntfccion_tpo as nmbre_idntfccion_tpo
  from df_s_identificaciones_tipo
order by dscrpcion_idntfccion_tpo;

