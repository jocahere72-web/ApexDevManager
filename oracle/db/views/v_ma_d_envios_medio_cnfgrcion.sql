
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MA_D_ENVIOS_MEDIO_CNFGRCION" ("ID_ENVIO_MDIO_CNFGRCION", "CDGO_CLNTE", "CDGO_ENVIO_MDIO", "DSCRPCION_ENVIO_MDIO", "MXMO_CRCTRES", "UNDAD_PRGRMA", "ACTVO", "ACTVO_DSCRPCION") AS
  select  a.id_envio_mdio_cnfgrcion ,
          a.cdgo_clnte ,
          a.cdgo_envio_mdio,
          b.dscrpcion dscrpcion_envio_mdio,
          a.mxmo_crctres ,
          a.undad_prgrma ,
		  a.actvo,
          case a.actvo when 'S' then 'Sí' when 'N' then 'No' end actvo_dscrpcion
  from ma_d_envios_medio_cnfgrcion a
  inner join ma_d_envios_medio b on a.cdgo_envio_mdio = b.cdgo_envio_mdio;

