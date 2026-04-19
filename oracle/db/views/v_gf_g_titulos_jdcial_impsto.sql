
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TITULOS_JDCIAL_IMPSTO" ("ID_TTLO_JDCIAL_IMPSTO", "ID_TTLO_JDCIAL", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "ID_SJTO_RSPNSBLE", "CDGO_IDNTFCCION_TPO", "IDNTFCCION_RSPNSBLE", "NMBRE_RZON_SCIAL_RSPNSBLE", "PRNCPAL_S_N", "DSCRPCION_PRNCPAL_S_N", "ID_INSTNCIA_FLJO") AS
  select a.id_ttlo_jdcial_impsto,
    a.id_ttlo_jdcial,
    a.id_impsto,
    b.nmbre_impsto,
    a.id_impsto_sbmpsto,
    b.nmbre_impsto_sbmpsto,
    c.id_sjto,
    a.id_sjto_impsto,
    c.idntfccion_sjto,
    c.idntfccion_sjto_frmtda,
    a.id_sjto_rspnsble,
    d.cdgo_idntfccion_tpo,
    d.idntfccion          idntfccion_rspnsble,
    upper(d.prmer_nmbre || ' ' || nvl2(d.sgndo_nmbre, d.sgndo_nmbre || ' ' ,'') || d.prmer_aplldo || ' ' ||nvl2(d.sgndo_aplldo, d.sgndo_aplldo || ' ' ,'')) nmbre_rzon_scial_rspnsble,
    d.prncpal_s_n,
    decode (d.prncpal_s_n, 'S', 'Si','N', 'No') dscrpcion_prncpal_s_n,
        a.id_instncia_fljo
   from gf_g_titulos_jdcial_impsto    a
   join v_df_i_impuestos_subimpuesto  b on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto
   join v_si_i_sujetos_impuesto     c on a.id_sjto_impsto = c.id_sjto_impsto
   left join si_i_sujetos_responsable d on a.id_sjto_rspnsble = d.id_sjto_rspnsble;

