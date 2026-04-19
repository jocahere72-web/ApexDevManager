
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PROCESOS_JRDCO_ACMLDO" ("ID_PRCSO_JRDCO_ACMLDO", "ID_PRCSO_JRDCO_PDRE", "ID_USRIO", "ID_ACTO", "FCHA_ACTO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "FCHA_NTFCCION", "CDGO_CLNTE", "ID_FLJO_GRPO", "DSCRPCION_GRPO", "CDGO_GRPO", "ID_RGLA_NGCIO_CLNTE", "DSCRPCION", "FCHA", "NMRO_PRCSO_JRDCO_ACMLDO", "ID_ACTO_TPO", "CDGO_ACTO_TPO") AS
  select id_prcso_jrdco_acmldo
     , id_prcso_jrdco_pdre
     , a.id_usrio
     , d.id_acto
     , d.fcha fcha_acto
     , d.nmro_acto
     , d.nmro_acto_dsplay
     , d.fcha_ntfccion
     , d.cdgo_clnte
     , b.id_fljo_grpo
     , b.dscrpcion_grpo
     , b.cdgo_grpo
     , c.id_rgla_ngcio_clnte
     , c.dscrpcion
     , a.fcha
     , nmro_prcso_jrdco_acmldo
     , e.id_acto_tpo
     , e.cdgo_acto_tpo
  from cb_g_procesos_jrdco_acmldo a
  join wf_d_flujos_grupo b
    on a.id_fljo_grpo = b.id_fljo_grpo
  join gn_d_reglas_negocio_cliente c
    on c.id_rgla_ngcio_clnte = a.id_rgla_ngcio_clnte
  join gn_g_actos d
    on d.id_acto = a.id_acto
left join v_gn_d_actos_tipo e
    on e.cdgo_acto_tpo = b.cdgo_grpo
   and e.cdgo_clnte = d.cdgo_clnte;

