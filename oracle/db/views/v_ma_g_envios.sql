
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MA_G_ENVIOS" ("ID_ENVIO", "CDGO_CLNTE", "ID_ENVIO_PRGRMDO", "DSCRPCION_ENVIO_PRGMDO", "JSON_PRFRNCIA", "FCHA_RGSTRO", "FCHA_PRGRMDA", "ID_SJTO_IMPSTO", "ID_ACTO", "EJCCION_TPO", "IDNTFCDOR", "FCHA_INCIO", "FCHA_FIN", "INTRVLO_RPTCION", "VLOR_INTRVLO", "ID_ENVIO_PRGRMD_CNSLTA_PRNCPAL", "ORGEN_TPO_DSTNTRIO", "ID_ENVIO_PRGRMD_CNSLTA_DSTNTR", "ORGEN_DSTNTRIO", "ORGEN_TPO_ADJUNTO", "ID_ENVIO_PRGRMDO_CNSLTA_ADJNTO", "ORGEN_ADJUNTO", "CNFRMCION_ENVIO", "ACTVO_ENVIO_PRGMDO") AS
  select   a.id_envio
      ,a.cdgo_clnte
      ,a.id_envio_prgrmdo
      ,b.dscrpcion  dscrpcion_envio_prgmdo
      ,a.json_prfrncia
      ,a.fcha_rgstro
      ,a.fcha_prgrmda
      ,a.id_sjto_impsto
      ,a.id_acto
      ,b.ejccion_tpo
      ,b.idntfcdor
      ,b.fcha_incio
      ,b.fcha_fin
      ,b.intrvlo_rptcion
      ,b.vlor_intrvlo
      ,b.id_envio_prgrmd_cnslta_prncpal
      ,b.orgen_tpo_dstntrio
      ,b.id_envio_prgrmd_cnslta_dstntr
      ,b.orgen_dstntrio
      ,b.orgen_tpo_adjunto
      ,b.id_envio_prgrmdo_cnslta_adjnto
      ,b.orgen_adjunto
      ,b.cnfrmcion_envio
      ,b.actvo     actvo_envio_prgmdo
  from ma_g_envios a
    join ma_g_envios_programado b on b.id_envio_prgrmdo = a.id_envio_prgrmdo
;

