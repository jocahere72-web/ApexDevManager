
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_REPORTES" ("ID_RPRTE", "ID_PRCSO", "CDGO_RPRTE_GRPO", "DSCRPCION_RPRTE_GRPO", "CDGO_FRMTO_TPO", "DSCRPCION_FRMTO_TPO", "CDGO_FRMTO_PLNTLLA", "NMBRE_RPRTE", "NMBRE_PLNTLLA", "NMBRE_CNSLTA", "INDCDOR_GNRCO", "DSCRPCION_INDCDOR_GNRCO", "ACTVO", "DSCRPCION_ACTVO") AS
  select a.id_rprte,
		a.id_prcso,
		a.cdgo_rprte_grpo,
		b.dscrpcion as dscrpcion_rprte_grpo,
		a.cdgo_frmto_tpo,
		c.dscrpcion as dscrpcion_frmto_tpo,
		a.cdgo_frmto_plntlla,
		a.nmbre_rprte,
		a.nmbre_plntlla,
		a.nmbre_cnslta,
		a.indcdor_gnrco,
		decode(a.indcdor_gnrco, 'S','Sí','No') as dscrpcion_indcdor_gnrco,
		a.actvo,
		decode(a.actvo, 'S','Sí','No') as dscrpcion_actvo
   from gn_d_reportes 		a
   join gn_d_reportes_grupo b 	on a.cdgo_rprte_grpo 	= b.cdgo_rprte_grpo
   join df_s_formatos_tipo 	c 	on a.cdgo_frmto_tpo 	= c.cdgo_frmto_tpo;

