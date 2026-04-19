
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_SALDOS_FAVOR_DOCUMENTOS" ("ID_SLDO_FVOR_SLCTUD", "ID_ACTO_TPO", "ID_FLJO_TREA", "ID_SLDO_FVOR_DCMNTO", "ID_ACTO", "ID_DCMNTO") AS
  select a.id_sldo_fvor_slctud,
       b.id_acto_tpo,
       b.id_fljo_trea,
       b.id_sldo_fvor_dcmnto,
       b.id_acto,
       e.id_dcmnto
  from gf_g_saldos_favor_solicitud a
 inner join gf_g_saldos_favor_documento b
    on a.id_sldo_fvor_slctud = b.id_sldo_fvor_slctud
  left join gf_g_sldos_fvor_slctud_dtll c
    on a.id_sldo_fvor_slctud = c.id_sldo_fvor_slctud
  left join gf_g_sldos_fvor_dcmnto_dtll d
    on b.id_sldo_fvor_dcmnto = d.id_sldo_fvor_dcmnto
  left join v_gn_g_actos e
    on b.id_acto = e.id_acto
 group by a.id_sldo_fvor_slctud,
          b.id_acto_tpo,
          b.id_fljo_trea,
          b.id_sldo_fvor_dcmnto,
          b.id_acto,
          e.id_dcmnto
;

