
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_EXTRACTO" ("ID_CNVNIO_EXTRCTO", "CDGO_CLNTE", "ID_CNVNIO", "NMRO_CNVNIO", "FCHA_SLCTUD", "FCHA_APRBCION", "NMRO_CTA", "FCHA_VNCMNTO", "VLOR_CPTAL", "VLOR_INTRES", "VLOR_FNCNCION", "VLOR_TTAL", "INDCDOR_CTA_PGDA", "DSCRPCION_INDCDOR_CTA_PGDA", "ID_DCMNTO_CTA", "NMRO_DCMNTO", "FCHA_PGO_CTA", "ACTVO", "DSCRPCION_ACTVO", "INDCDOR_PGO_APLCDO", "DSCRPCION_INDCDOR_PGO_APLCDO", "ESTDO_CTA", "DIAS_VNCMNTO") AS
  select a.id_cnvnio_extrcto,
		b.cdgo_clnte,
		a.id_cnvnio,
		b.nmro_cnvnio,
		b.fcha_slctud,
		b.fcha_aprbcion,
		a.nmro_cta,
		a.fcha_vncmnto,
		a.vlor_cptal,
		a.vlor_intres,
		a.vlor_fncncion,
		a.vlor_ttal,
		a.indcdor_cta_pgda,
		decode (a.indcdor_cta_pgda, 'N', 'No','S', 'Si') dscrpcion_indcdor_cta_pgda,
		a.id_dcmnto_cta,
		c.nmro_dcmnto,
		a.fcha_pgo_cta,
		a.actvo,
		decode (a.actvo, 'N', 'No','S', 'Si') dscrpcion_actvo,
		c.indcdor_pgo_aplcdo,
		decode (c.indcdor_pgo_aplcdo, 'N', 'No','S', 'Si') dscrpcion_indcdor_pgo_aplcdo,
		case when a.indcdor_cta_pgda = 'S' then
			'PAGADA'
			when a.indcdor_cta_pgda = 'N' and trunc(a.fcha_vncmnto) < trunc(sysdate) then
			'VENCIDA'
			else
			'ADEUDADA'
		end as estdo_cta,
		case when a.indcdor_cta_pgda = 'N' and trunc(a.fcha_vncmnto) < trunc(sysdate) then
			trunc(sysdate) - trunc(a.fcha_vncmnto)
        else
            null
       end as dias_vncmnto
   from gf_g_convenios_extracto 	a
   join gf_g_convenios				b on a.id_cnvnio = b.id_cnvnio
   left join  re_g_documentos		c on a.id_dcmnto_cta = c.id_dcmnto
;

