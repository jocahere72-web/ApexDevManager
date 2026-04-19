
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_D_LOTE_DETALLE" ("ID_LTE_DTLLE", "ID_LTE", "ID_ACTO", "ID_ACTO_RSPNSBLE", "ID_NTFCCION_RSPNSBLE", "NMRO_GUIA", "CDGO_CSAL_ENTDAD", "FCHA_NTFCCION", "NMRO_IDNTFCCION", "NMBRE_NTFCCION", "ORDEN_SRVCIO", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO") AS
  select
    a.id_lte_dtlle
    , a.id_lte
    , a.id_acto
    , a.id_acto_rspnsble
    , a.id_ntfccion_rspnsble
    , a.nmro_guia
    , a.cdgo_csal_entdad
    , a.fcha_ntfccion
    , a.nmro_idntfccion
    , a.nmbre_ntfccion
    , a.orden_srvcio
    , b.id_acto_tpo
	,(select dscrpcion from gn_d_actos_tipo where id_acto_tpo = b.id_acto_tpo ) dscrpcion_acto_tpo
From nt_d_lote_detalle 	a
join nt_g_lote  		b on  b.id_lte = a.id_lte;

