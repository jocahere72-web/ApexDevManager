
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_NOTIFICACIONES" ("CDGO_CLNTE", "ID_NTFCCION", "ID_ACTO", "NMRO_ACTO", "FCHA_ACTO", "INDCDOR_NTFCDO", "CDGO_ESTDO", "ACTO_DESCRPCION", "CLOR_ESTDO", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "FCHA_NTFCCION") AS
  select b.cdgo_clnte,
       a.id_ntfccion,
       a.id_acto,
       b.nmro_acto,
       b.fcha fcha_acto,
       a.indcdor_ntfcdo,
       a.cdgo_estdo,
       c.dscrpcion acto_descrpcion,
       c.clor_estdo,
       b.cdgo_acto_orgen,
       b.dscrpcion_acto_orgen,
       b.id_acto_tpo,
       b.dscrpcion_acto_tpo,
       b.fcha_ntfccion
  from nt_g_notificaciones a
 inner join v_gn_g_actos b
    on a.id_acto = b.id_acto
 inner join nt_d_estado c
    on a.cdgo_estdo = c.cdgo_estdo
;

