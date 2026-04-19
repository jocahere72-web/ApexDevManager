
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GJ_D_MOTIVOS_CLIENTE" ("ID_MTVO_CLNTE", "ID_MTVO", "DSCRPCION", "TXTO_DCMNTO", "ACTVO_MTVO", "CDGO_CLNTE", "A_I_R", "ACTVO") AS
  select  a.id_mtvo_clnte,
          a.id_mtvo,
          b.dscrpcion,
          b.txto_dcmnto,
          b.actvo actvo_mtvo,
          a.cdgo_clnte,
          a.a_i_r,
          a.actvo
  from gj_d_motivos_cliente   a
  inner join gj_d_motivos     b on a.id_mtvo = b.id_mtvo
;

