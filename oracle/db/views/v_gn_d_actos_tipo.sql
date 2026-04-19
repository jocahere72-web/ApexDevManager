
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_ACTOS_TIPO" ("ID_ACTO_TPO", "CDGO_ACTO_TPO", "DSCRPCION", "CDGO_CLNTE", "INDCDOR_NTFCCION", "ID_PRCSO", "DSCRPCION_PRCSO") AS
  select  a.id_acto_tpo,
         a.cdgo_acto_tpo,
         a.dscrpcion,
         a.cdgo_clnte,
         a.indcdor_ntfccion,
         b.id_prcso,
         b.dscrpcion dscrpcion_prcso
  from gn_d_actos_tipo a
  left join df_s_procesos b on a.id_prcso = b.id_prcso;

