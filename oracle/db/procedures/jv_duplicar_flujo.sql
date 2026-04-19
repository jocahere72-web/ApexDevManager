
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JV_DUPLICAR_FLUJO" (v_cdgo_fljo_o  IN VARCHAR2,
                                              v_cdgo_fljo_d  IN VARCHAR2,
                                              v_nmbre_fljo_o IN VARCHAR2) AS
  v_cdgo_clnte           NUMBER := 23001;
  v_cdgo_clnte_dst       NUMBER := 23001;
  v_obj_fljo             JSON_ARRAY_T := JSON_ARRAY_T('[]');
  v_obj_trea             JSON_ARRAY_T := JSON_ARRAY_T('[]');
  v_obj_trns             JSON_ARRAY_T := JSON_ARRAY_T('[]');
  v_obj_evnt             JSON_ARRAY_T := JSON_ARRAY_T('[]');
  v_obj_evnt_mnj         JSON_ARRAY_T := JSON_ARRAY_T('[]');
  v_json_fljo            CLOB;
  v_json_trea            CLOB;
  v_json_trns            CLOB;
  v_json_evnt            CLOB;
  v_json_evnt_mnj        CLOB;
  v_id_fljo              NUMBER;
  v_id_fljo_trea         NUMBER;
  v_id_fljo_trnscion     NUMBER;
  v_id_fljo_evnto_mnjdor NUMBER;
BEGIN
  -- MIGRAMOS LOS FLUJOS DE TRABAJO
  FOR c_flujos IN (SELECT a.*
                     FROM wf_d_flujos a
                     LEFT JOIN wf_d_flujos b
                       ON b.cdgo_fljo = a.cdgo_fljo
                    WHERE a.cdgo_clnte = v_cdgo_clnte
                      AND a.cdgo_fljo = v_cdgo_fljo_o) LOOP
    INSERT INTO wf_d_flujos
      (cdgo_clnte,
       cdgo_fljo,
       dscrpcion_fljo,
       undad_drcion,
       drcion,
       undad_drcion_optma,
       drcion_optma,
       actvo,
       id_fljo_trea_incial,
       id_prcso,
       indcdor_incia_usrio_fnal)
    VALUES
      (v_cdgo_clnte_dst,
       v_cdgo_fljo_d,
       v_nmbre_fljo_o,
       c_flujos.undad_drcion,
       c_flujos.drcion,
       c_flujos.undad_drcion_optma,
       c_flujos.drcion_optma,
       c_flujos.actvo,
       c_flujos.id_fljo_trea_incial,
       c_flujos.id_prcso,
       c_flujos.indcdor_incia_usrio_fnal)
    RETURNING id_fljo INTO v_id_fljo;

    v_obj_fljo.append(JSON_OBJECT_T(JSON_OBJECT(KEY 'id_fljo_o' VALUE
                                                c_flujos.id_fljo,
                                                KEY 'id_fljo_d' VALUE
                                                v_id_fljo)));

    -- MIGRAMOS LAS TAREAS DEL FLUJO
    FOR c_fljos_trea IN (SELECT *
                           FROM wf_d_flujos_tarea
                          WHERE id_fljo = c_flujos.id_fljo) LOOP
      INSERT INTO wf_d_flujos_tarea
        (id_fljo,
         id_trea,
         undad_drcion,
         drcion,
         undad_drcion_optma,
         drcion_optma,
         tpo_dia,
         indcdor_incio,
         actvo,
         indcdor_procsar_estdo,
         indcdor_trnscion_atmtca,
         indcdor_vldar_tdos_fljos)
      VALUES
        (v_id_fljo,
         c_fljos_trea.id_trea,
         c_fljos_trea.undad_drcion,
         c_fljos_trea.drcion,
         c_fljos_trea.undad_drcion_optma,
         c_fljos_trea.drcion_optma,
         c_fljos_trea.tpo_dia,
         c_fljos_trea.indcdor_incio,
         c_fljos_trea.actvo,
         c_fljos_trea.indcdor_procsar_estdo,
         c_fljos_trea.indcdor_trnscion_atmtca,
         c_fljos_trea.indcdor_vldar_tdos_fljos)
      RETURNING id_fljo_trea INTO v_id_fljo_trea;

      v_obj_trea.append(JSON_OBJECT_T(JSON_OBJECT(KEY 'id_fljo_trea_o'
                                                  VALUE
                                                  c_fljos_trea.id_fljo_trea,
                                                  KEY 'id_fljo_trea_d'
                                                  VALUE v_id_fljo_trea)));

      -- MIGRAMOS LOS ESTADOS DE UNA TAREA DEL FLUJO
      INSERT INTO wf_d_flujos_tarea_estado
        SELECT (SELECT NVL(MAX(id_fljo_trea_estdo), 0)
                  FROM wf_d_flujos_tarea_estado) + ROWNUM AS id_fljo_trea_estdo,
               v_id_fljo_trea AS id_fljo_trea,
               dscrpcion,
               orden,
               actvo,
               dscrpcion_vsble
          FROM wf_d_flujos_tarea_estado
         WHERE id_fljo_trea = c_fljos_trea.id_fljo_trea;
    END LOOP;

    -- MIGRAMOS LOS EVENTOS DE UN FLUJO
    FOR c_flujo_evn IN (SELECT (SELECT NVL(MAX(id_fljo_evnto), 0)
                                  FROM wf_d_flujos_evento) + ROWNUM AS id,
                               id_fljo_evnto,
                               id_fljo,
                               id_evnto,
                               actvo
                          FROM wf_d_flujos_evento a
                         WHERE a.id_fljo = c_flujos.id_fljo) LOOP
      INSERT INTO wf_d_flujos_evento
        (id_fljo_evnto, id_fljo, id_evnto, actvo)
      VALUES
        (c_flujo_evn.id,
         v_id_fljo,
         c_flujo_evn.id_evnto,
         c_flujo_evn.actvo);

      v_obj_evnt.append(JSON_OBJECT_T(JSON_OBJECT(KEY 'id_fljo_evnto_o'
                                                  VALUE
                                                  c_flujo_evn.id_fljo_evnto,
                                                  KEY 'id_fljo_evnto_d'
                                                  VALUE c_flujo_evn.id)));
    END LOOP;

    v_json_trea := v_obj_trea.to_clob();

    -- MIGRACIÓN DE TRANSICIONES
    FOR c_trn IN (SELECT id_fljo_trnscion,
                         v_id_fljo                      AS id_fljo,
                         b.id_fljo_trea_d               AS id_fljo_trea,
                         c.id_fljo_trea_d               AS id_fljo_trea_dstno,
                         a.orden,
                         a.nmbre_trnscion,
                         a.cdgo_mtdo_asgncion,
                         a.indcdor_aprbar_tdo_prtcpntes,
                         a.indcdor_actlzar
                    FROM wf_d_flujos_transicion a
                    JOIN JSON_TABLE(v_json_trea, '$[*]' COLUMNS(id_fljo_trea_o PATH '$.id_fljo_trea_o', id_fljo_trea_d PATH '$.id_fljo_trea_d')) b
                      ON b.id_fljo_trea_o = a.id_fljo_trea
                    JOIN JSON_TABLE(v_json_trea, '$[*]' COLUMNS(id_fljo_trea_o PATH '$.id_fljo_trea_o', id_fljo_trea_d PATH '$.id_fljo_trea_d')) c
                      ON c.id_fljo_trea_o = a.id_fljo_trea_dstno
                   WHERE a.id_fljo = c_flujos.id_fljo) LOOP
      INSERT INTO wf_d_flujos_transicion
        (id_fljo,
         id_fljo_trea,
         id_fljo_trea_dstno,
         orden,
         nmbre_trnscion,
         cdgo_mtdo_asgncion,
         indcdor_aprbar_tdo_prtcpntes,
         indcdor_actlzar)
      VALUES
        (c_trn.id_fljo,
         c_trn.id_fljo_trea,
         c_trn.id_fljo_trea_dstno,
         c_trn.orden,
         c_trn.nmbre_trnscion,
         c_trn.cdgo_mtdo_asgncion,
         c_trn.indcdor_aprbar_tdo_prtcpntes,
         c_trn.indcdor_actlzar)
      RETURNING id_fljo_trnscion INTO v_id_fljo_trnscion;

      v_obj_trns.append(JSON_OBJECT_T(JSON_OBJECT(KEY 'id_fljo_trnscion_o'
                                                  VALUE
                                                  c_trn.id_fljo_trnscion,
                                                  KEY 'id_fljo_trnscion_d'
                                                  VALUE v_id_fljo_trnscion)));

      -- INSERTAMOS LOS PARAMETROS DE LA TRANSICION
      INSERT INTO wf_d_flujos_trnscion_prmtro
        SELECT (SELECT NVL(MAX(id_fljo_trnscion_prmtro), 0)
                  FROM wf_d_flujos_trnscion_prmtro) + ROWNUM AS id_fljo_trnscion_prmtro,
               v_id_fljo_trnscion AS id_fljo_trnscion,
               prmtro_orgen,
               prmtro_dstno,
               actvo
          FROM wf_d_flujos_trnscion_prmtro a
         WHERE a.id_fljo_trnscion = c_trn.id_fljo_trnscion;

      -- INSERTAMOS LAS CONDICIONES DE LA TRANSICION
      INSERT INTO wf_d_flujos_trnscion_cndcion
        SELECT (SELECT NVL(MAX(id_fljo_trnscion_cndcion), 0)
                  FROM wf_d_flujos_trnscion_cndcion) + ROWNUM AS id_fljo_trnscion_cndcion,
               v_id_fljo_trnscion AS id_fljo_trnscion,
               tpo_cndcion,
               id_trea_atrbto,
               objto_cndcion,
               id_oprdor_tpo,
               vlor1,
               vlor2,
               cmprta_lgca,
               orden_agrpcion,
               mnsje
          FROM wf_d_flujos_trnscion_cndcion
         WHERE id_fljo_trnscion = c_trn.id_fljo_trnscion;
    END LOOP;
  END LOOP;

  v_json_fljo := v_obj_fljo.to_clob();
  v_json_trea := v_obj_trea.to_clob();
  v_json_trns := v_obj_trns.to_clob();
  v_json_evnt := v_obj_evnt.to_clob();

  -- MIGRACION DE MANEJADORES DE EVENTOS DE UN FLUJO
  FOR c_fljo_mnjdor IN (SELECT id_fljo_evnto_mnjdor,
                               d.id_fljo_d          AS id_fljo,
                               c.id_fljo_trea_d     AS id_fljo_trea,
                               id_fljo_evnto_d      AS id_fljo_evnto,
                               fncion
                          FROM wf_d_flujos_evento_manejdor a
                          JOIN JSON_TABLE(v_json_evnt, '$[*]' COLUMNS(id_fljo_evnto_o PATH '$.id_fljo_evnto_o', id_fljo_evnto_d PATH '$.id_fljo_evnto_d')) b
                            ON b.id_fljo_evnto_o = a.id_fljo_evnto
                          JOIN JSON_TABLE(v_json_trea, '$[*]' COLUMNS(id_fljo_trea_o PATH '$.id_fljo_trea_o', id_fljo_trea_d PATH '$.id_fljo_trea_d')) c
                            ON c.id_fljo_trea_o = a.id_fljo_trea
                          JOIN JSON_TABLE(v_json_fljo, '$[*]' COLUMNS(id_fljo_o PATH '$.id_fljo_o', id_fljo_d PATH '$.id_fljo_d')) d
                            ON d.id_fljo_o = a.id_fljo) LOOP
    INSERT INTO wf_d_flujos_evento_manejdor
      (id_fljo, id_fljo_trea, id_fljo_evnto, fncion)
    VALUES
      (c_fljo_mnjdor.id_fljo,
       c_fljo_mnjdor.id_fljo_trea,
       c_fljo_mnjdor.id_fljo_evnto,
       c_fljo_mnjdor.fncion)
    RETURNING id_fljo_evnto_mnjdor INTO v_id_fljo_evnto_mnjdor;

    v_obj_evnt_mnj.append(JSON_OBJECT_T(JSON_OBJECT(KEY
                                                    'id_fljo_evnto_mnjdor_o'
                                                    VALUE
                                                    c_fljo_mnjdor.id_fljo_evnto_mnjdor,
                                                    KEY
                                                    'id_fljo_evnto_mnjdor_d'
                                                    VALUE
                                                    v_id_fljo_evnto_mnjdor)));
  END LOOP;
END jv_duplicar_flujo;
/

