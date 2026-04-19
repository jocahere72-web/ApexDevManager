
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_DECLARACIONES_ITM_CLCLO" ("ID_DCLRCION_ITEM_CLCLO", "ID_DCLRCION_ITEM", "DSCRPCION", "ORDEN", "ID_DCLRCION_ITEM_RLCNDO", "OPRCION", "MLJE", "TPO_CLCLO") AS
  select a.id_dclrcion_item_clclo,
       a.id_dclrcion_item,
       b.dscrpcion,
       a.orden,
       a.id_dclrcion_item_rlcndo,
       a.oprcion,
       a.mlje,
       a.tpo_clclo
  from gi_d_declaraciones_item_clclo a
  join gi_d_declaraciones_item       b on a.id_dclrcion_item = b.id_dclrcion_item;

