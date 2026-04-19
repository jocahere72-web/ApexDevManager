
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_USUARIOS" ("ID_USRIO", "USER_NAME", "CDGO_CLNTE", "ID_FNCNRIO", "ID_TRCRO", "NMBRE_TRCRO", "IDNTFCCION", "DRCCION", "EMAIL", "TLFNO", "ID_PRFSION", "NMBRE_PRFSION", "ID_OFCNA", "NMBRE_OFCNA", "ID_CRGO", "NMBRE_CRGO", "FCHA_CRCION", "ID_ENTDAD", "CDGO_ENTDAD_TPO", "DSCRPCION_ENTDAD_TPO", "IDNTFCCION_ENTDAD", "NMBRE_RZON_SCIAL_ENTDAD", "ADMIN", "ADMIN_RNION", "PASSWORD", "FCHA_EXPRCION", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA", "ACTVO") AS
  select a.id_usrio
		, a.user_name
		, b.cdgo_clnte
		, c.id_fncnrio
		, b.id_trcro
		, b.nmbre_trcro
		, b.idntfccion
		, b.drccion
		, b.email
		, b.tlfno
		, b.id_prfsion
		, b.nmbre_prfsion
		, c.id_ofcna
		, d.nmbre_ofcna
		, c.id_crgo
		, e.nmbre_crgo
		, a.fcha_crcion
		, c.id_entdad
		, f.cdgo_entdad_tpo
		, f.dscrpcion_entdad_tpo
		, f.idntfccion			idntfccion_entdad
		, f.nmbre_rzon_scial	nmbre_rzon_scial_entdad
		, a.admin
		, a.admin_rnion
		, a.password
		, a.fcha_exprcion
		, a.username_digita
		, a.fecha_digita
		, a.username_modifica
		, a.fecha_modifica
		, a.actvo
	 from sg_g_usuarios				a
	 join v_si_c_terceros			b on b.id_trcro 	= a.id_trcro
	 left join df_c_funcionarios	c on c.id_trcro 	= b.id_trcro
	 left join df_c_oficinas		d on d.id_ofcna 	= c.id_ofcna
	 left join df_c_cargos			e on e.id_crgo		= c.id_crgo
	 left join v_df_s_entidades		f on c.id_entdad	= f.id_entdad;

