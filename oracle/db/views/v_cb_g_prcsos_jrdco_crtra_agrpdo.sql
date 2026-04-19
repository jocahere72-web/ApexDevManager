
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PRCSOS_JRDCO_CRTRA_AGRPDO" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_PRCSOS_JRDCO", "ID_PRCSO_JRDCO_LTE", "NMRO_PRCSO_JRDCO", "FCHA_PRCSO", "ID_PRCSOS_JRDCO_DCMNTO", "NMRO_MNDMNTO", "FCHA_MNDMNTO", "INDCDOR_NTFCCION", "FCHA_NTFCCION", "ID_SJTO_IMPSTO", "ID_SJTO", "ID_PRPTRIO", "PRNCPAL_S_N", "PRPTRIO", "IDNTFCCION_SJTO", "DSCRPCION_SJTO_ESTDO", "DRCCION_NTFCCION", "NMBRE_FNCNRIO", "CDGO_MVNT_FNCRO_ESTDO", "VGNCIAS", "VGNCIAS_SLDO_PRCSO", "VLOR_SLDO_CPTAL", "VLOR_INTRES", "VLOR_SLDO_TTAL", "VGNCIAS_EMBRGO", "NMRO_DTRMNCION", "FCHA_DTRMNCION") AS
  select a.cdgo_clnte,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       a.id_prcsos_jrdco,
       a.id_prcso_jrdco_lte,
       a.nmro_prcso_jrdco,
       a.fcha_prcso,
       a.id_prcsos_jrdco_dcmnto,
       a.nmro_mndmnto,
       a.fcha_mndmnto,
       a.indcdor_ntfccion,
       a.fcha_ntfccion,
       a.id_sjto_impsto,
       a.id_sjto,
       a.id_prptrio,
       a.prncpal_s_n,
       a.prptrio,
       a.idntfccion_sjto,
       a.dscrpcion_sjto_estdo,
       a.drccion_ntfccion,
       a.nmbre_fncnrio,
       listagg(distinct a.cdgo_mvnt_fncro_estdo, ', ') within group(order by a.cdgo_mvnt_fncro_estdo) cdgo_mvnt_fncro_estdo,
       listagg(distinct a.vgncia, ', ') within group(order by a.vgncia) vgncias,
       listagg(distinct case
                 when a.vlor_sldo_cptal > 0 then
                  a.vgncia
               end,
               ', ') within group(order by a.vgncia) vgncias_sldo_prcso,
       sum(a.vlor_sldo_cptal) vlor_sldo_cptal,
       sum(a.vlor_intres) vlor_intres,
       sum(a.vlor_sldo_ttal) vlor_sldo_ttal,
       listagg(distinct case
                 when a.tne_embrgo = 'S' then
                  a.vgncia
               end,
               ', ') within group(order by a.vgncia) vgncias_embrgo,
       listagg(distinct a.nmro_dtrmncion, ', ') within group(order by a.nmro_dtrmncion) nmro_dtrmncion,
       listagg(distinct to_char(a.fcha_dtrmncion,'dd/mm/yyyy'), ', ') within group(order by a.nmro_dtrmncion) fcha_dtrmncion
  from (select distinct d.cdgo_clnte,
                        t.id_impsto,
                        t.id_impsto_sbmpsto,
                        d.id_prcso_jrdco_lte,
                        d.id_prcsos_jrdco,
                        d.nmro_prcso_jrdco,
                        d.fcha fcha_prcso,
                        m.id_prcsos_jrdco_dcmnto,
                        m.nmro_acto nmro_mndmnto,
                        m.fcha_acto fcha_mndmnto,
                        b.indcdor_ntfccion,
                        b.fcha_ntfccion,
                        i.id_sjto_impsto,
                        i.id_sjto,
                        i.idntfccion_sjto,
                        i.dscrpcion_sjto_estdo,
                        i.drccion_ntfccion,
                        nvl(e.idntfccion,i.idntfccion_sjto) id_prptrio,
                        nvl(p.nmbre_rzon_scial,e.prmer_nmbre) prptrio,
                        nvl(e.prncpal_s_n,'S') prncpal_s_n,
                        c.nmbre_trcro nmbre_fncnrio,
                        v.cdgo_mvnt_fncro_estdo,
                        v.vgncia,
                        v.vlor_sldo_cptal,
                        v.vlor_intres,
                        (v.vlor_sldo_cptal + v.vlor_intres) vlor_sldo_ttal,
                        (select max('S')
                           from mc_g_embargos_cartera_detalle ec
                          where ec.Id_Sjto_Impsto = i.id_sjto_impsto
                            and ec.vgncia = v.vgncia
                            and ec.id_prdo = v.id_prdo) tne_embrgo,
                        q.nmro_acto nmro_dtrmncion,
                        q.fcha_dtrmncion
          from cb_g_procesos_juridico d
          join cb_g_procesos_jrdco_dcmnto m
            on m.id_prcsos_jrdco = d.id_prcsos_jrdco
          join gn_d_actos_tipo r
            on r.id_acto_tpo = m.id_acto_tpo
           and r.cdgo_acto_tpo = 'MAP'
          join cb_g_prcsos_jrdc_dcmnt_mvnt t
            on t.id_prcsos_jrdco_dcmnto = m.id_prcsos_jrdco_dcmnto
          join v_si_i_sujetos_impuesto i
            on i.cdgo_clnte = d.cdgo_clnte
           and i.id_impsto = t.id_impsto
              --and i.id_sjto_estdo = 1
           and i.id_sjto_impsto = t.id_sjto_impsto
          join v_gf_g_cartera_x_concepto v
            on v.cdgo_clnte = d.cdgo_clnte
           and v.id_impsto = t.id_impsto
           and v.id_impsto_sbmpsto = t.id_impsto_sbmpsto
           AND v.vgncia = t.vgncia
           and v.id_prdo = t.id_prdo
           and v.id_cncpto = t.id_cncpto
           and v.id_sjto_impsto = i.id_sjto_impsto
           and v.cdgo_mvnt_fncro_estdo in ('CN', 'NO')
          join v_sg_g_usuarios c
            on c.id_fncnrio = d.id_fncnrio
          left join si_i_sujetos_responsable e
            on e.id_sjto_impsto = t.Id_Sjto_Impsto
            and i.cdgo_sjto_tpo <> 'E'
          left join si_i_personas p
            on p.id_sjto_impsto = t.Id_Sjto_Impsto
            and i.cdgo_sjto_tpo = 'E'
          left join (select n.fcha_dtrmncion,
                           o.nmro_acto,
                           m.id_sjto_impsto,
                           m.vgncia,
                           m.id_prdo,
                           m.id_cncpto
                      from gi_g_determinaciones n
                      join gi_g_determinacion_detalle m
                        on m.id_dtrmncion = n.id_dtrmncion
                      join gn_g_actos o
                        on o.id_acto = n.id_acto) q
            on q.id_sjto_impsto = e.id_sjto_impsto
           and q.vgncia = t.vgncia
           and q.id_prdo = t.id_prdo
           and q.id_cncpto = t.id_cncpto
          join gn_g_actos b
            on b.id_acto = m.id_acto) a
 group by a.cdgo_clnte,
          a.id_impsto,
          a.id_impsto_sbmpsto,
          a.id_prcso_jrdco_lte,
          a.id_prcsos_jrdco,
          a.nmro_prcso_jrdco,
          a.fcha_prcso,
          a.id_prcsos_jrdco_dcmnto,
          a.nmro_mndmnto,
          a.fcha_mndmnto,
          a.indcdor_ntfccion,
          a.fcha_ntfccion,
          a.id_sjto_impsto,
          a.id_sjto,
          a.idntfccion_sjto,
          a.dscrpcion_sjto_estdo,
          a.drccion_ntfccion,
          a.id_prptrio,
          a.prptrio,
          a.prncpal_s_n,
          a.nmbre_fncnrio
;

