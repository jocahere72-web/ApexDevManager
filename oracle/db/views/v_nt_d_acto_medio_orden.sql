
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_D_ACTO_MEDIO_ORDEN" ("ID_ACTO_MDIO_ORDEN", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "ID_MDIO", "DSCRPCION_ID_MDIO", "CDGO_MDIO", "INDCDOR_MSVO", "ORDEN", "UNDAD_DRCION", "DRCION", "DIA_TPO", "INDCDOR_AUTMTCO", "ID_ENVIO_PRGRMDO", "DSCRPCION_ENVIO_PRGRMDO", "IDNTFCDOR") AS
  select	a.id_acto_mdio_orden
		, a.id_acto_tpo
		,(select dscrpcion from gn_d_actos_tipo where id_acto_tpo = a.id_acto_tpo) dscrpcion_acto_tpo
		, a.id_mdio
        , b.dscrpcion dscrpcion_id_mdio
        , b.cdgo_mdio
        , b.indcdor_msvo
		, a.orden
		, a.undad_drcion
		, a.drcion
		, a.dia_tpo
		, a.indcdor_autmtco
		, a.id_envio_prgrmdo
        , c.dscrpcion dscrpcion_envio_prgrmdo
        , c.idntfcdor
from nt_d_acto_medio_orden              a
    join nt_d_medio                     b on b.id_mdio = a.id_mdio
    left join ma_g_envios_programado    c on c.id_envio_prgrmdo = a.id_envio_prgrmdo;

