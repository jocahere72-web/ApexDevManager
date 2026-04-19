
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PRESCRIPCIONES" ("ID_PRSCRPCION", "CDGO_CLNTE", "NMRO_PRSCRPCION", "ID_PRSCRPCION_TPO", "DSCRPCION_PRSCRPCION_TPO", "CDGO_RSPSTA", "DSCRPCION_RSPSTA", "ID_USRIO_RSPSTA", "FCHA_RSPSTA", "ID_USRIO_AUTRZA_RSPSTA", "FCHA_AUTRZA_RSPSTA", "CDGO_CSAL_ANLCION", "ID_INSTNCIA_FLJO", "FCHA_INCIO", "ID_INSTNCIA_FLJO_PDRE", "ID_SLCTUD", "NMRO_RDCDO", "FCHA_SLCTUD", "ID_ESTDO_SLCTUD") AS
  select a.id_prscrpcion,
       a.cdgo_clnte,
       a.nmro_prscrpcion,
       a.id_prscrpcion_tpo,
       i.dscrpcion              dscrpcion_prscrpcion_tpo,
       a.cdgo_rspsta,
       f.dscrpcion              dscrpcion_rspsta,
       a.id_usrio_rspsta,
       a.fcha_rspsta,
       a.id_usrio_autrza_rspsta,
       a.fcha_autrza_rspsta,
       a.cdgo_csal_anlcion,
       a.id_instncia_fljo,
       c.fcha_incio,
       a.id_instncia_fljo_pdre,
       a.id_slctud,
       e.nmro_rdcdo_dsplay      nmro_rdcdo,
       e.fcha_incio             fcha_slctud,
       e.id_estdo id_estdo_slctud
  from gf_g_prescripciones a
 inner join df_s_clientes b
    on b.cdgo_clnte = a.cdgo_clnte
 inner join wf_g_instancias_flujo c
    on c.id_instncia_fljo = a.id_instncia_fljo
  left join wf_g_instancias_flujo d
    on d.id_instncia_fljo = a.id_instncia_fljo_pdre
  left join pq_g_solicitudes e
    on e.id_slctud = a.id_slctud
  left join gf_d_prscrpcnes_rspsta f
    on f.cdgo_rspsta = a.cdgo_rspsta
  left join sg_g_usuarios g
    on g.id_usrio = a.id_usrio_rspsta
  left join sg_g_usuarios h
    on h.id_usrio = a.id_usrio_autrza_rspsta
  left join gf_d_prescripciones_tipo i
    on i.id_prscrpcion_tpo = a.id_prscrpcion_tpo
;

