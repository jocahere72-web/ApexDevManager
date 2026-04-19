
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_NTFCCION_GUIA_LTE_DTLLE" ("ID_NTFCCION_GUIA", "ID_LTE_DTLLE", "ID_LTE", "ID_PRCSO_CRGA", "ID_PRCSO_INTRMDIA", "ID_ACTO", "NMRO_ACTO", "ID_ACTO_RSPNSBLE", "ID_NTFCCION_RSPNSBLE", "NMRO_GUIA", "NMBRE_EVDNCIA_CMPLTO", "CDGO_CSAL_ENTDAD", "DSCRPCION_CSAL_ENTDAD", "CDGO_CSAL", "DSCRPCION_CSAL", "INDCDOR_NTFCDO", "NMRO_IDNTFCCION", "NMBRE_NTFCCION", "FCHA_NTFCCION", "ORDEN_SRVCIO", "INDCDOR_PRCSDO") AS
  select  b.id_ntfccion_guia,
          b.id_lte_dtlle,
          a.id_lte,
          b.id_prcso_crga,
          b.id_prcso_intrmdia,
          a.id_acto,
		  g.nmro_acto,
          a.id_acto_rspnsble,
          a.id_ntfccion_rspnsble,
          b.nmro_guia,
          b.nmbre_evdncia_cmplto,
          b.cdgo_csal_entdad,
          e.dscrpcion dscrpcion_csal_entdad,
          e.cdgo_csal,
          f.dscrpcion dscrpcion_csal,
		  f.indcdor_ntfcdo,
          b.nmro_idntfccion,
          b.nmbre_ntfccion,
		  b.fcha_ntfccion,
          b.orden_srvcio,
          a.indcdor_prcsdo
  from nt_d_lote_detalle a
  inner join nt_g_notificacion_guia       b on a.id_lte_dtlle         = b.id_lte_dtlle
  inner join nt_g_lote                    c on a.id_lte               = c.id_lte
  inner join v_nt_d_ntfccion_mdio_entdd   d on c.id_entdad_clnte_mdio = d.id_entdad_clnte_mdio
  left 	join nt_d_causales_entidad        e on d.cdgo_entdad          = e.cdgo_entdad             and
                                               b.cdgo_csal_entdad     = e.cdgo_csal_entdad
  left 	join nt_d_causales                f on e.cdgo_csal            = f.cdgo_csal
  inner	join gn_g_actos					  g on a.id_acto			  = g.id_acto;

