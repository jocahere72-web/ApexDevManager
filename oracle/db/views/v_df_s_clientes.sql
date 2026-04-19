
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_CLIENTES" ("CDGO_CLNTE", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "NMRO_IDNTFCCION", "NMBRE_CLNTE", "DRCCION", "TLFNO", "CLLAR", "EMAIL", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "SLGAN", "NMBRE_ENCRGDO", "ID_OFCNA", "NMBRE_OFCNA", "STIO_WEB", "ESCDO", "SMBLO_MNDA", "FRMTO_MNDA", "NMRO_DCMLES", "ACTVO", "DSCRPCION_ACTVO") AS
  select a.cdgo_clnte,
		a.cdgo_idntfccion_tpo,
		b.dscrpcion_idntfccion_tpo,
		a.nmro_idntfccion,
		a.nmbre_clnte,
		a.drccion,
		a.tlfno,
        a.cllar,
		a.email,
		a.id_pais,
		c.nmbre_pais,
		a.id_dprtmnto,
		d.nmbre_dprtmnto,
		a.id_mncpio,
		e.nmbre_mncpio,
		a.slgan,
		a.nmbre_encrgdo,
		a.id_ofcna,
		f.nmbre_ofcna,
		a.stio_web,
		a.escdo,
		a.smblo_mnda,
		a.frmto_mnda,
		a.nmro_dcmles,
		a.actvo,
		decode (a.actvo, 'S', 'Si', 'N', 'No') dscrpcion_actvo
  from df_s_clientes 				a
  join df_s_identificaciones_tipo 	b on a.cdgo_idntfccion_tpo	= b.cdgo_idntfccion_tpo
  join df_s_paises					c on a.id_pais 				= c.id_pais
  join df_s_departamentos			d on a.id_dprtmnto 			= d.id_dprtmnto
  join df_s_municipios				e on a.id_mncpio			= e.id_mncpio
  left join df_c_oficinas 			f on a.id_ofcna 			= f.id_ofcna;

