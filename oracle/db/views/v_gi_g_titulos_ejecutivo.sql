
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_TITULOS_EJECUTIVO" ("ID_TTLO_EJCTVO", "CDGO_CLNTE", "NMRO_TTLO_EJCTVO", "ID_AREA", "NMBRE_AREA", "ID_IMPSTO_ACTO", "NMBRE_IMPSTO_ACTO", "CDGO_TTLO_EJCTVO_ESTDO", "DSCRPCION", "FCHA_CNSTTCION", "FCHA_NTFCCION", "NMRO_NTFCCION", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO") AS
  select  a.id_ttlo_ejctvo,
        a.cdgo_clnte,
        a.nmro_ttlo_ejctvo,
        b.id_area,
        b.nmbre_area,
        c.id_impsto_acto,
        c.nmbre_impsto_acto,
        d.cdgo_ttlo_ejctvo_estdo,
        d.dscrpcion,
        a.fcha_cnsttcion,
        a.fcha_ntfccion,
        a.nmro_guia as nmro_ntfccion,
        e.id_impsto,
        e.nmbre_impsto,
        f.id_impsto_sbmpsto,
        f.nmbre_impsto_sbmpsto,
        a.id_sjto_impsto
from gi_g_titulos_ejecutivo         a
join df_c_areas                     b   on  a.id_area                   =   b.id_area
join df_i_impuestos_acto            c   on  a.id_impsto_acto            =   c.id_impsto_acto
join gi_d_titulos_ejecutivo_estdo   d   on  a.cdgo_ttlo_ejctvo_estdo    =   d.cdgo_ttlo_ejctvo_estdo
join df_c_impuestos                 e   on  a.id_impsto                 =   e.id_impsto
join df_i_impuestos_subimpuesto     f   on  a.id_impsto_sbmpsto         =   f.id_impsto_sbmpsto;

