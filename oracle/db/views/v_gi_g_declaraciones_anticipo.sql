
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DECLARACIONES_ANTICIPO" ("ID_DCLRCION", "ID_DCLRCION_VGNCIA_FRMLRIO", "CDGO_CLNTE", "ID_SJTO_IMPSTO", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "VGNCIA", "ID_PRDO", "NMRO_CNSCTVO", "CDGO_DCLRCION_ESTDO", "VLOR_PAGO", "ID_DCLRCION_TPO_VGNCIA", "DSCRPCION", "INDCDOR_DCLRCION_FNAL", "CDGO_DCLRCN_TPO", "ID_DCLRCION_CRRCCION") AS
  select   a.id_dclrcion,
           a.id_dclrcion_vgncia_frmlrio,
           a.cdgo_clnte,
           a.id_sjto_impsto,
           a.id_impsto,
           a.id_impsto_sbmpsto,
           a.vgncia,
           a.id_prdo,
           a.nmro_cnsctvo,
           a.cdgo_dclrcion_estdo,
           a.vlor_pago,
           b.id_dclrcion_tpo_vgncia,
           d.dscrpcion,
           d.indcdor_dclrcion_fnal,
           d.cdgo_dclrcn_tpo,
           a.id_dclrcion_crrccion
    from gi_g_declaraciones a
    inner join gi_d_dclrcnes_vgncias_frmlr b on   b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio
    inner join gi_d_dclrcnes_tpos_vgncias  c on   c.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia
    inner join gi_d_declaraciones_tipo     d on   c.id_dclrcn_tpo = d.id_dclrcn_tpo
    where -- a.id_sjto_impsto = 4291075 and
    a.cdgo_dclrcion_estdo = 'APL'
    and d.cdgo_dclrcn_tpo = 'ANT'
    and not exists (select e.id_dclrcion_rgstrda
                    from gi_g_declaraciones_anticipo e
                    where e.id_dclrcion_rgstrda = a.id_dclrcion
                    and e.aplcdo = 'S'  )
;

