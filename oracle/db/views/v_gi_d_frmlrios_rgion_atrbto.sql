
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_FRMLRIOS_RGION_ATRBTO" ("CDGO_CLNTE", "ID_FRMLRIO", "DSCRPCION_FRMLRIO", "ID_FRMLRIO_RGION", "ID_FRMLRIO_RGION_ATRBTO", "CDGO_ATRBTO_TPO", "DSCRPCION_ATRBTO_TPO", "DSCRPCION", "NMBRE_DSPLAY", "NMBRE_RPRTE", "ALNCION_CBCRA", "ALNCION_VLOR", "MSCRA", "INDCDOR_INCIA_NVA_FLA", "NMRO_CLMNA", "AMPLCION_CLMNA", "VLOR_DFCTO", "ORDEN", "TPO_ORGN", "ORGEN", "INDCDOR_OBLGTRIO", "INDCDOR_EDTBLE", "ACTVO") AS
  select      c.cdgo_clnte,
            --c.id_impsto,
            --c.id_impsto_sbmpsto,
            b.id_frmlrio,
            c.dscrpcion dscrpcion_frmlrio,
            a.id_frmlrio_rgion,
            a.id_frmlrio_rgion_atrbto,
            a.cdgo_atrbto_tpo,
			d.dscrpcion dscrpcion_atrbto_tpo,
            a.dscrpcion,
            a.nmbre_dsplay,
            a.nmbre_rprte,
            a.alncion_cbcra,
            a.alncion_vlor,
            a.mscra,
            a.indcdor_incia_nva_fla,
            a.nmro_clmna,
            a.amplcion_clmna,
            a.vlor_dfcto,
            a.orden,
            a.tpo_orgn,
            a.orgen,
            a.indcdor_oblgtrio,
            a.indcdor_edtble,
            a.actvo
from        gi_d_frmlrios_rgion_atrbto  a
inner join  gi_d_formularios_region     b   on  b.id_frmlrio_rgion  =   a.id_frmlrio_rgion
inner join  gi_d_formularios            c   on  c.id_frmlrio		=   b.id_frmlrio
inner join	gi_d_atributos_tipo			d	on	d.cdgo_atrbto_tpo	=	a.cdgo_atrbto_tpo;

