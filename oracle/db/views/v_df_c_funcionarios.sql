
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_FUNCIONARIOS" ("ID_FNCNRIO", "CDGO_CLNTE", "ID_TRCRO", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION", "NMBRE_TRCRO", "DRCCION", "EMAIL", "TLFNO", "ID_PRFSION", "NMBRE_PRFSION", "ID_OFCNA", "NMBRE_OFCNA", "ID_CRGO", "NMBRE_CRGO", "ACTVO", "FIRMA_FILE_BLOB", "FIRMA_FILE_NAME", "FIRMA_FILE_MIMETYPE") AS
  select a.id_fncnrio,
		a.cdgo_clnte,
		a.id_trcro,
		c.cdgo_idntfccion_tpo,
		c.dscrpcion_idntfccion_tpo,
		c.idntfccion,
		c.nmbre_trcro,
		c.drccion,
		c.email,
		c.tlfno,
		c.id_prfsion,
		c.nmbre_prfsion,
		a.id_ofcna,
		d.nmbre_ofcna,
		a.id_crgo,
		e.nmbre_crgo,
		a.actvo,
        firma_file_blob,
        firma_file_name,
        firma_file_mimetype
  from df_c_funcionarios 	a
  join df_s_clientes		b on a.cdgo_clnte 	= b.cdgo_clnte
  join v_si_c_terceros		c on a.id_trcro		= c.id_trcro
  join df_c_oficinas		d on a.id_ofcna 	= d.id_ofcna
  join df_c_cargos			e on a.id_crgo		= e.id_crgo;

