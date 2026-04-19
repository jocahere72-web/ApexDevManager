
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_FORMULARIOS_REGION" ("ID_FRMLRIO_RGION", "ID_FRMLRIO", "ID_FRMLRIO_RGION_PDRE", "CDGO_RGION_TPO", "DSCRPCION", "INDCDOR_INCIA_NVA_FLA", "NMRO_CLMNA", "AMPLCION_CLMNA", "INDCDOR_EDTBLE", "ORDEN", "ACTVO", "DSCRPCION_RGION_TPO") AS
  select a.id_frmlrio_rgion,
  	     a.id_frmlrio,
         a.id_frmlrio_rgion_pdre,
         a.cdgo_rgion_tpo,
         a.dscrpcion,
         a.indcdor_incia_nva_fla,
	     a.nmro_clmna,
         a.amplcion_clmna,
		 a.indcdor_edtble,
         a.orden,
		 a.actvo,
         c.dscrpcion dscrpcion_rgion_tpo
  from gi_d_formularios_region a
  inner join gi_d_formularios     b on a.id_frmlrio       = b.id_frmlrio
  inner join gi_d_regiones_tipo   c on a.cdgo_rgion_tpo   = c.cdgo_rgion_tpo;

