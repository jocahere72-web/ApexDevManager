
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PRCSOS_JRDCO_CRTRA_AGRPDO2" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_PRCSOS_JRDCO", "ID_PRCSO_JRDCO_LTE", "NMRO_PRCSO_JRDCO", "FCHA_PRCSO", "ID_PRCSOS_JRDCO_DCMNTO", "NMRO_MNDMNTO", "FCHA_MNDMNTO", "INDCDOR_NTFCCION", "FCHA_NTFCCION", "ID_SJTO_IMPSTO", "ID_SJTO", "ID_PRPTRIO", "PRNCPAL_S_N", "PRPTRIO", "IDNTFCCION_SJTO", "DSCRPCION_SJTO_ESTDO", "DRCCION_NTFCCION", "NMBRE_FNCNRIO", "CDGO_MVNT_FNCRO_ESTDO", "VGNCIAS", "VGNCIAS_SLDO_PRCSO", "VLOR_SLDO_CPTAL", "VLOR_INTRES", "VLOR_SLDO_TTAL", "VGNCIAS_EMBRGO", "NMRO_DTRMNCION", "FCHA_DTRMNCION") AS
  SELECT a.cdgo_clnte,
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
       -- Agregaciones
       LISTAGG(DISTINCT a.cdgo_mvnt_fncro_estdo, ', ') WITHIN GROUP(ORDER BY a.cdgo_mvnt_fncro_estdo) cdgo_mvnt_fncro_estdo,
       LISTAGG(DISTINCT a.vgncia, ', ') WITHIN GROUP(ORDER BY a.vgncia) vgncias,
       LISTAGG(DISTINCT CASE WHEN a.vlor_sldo_cptal > 0 THEN a.vgncia END, ', ') WITHIN GROUP(ORDER BY a.vgncia) vgncias_sldo_prcso,
       SUM(a.vlor_sldo_cptal) vlor_sldo_cptal,
       SUM(a.vlor_intres) vlor_intres,
       SUM(a.vlor_sldo_ttal) vlor_sldo_ttal,
       LISTAGG(DISTINCT CASE WHEN a.tne_embrgo = 'S' THEN a.vgncia END, ', ') WITHIN GROUP(ORDER BY a.vgncia) vgncias_embrgo,
       LISTAGG(DISTINCT a.nmro_dtrmncion, ', ') WITHIN GROUP(ORDER BY a.nmro_dtrmncion) nmro_dtrmncion,
       LISTAGG(DISTINCT a.fcha_dtrmncion, ', ') WITHIN GROUP(ORDER BY a.nmro_dtrmncion) fcha_dtrmncion
  FROM (
        -- Quitamos el DISTINCT y usamos GROUP BY para normalizar los datos de cartera/determinaciones
        SELECT d.cdgo_clnte,
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
               nvl(e.idntfccion, i.idntfccion_sjto) id_prptrio,
               nvl(p.nmbre_rzon_scial, e.prmer_nmbre) prptrio,
               nvl(e.prncpal_s_n, 'S') prncpal_s_n,
               c.nmbre_trcro nmbre_fncnrio,
               v.cdgo_mvnt_fncro_estdo,
               v.vgncia,
               v.vlor_sldo_cptal,
               v.vlor_intres,
               (v.vlor_sldo_cptal + v.vlor_intres) vlor_sldo_ttal,
               -- Subconsulta escalar (la mantenemos ya que para 1 registro es eficiente, pero la optimizamos)
               (SELECT MAX('S') FROM mc_g_embargos_cartera_detalle ec
                 WHERE ec.id_sjto_impsto = i.id_sjto_impsto AND ec.vgncia = v.vgncia AND ec.id_prdo = v.id_prdo) tne_embrgo,
               q.nmro_acto nmro_dtrmncion,
               to_char(q.fcha_dtrmncion, 'dd/mm/yyyy') fcha_dtrmncion
          FROM cb_g_procesos_juridico d
          JOIN cb_g_procesos_jrdco_dcmnto m ON m.id_prcsos_jrdco = d.id_prcsos_jrdco
          JOIN gn_d_actos_tipo r ON r.id_acto_tpo = m.id_acto_tpo AND r.cdgo_acto_tpo = 'MAP'
          JOIN cb_g_prcsos_jrdc_dcmnt_mvnt t ON t.id_prcsos_jrdco_dcmnto = m.id_prcsos_jrdco_dcmnto
          JOIN v_si_i_sujetos_impuesto i ON i.id_sjto_impsto = t.id_sjto_impsto
          JOIN v_gf_g_cartera_x_concepto v ON v.id_sjto_impsto = i.id_sjto_impsto
                                          AND v.vgncia = t.vgncia -- Corrección de índice
                                          AND v.id_prdo = t.id_prdo
                                          AND v.id_cncpto = t.id_cncpto
                                          AND v.cdgo_mvnt_fncro_estdo in ('CN', 'NO')
          JOIN v_sg_g_usuarios c ON c.id_fncnrio = d.id_fncnrio
          LEFT JOIN si_i_sujetos_responsable e ON e.id_sjto_impsto = t.id_sjto_impsto AND i.cdgo_sjto_tpo <> 'E'
          LEFT JOIN si_i_personas p ON p.id_sjto_impsto = t.id_sjto_impsto AND i.cdgo_sjto_tpo = 'E'
          LEFT JOIN (SELECT n.fcha_dtrmncion, o.nmro_acto, m.id_sjto_impsto, m.vgncia, m.id_prdo, m.id_cncpto
                       FROM gi_g_determinaciones n
                       JOIN gi_g_determinacion_detalle m ON m.id_dtrmncion = n.id_dtrmncion
                       JOIN gn_g_actos o ON o.id_acto = n.id_acto) q
            ON q.id_sjto_impsto = t.id_sjto_impsto AND q.vgncia = t.vgncia AND q.id_prdo = t.id_prdo AND q.id_cncpto = t.id_cncpto
          JOIN gn_g_actos b ON b.id_acto = m.id_acto
       ) a
 GROUP BY a.cdgo_clnte, a.id_impsto, a.id_impsto_sbmpsto, a.id_prcso_jrdco_lte, a.id_prcsos_jrdco, a.nmro_prcso_jrdco, a.fcha_prcso,
          a.id_prcsos_jrdco_dcmnto, a.nmro_mndmnto, a.fcha_mndmnto, a.indcdor_ntfccion, a.fcha_ntfccion, a.id_sjto_impsto, a.id_sjto,
          a.idntfccion_sjto, a.dscrpcion_sjto_estdo, a.drccion_ntfccion, a.id_prptrio, a.prptrio, a.prncpal_s_n, a.nmbre_fncnrio
;

