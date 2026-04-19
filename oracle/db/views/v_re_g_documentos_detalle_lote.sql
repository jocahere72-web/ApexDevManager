
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_DOCUMENTOS_DETALLE_LOTE" ("ID_DCMNTO", "NMRO_DCMNTO", "ID_DCMNTO_LTE", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "BSE_GRVBLE", "TXTO_TRFA", "FCHA_VNCMNTO", "VLOR_CPTAL", "VLOR_INTRES", "ID_DSCNTO_RGLA_CPTAL", "VLOR_DSCNTO_CPTAL", "VLOR_DSCNTO_INTRES", "VLOR_DSCNTO", "ID_DSCNTO_RGLA_INTRES", "VLOR_TTAL") AS
  select x.id_dcmnto,
       x.nmro_dcmnto,
       x.id_dcmnto_lte,
       x.id_sjto_impsto,
       x.idntfccion_sjto,
       x.idntfccion_sjto_frmtda,
       x.bse_grvble,
       x.trfa txto_trfa,
       x.fcha_vncmnto,
       x.vlor_cptal,
       x.vlor_intres,
       x.id_dscnto_rgla_cptal,
       x.vlor_dscnto_cptal,
       x.vlor_dscnto_intres,
       (x.vlor_dscnto_cptal + x.vlor_dscnto_intres) as vlor_dscnto,
       x.id_dscnto_rgla_intres,
       ((x.vlor_cptal - x.vlor_dscnto_cptal) +
       (x.vlor_intres - x.vlor_dscnto_intres)) as vlor_ttal
  from (select a.id_dcmnto,
               a.nmro_dcmnto,
               a.id_dcmnto_lte,
               a.id_sjto_impsto,
               a.idntfccion_sjto,
               a.idntfccion_sjto_frmtda,
               b.bse_grvble,
               b.trfa,
               a.fcha_vncmnto,
               nvl((select sum(vlor_dbe)
                     from genesys.v_re_g_documentos_detalle m
                    where m.id_dcmnto = a.id_dcmnto
                      and m.cdgo_cncpto_tpo = 'C'
                      and m.ctgria_cncpto_dscnto = 'C'),
                   0) as vlor_cptal,
               nvl((select sum(vlor_dbe)
                     from genesys.re_g_documentos_detalle m
                    where m.id_dcmnto = a.id_dcmnto
                      and m.cdgo_cncpto_tpo = 'I'
                      and m.cdgo_cncpto_tpo = 'I'),
                   0) as vlor_intres,
               0 as id_dscnto_rgla_cptal,
               nvl((select sum(vlor_hber)
                     from genesys.v_re_g_documentos_detalle m
                    where m.id_dcmnto = a.id_dcmnto
                      and m.cdgo_cncpto_tpo = 'D'
                      and m.ctgria_cncpto_dscnto = 'C'),
                   0) as vlor_dscnto_cptal,
               nvl((select sum(vlor_hber)
                     from genesys.v_re_g_documentos_detalle m
                    where m.id_dcmnto = a.id_dcmnto
                      and m.cdgo_cncpto_tpo = 'D'
                      and m.ctgria_cncpto_dscnto = 'I'),
                   0) as vlor_dscnto_intres,
               0 as id_dscnto_rgla_intres
          from genesys.v_re_g_documentos a
          join genesys.v_re_g_documentos_detalle b
            on a.id_dcmnto = b.id_dcmnto
         group by a.id_dcmnto,
                  a.nmro_dcmnto,
                  a.id_dcmnto_lte,
                  a.id_sjto_impsto,
                  a.idntfccion_sjto,
                  a.idntfccion_sjto_frmtda,
                  b.bse_grvble,
                  b.trfa,
                  a.fcha_vncmnto

        ) x
;

