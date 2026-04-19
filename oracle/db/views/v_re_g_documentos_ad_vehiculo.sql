
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_AD_VEHICULO" ("ID_DCMNTO_AD_VHCLO", "ID_DCMNTO", "CDGO_VHCLO_CLSE", "DSCRPCION_VHCLO_CLSE", "CDGO_VHCLO_MRCA", "DSCRPCION_VHCLO_MRCA", "ID_VHCLO_LNEA", "DSCRPCION_VHCLO_LNEA", "CDGO_VHCLO_SRVCIO", "DSCRPCION_VHCLO_SRVCIO", "CLNDRJE", "CPCDAD_CRGA", "CPCDAD_PSJRO", "CDGO_VHCLO_CRRCRIA", "DSCRPCION_VHCLO_CRROCRIA", "MDLO", "CDGO_VHCLO_BLNDJE", "DSCRPCION_VHCLO_BLNDJE", "CDGO_VHCLO_OPRCION", "DSCRPCION_VHCLO_OPRCION") AS
  select a.id_dcmnto_ad_vhclo
		, a.id_dcmnto
		, a.cdgo_vhclo_clse
		, c.dscrpcion_vhclo_clse
		, a.cdgo_vhclo_mrca
		, d.dscrpcion_vhclo_mrca
		, a.id_vhclo_lnea
		, e.dscrpcion_vhclo_lnea
		, a.cdgo_vhclo_srvcio
		, f.dscrpcion_vhclo_srvcio
		, a.clndrje
		, a.cpcdad_crga
		, a.cpcdad_psjro
		, a.cdgo_vhclo_crrcria
		, g.dscrpcion_vhclo_crrocria
		, a.mdlo
		, a.cdgo_vhclo_blndje
		, j.dscrpcion_vhclo_blndje
		, a.cdgo_vhclo_oprcion
		, l.dscrpcion_vhclo_oprcion
	 from re_g_documentos_ad_vehiculo		a
	 join df_s_vehiculos_clase 			    c on a.cdgo_vhclo_clse 		= c.cdgo_vhclo_clse
	 join df_s_vehiculos_marca 				d on a.cdgo_vhclo_mrca		= d.cdgo_vhclo_mrca
	 join df_s_vehiculos_linea 			    e on a.id_vhclo_lnea		= e.id_vhclo_lnea
	 join df_s_vehiculos_servicio			f on a.cdgo_vhclo_srvcio	= f.cdgo_vhclo_srvcio
	 join df_s_vehiculos_carroceria		    g on a.cdgo_vhclo_crrcria	= g.cdgo_vhclo_crrcria
	 join df_s_vehiculos_blindaje			j on a.cdgo_vhclo_blndje	= j.cdgo_vhclo_blndje
	 left join df_s_vehiculos_operacion		l on a.cdgo_vhclo_oprcion	= l.cdgo_vhclo_oprcion;

