
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_NOVEDADES_PERSONA_SJTO" ("ID_NVDAD_PRSNA_SJTO", "ID_NVDAD_PRSNA", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "NMBRE", "NMBRE_RZON_SCIAL", "DRCCION", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "DRCCION_NTFCCION", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "EMAIL", "TLFNO", "CLLAR", "NMRO_RGSTRO_CMRA_CMRCIO", "FCHA_RGSTRO_CMRA_CMRCIO", "FCHA_INCIO_ACTVDDES", "NMRO_SCRSLES", "DRCCION_CMRA_CMRCIO", "ID_ACTVDAD_ECNMCA", "CDGO_ACTVDAD_ECNMCA", "DSCRPCION", "TPO_PRSNA", "DSCRPCION_TPO_PRSNA", "ID_SJTO_TPO", "NMBRE_SJTO_TPO") AS
  select a.id_nvdad_prsna_sjto
		, a.id_nvdad_prsna
		, a.cdgo_idntfccion_tpo
		, b.dscrpcion_idntfccion_tpo
		, a.idntfccion
		, a.prmer_nmbre ||' '|| a.sgndo_nmbre||' '||a.prmer_aplldo||' '||a.sgndo_aplldo as nmbre
		, a.nmbre_rzon_scial
		, a.drccion
		, a.id_pais
		, c.nmbre_pais
		, a.id_dprtmnto
		, d.nmbre_dprtmnto
		, a.id_mncpio
		, e.nmbre_mncpio
		, a.drccion_ntfccion
		, a.id_pais_ntfccion
		, f.nmbre_pais           as nmbre_pais_ntfccion
		, a.id_dprtmnto_ntfccion
		, g.nmbre_dprtmnto       as nmbre_dprtmnto_ntfccion
		, a.id_mncpio_ntfccion
		, h.nmbre_mncpio         as nmbre_mncpio_ntfccion
		, a.email
		, a.tlfno
		, a.cllar
		, a.nmro_rgstro_cmra_cmrcio
		, a.fcha_rgstro_cmra_cmrcio
		, a.fcha_incio_actvddes
		, a.nmro_scrsles
		, a.drccion_cmra_cmrcio
		, a.id_actvdad_ecnmca
		, i.cdgo_actvdad_ecnmca
		, i.dscrpcion
		, a.tpo_prsna
		, decode(a.tpo_prsna, 'J', 'JURÍDICA', 'N','NATURAL') as dscrpcion_tpo_prsna
		, a.id_sjto_tpo
		, j.nmbre_sjto_tpo
	 from si_g_novedades_persona_sjto 		a
	 join df_s_identificaciones_tipo  		b on a.cdgo_idntfccion_tpo  = b.cdgo_idntfccion_tpo
	 left join df_s_paises                 	c on a.id_pais              = c.id_pais
	 left join df_s_departamentos          	d on a.id_dprtmnto          = d.id_dprtmnto
	 left join df_s_municipios             	e on a.id_mncpio            = e.id_mncpio
	 left join df_s_paises                 	f on a.id_pais_ntfccion     = f.id_pais
	 left join df_s_departamentos          	g on a.id_dprtmnto_ntfccion = g.id_dprtmnto
	 left join df_s_municipios             	h on a.id_mncpio_ntfccion   = h.id_mncpio
	 join gi_d_actividades_economica       	i on a.id_actvdad_ecnmca    = i.id_actvdad_ecnmca
	 left join df_i_sujetos_tipo           	j on a.id_sjto_tpo          = j.id_sjto_tpo;

