
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_NOTIFICACIONES_DETALLE" ("CDGO_CLNTE", "ID_ACTO", "NMRO_ACTO", "ID_NTFCCION", "INDCDOR_NTFCDO", "CDGO_ESTDO", "CDGO_ESTDO_DSCRPCION", "ID_NTFCCION_DTLLE", "ID_MDIO", "ID_ENTDAD_CLNTE_MDIO", "CDGO_ENTDAD", "DSCRPCION_ENTDAD", "CDGO_MDIO", "DSCRPCION_MDIO", "INDCDOR_MSVO", "ID_ACTO_TPO", "DSCRPCION_ACTO_TPO", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "ID_FNCNRIO_GNRCION", "FCHA_GNRCION", "ID_FNCNRIO_PRCSMNTO", "FCHA_PRCSMNTO", "FCHA_FIN_TRMNO", "FCHA_ACTO", "NMBRE_TRCRO", "CANTDAD_RESPNSBLES", "CANTDAD_RESPNSBLES_NOTFCDOS") AS
  select c.cdgo_clnte,
         b.id_acto,
         c.nmro_acto,
         a.id_ntfccion,
         b.indcdor_ntfcdo,
         b.cdgo_estdo,
         f.dscrpcion cdgo_estdo_dscrpcion,
         a.id_ntfccion_dtlle,
         a.id_mdio,
         a.id_entdad_clnte_mdio,
         d.cdgo_entdad,
         d.dscrpcion_entdad,
         g.cdgo_mdio,
         g.dscrpcion dscrpcion_mdio,
		 g.indcdor_msvo,
         c.id_acto_tpo,
         c.dscrpcion_acto_tpo,
         c.cdgo_acto_orgen,
         c.dscrpcion_acto_orgen,
         a.id_fncnrio_gnrcion,
         a.fcha_gnrcion,
         a.id_fncnrio_prcsmnto,
         a.fcha_prcsmnto,
         a.fcha_fin_trmno,
		 c.fcha fcha_acto,
		 c.nmbre_trcro,
         nvl(e.cantdad_respnsbles,0) cantdad_respnsbles,
         nvl(e.cantdad_respnsbles_notfcdos,0) cantdad_respnsbles_notfcdos
  from nt_g_notificaciones_detalle        a
  inner join nt_g_notificaciones          b on    a.id_ntfccion          = b.id_ntfccion
  inner join v_gn_g_actos                 c on    b.id_acto              = c.id_acto
  left 	join v_nt_d_ntfccion_mdio_entdd   d on    a.id_entdad_clnte_mdio = d.id_entdad_clnte_mdio
  left  join (select id_ntfccion_dtlle, sum(case when indcdor_ntfcdo = 'S' then 1 else 0 end) cantdad_respnsbles_notfcdos,
              count(*) as cantdad_respnsbles
              from nt_g_ntfccnes_rspnsble
              group by id_ntfccion_dtlle) e on a.id_ntfccion_dtlle = e.id_ntfccion_dtlle
  inner join nt_d_estado f on b.cdgo_estdo = f.cdgo_estdo
  inner join nt_d_medio  g on a.id_mdio    = g.id_mdio
  order by 2;

