
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_EJECUTORIAS" (p_cdgo_clnte NUMBER) IS
  -- Tipos para el procesamiento en bloque (Bulk Processing)
  TYPE t_ejecutoria_c1 IS RECORD(
    id              LISTADO_EJECUTORIA.id%TYPE,
    idntfccion_sjto V_SI_I_SUJETOS_IMPUESTO.idntfccion_sjto%TYPE,
    id_sjto_impsto  V_SI_I_SUJETOS_IMPUESTO.id_sjto_impsto%TYPE,
    id_dtrmncion    GI_G_DETERMINACIONES.id_dtrmncion%TYPE,
    nmro_acto       GN_G_ACTOS.nmro_acto%TYPE,
    ttal_dtrmncion  NUMBER);
  TYPE tt_ejecutoria_c1 IS TABLE OF t_ejecutoria_c1 INDEX BY PLS_INTEGER;

  TYPE t_ejecutoria_c2 IS RECORD(
    id                 LISTADO_EJECUTORIA.id%TYPE,
    idntfccion_sjto    V_SI_I_SUJETOS_IMPUESTO.idntfccion_sjto%TYPE,
    id_sjto_impsto     V_SI_I_SUJETOS_IMPUESTO.id_sjto_impsto%TYPE,
    id_dtrmncion       GI_G_DETERMINACIONES.id_dtrmncion%TYPE,
    nmro_acto          GN_G_ACTOS.nmro_acto%TYPE,
    id_acto_ejecutoria LISTADO_EJECUTORIA.id_acto_ejecutoria%TYPE);
  TYPE tt_ejecutoria_c2 IS TABLE OF t_ejecutoria_c2 INDEX BY PLS_INTEGER;

  -- Colecciones para almacenar los datos en bloque
  l_ejecutorias_c1 tt_ejecutoria_c1;
  l_ejecutorias_c2 tt_ejecutoria_c2;

  -- Colecciones para almacenar los resultados para los updates en bloque
  TYPE tt_id_acto IS TABLE OF LISTADO_EJECUTORIA.id_acto_ejecutoria%TYPE INDEX BY PLS_INTEGER;
  TYPE tt_dcmnto IS TABLE OF LISTADO_EJECUTORIA.dcmnto%TYPE INDEX BY PLS_INTEGER;
  TYPE tt_id IS TABLE OF LISTADO_EJECUTORIA.id%TYPE INDEX BY PLS_INTEGER;

  l_ids_c1      tt_id;
  l_actos_c1    tt_id_acto;
  l_dcmntos_c1  tt_dcmnto;
  l_ids_c2_proc tt_id; -- IDs de registros procesados con éxito en C2

  CURSOR C1 IS
    SELECT a.id,
           b.idntfccion_sjto,
           b.id_sjto_impsto,
           c.id_dtrmncion,
           d.nmro_acto,
           (SELECT NVL(SUM(dd.vlor_cptal) + SUM(dd.vlor_intres), 0)
              FROM gi_g_determinacion_detalle dd
             WHERE dd.id_dtrmncion = c.id_dtrmncion) AS ttal_dtrmncion
      FROM LISTADO_EJECUTORIA A
      JOIN V_SI_I_SUJETOS_IMPUESTO B
        ON b.cdgo_clnte = p_cdgo_clnte
       AND B.id_impsto = p_cdgo_clnte || 1
       AND B.idntfccion_sjto = A.REFERENCIA
      JOIN GI_G_DETERMINACIONES C
        ON C.ID_SJTO_IMPSTO = B.id_sjto_impsto
      JOIN GN_G_ACTOS D
        ON D.ID_ACTO = C.ID_ACTO
       AND D.NMRO_ACTO = A.NUMERO_FACTURA
     WHERE A.PRCSDO = 'N'
       AND a.dcmnto IS NULL
     ORDER BY A.REFERENCIA;

  CURSOR C2 IS
    SELECT a.id,
           b.idntfccion_sjto,
           b.id_sjto_impsto,
           c.id_dtrmncion,
           d.nmro_acto,
           a.id_acto_ejecutoria
      FROM LISTADO_EJECUTORIA A
      JOIN V_SI_I_SUJETOS_IMPUESTO B
        ON b.cdgo_clnte = p_cdgo_clnte
       AND B.id_impsto = p_cdgo_clnte || 1
       AND B.idntfccion_sjto = A.REFERENCIA
      JOIN GI_G_DETERMINACIONES C
        ON C.ID_SJTO_IMPSTO = B.id_sjto_impsto
      JOIN GN_G_ACTOS D
        ON D.ID_ACTO = C.ID_ACTO
       AND D.NMRO_ACTO = A.NUMERO_FACTURA
     WHERE A.PRCSDO = 'N'
       AND a.dcmnto IS NOT NULL
       AND a.id_acto_ejecutoria IS NOT NULL
     ORDER BY A.REFERENCIA;

  -- Variables
  v_json_acto        CLOB;
  v_slct_sjto_impsto CLOB;
  v_slct_vgncias     CLOB;
  v_slct_rspnsble    CLOB;
  v_id_acto_tpo      gn_g_actos.id_acto_tpo%TYPE := 197;
  v_cdgo_acto_orgen  VARCHAR2(3) := 'DTM';
  v_id_usrio         NUMBER := 239298; -- Lupita Bello
  o_id_acto          NUMBER;
  v_id_plntlla       NUMBER := 313;

  v_cdgo_rspsta   NUMBER;
  o_mnsje_rspsta  VARCHAR2(1000);
  v_nmbre_drctrio VARCHAR2(200) := 'CONSTANCIA_DE_EJECUTORIA';
  v_nmbre_archvo  VARCHAR2(200);

  v_gn_d_reportes gn_d_reportes%ROWTYPE;
  v_json_plntlla  JSON_OBJECT_T;
  v_dcmnto        CLOB;
  v_blob          BLOB;

  -- Variables de control y monitoreo
  l_limit               PLS_INTEGER := 500; -- Tamaño del lote, puedes ajustarlo
  v_total_procesados_f1 PLS_INTEGER := 0;
  v_total_procesados_f2 PLS_INTEGER := 0;

BEGIN
  -- ===================================================================
  -- FASE 1: Procesamiento del Cursor C1 (Creación de Actos y Documentos)
  -- ===================================================================
  OPEN C1;
  LOOP
    FETCH C1 BULK COLLECT
      INTO l_ejecutorias_c1 LIMIT l_limit;
    EXIT WHEN l_ejecutorias_c1.COUNT = 0;

    l_ids_c1.DELETE;
    l_actos_c1.DELETE;
    l_dcmntos_c1.DELETE;

    FOR i IN 1 .. l_ejecutorias_c1.COUNT LOOP
      v_slct_sjto_impsto := ' select id_impsto_sbmpsto, id_sjto_impsto from gi_g_determinaciones where id_dtrmncion = ' || l_ejecutorias_c1(i).id_dtrmncion;
      v_slct_vgncias     := ' select distinct a.id_sjto_impsto, b.vgncia, b.id_prdo, b.vlor_cptal, b.vlor_intres from gi_g_determinaciones a join gi_g_determinacion_detalle b on a.id_dtrmncion = b.id_dtrmncion where a.id_dtrmncion = ' || l_ejecutorias_c1(i).id_dtrmncion;
      v_slct_rspnsble    := ' select a.cdgo_idntfccion_tpo, a.idntfccion, a.prmer_nmbre, a.sgndo_nmbre, a.prmer_aplldo, a.sgndo_aplldo, b.drccion_ntfccion, b.id_pais_ntfccion, b.id_dprtmnto_ntfccion, b.id_mncpio_ntfccion, b.email, b.tlfno from gi_g_dtrmncn_rspnsble a join si_i_sujetos_impuesto b on a.id_sjto_impsto = b.id_sjto_impsto where a.id_dtrmncion = ' || l_ejecutorias_c1(i).id_dtrmncion ||
                            ' group by a.cdgo_idntfccion_tpo, a.idntfccion, a.prmer_nmbre, a.sgndo_nmbre, a.prmer_aplldo, a.sgndo_aplldo, b.drccion_ntfccion, b.id_pais_ntfccion, b.id_dprtmnto_ntfccion, b.id_mncpio_ntfccion, b.email, b.tlfno';

      v_json_acto := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                           p_cdgo_acto_orgen     => v_cdgo_acto_orgen,
                                                           p_id_orgen            => l_ejecutorias_c1(i).id_dtrmncion,
                                                           p_id_undad_prdctra    => l_ejecutorias_c1(i).id_dtrmncion,
                                                           p_id_acto_tpo         => v_id_acto_tpo,
                                                           p_acto_vlor_ttal      => l_ejecutorias_c1(i).ttal_dtrmncion,
                                                           p_cdgo_cnsctvo        => 'CEJED',
                                                           p_id_acto_rqrdo_hjo   => NULL,
                                                           p_id_acto_rqrdo_pdre  => NULL,
                                                           p_fcha_incio_ntfccion => SYSDATE,
                                                           p_id_usrio            => v_id_usrio,
                                                           p_slct_sjto_impsto    => v_slct_sjto_impsto,
                                                           p_slct_vgncias        => v_slct_vgncias,
                                                           p_slct_rspnsble       => v_slct_rspnsble);

      pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => p_cdgo_clnte,
                                       p_json_acto    => v_json_acto,
                                       o_id_acto      => o_id_acto,
                                       o_cdgo_rspsta  => v_cdgo_rspsta,
                                       o_mnsje_rspsta => o_mnsje_rspsta);

      IF v_cdgo_rspsta <> 0 THEN
        dbms_output.put_line('ERROR en prc_rg_acto para nmro_acto ' || l_ejecutorias_c1(i).nmro_acto || ': ' ||
                             o_mnsje_rspsta);
        RAISE_APPLICATION_ERROR(-20001,
                                'Error en lote de la Fase 1, deteniendo el proceso. Mensaje: ' ||
                                o_mnsje_rspsta);
      ELSE
        v_json_plntlla := JSON_OBJECT_T();
        v_json_plntlla.put('id_dtrmncion',
                           l_ejecutorias_c1(i).id_dtrmncion);
        v_json_plntlla.put('id_sjto_impsto',
                           l_ejecutorias_c1(i).id_sjto_impsto);
        v_json_plntlla.put('id_acto', o_id_acto);

        v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(v_json_plntlla.to_clob,
                                                       v_id_plntlla);

        l_ids_c1(i) := l_ejecutorias_c1(i).id;
        l_actos_c1(i) := o_id_acto;
        l_dcmntos_c1(i) := v_dcmnto;
      END IF;
    END LOOP;

    FORALL i IN 1 .. l_ids_c1.COUNT
      UPDATE LISTADO_EJECUTORIA
         SET id_acto_ejecutoria = l_actos_c1(i), dcmnto = l_dcmntos_c1(i)
       WHERE id = l_ids_c1(i);

    -- MEJORA: Commit por lote para persistir el progreso y permitir monitoreo/reinicio.
    COMMIT;

    v_total_procesados_f1 := v_total_procesados_f1 + l_ejecutorias_c1.COUNT;
    dbms_output.put_line('Fase 1: Lote de ' || l_ejecutorias_c1.COUNT ||
                         ' registros completado. Total procesado en Fase 1: ' ||
                         v_total_procesados_f1);

  END LOOP;
  CLOSE C1;

  -- ===================================================================
  -- FASE 2: Procesamiento del Cursor C2 (Generación de BLOB y Archivo)
  -- ===================================================================
  SELECT b.*
    INTO v_gn_d_reportes
    FROM gn_d_plantillas a
    JOIN gn_d_reportes b
      ON a.id_rprte = b.id_rprte
   WHERE a.id_plntlla = v_id_plntlla;

  IF v('APP_SESSION') IS NULL THEN
    apex_session.create_session(p_app_id   => 66000,
                                p_page_id  => 37,
                                p_username => '1111111112');
  ELSE
    apex_session.attach(p_app_id     => 66000,
                        p_page_id    => 37,
                        p_session_id => v('APP_SESSION'));
  END IF;
  apex_util.set_session_state('P37_ID_RPRTE', v_gn_d_reportes.id_rprte);

  OPEN C2;
  LOOP
    FETCH C2 BULK COLLECT
      INTO l_ejecutorias_c2 LIMIT l_limit;
    EXIT WHEN l_ejecutorias_c2.COUNT = 0;

    l_ids_c2_proc.DELETE;

    FOR i IN 1 .. l_ejecutorias_c2.COUNT LOOP
      BEGIN
        -- Bloque anónimo para capturar errores por fila y continuar con el lote
        apex_util.set_session_state('P37_JSON',
                                    '{"nmbre_rprte":"' ||
                                    v_gn_d_reportes.nmbre_rprte ||
                                    '","id_ejctria":"' || l_ejecutorias_c2(i).id ||
                                    '","id_plntlla":"' || v_id_plntlla || '"}');

        v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                               p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,
                                               p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,
                                               p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,
                                               p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);

        IF dbms_lob.getlength(v_blob) > 5 THEN
          v_nmbre_archvo := l_ejecutorias_c2(i).id_acto_ejecutoria || ' - ' || l_ejecutorias_c2(i).nmro_acto ||
                             '.pdf';

          pkg_gd_utilidades.prc_rg_dcmnto_dsco(p_blob         => v_blob,
                                               p_directorio   => v_nmbre_drctrio,
                                               p_nmbre_archvo => v_nmbre_archvo,
                                               o_cdgo_rspsta  => v_cdgo_rspsta,
                                               o_mnsje_rspsta => o_mnsje_rspsta);

          IF (v_cdgo_rspsta = 0) THEN
            pkg_gn_generalidades.prc_ac_acto(p_directory       => v_nmbre_drctrio,
                                             p_file_name_dsco  => v_nmbre_archvo,
                                             p_id_acto         => l_ejecutorias_c2(i).id_acto_ejecutoria,
                                             p_ntfccion_atmtca => 'N');

            l_ids_c2_proc(l_ids_c2_proc.COUNT + 1) := l_ejecutorias_c2(i).id;
          ELSE
            dbms_output.put_line('Error registrando en el disco ' || l_ejecutorias_c2(i).nmro_acto || ': ' ||
                                 o_mnsje_rspsta);
          END IF;
        ELSE
          dbms_output.put_line('Error generando el blob para ' || l_ejecutorias_c2(i).nmro_acto);
        END IF;
      EXCEPTION
        WHEN OTHERS THEN
          dbms_output.put_line('ERROR no controlado procesando la fila ' || l_ejecutorias_c2(i).nmro_acto || ': ' ||
                               SQLERRM);
      END;
    END LOOP;

    IF l_ids_c2_proc.COUNT > 0 THEN
      FORALL i IN 1 .. l_ids_c2_proc.COUNT
        UPDATE LISTADO_EJECUTORIA a
           SET a.prcsdo = 'S'
         WHERE a.id = l_ids_c2_proc(i);
    END IF;

    -- MEJORA: Commit por lote para persistir el progreso y permitir monitoreo/reinicio.
    COMMIT;

    v_total_procesados_f2 := v_total_procesados_f2 + l_ejecutorias_c2.COUNT;
    dbms_output.put_line('Fase 2: Lote de ' || l_ejecutorias_c2.COUNT ||
                         ' registros procesado. Registros actualizados: ' ||
                         l_ids_c2_proc.COUNT || '. Total en Fase 2: ' ||
                         v_total_procesados_f2);

  END LOOP;
  CLOSE C2;

EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('ERROR FATAL en JL_GENERAR_EJECUTORIAS: ' ||
                         SQLERRM);
    RAISE;
END JL_GENERAR_EJECUTORIAS;
/

