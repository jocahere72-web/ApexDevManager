
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_D_NTFCCION_MDIO_ENTDD" ("ID_ENTDAD_CLNTE_MDIO", "ID_ENTDAD_CLNTE", "CDGO_CLNTE", "CDGO_ENTDAD", "DSCRPCION_ENTDAD", "ID_MDIO", "CDGO_MDIO", "DSCRPCION_MDIO") AS
  select a.id_entdad_clnte_mdio,
         a.id_entdad_clnte,
		 c.cdgo_clnte,
		 c.cdgo_entdad,
         c.dscrpcion as dscrpcion_entdad,
         a.id_mdio,
		 b.cdgo_mdio,
		 b.dscrpcion as dscrpcion_mdio
  from nt_d_entidad_cliente_medio a
  inner join nt_d_medio b on a.id_mdio = b.id_mdio
  inner join v_nt_d_entidad_cliente c on a.id_entdad_clnte = c.id_entdad_clnte;

