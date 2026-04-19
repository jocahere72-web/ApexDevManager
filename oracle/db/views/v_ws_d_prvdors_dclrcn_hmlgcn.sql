
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WS_D_PRVDORS_DCLRCN_HMLGCN" ("ID_PRVDOR_DCLRCION_HMLGCION", "ID_PRVDOR_DCLRCION", "ID_PRVDOR", "ID_FRMLRIO", "CDGO_SCCION", "CDGO_ITEM_PRVDOR", "ID_FRMLRIO_RGION_ATRBTO", "INDCDOR_TPO_DTO", "ORGN_EXTRCCION", "VLOR_EXTRCCION", "ID_CNSLTA_DCLRCION", "INDCDOR_FRMLRIO_ATRBTO_HMLGA", "FNCION_FRMLRIO_ATRBTO_HMLGA", "VLOR_FJO") AS
  select  a.id_prvdor_dclrcion_hmlgcion,
        c.id_prvdor_dclrcion,
        c.id_prvdor,
        c.id_frmlrio,
        b.cdgo_sccion,
        b.cdgo_item_prvdor,
        a.id_frmlrio_rgion_atrbto,
        b.indcdor_tpo_dto,
        b.orgn_extrccion,
        b.vlor_extrccion,
        a.id_cnslta_dclrcion,
        a.indcdor_frmlrio_atrbto_hmlga,
        a.fncion_frmlrio_atrbto_hmlga,
        a.vlor_fjo
from ws_d_prvdors_dclrcn_hmlgcn a
join ws_d_provedores_dclrcn_itm b
  on a.id_prvdor_dclrcion_itm = b.id_prvdor_dclrcion_itm
join ws_d_provedores_declrcn    c
  on b.id_prvdor_dclrcion = c.id_prvdor_dclrcion
;

