
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_PQ_G_SOLICITUDES_TRSLADO_TRAZA" ("ID_SLCTUD_TRZA", "ID_SLCTUD", "FCHA_MDFCCION", "IDNTFCCION_ANTROR", "IDNTFCCION_NVA", "ID_IMPSTO_ANTRIOR", "IMPSTO_ANTRIOR", "ID_IMPSTO_NVO", "IMPSTO_NVO", "ID_MTVO_ANTROR", "MTVO_ANTRIOR", "ID_MTVO_NVA", "MTVO_NVO", "EMAIL_ANTROR", "EMAIL_NVA", "DRCCION_NTFCCION_ANTROR", "DRCCION_NTFCCION_NVA", "OBSRVCION_TRSLDO", "ID_USRIO_TRSLDA", "USRIO_MDFCA", "ID_USRIO_FLJO_ANTRIOR", "USRIO_FLJO_ANTERIOR") AS
  select t.id_slctud_trza,
       t.id_slctud,
       t.fcha_trsldo             fcha_mdfccion,
       t.idntfccion_antror,
       t.idntfccion_nva,
       t.impsto_antror           id_impsto_antrior,
       c.nmbre_impsto            impsto_antrior,
       t.impsto_nva              id_impsto_nvo,
       d.nmbre_impsto            impsto_nvo,
       t.id_mtvo_antror,
       t.dscrpcion               mtvo_antrior,
       t.id_mtvo_nva,
       b.dscrpcion               mtvo_nvo,
       t.email_antror,
       t.email_nva,
       t.drccion_ntfccion_antror,
       t.drccion_ntfccion_nva,
       t.obsrvcion_trsldo,
       t.id_usrio_trslda,
       a.nmbre_trcro             usrio_mdfca,
       t.id_usrio_fljo_antrior,
       e.nmbre_trcro usrio_fljo_anterior
  from pq_g_solicitudes_trslado_traza t
  join v_sg_g_usuarios a
    on a.id_usrio = t.id_usrio_trslda
  left join pq_d_motivos b
    on b.id_mtvo = t.id_mtvo_nva
  left join df_c_impuestos c
    on c.id_impsto = t.impsto_antror
  left join df_c_impuestos d
    on d.id_impsto = t.impsto_nva
  left join v_sg_g_usuarios e
    on e.id_usrio = t.id_usrio_fljo_antrior
;

