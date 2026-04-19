
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_RESOLUCION_CTSTOPRO_DTLLE" ("ID_RSLCION_CTSTOPRO", "RSLCION", "RDCCION", "CDGO_TPO_TRMTE", "TPO_TRMTE", "CDGO_CLSE_MTCION", "CLSE_MTCION", "ID_RSL_ADJNTO") AS
  select distinct
a.id_rslcion_CtstoPro
, b.rslcion
, b.rdccion
, b.tpo_trmte cdgo_tpo_trmte
, d.dscrpcion tpo_trmte
, b.clse_mtcion cdgo_clse_mtcion
, e.dscrpcion clse_mtcion
, c.id_rsl_adjnto
from si_g_resolucion_catastopro         a
join si_g_resolucion_ctstopro_dtlle     b on a.id_rslcion_CtstoPro = b.id_rslcion_CtstoPro
join si_g_resoluciones_adjunto          c on c.id_rsl_adjnto = b.id_rsl_adjnto
join df_s_tramites_tipo                 d on d.cdgo_trmte_tpo  = b.tpo_trmte
join df_s_mutaciones_clase              e on e.cdgo_mtcion_clse = b.clse_mtcion;

