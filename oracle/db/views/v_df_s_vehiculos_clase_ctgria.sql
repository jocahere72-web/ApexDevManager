
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VEHICULOS_CLASE_CTGRIA" ("ID_VHCLO_CLSE_CTGRIA", "VGNCIA", "CDGO_VHCLO_CLSE", "DSCRPCION_VHCLO_CLSE", "CDGO_VHCLO_CTGTRIA", "DSCRPCION_VHCLO_CTGTRIA") AS
  select c.id_vhclo_clse_ctgria,
          c.vgncia,
          c.cdgo_vhclo_clse,
          a.dscrpcion_vhclo_clse,
          c.cdgo_vhclo_ctgtria,
          d.dscrpcion_vhclo_ctgtria
        from df_s_vehiculos_clase_ctgria c
        join df_s_vehiculos_clase        a on c.cdgo_vhclo_clse    = a.cdgo_vhclo_clse
        join df_s_vehiculos_categoria    d on c.cdgo_vhclo_ctgtria = d.cdgo_vhclo_ctgtria
      order by dscrpcion_vhclo_clse, dscrpcion_vhclo_ctgtria
;

