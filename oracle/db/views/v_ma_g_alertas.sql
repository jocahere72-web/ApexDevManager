
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MA_G_ALERTAS" ("ID_ALRTA", "ID_ALRTA_TPO", "DSCRPCION_ALRTA", "CDGO", "CLOR_ALRTA", "ICNO", "ICNO_CLOR", "ID_ENVIO_MDIO", "ID_USRIO", "TTLO", "DSCRPCION", "URL", "FCHA_RGSTRO", "INDCDOR_VSTO", "FCHA_VSTO", "ID_ALRTA_ESTDO", "CDGO_ESTDO", "DSCRPCION_ESTDO", "CDGO_ENVIO_ESTDO", "ACTVO_ESTDO") AS
  select  a.id_alrta,
          a.id_alrta_tpo,
          b.dscrpcion dscrpcion_alrta,
          b.cdgo,
          b.clor_alrta,
          b.icno,
          b.icno_clor,
          a.id_envio_mdio,
          a.id_usrio,
          a.ttlo,
          a.dscrpcion,
          a.url,
          a.fcha_rgstro,
          a.indcdor_vsto,
          a.fcha_vsto,
          a.id_alrta_estdo,
          c.cdgo_estdo,
          c.dscrpcion dscrpcion_estdo,
          c.cdgo_envio_estdo,
          c.actvo actvo_estdo
  from ma_g_alertas a
  inner join ma_d_alertas_tipo b on a.id_alrta_tpo = b.id_alrta_tpo
  inner join ma_d_alertas_estado c on a.id_alrta_estdo = c.id_alrta_estdo;

