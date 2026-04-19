
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_GRUPO" ("ID_VHCLO_GRPO", "VGNCIA", "ID_VHCLO_CLSE_CTGRIA", "CDGO_VHCLO_CLSE", "DSCRPCION_VHCLO_CLSE", "DSCRPCION_VHCLO_CTGTRIA", "CDGO_VHCLO_MRCA", "DSCRPCION_VHCLO_MRCA", "ID_VHCLO_LNEA", "DSCRPCION_VHCLO_LNEA", "CLNDRJE_DSDE", "CLNDRJE_HSTA", "CPCDAD_DSDE", "CPCDAD_HSTA", "CDGO_VHCLO_SRVCIO", "DSCRPCION_VHCLO_SRVCIO", "CDGO_VHCLO_OPRCION", "DSCRPCION_VHCLO_OPRCION", "CDGO_VHCLO_CRRCRIA", "DSCRPCION_VHCLO_CRRCRIA", "GRPO") AS
  select g.id_vhclo_grpo,
         g.vgncia,
	       g.id_vhclo_clse_ctgria,
         ct.cdgo_vhclo_clse,
	       ct.dscrpcion_vhclo_clse,
	       ct.dscrpcion_vhclo_ctgtria,
	       g.cdgo_vhclo_mrca,
	       l.dscrpcion_vhclo_mrca,
	       g.id_vhclo_lnea,
         l.dscrpcion_vhclo_lnea,
	       g.clndrje_dsde,
	       g.clndrje_hsta,
	       g.cpcdad_dsde,
	       g.cpcdad_hsta,
	       g.cdgo_vhclo_srvcio,
	       (select dscrpcion_vhclo_srvcio from df_s_vehiculos_servicio s where g.cdgo_vhclo_srvcio = s.cdgo_vhclo_srvcio) dscrpcion_vhclo_srvcio,
	       g.cdgo_vhclo_oprcion,
	       (select dscrpcion_vhclo_oprcion from df_s_vehiculos_operacion o where g.cdgo_vhclo_oprcion = o.cdgo_vhclo_oprcion)dscrpcion_vhclo_oprcion,
	       g.cdgo_vhclo_crrcria,
	       (select dscrpcion_vhclo_crrocria from df_s_vehiculos_carroceria c where g.cdgo_vhclo_crrcria = c.cdgo_vhclo_crrcria ) dscrpcion_vhclo_crrcria,
	       g.grpo
    from df_s_vehiculos_grupo g, v_df_s_vehiculos_clase_ctgria ct, v_df_s_vehiculos_linea l
   where g.id_vhclo_clse_ctgria = ct.id_vhclo_clse_ctgria
     and g.id_vhclo_lnea = l.id_vhclo_lnea
   order by ct.dscrpcion_vhclo_clse, ct.dscrpcion_vhclo_ctgtria,
         l.dscrpcion_vhclo_mrca, l.dscrpcion_vhclo_lnea
;

