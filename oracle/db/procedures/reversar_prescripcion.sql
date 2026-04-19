
  CREATE OR REPLACE EDITIONABLE PROCEDURE "REVERSAR_PRESCRIPCION" (v_message           OUT VARCHAR2,
                                                  v_nmro_rdcdo_dsplay IN VARCHAR2) IS

  --v_nmro_rdcdo_dsplay VARCHAR2(20) := '2022-10013337';

  v_id_instancia_fljo         NUMBER;
  v_id_instancia_trnscion     NUMBER;
  v_id_instncia_flj_trnscn    NUMBER;
  v_id_prscrpcion             NUMBER;
  v_id_prscrpcion_sjto_impsto NUMBER;
  v_id_acto                   NUMBER;

BEGIN
  SELECT a.id_instncia_fljo
    INTO v_id_instancia_fljo
    FROM pq_g_solicitudes a
   WHERE a.nmro_rdcdo_dsplay = v_nmro_rdcdo_dsplay;

  SELECT e.id_instncia_trnscion
    INTO v_id_instancia_trnscion
    FROM pq_g_solicitudes a
    LEFT JOIN wf_g_instancias_flujo_gnrdo b
      ON a.id_instncia_fljo = b.id_instncia_fljo
    JOIN wf_g_instancias_flujo c
      ON b.id_instncia_fljo_gnrdo_hjo = c.id_instncia_fljo
    JOIN wf_d_flujos d
      ON c.id_fljo = d.id_fljo
    JOIN wf_g_instancias_transicion e
      ON c.id_instncia_fljo = e.id_instncia_fljo
    JOIN wf_d_flujos_tarea f
      ON e.id_fljo_trea_orgen = f.id_fljo_trea
    JOIN wf_d_tareas g
      ON f.id_trea = g.id_trea
    JOIN sg_g_usuarios h
      ON e.id_usrio = h.id_usrio
    JOIN si_c_terceros i
      ON h.id_trcro = i.id_trcro
    JOIN wf_d_estado_transicion j
      ON e.id_estdo_trnscion = j.id_estdo_trnscion
   WHERE a.id_instncia_fljo = v_id_instancia_fljo
     AND ROWNUM = 1;

  SELECT t.id_instncia_fljo
    INTO v_id_instncia_flj_trnscn
    FROM wf_g_instancias_transicion t
   WHERE t.id_instncia_trnscion = v_id_instancia_trnscion
     AND ROWNUM = 1;

  SELECT t.id_prscrpcion
    INTO v_id_prscrpcion
    FROM gf_g_prescripciones t
   WHERE t.id_instncia_fljo_pdre = v_id_instancia_fljo;

  SELECT t.id_prscrpcion_sjto_impsto
    INTO v_id_prscrpcion_sjto_impsto
    FROM gf_g_prscrpcnes_sjto_impsto t
   WHERE t.id_prscrpcion = v_id_prscrpcion;

  SELECT t.id_acto
    INTO v_id_acto
    FROM gf_g_prscrpcns_dcmnto t
   WHERE t.id_prscrpcion = v_id_prscrpcion;

  BEGIN
    DELETE FROM gn_g_actos_responsable t WHERE t.id_acto = v_id_acto;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gn_g_actos_responsable].';
  END;

  BEGIN
    DELETE FROM gn_g_actos_sujeto_impuesto t WHERE t.id_acto = v_id_acto;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gn_g_actos_sujeto_impuesto].';
  END;

  BEGIN
    DELETE FROM gn_g_actos_vigencia t WHERE t.id_acto = v_id_acto;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gn_g_actos_vigencia].';
  END;

  BEGIN
    DELETE FROM gf_g_prscrpcns_dcmnto t
     WHERE t.id_prscrpcion = v_id_prscrpcion;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gf_g_prscrpcns_dcmnto].';
  END;

  BEGIN
    DELETE FROM gn_g_actos t WHERE t.id_acto = v_id_acto;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gn_g_actos].';
  END;

  BEGIN
    DELETE FROM gf_g_prscrpcnes_vgncs_vldcn t
     WHERE t.id_prscrpcion_vgncia IN
           (SELECT u.id_prscrpcion_vgncia
              FROM gf_g_prscrpcnes_vgncia u
             WHERE u.id_prscrpcion_sjto_impsto = v_id_prscrpcion_sjto_impsto);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gf_g_prscrpcnes_vgncs_vldcn].';
  END;

  BEGIN
    DELETE FROM gf_g_prscrpcnes_vgncia t
     WHERE t.id_prscrpcion_sjto_impsto = v_id_prscrpcion_sjto_impsto;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gf_g_prscrpcnes_vgncia].';
  END;

  BEGIN
    DELETE FROM gf_g_prscrpcnes_obsrvcion t
     WHERE t.id_prscrpcion = v_id_prscrpcion;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gf_g_prscrpcnes_obsrvcion].';
  END;

  BEGIN
    DELETE FROM gf_g_prscrpcnes_sjto_impsto t
     WHERE t.id_prscrpcion = v_id_prscrpcion;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gf_g_prscrpcnes_sjto_impsto].';
  END;

  BEGIN
    DELETE FROM gf_g_prescripciones t
     WHERE t.id_instncia_fljo_pdre = v_id_instancia_fljo;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [gf_g_prescripciones].';
  END;

  BEGIN
    DELETE FROM wf_g_instancias_transicion a
     WHERE id_instncia_fljo = v_id_instncia_flj_trnscn
       AND id_instncia_trnscion NOT IN
           (SELECT MIN(id_instncia_trnscion)
              FROM wf_g_instancias_transicion b
             WHERE id_instncia_fljo = a.id_instncia_fljo);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_message := 'No se encontraron datos en la tabla [wf_g_instancias_transicion].';
  END;

  UPDATE wf_g_instancias_transicion a
     SET a.id_estdo_trnscion = 1
   WHERE a.id_instncia_fljo = v_id_instncia_flj_trnscn;

  COMMIT;

  v_message := 'La reversion de la Prescripcion con radicado: ' ||
               v_nmro_rdcdo_dsplay || '. Se ha realizado exitosamente.';

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    v_message := 'No se encontraron datos.';
  WHEN OTHERS THEN
    v_message := 'Error: ' || SQLERRM;
    ROLLBACK;
END;
/

