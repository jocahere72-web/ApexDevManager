
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_FISCALIZACION_LOTE" ("ID_FSCLZCION_LTE", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_PRGRMA", "CDGO_PRGRMA", "NMBRE_PRGRMA", "ID_SBPRGRMA", "CDGO_SBPRGRMA", "NMBRE_SBPRGRMA", "ID_FNCNRIO_RGSTRO", "INDCDOR_PRCSDO", "OBSRVCION", "FCHA_RGSTRO") AS
  select a.id_fsclzcion_lte,
       a.cdgo_clnte,
       d.id_impsto,
       d.nmbre_impsto,
       a.id_prgrma,
       b.cdgo_prgrma,
       b.nmbre_prgrma,
       a.id_sbprgrma,
       c.cdgo_sbprgrma,
       c.nmbre_sbprgrma,
       a.id_fncnrio_rgstro,
       a.indcdor_prcsdo,
       a.obsrvcion,
       a.fcha_rgstro
from fi_g_fiscalizacion_lote a
join fi_d_programas      b on a.id_prgrma   =   b.id_prgrma
join fi_d_subprogramas   c on a.id_sbprgrma =   c.id_sbprgrma
join df_c_impuestos      d on a.id_impsto   =   d.id_impsto;

