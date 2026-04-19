
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_FISCALIZACION_EXPDNTE_DTLLE" ("ID_FSCLZCION_EXPDNTE", "ID_CNDDTO", "ID_INSTNCIA_FLJO", "CDGO_EXPDNTE_ESTDO", "ID_EXPDNTE", "FCHA_APRTRA", "FCHA_CRRE", "ID_FNCNRIO", "ID_FSCLZCION_EXPDNTE_PDRE", "NMRO_EXPDNTE", "ID_FSCLZC_EXPDN_CNDD_VGNC", "ID_CNDDTO_VGNCIA", "VGNCIA", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "ESTDO", "ID_DCLRCION", "ID_LQDCION") AS
  select  a.id_fsclzcion_expdnte ,
        a.id_cnddto ,
        a.id_instncia_fljo ,
        a.cdgo_expdnte_estdo ,
        a.id_expdnte ,
        a.fcha_aprtra ,
        a.fcha_crre ,
        a.id_fncnrio ,
        a.id_fsclzcion_expdnte_pdre ,
        a.nmro_expdnte,
        b.id_fsclzc_expdn_cndd_vgnc,
        b.id_cnddto_vgncia,
        c.vgncia,
        c.id_prdo,
        c.id_dclrcion_vgncia_frmlrio,
        b.estdo,
        b.id_dclrcion,
        b.id_lqdcion
from fi_g_fiscalizacion_expdnte a
join fi_g_fsclzc_expdn_cndd_vgnc b on a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
join fi_g_candidatos_vigencia c on b.id_cnddto_vgncia = c.id_cnddto_vgncia;

