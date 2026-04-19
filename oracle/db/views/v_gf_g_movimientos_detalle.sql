
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_MOVIMIENTOS_DETALLE" ("ID_MVMNTO_DTLLE", "ID_MVMNTO_FNCRO", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_FRMTDA", "IDNTFCCION_ANTRIOR", "IDNTFCCION_ANTRIOR_FRMTDA", "CDGO_MVMNTO_ORGN", "ID_ORGEN", "NMRO_MVMNTO_FNCRO", "FCHA_VNCMNTO", "FCHA_MVMNTO_ORGEN", "CDGO_MVNT_FNCRO_ESTDO", "DSCRPCION_MVNT_FNCRO_ESTDO", "CDGO_MVMNTO_ORGN_DTLLE", "DSCRPCION_MVMNTO_ORGN_DTLLE", "ID_ORGEN_DTLLE", "CDGO_MVMNTO_TPO", "DSCRPCION_MVMNTO_TPO", "VGNCIA", "ID_PRDO", "PRDO", "DSCRPCION_PRDO", "FCHA_VNCMNTO_PRDO", "CDGO_PRDCDAD", "DSCRPCION_PRDCDAD", "FCHA_MVMNTO", "FCHA_FRMTDA", "ID_IMPSTO_ACTO_CNCPTO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "GNRA_INTRES_MRA", "DSCRPCION_GNRA_INTRES_MRA", "CDGO_CNCPTO_TPO_CSDO", "ID_CNCPTO_RLCNAL", "ID_CNCPTO_CSDO", "CDGO_CNCPTO_CSDO", "DSCRPCION_CNCPTO_CSDO", "ID_CNCPTO_RLCNAL_CSDO", "VLOR_DBE", "VLOR_HBER", "ID_MVMNTO_DTLLE_BSE", "ACTVO", "DSCRPCION_ACTVO", "CDGO_IDNTFCCION_TPO", "IDNTFCCION") AS
  select a.id_mvmnto_dtlle,
         a.id_mvmnto_fncro,
         b.cdgo_clnte,
         b.id_impsto,
         (select l.nmbre_impsto  from v_df_i_impuestos_subimpuesto   l
          where b.id_impsto_sbmpsto = l.id_impsto_sbmpsto) nmbre_impsto ,
         b.id_impsto_sbmpsto,
         (select l.nmbre_impsto_sbmpsto from v_df_i_impuestos_subimpuesto   l
          where b.id_impsto_sbmpsto = l.id_impsto_sbmpsto) nmbre_impsto_sbmpsto,
         (select c.id_sjto from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto) id_sjto,
         b.id_sjto_impsto,
         (select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto)  idntfccion_sjto,
         case when length((select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto)) = 15 then
                pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => (select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto), p_frmto => 'xx-xx-xxxx-xxxx-xxx' , p_crcter_dlmtdor => '-' )
            when length( (select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto)) = 25 then
                pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => (select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto), p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx' , p_crcter_dlmtdor => '-' )
        end as idntfccion_frmtda,
         (select d.idntfccion_antrior from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto) idntfccion_antrior,
         case when length ((select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto)) = 15 then
                pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => (select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto), p_frmto => 'xx-xx-xxxx-xxxx-xxx' , p_crcter_dlmtdor => '-' )
          when length((select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
           where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto)) = 25 then
                pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => (select d.idntfccion from si_i_sujetos_impuesto c ,si_c_sujetos d
                where  b.id_sjto_impsto = c.id_sjto_impsto and c.id_sjto = d.id_sjto), p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx' , p_crcter_dlmtdor => '-' )
        end as idntfccion_antrior_frmtda,
         b.cdgo_mvmnto_orgn,
         b.id_orgen,
         b.nmro_mvmnto_fncro,
         trunc(a.fcha_vncmnto)        fcha_vncmnto,
         b.fcha_mvmnto                fcha_mvmnto_orgen ,
         b.cdgo_mvnt_fncro_estdo,
         (select j.dscrpcion from gf_d_mvmnto_fncro_estdo j where
         b.cdgo_mvnt_fncro_estdo = j.cdgo_mvnt_fncro_estdo) dscrpcion_mvnt_fncro_estdo,
         a.cdgo_mvmnto_orgn         cdgo_mvmnto_orgn_dtlle,
         (select k.dscrpcion from gf_d_movimiento_origen k
         where a.cdgo_mvmnto_orgn = k.cdgo_mvmnto_orgn) dscrpcion_mvmnto_orgn_dtlle,
         a.id_orgen             id_orgen_dtlle,
         a.cdgo_mvmnto_tpo,
         (select i.dscrpcion from gf_d_movimiento_tipo i
         where a.cdgo_mvmnto_tpo = i.cdgo_mvmnto_tpo)dscrpcion_mvmnto_tpo,
         a.vgncia,
         a.id_prdo,
         (select e.prdo  from df_i_periodos e
         where a.id_prdo= e.id_prdo) prdo ,
         (select e.dscrpcion from df_i_periodos e
         where a.id_prdo= e.id_prdo)  dscrpcion_prdo,
         (select trunc(e.fcha_vncmnto) from df_i_periodos e
         where a.id_prdo= e.id_prdo) fcha_vncmnto_prdo,
         a.cdgo_prdcdad,
         (select h.dscrpcion from df_s_periodicidad h
         where a.cdgo_prdcdad = h.cdgo_prdcdad) dscrpcion_prdcdad,
         a.fcha_mvmnto,
         trunc(a.fcha_mvmnto)       fcha_frmtda,
         a.id_impsto_acto_cncpto,
         a.id_cncpto,
         (select f.cdgo_cncpto from  df_i_conceptos  f
         where a.id_cncpto = f.id_cncpto) cdgo_cncpto,
         (select f.dscrpcion from  df_i_conceptos  f
         where a.id_cncpto = f.id_cncpto) dscrpcion_cncpto,
         a.gnra_intres_mra,
         decode (a.gnra_intres_mra, 'S','Si','N','No') dscrpcion_gnra_intres_mra,
         (select f.cdgo_cncpto_tpo from  df_i_conceptos  f
         where a.id_cncpto = f.id_cncpto) cdgo_cncpto_tpo_csdo,
         (select f.id_cncpto_rlcnal from  df_i_conceptos  f
         where a.id_cncpto = f.id_cncpto) id_cncpto_rlcnal ,
         a.id_cncpto_csdo,
         (select g.cdgo_cncpto from df_i_conceptos g
          where a.id_cncpto_csdo = g.id_cncpto ) cdgo_cncpto_csdo,
         (select g.dscrpcion from df_i_conceptos g
         where a.id_cncpto_csdo = g.id_cncpto)dscrpcion_cncpto_csdo,
         (select g.id_cncpto_rlcnal from df_i_conceptos g
         where a.id_cncpto_csdo = g.id_cncpto) id_cncpto_rlcnal_csdo,
         a.vlor_dbe,
         a.vlor_hber,
         a.id_mvmnto_dtlle_bse,
         a.actvo,
         decode (a.actvo, 'S','Si','N','No') dscrpcion_actvo,
         a.cdgo_idntfccion_tpo ,
         a.idntfccion
from    gf_g_movimientos_detalle       a
join    gf_g_movimientos_financiero    b on a.id_mvmnto_fncro  = b.id_mvmnto_fncro
;

