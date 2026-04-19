
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_DEFINICIONES_IMPUESTO" ("ID_DFNCN_IMPSTO", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "CDGO_DFNCN_IMPSTO", "DSCRPCION", "FRMTO", "DSCRPCION_FRMTO", "VLOR") AS
  select a.id_dfncn_impsto
             , a.cdgo_clnte
             , a.id_impsto
             , c.nmbre_impsto
             , a.cdgo_dfncn_impsto
             , a.dscrpcion
             , a.frmto
             , b.dscrpcion_dto_tpo as dscrpcion_frmto
             , a.vlor
        from df_i_definiciones_impuesto a
        join et_d_datos_tipo b
          on a.frmto = b.cdgo_dto_tpo
        join df_c_impuestos c
          on a.id_impsto = c.id_impsto;

