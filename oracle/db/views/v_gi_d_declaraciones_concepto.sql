
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_DECLARACIONES_CONCEPTO" ("ID_DCLRCION_VGNCIA_FRMLRIO", "ID_IMPSTO_ACTO_CNCPTO", "ID_CNCPTO", "CDGO_CNCPTO_TPO", "CTGRIA_CNCPTO", "ID_CNCPTO_RLCNAL", "ID_FRMLRIO_RGION", "ID_FRMLRIO_RGION_ATRBTO", "FLA", "ID_FRMLRIO_RGION_ITEM") AS
  select    a.id_dclrcion_vgncia_frmlrio,
            a.id_impsto_acto_cncpto,
            b.id_cncpto,
            'DBT' cdgo_cncpto_tpo,
            'C' ctgria_cncpto,
            b.id_cncpto id_cncpto_rlcnal,
            a.id_frmlrio_rgion,
            a.id_frmlrio_rgion_atrbto,
            a.fla,
            a.id_frmlrio_rgion_item
from        gi_d_dclrcnes_acto_cncpto       a
inner join  df_i_impuestos_acto_concepto    b   on  b.id_impsto_acto_cncpto =   a.id_impsto_acto_cncpto
union all
select      d.id_dclrcion_vgncia_frmlrio,
            e.id_impsto_acto_cncpto,
            c.id_cncpto,
            f.cdgo_cncpto_tpo,
            f.ctgria_cncpto,
            nvl(f.id_cncpto_rlcnal, e.id_cncpto) as id_cncpto_rlcnal,
            c.id_frmlrio_rgion,
            c.id_frmlrio_rgion_atrbto,
            c.fla,
            c.id_frmlrio_rgion_item
from        gi_d_dclrcnes_cncpto_rlcnal     c
inner join  gi_d_dclrcnes_acto_cncpto       d   on  d.id_dclrcion_acto_cncpto   =   c.id_dclrcion_acto_cncpto
inner join  df_i_impuestos_acto_concepto    e   on  e.id_impsto_acto_cncpto     =   d.id_impsto_acto_cncpto
inner join  df_i_conceptos                  f   on  f.id_cncpto                 =   c.id_cncpto
;

