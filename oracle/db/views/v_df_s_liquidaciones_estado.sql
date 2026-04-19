
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_LIQUIDACIONES_ESTADO" ("CDGO_LQDCION_ESTDO", "DSCRPCION_LQDCION_ESTDO") AS
  select cdgo_lqdcion_estdo,
       dscrpcion_lqdcion_estdo
  from df_s_liquidaciones_estado
order by dscrpcion_lqdcion_estdo;

