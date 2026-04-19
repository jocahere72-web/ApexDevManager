
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MA_G_ENVIOS_MEDIO" ("CDGO_CLNTE", "ID_ENVIO_MDIO", "ID_ENVIO", "CDGO_ENVIO_MDIO", "DSCRPCION_ENVIO_MDIO", "DSTNO", "ASNTO", "TXTO_MNSJE", "CDGO_ENVIO_ESTDO", "DSCRPCION_ENVIO_ESTDO", "RSPSTA", "STATUS", "MESSAGEHREF", "MESSAGEID", "FCHA_RSPSTA", "INDCDOR_NTFCDO", "FCHA_NTFCDO", "ID_ENVIO_PRGRMDO", "DSCRPCION_ENVIO_PRGRMDO", "ID_SJTO_IMPSTO", "ID_ACTO", "FCHA_RGSTRO") AS
  select      b.cdgo_clnte
            ,a.id_envio_mdio
			,a.id_envio
			,a.cdgo_envio_mdio
			,(select dscrpcion from ma_d_envios_medio where cdgo_envio_mdio = a.cdgo_envio_mdio) dscrpcion_envio_mdio
			,a.dstno
			,a.asnto
			,a.txto_mnsje
			,a.cdgo_envio_estdo
			,(select dscrpcion from ma_d_envios_estado where cdgo_envio_estdo = a.cdgo_envio_estdo) dscrpcion_envio_estdo
			,a.rspsta
			,a.status
			,a.messagehref
			,a.messageid
			,a.fcha_rspsta
			,a.indcdor_ntfcdo
			,a.fcha_ntfcdo
			,b.id_envio_prgrmdo
			,(select dscrpcion from ma_g_envios_programado where id_envio_prgrmdo = b.id_envio_prgrmdo) dscrpcion_envio_prgrmdo
			,b.id_sjto_impsto
			,b.id_acto
      , b.fcha_rgstro
	from ma_g_envios_medio a join ma_g_envios b on b.id_envio = a.id_envio
;

