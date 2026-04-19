
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_PRCSOS_JRDC_DCMNT_ESTD" ("ID_PRCSOS_JRDCO", "ID_INSTNCIA_FLJO", "NMRO_PRCSO_JRDCO", "VLOR_TTAL_DDA", "FCHA", "ID_PRCSOS_JRDCO_DCMNTO", "NOMBRE_ETPA", "ID_ETPA", "ID_FLJO_TREA_ESTDO", "ESTDO_ETPA", "ESTDO_ETPA_VSBLE", "OBSRVCION", "ACTVO", "PRCSO_ESTDO", "FCHA_RGSTRO", "ID_USRIO", "ID_FNCNRIO", "FUNCIONARIO") AS
  select a.id_prcsos_jrdco,
       a.id_instncia_fljo,
       a.nmro_prcso_jrdco,
       a.vlor_ttal_dda,
       a.fcha,
       b.id_prcsos_jrdco_dcmnto,
       d.nmbre_trea nombre_etpa,
       d.id_fljo_trea id_etpa,
       e.id_fljo_trea_estdo,
       e.dscrpcion estdo_etpa,
       e.dscrpcion_vsble estdo_etpa_vsble,
       c.obsrvcion,
       c.actvo,
       decode(c.actvo,null,'En Espera','S','Procesado - Activo','Procesado') prcso_estdo ,
       c.fcha_rgstro,
       f.id_usrio,
       f.id_fncnrio,
       f.nmbre_trcro funcionario
  from cb_g_procesos_juridico a
  join cb_g_procesos_jrdco_dcmnto b
    on a.id_prcsos_jrdco = b.id_prcsos_jrdco
 left join cb_g_prcsos_jrdc_dcmnt_estd c
    on c.id_prcsos_jrdco_dcmnto = b.id_prcsos_jrdco_dcmnto
  join v_wf_d_flujos_tarea d
    on b.id_fljo_trea = d.id_fljo_trea
  join wf_d_flujos_tarea_estado e
    on e.id_fljo_trea = d.id_fljo_trea
   and e.id_fljo_trea_estdo = nvl(c.id_fljo_trea_estdo, b.id_estdo_trea)
  left join v_sg_g_usuarios f
    on f.id_fncnrio = c.id_fncnrio
    order by c.id_prcsos_jrdco_dcmnto_estdo;

