
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBARGOS_RSPSTAS_OFCIO" ("ID_EMBRGOS_RSPSTAS_OFCIO", "CDGO_CLNTE", "ID_SLCTD_OFCIO", "ID_RSPSTAS_EMBRGO", "CDGO_RSPSTA", "DSCRPCION", "OBSRVCION_RSPSTA", "FILENAME_RSPSTA", "MIME_TYPE_RSPSTA", "BLOB_RSPSTA") AS
  select a.id_embrgos_rspstas_ofcio,
        a.cdgo_clnte,
        a.id_slctd_ofcio,
        a.id_rspstas_embrgo,
        b.cdgo_rspsta,
        b.dscrpcion,
        a.obsrvcion_rspsta,
        a.filename_rspsta,
        a.mime_type_rspsta,
        a.blob_rspsta
from mc_g_embargos_rspstas_ofcio a
join mc_d_respuestas_embargo b on b.id_rspstas_embrgo = a.id_rspstas_embrgo;

