
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_D_CONVENIOS_TIPO_CNDCION" ("ID_CNVNIO_TPO_CNDCION", "ID_CNVNIO_TPO", "DSCRPCION", "CDGO_SJTO_TPO", "FCHA_LMTE_ELBRCION", "ID_CNVNIO_ATRBTO", "NMBRE_ATRBTO", "DSCRPCION_ATRBTO", "NMBRE_TBLA", "NMBRE_CLMNA", "TPO_DTO_ATRBTO", "TPO_OBJTO_ATRBTO", "ID_OPRDOR_TPO", "DSCRPCION_OPRDOR_TPO", "OPRDOR", "VLOR1", "VLOR2", "CMPRTA_LGCA", "ORDEN_AGRPCION") AS
  select a.id_cnvnio_tpo_cndcion,
		a.id_cnvnio_tpo,
		b.dscrpcion,
		b.cdgo_sjto_tpo,
		b.fcha_lmte_elbrcion,
		a.id_cnvnio_atrbto,
		c.nmbre 		nmbre_atrbto,
		c.dscrpcion 	dscrpcion_atrbto,
		c.nmbre_tbla,
		c.nmbre_clmna,
		c.tpo_dto 		tpo_dto_atrbto,
		c.tpo_objto 	tpo_objto_atrbto,
		a.id_oprdor_tpo,
		d.dscrpcion     dscrpcion_oprdor_tpo,
        d.oprdor,
		a.vlor1,
		a.vlor2,
		a.cmprta_lgca,
		a.orden_agrpcion
  from gf_d_convenios_tipo_cndcion	a
  join gf_d_convenios_tipo 			b on a.id_cnvnio_tpo 	= b.id_cnvnio_tpo
  join gf_d_convenios_atributo		c on a.id_cnvnio_atrbto	= c.id_cnvnio_atrbto
  join df_s_operadores_tipo			d on a.id_oprdor_tpo	= d.id_oprdor_tpo;

