
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_FLUJOS_TAREA_PRTCPNTE" ("ID_FLJO_TREA_PRTCPNTE", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_FLJO_TREA", "ID_FLJO", "CDGO_FLJO", "DSCRPCION_FLJO", "ID_TREA", "NMBRE_TREA", "TPO_PRTCPNTE", "ID_PRTCPTE", "DSCRPCION_PRTCPNTE", "ACTVO") AS
  select
  a.id_fljo_trea_prtcpnte,
  b.cdgo_clnte,
  b.nmbre_clnte,
  a.id_fljo_trea,
  b.id_fljo,
  b.cdgo_fljo,
  b.dscrpcion_fljo,
  b.id_trea,
  b.nmbre_trea,
  a.tpo_prtcpnte,
  a.id_prtcpte,
  case  a.tpo_prtcpnte
    when 'USUARIO' then
		  (select m.nmbre_trcro from v_sg_g_usuarios m where m.id_usrio = a.id_prtcpte)
	  when 'PERFIL' then
		  (select m.nmbre_prfil from v_sg_g_perfiles m where m.id_prfil = a.id_prtcpte)
  end dscrpcion_prtcpnte,
  a.actvo
from wf_d_flujos_tarea_prtcpnte a, v_wf_d_flujos_tarea b
where a.id_fljo_trea = b.id_fljo_trea;

