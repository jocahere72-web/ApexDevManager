
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_LINEA" ("ID_VHCLO_LNEA", "CDGO_LNEA", "DSCRPCION_VHCLO_LNEA", "CDGO_VHCLO_MRCA", "DSCRPCION_VHCLO_MRCA", "MNSTRIO") AS
  select l.id_vhclo_lnea,
         l.cdgo_lnea,
	       l.dscrpcion_vhclo_lnea,
         l.cdgo_vhclo_mrca,
	       (select m.dscrpcion_vhclo_mrca from df_s_vehiculos_marca m  where l.cdgo_vhclo_mrca = m.cdgo_vhclo_mrca )dscrpcion_vhclo_mrca,
         l.mnstrio
    from df_s_vehiculos_linea l
   order by l.dscrpcion_vhclo_lnea
;

