
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_G_INSTANCIA_TRANSICION" ("ID_INSTNCIA_FLJO", "ID_FLJO", "CDGO_FLJO", "DSCRPCION_FLJO", "CDGO_CLNTE", "ID_PRCSO", "PRCSO", "ID_INSTNCIA_TRNSCION", "ID_FLJO_TREA_ORGEN", "FCHA_INCIO", "ID_ESTDO_TRNSCION", "ESTDO_TRNSCION") AS
  select b.id_instncia_fljo
     , b.id_fljo
     , b.cdgo_fljo
     , b.dscrpcion_fljo
     , b.cdgo_clnte
     , b.id_prcso
     , b.prcso
     , a.id_instncia_trnscion
     , a.id_fljo_trea_orgen
     , a.fcha_incio
     , a.id_estdo_trnscion
     , d.estdo_trnscion
  from wf_g_instancias_transicion a
  join v_wf_g_instancias_flujo b
    on b.id_instncia_fljo = a.id_instncia_fljo
  join v_sg_g_usuarios c
    on c.id_usrio = b.id_usrio
  join wf_d_estado_transicion d
    on d.id_estdo_trnscion = a.id_estdo_trnscion;

