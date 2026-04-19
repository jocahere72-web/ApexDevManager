
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_G_ACTOS_TIPO" ("CDGO_ACTO_TPO", "DSCRPCION_ACTO", "CDGO_CLNTE", "INDCDOR_NTFCCION", "INDCDR_NTFCCION_ATMTCA", "ID_PRCSO", "DSCRPCION_PRCSO") AS
  select a.cdgo_acto_tpo,
	 a.dscrpcion DSCRPCION_ACTO,
	 a.cdgo_clnte,
	 a.indcdor_ntfccion,
	 a.indcdr_ntfccion_atmtca,
	 b.id_prcso,
	 b.dscrpcion DSCRPCION_PRCSO
from gn_d_actos_tipo a
join df_s_procesos b on a.id_prcso = b.id_prcso;

