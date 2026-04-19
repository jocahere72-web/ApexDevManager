
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_REVOCATORIA" ("ID_CNVNIO", "ID_CNVNIO_RVCTRIA", "ID_ACTO_ANLCION", "FCHA_ANLCION", "ID_USRIO_ANLCION", "ID_ACTO", "FCHA_APLCCION", "ID_USRIO_APLCCION", "ID_USRIO", "FCHA_RGSTRO", "ID_RVCTRIA_MTDO", "NMRO_CNVNIO", "NMBRE_SLCTNTE", "DRCCION_NTFCCION", "IDNTFCCION_SJTO_FRMTDA", "IDNTFCCION_SJTO", "ID_SJTO", "NMBRE_IMPSTO_SBMPSTO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_CLNTE", "ID_SJTO_IMPSTO", "CDGO_CNVNIO_RVCTRIA_ESTDO", "DSCRPCION_CNVNIO_RVCTRIA_ESTDO", "NMBRE_TRCRO", "NMBRE_TRCRO_APLCCION", "NMBRE_TRCRO_ANLCION", "NMRO_IDNTFCCION_SLCTNTE", "ID_CNVNIO_TPO", "INDCDOR_VLDA_PGO_CTA", "CDGO_RVCTRIA_TPO", "INDCDOR_APLCA_RVCTRIA_INMDTA", "CDGO_SJTO_TPO", "DSCRPCION_CNVNIO_TPO", "CDGO_CNVNIO_ESTDO", "ID_ACTO_TPO", "NMRO_ACTO_DSPLAY", "NMRO_ACTO_ANLCION", "DSCRPCION_MTDO_RVCTRIA", "ANLCION_ACTVA", "NMRO_CTAS", "NMRO_OFCIOS_EMTDO_RVOCAR", "TLFNO", "CLLAR", "EMAIL") AS
  select a.id_cnvnio,
       a.id_cnvnio_rvctria,
       a.id_acto_anlcion,
       a.fcha_anlcion,
       a.id_usrio_anlcion,
       a.id_acto,
       a.fcha_aplccion,
       a.id_usrio_aplccion,
       a.id_usrio,
       a.fcha_rgstro,
       a.id_rvctria_mtdo,
       b.nmro_cnvnio,
       upper(g.prmer_nmbre || ' ' ||
             nvl2(g.sgndo_nmbre, g.sgndo_nmbre || ' ', '') ||
             g.prmer_aplldo || ' ' ||
             nvl2(g.sgndo_aplldo, g.sgndo_aplldo || ' ', '')) nmbre_slctnte,
       g.drccion_ntfccion,
       case
         when length(f.idntfccion) = 15 then
          pkg_gn_generalidades.fnc_cl_formato_texto(p_txto           => f.idntfccion,
                                                    p_frmto          => 'xx-xx-xxxx-xxxx-xxx',
                                                    p_crcter_dlmtdor => '-')
         when length(f.idntfccion) = 25 then
          pkg_gn_generalidades.fnc_cl_formato_texto(p_txto           => f.idntfccion,
                                                    p_frmto          => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx',
                                                    p_crcter_dlmtdor => '-')
         else
          f.idntfccion
       end as idntfccion_sjto_frmtda,
       f.idntfccion idntfccion_sjto,
       c.id_sjto,
       e.nmbre_impsto_sbmpsto,
       c.id_impsto,
       d.nmbre_impsto,
       e.id_impsto_sbmpsto,
       b.cdgo_clnte,
       b.id_sjto_impsto,
       j.cdgo_cnvnio_rvctria_estdo,
       j.dscrpcion dscrpcion_cnvnio_rvctria_estdo,
       k.nmbre_trcro,
       l.nmbre_trcro nmbre_trcro_aplccion,
       m.nmbre_trcro nmbre_trcro_anlcion,
       g.idntfccion nmro_idntfccion_slctnte,
       h.id_cnvnio_tpo,
       n.indcdor_vlda_pgo_cta,
       n.cdgo_rvctria_tpo,
       n.indcdor_aplca_rvctria_inmdta,
       o.cdgo_sjto_tpo,
       o.dscrpcion dscrpcion_cnvnio_tpo,
       p.cdgo_cnvnio_estdo,
       i.id_acto_tpo,
       i.nmro_acto nmro_acto_dsplay,
       q.nmro_acto_dsplay nmro_acto_anlcion,
       n.dscrpcion dscrpcion_mtdo_rvctria,
       a.anlcion_actva,
       n.nmro_ctas,
       n.nmro_ofcios_emtdo_rvocar,
       g.tlfno,
       g.cllar,
       g.email
  from gf_g_convenios_revocatoria a
  join v_gf_g_convenios b
    on a.id_cnvnio = b.id_cnvnio
  join si_i_sujetos_impuesto c
    on b.id_sjto_impsto = c.id_sjto_impsto
  join df_c_impuestos d
    on c.id_impsto = d.id_impsto
  join df_i_impuestos_subimpuesto e
    on b.id_impsto_sbmpsto = e.id_impsto_sbmpsto
  join si_c_sujetos f
    on c.id_sjto = f.id_sjto
  join pq_g_solicitantes g
    on b.id_slctud = g.id_slctud
  join gf_d_convenios_tipo h
    on h.id_cnvnio_tpo = b.id_cnvnio_tpo
  left join gn_g_actos i
    on a.id_acto = i.id_acto
  join gf_d_cnvnios_rvctria_estdo j
    on a.cdgo_cnvnio_rvctria_estdo = j.cdgo_cnvnio_rvctria_estdo
  join v_sg_g_usuarios k
    on a.id_usrio = k.id_usrio
  left join v_sg_g_usuarios l
    on a.id_usrio_aplccion = l.id_usrio
  left join v_sg_g_usuarios m
    on a.id_usrio_anlcion = m.id_usrio
  join gf_d_revocatoria_metodo n
    on a.id_rvctria_mtdo = n.id_rvctria_mtdo
  join gf_d_convenios_tipo o
    on h.id_cnvnio_tpo = o.id_cnvnio_tpo
  join gf_d_convenios_estado p
    on b.cdgo_cnvnio_estdo = p.cdgo_cnvnio_estdo
  left join gn_g_actos q
    on a.id_acto_anlcion = q.id_acto
;

