
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_G_INSTANCIAS_FLUJO_GNRDO" ("ID_INSTNCIA_FLJO", "PRCSO", "CDGO_FLJO", "ID_FLJO", "DSCRPCION_FLJO", "ID_FLJO_TREA", "NMBRE_TREA", "ESTDO_INSTNCIA", "FCHA_FIN_PLNDA", "ID_INSTNCIA_FLJO_GNRDO", "PRCSO_GNRDO", "CDGO_FLJO_GNRDO", "ID_FLJO_GNRDO", "DSCRPCION_FLJO_GNRDO", "ESTDO_INSTNCIA_GNRDO", "FCHA_FIN_PLNDA_GNRDO", "INDCDOR_MNJDO", "DSCRPCION_INDCDOR_MNJDO") AS
  select b.id_instncia_fljo,
       b.prcso,
       b.cdgo_fljo,
       b.id_fljo,
       b.dscrpcion_fljo,
       t.id_fljo_trea,
       t.nmbre_trea,
       b.estdo_instncia,
       b.fcha_fin_plnda,
       c.id_instncia_fljo id_instncia_fljo_gnrdo,
       c.prcso prcso_gnrdo,
       c.cdgo_fljo cdgo_fljo_gnrdo,
       c.id_fljo id_fljo_gnrdo,
       c.dscrpcion_fljo dscrpcion_fljo_gnrdo,
       c.estdo_instncia estdo_instncia_gnrdo,
       b.fcha_fin_plnda fcha_fin_plnda_gnrdo,
       a.indcdor_mnjdo,
       decode(a.indcdor_mnjdo, 'S', 'Ejecutado', 'N', 'No Ejecutado', 'E' , 'Ejecutado con Errores' ) dscrpcion_indcdor_mnjdo
  from wf_g_instancias_flujo_gnrdo a
  join v_wf_g_instancias_flujo b
    on b.id_instncia_fljo = a.id_instncia_fljo
  join v_wf_d_flujos_tarea t
    on t.id_fljo_trea = a.id_fljo_trea
   and t.id_fljo   = b.id_fljo
  join v_wf_g_instancias_flujo c
    on c.id_instncia_fljo = a.id_instncia_fljo_gnrdo_hjo;

