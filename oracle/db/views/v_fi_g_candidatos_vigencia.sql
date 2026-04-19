
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_CANDIDATOS_VIGENCIA" ("ID_CNDDTO_VGNCIA", "ID_CNDDTO", "VGNCIA", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "PRDO", "DSCRPCION") AS
  select a.id_cnddto_vgncia,
       a.id_cnddto,
       a.vgncia,
       b.id_prdo,
       a.id_dclrcion_vgncia_frmlrio,
       b.prdo,
       b.dscrpcion
from fi_g_candidatos_vigencia a
join df_i_periodos            b on a.id_prdo = b.id_prdo;

