
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_TAREAS" ("ID_TREA", "CDGO_CLNTE", "NMBRE_CLNTE", "NMBRE_TREA", "DSCRPCION_TREA", "CDGO_ACCION_TPO", "DSCRPCION_ACCION_TPO", "ID_APLCCION", "NMRO_APLCCION", "NMBRE_APLCCION", "NMRO_PGNA", "NMBRE_UP", "NMBRE_RPRTE", "NTFCCION_CRREO", "INDCDOR_ENVIAR", "DSCRPCION_INDCDOR_ENVIAR") AS
  select a.id_trea,
	   a.cdgo_clnte,
	   (select m.nmbre_clnte from df_s_clientes m where m.cdgo_clnte = a.cdgo_clnte) nmbre_clnte,
	   a.nmbre_trea,
	   a.dscrpcion_trea,
	   a.cdgo_accion_tpo,
       b.dscrpcion_accion_tpo,
	   a.id_aplccion,
       b.nmro_aplccion,
	   b.nmbre_aplccion,
	   a.nmro_pgna,
	   a.nmbre_up,
	   a.nmbre_rprte,
	   a.ntfccion_crreo,
       a.indcdor_enviar,
       decode(a.indcdor_enviar, 'S','Sí','No') dscrpcion_indcdor_enviar
  from wf_d_tareas a
  join wf_d_acciones_tipo b
    on b.cdgo_accion_tpo =  a.cdgo_accion_tpo
  join sg_g_aplicaciones b
    on b.id_aplccion = a.id_aplccion;

