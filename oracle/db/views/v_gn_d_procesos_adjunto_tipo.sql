
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_PROCESOS_ADJUNTO_TIPO" ("ID_PRCSOS_ADJNTO_TPO", "CDGO_PRCSO", "NMBRE_PRCSO", "ACTVO_PRCSO", "ID_ADJNTO_TPO", "ACTVO", "CDGO_ADJNTO_TPO", "DSCRPCION", "ACTVO_ADJNTO_TPO") AS
  select
  a.id_prcsos_adjnto_tpo,
  a.cdgo_prcso,
  b.nmbre_prcso,
  b.actvo actvo_prcso,
  a.id_adjnto_tpo,
  a.actvo,
  c.cdgo_adjnto_tpo,
  c.dscrpcion,
  c.actvo actvo_adjnto_tpo
from gn_d_procesos_adjunto_tipo a
join df_c_procesos 				b on b.cdgo_prcso = a.cdgo_prcso
join gn_d_adjuntos_tipo			c on c.id_adjnto_tpo = a.id_adjnto_tpo;

