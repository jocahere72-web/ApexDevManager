
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_CONCEPTOS" ("ID_CNCPTO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "CDGO_CNCPTO", "DSCRPCION", "CDGO_CNCPTO_TPO", "DSCRPCION_CNCPTO_TPO", "ID_CNCPTO_RLCNAL", "CDGO_CNCPTO_RLCNAL", "DSCRPCION_CNCPTO_RLCNAL", "SNCION", "DSCRPCION_SNCION", "UNCO", "DSCRPCION_UNCO", "ACTVO", "DSCRPCION_ACTVO", "CTGRIA_CNCPTO") AS
  select a.id_cncpto
     , a.cdgo_clnte
     , b.nmbre_clnte
     , a.id_impsto
     , c.nmbre_impsto
     , a.cdgo_cncpto
     , a.dscrpcion
     , a.cdgo_cncpto_tpo
     , d.dscrpcion dscrpcion_cncpto_tpo
     , a.id_cncpto_rlcnal
     , e.cdgo_cncpto cdgo_cncpto_rlcnal
     , e.dscrpcion dscrpcion_cncpto_rlcnal
     , a.sncion
     , decode(a.sncion,'S', 'Sí', 'N', 'No') dscrpcion_sncion
     , a.unco
     , decode(a.unco,'S', 'Sí', 'N', 'No') dscrpcion_unco
     , a.actvo
     , decode(a.actvo,'S', 'Sí', 'N', 'No') dscrpcion_actvo
	 , decode (a.ctgria_cncpto, 'C', 'Capital', 'D', 'Descuento', 'I', 'Interés') ctgria_cncpto
  from df_i_conceptos       a
  join df_s_clientes      b on a.cdgo_clnte         = b.cdgo_clnte
  join df_c_impuestos     c on a.id_impsto        = c.id_impsto
  join df_s_conceptos_tipo  d on a.cdgo_cncpto_tpo    = d.cdgo_cncpto_tpo
  left join df_i_conceptos  e on a.id_cncpto_rlcnal     = e.id_cncpto
  order by a.cdgo_clnte, a.id_impsto, a.cdgo_cncpto_tpo desc, a.id_cncpto;

