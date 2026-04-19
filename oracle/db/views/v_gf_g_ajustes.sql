
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_AJUSTES" ("ID_AJSTE", "CDGO_CLNTE", "NMBRE_IMPSTO", "ID_IMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "NUMRO_AJSTE", "ID_SJTO", "IDNTFCCION_SJTO", "DRCCION", "CDGO_TPO_AJSTE", "CDGO_AJSTE_MTVO", "ORGEN", "DSCRPCION_ORGEN", "TPO_AJSTE", "VLOR", "FCHA", "FCHA_FRMTDA", "FCHA_APLCCION", "FCHA_APLCCION_FRMTDA", "ID_AJSTE_MTVO", "DSCRPCION_MOTIVO", "NMRO_SLCTUD", "CDGO_AJSTE_ESTDO", "DSCRPCION_ESTADO", "OBSRVCION", "OBSRVCION_NA_NAP", "FCHA_DCMNTO_SPRTE", "FCHA_FRMTDA_DCMNTO_SPRTE", "TPO_DCMNTO_SPRTE", "NMBRE_TRCRO", "ID_USRIO", "ID_INSTNCIA_FLJO", "ID_FLJO_TREA", "ID_INSTNCIA_FLJO_PDRE", "INDCDOR_INTRFAZ", "VLOR_INTRES") AS
  select  a.id_ajste,
       a.cdgo_clnte,
       e.nmbre_impsto,
       a.id_impsto,
       f.nmbre_impsto_sbmpsto,
       a.id_impsto_sbmpsto,
       a.id_sjto_impsto,
       a.numro_ajste,
       b.id_sjto,
       b.idntfccion_sjto,
       b.drccion,
       a.tpo_ajste cdgo_tpo_ajste,
       c.cdgo_ajste_mtvo,
       a.orgen,
       case when a.orgen = 'A' then 'Masivo'
            else 'Manual'
       end dscrpcion_orgen,
        case when a.tpo_ajste = 'DB' then 'Débito'
             else 'Crédito'
       end tpo_ajste,
       a.vlor,
       a.fcha,
       trunc(a.fcha) fcha_frmtda,
       a.fcha_aplccion,
       trunc(a.fcha_aplccion) fcha_aplccion_frmtda,
       a.id_ajste_mtvo,
       c.dscrpcion dscrpcion_motivo,
       a.nmro_slctud,
       a.cdgo_ajste_estdo,
       d.dscrpcion dscrpcion_estado,
       a.obsrvcion,
       a.obsrvcion_na_nap,
       a.fcha_dcmnto_sprte,
       trunc(a.fcha_dcmnto_sprte) fcha_frmtda_dcmnto_sprte,
       a.tpo_dcmnto_sprte,
 --      h.dscrpcion dscrpcion_dcmnto_sprte,
 --     i.id_acto,
 --      i.nmro_acto_dsplay nmro_dcmto_sprte,
 --     i.nmro_acto,
      -- a.nmro_dcmto_sprte,
       j.nmbre_trcro,
      a.id_usrio,
       a.id_instncia_fljo,
      a.id_fljo_trea,
    a.id_instncia_fljo_pdre,
    a.indcdor_intrfaz,
    a.vlor_intres

    from gf_g_ajustes a
    join v_si_i_sujetos_impuesto b on a.id_sjto_impsto = b.id_sjto_impsto
   join gf_d_ajuste_motivo c on a.id_ajste_mtvo = c.id_ajste_mtvo
    join gf_d_ajuste_estado d on a.cdgo_ajste_estdo = d.cdgo_ajste_estdo
    join df_c_impuestos e on a.id_impsto = e.id_impsto
    join df_i_impuestos_subimpuesto f on a.id_impsto_sbmpsto = f.id_impsto_sbmpsto
/*inner join v_gn_d_actos_tipo h on a.tpo_dcmnto_sprte     = h.id_acto_tpo
inner join v_gn_g_actos i on a.nmro_dcmto_sprte     = i.id_acto  */
inner     join v_sg_g_usuarios  j on a.id_usrio             = j.id_usrio
;

