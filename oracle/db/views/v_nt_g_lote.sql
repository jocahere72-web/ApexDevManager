
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_LOTE" ("ID_LTE", "CDGO_CLNTE", "ID_ENTDAD_CLNTE_MDIO", "DSCRPCION_MEDIO", "DSCRPCION", "FCHA_GNRCION", "CDGO_ESTDO_LTE", "ID_FNCNRIO_GNRCION", "DSCRPCION_FNCNRIO_GNRCION", "NMRO_RGSTROS", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "FCHA_PRCSMNTO", "ID_FNCNRIO_PRCSMNTO", "DSCRPCION_FNCNRIO_PRCSMNTO", "ID_NTFCION_MDIO_EVDNCIA") AS
  select a.id_lte
		,a.cdgo_clnte
		,a.id_entdad_clnte_mdio
		,(select dscrpcion_mdio from v_nt_d_entidad_cliente_medio where id_entdad_clnte_mdio = a.id_entdad_clnte_mdio) dscrpcion_medio
		,a.dscrpcion
		,a.fcha_gnrcion
		,a.cdgo_estdo_lte
		,a.id_fncnrio_gnrcion
		,(select nmbre_trcro from v_df_c_funcionarios where  id_fncnrio  = a.id_fncnrio_gnrcion) dscrpcion_fncnrio_gnrcion
		,a.nmro_rgstros
		,a.id_acto_tpo
		,(select dscrpcion from gn_d_actos_tipo where  id_acto_tpo = a.id_acto_tpo) dscrpcion_acto_tpo
		,a.fcha_prcsmnto
		,a.id_fncnrio_prcsmnto
		,(select nmbre_trcro from v_df_c_funcionarios where  id_fncnrio  = a.id_fncnrio_prcsmnto) dscrpcion_fncnrio_prcsmnto
		,a.id_ntfcion_mdio_evdncia
from nt_g_lote	a;

