
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DECLARACIONES_ADICIONAL" ("ID_DCLRCION_ADCNAL", "ID_DCLRCION_PRVDA", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_TPO_FRMLRIO", "VGNCIA", "ID_PRDO", "DECLARACION_FLEX_N01", "DECLARACION_FLEX_N02", "DECLARACION_FLEX_N03", "DECLARACION_FLEX_N04", "DECLARACION_FLEX_D01", "DECLARACION_FLEX_D02", "DECLARACION_FLEX_D03", "DECLARACION_FLEX_D04", "DECLARACION_FLEX_01", "DECLARACION_FLEX_02", "DECLARACION_FLEX_03", "DECLARACION_FLEX_04", "DECLARACION_FLEX_05", "DECLARACION_FLEX_06", "DECLARACION_FLEX_07", "DECLARACION_FLEX_08", "DECLARACION_FLEX_CLOB") AS
  select a.id_dclrcion_adcnal,
       a.id_dclrcion_prvda,
       a.cdgo_clnte,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       a.id_tpo_frmlrio,
       a.vgncia,
       a.id_prdo,
       a.declaracion_flex_n01,
       a.declaracion_flex_n02,
       a.declaracion_flex_n03,
       a.declaracion_flex_n04,
       a.declaracion_flex_d01,
       a.declaracion_flex_d02,
       a.declaracion_flex_d03,
       a.declaracion_flex_d04,
       a.declaracion_flex_01,
       a.declaracion_flex_02,
       a.declaracion_flex_03,
       a.declaracion_flex_04,
       a.declaracion_flex_05,
       a.declaracion_flex_06,
       a.declaracion_flex_07,
       a.declaracion_flex_08,
       a.declaracion_flex_clob
  from gi_g_declaraciones_adicional  a;

