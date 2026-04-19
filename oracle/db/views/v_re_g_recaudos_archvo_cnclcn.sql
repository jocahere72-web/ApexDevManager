
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_ARCHVO_CNCLCN" ("ID_RCDO_ARCHVO_CNCLCION", "NMBRE_ARCHVO", "FCHA_CNCLCION", "ESTDO_ARCHVO", "DSCRPCION_ESTDO_ARCHVO") AS
  select a.id_rcdo_archvo_cnclcion
	 , a.nmbre_archvo
	 , a.fcha_cnclcion
	 , a.estdo_archvo
	 , decode(a.estdo_archvo, 'IN', 'INICIADO', 'FINALIZADO') as dscrpcion_estdo_archvo
from re_g_recaudos_archvo_cnclcn	a;

