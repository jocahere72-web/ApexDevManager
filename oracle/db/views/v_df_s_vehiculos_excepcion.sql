
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_EXCEPCION" ("ID_VHCLO_EXCPCION", "VGNCIA", "CDGO_VHCLO_MRCA", "DSCRPCION_VHCLO_MRCA", "ID_VHCLO_LNEA", "DSCRPCION_VHCLO_LNEA", "CDGO_VHCLO_CLSE", "DSCRPCION_VHCLO_CLSE", "CDGO_VHCLO_CRRCRIA", "DSCRPCION_VHCLO_CRROCRIA", "CLNDRJE", "DSCRPCION_VHCLO_OPRCION", "CDGO_VHCLO_SRVCIO", "DSCRPCION_VHCLO_SRVCIO", "CPCDAD_DSDE", "CPCDAD_HSTA", "MDLO_DSDE", "MDLO_HSTA", "GRPO") AS
  select e.id_vhclo_excpcion,
          e.vgncia,
          e.cdgo_vhclo_mrca,
          l.dscrpcion_vhclo_mrca,
          e.id_vhclo_lnea,
          l.dscrpcion_vhclo_lnea,
          e.cdgo_vhclo_clse,
          a.dscrpcion_vhclo_clse,
          e.cdgo_vhclo_crrcria,
          b.dscrpcion_vhclo_crrocria,
          e.clndrje,
          c.dscrpcion_vhclo_oprcion,
          e.cdgo_vhclo_srvcio,
          d.dscrpcion_vhclo_srvcio,
          e.cpcdad_dsde,
          e.cpcdad_hsta,
          e.mdlo_dsde,
          e.mdlo_hsta,
          e.grpo
        from df_s_vehiculos_excepcion  e
        join df_s_vehiculos_clase      a on e.cdgo_vhclo_clse         = a.cdgo_vhclo_clse
        join df_s_vehiculos_carroceria b on e.cdgo_vhclo_crrcria      = b.cdgo_vhclo_crrcria
        join df_s_vehiculos_operacion  c on e.cdgo_vhclo_oprcion      = c.cdgo_vhclo_oprcion
        join df_s_vehiculos_servicio   d on e.cdgo_vhclo_srvcio       = d.cdgo_vhclo_srvcio,
        v_df_s_vehiculos_linea l
      where e.id_vhclo_lnea = l.id_vhclo_lnea
      order by l.dscrpcion_vhclo_mrca, l.dscrpcion_vhclo_lnea,
              a.dscrpcion_vhclo_clse, grpo
;

