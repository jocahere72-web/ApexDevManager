
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_D_ENTIDAD_CLIENTE_MEDIO" ("ID_ENTDAD_CLNTE_MDIO", "ID_ENTDAD_CLNTE", "DSCRPCION_ENTDAD_CLNTE", "ID_MDIO", "DSCRPCION_MDIO") AS
  select	a.id_entdad_clnte_mdio
		,a.id_entdad_clnte
		,(select dscrpcion from v_nt_d_entidad_cliente where id_entdad_clnte = a.id_entdad_clnte) dscrpcion_entdad_clnte
		,a.id_mdio
		,(select dscrpcion from nt_d_medio where  id_mdio = a.id_mdio) dscrpcion_mdio
from nt_d_entidad_cliente_medio a;

