
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_SUJETOS_ESTADO" ("ID_SJTO_ESTDO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "DSCRPCION_SJTO_ESTDO") AS
  select a.ID_SJTO_ESTDO,
         a.CDGO_CLNTE,
         b.nmbre_clnte,
         a.ID_IMPSTO,
         c.nmbre_impsto,
         a.DSCRPCION_SJTO_ESTDO
  from df_i_sujetos_estado a
  join df_s_clientes       b on a.cdgo_clnte = b.cdgo_clnte
  join df_c_impuestos      c on a.id_impsto  = c.id_impsto
 order by dscrpcion_sjto_estdo;

