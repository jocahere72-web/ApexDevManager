
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_C_TERCEROS" ("ID_TRCRO", "CDGO_CLNTE", "NMBRE_CLNTE", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "NMBRE_TRCRO", "DRCCION", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "DRCCION_NTFCCION", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "EMAIL", "TLFNO", "CLLAR", "GRFRNCCION", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "GNRO", "NCNLDAD", "FCHA_NCMNTO", "ID_PAIS_ORGN", "NMBRE_PAIS_ORGN", "ID_PRFSION", "NMBRE_PRFSION", "INDCDOR_CNTRBYNTE", "INDCDR_FNCNRIO", "CDGO_TRCRO_TPO", "DSCRPCION_TRCRO_TPO") AS
  select a.id_trcro
		, a.cdgo_clnte
		, (select nmbre_clnte from df_s_clientes c where c.cdgo_clnte = a.cdgo_clnte) nmbre_clnte
		, a.cdgo_idntfccion_tpo
		, (select dscrpcion_idntfccion_tpo from df_s_identificaciones_tipo d where d.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo )dscrpcion_idntfccion_tpo
		, a.idntfccion
		, trim(trim(a.prmer_nmbre||' '||a.sgndo_nmbre)||' '||replace(trim(a.prmer_aplldo||' '||a.sgndo_aplldo),'.','')) nmbre_trcro
		, a.drccion
		, a.id_pais
		, (select nmbre_pais from df_s_paises p where p.id_pais = a.id_pais)nmbre_pais
		, a.id_dprtmnto
		, (select nmbre_dprtmnto from df_s_departamentos d where d.id_dprtmnto = a.id_dprtmnto)nmbre_dprtmnto
		, a.id_mncpio
		, (select nmbre_mncpio from df_s_municipios m where m.id_mncpio = a.id_mncpio)nmbre_mncpio
		, a.drccion_ntfccion
		, a.id_pais_ntfccion
		, (select nmbre_pais from df_s_paises p where p.id_pais = a.id_pais_ntfccion)nmbre_pais_ntfccion
		, a.id_dprtmnto_ntfccion
		, (select nmbre_dprtmnto from df_s_departamentos d where d.id_dprtmnto = a.id_dprtmnto_ntfccion)nmbre_dprtmnto_ntfccion
		, a.id_mncpio_ntfccion
		, (select nmbre_mncpio from df_s_municipios m where m.id_mncpio = a.id_mncpio_ntfccion)nmbre_mncpio_ntfccion
		, a.email
		, a.tlfno
		, a.cllar
		, a.grfrnccion
		, a.file_blob
		, a.file_name
		, a.file_mimetype
		, a.gnro
		, a.ncnldad
		, a.fcha_ncmnto
		, a.id_pais_orgn
		, (select nmbre_pais from df_s_paises p where p.id_pais = a.id_pais_orgn)nmbre_pais_orgn
		, a.id_prfsion
		, (select nmbre_prfsion from df_s_profesiones p where p.id_prfsion = a.id_prfsion)nmbre_prfsion
		, a.indcdor_cntrbynte
		, a.indcdr_fncnrio
		, a.cdgo_trcro_tpo
		, b.dscrpcion 			dscrpcion_trcro_tpo
	 from si_c_terceros			a
	 left join df_s_terceros_tipo	b on a.cdgo_trcro_tpo	= b.cdgo_trcro_tpo;

