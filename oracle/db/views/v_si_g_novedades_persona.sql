
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_NOVEDADES_PERSONA" ("ID_NVDAD_PRSNA", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "IDNTFCCION_ANTRIOR", "ID_SJTO_IMPSTO", "OBSRVCION", "CDGO_NVDAD_TPO", "DSCRPCION_NVDAD_TPO", "ID_INSTNCIA_FLJO", "ID_INSTNCIA_FLJO_PDRE", "ID_SLCTUD", "CDGO_NVDAD_PRSNA_ESTDO", "DSCRPCION_NVDAD_PRSNA_ESTDO", "FCHA_RGSTRO", "ID_USRIO_RGSTRO", "NMBRE_USRIO_RGSTRO", "FCHA_APLCO", "ID_USRIO_APLCO", "NMBRE_USRIO_APLCO", "FCHA_RCHZO", "ID_USRIO_RCHZO", "NMBRE_USRIO_RCHZO", "OBSRVCION_RCHZO", "NMBRE_SLCTNTE", "CDGO_IDNTFCCION_TPO_SLCTNTE", "NMRO_IDNTFCCION_SLCTNTE", "DRCCION_NTFCCION", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "EMAIL", "TLFNO", "CLLAR", "NMRO_RDCDO", "NMRO_RDCDO_DSPLAY", "ID_ACTO", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "INDCDOR_NTFCDO", "FCHA_ACTO") AS
  select a.id_nvdad_prsna
		, a.cdgo_clnte
		, a.id_impsto
		, a.id_impsto_sbmpsto
		, c.id_sjto
		, nvl(c.idntfccion, l.idntfccion)			idntfccion_sjto
		, nvl(c.idntfccion_antrior, l.idntfccion)	idntfccion_antrior
		, a.id_sjto_impsto
		, a.obsrvcion
		, a.cdgo_nvdad_tpo
		, d.dscrpcion								dscrpcion_nvdad_tpo
		, a.id_instncia_fljo
		, a.id_instncia_fljo_pdre
		, a.id_slctud
		, a.cdgo_nvdad_prsna_estdo
		, e.dscrpcion								dscrpcion_nvdad_prsna_estdo

		, a.fcha_rgstro
		, a.id_usrio_rgstro
		, f.nmbre_trcro								nmbre_usrio_rgstro

		, a.fcha_aplco
		, a.id_usrio_aplco
		, j.nmbre_trcro								nmbre_usrio_aplco

		, a.fcha_rchzo
		, a.id_usrio_rchzo
		, k.nmbre_trcro								nmbre_usrio_rchzo

		, a.obsrvcion_rchzo
		, g.nmbre_slctnte
		, g.cdgo_idntfccion_tpo						cdgo_idntfccion_tpo_slctnte
		, g.idntfccion								nmro_idntfccion_slctnte
		, l.drccion_ntfccion
		, g.id_pais_ntfccion
		, g.nmbre_pais_ntfccion
		, g.id_dprtmnto_ntfccion
		, g.nmbre_dprtmnto_ntfccion
		, g.id_mncpio_ntfccion
		, g.nmbre_mncpio_ntfccion
		, g.email
		, g.tlfno
		, g.cllar
		, h.nmro_rdcdo
		, h.nmro_rdcdo_dsplay
		, a.id_acto
		, i.cdgo_acto_orgen
		, i.dscrpcion_acto_orgen
		, i.nmro_acto
		, i.nmro_acto_dsplay
		, i.indcdor_ntfcdo
		, i.fcha fcha_acto
	 from si_g_novedades_persona			a
	 left join si_i_sujetos_impuesto		b on a.id_sjto_impsto			= b.id_sjto_impsto
	 left join si_c_sujetos					c on b.id_sjto					= c.id_sjto
	 join si_d_novedades_tipo				d on a.cdgo_nvdad_tpo			= d.cdgo_nvdad_tpo
	 join si_d_novedades_prsna_estdo		e on a.cdgo_nvdad_prsna_estdo	= e.cdgo_nvdad_prsna_estdo
	 join v_sg_g_usuarios					f on a.id_usrio_rgstro			= f.id_usrio
	 left join v_pq_g_solicitantes			g on a.id_slctud				= g.id_slctud
	 left join v_pq_g_solicitudes			h on a.id_slctud				= h.id_slctud
	 left join v_gn_g_actos					i on a.id_acto 					= i.id_acto
	 left join v_sg_g_usuarios				j on a.id_usrio_aplco			= j.id_usrio
	 left join v_sg_g_usuarios				k on a.id_usrio_rchzo			= k.id_usrio
	 left join si_g_novedades_persona_sjto	l on a.id_nvdad_prsna		    = l.id_nvdad_prsna;

