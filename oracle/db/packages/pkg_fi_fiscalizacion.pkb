
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_FI_FISCALIZACION" AS
  PROCEDURE prc_rg_fsclzcion_pblcion_msva(p_cdgo_clnte       IN df_s_clientes.cdgo_clnte%TYPE,
                                          p_id_usrio         IN sg_g_usuarios.id_usrio%TYPE,
                                          p_id_cnslta_mstro  IN cs_g_consultas_maestro.id_cnslta_mstro%TYPE,
                                          p_id_fsclzcion_lte IN fi_g_fiscalizacion_lote.id_fsclzcion_lte%TYPE,
                                          o_cdgo_rspsta      OUT number,
                                          o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_id_sjto_impsto number;

    v_id_cnddto_vgncia number;

    v_id_impsto number;

    v_anios number;

    v_dias number;

    v_mnsje_log varchar2(4000);

    v_guid varchar2(33) := sys_guid();

    v_nmbre_cnslta varchar2(1000);

    v_sql CLOB;

    p_json CLOB;

    v_pblcion sys_refcursor;

    v_id_cnddto fi_g_candidatos.id_cnddto%TYPE;

    TYPE v_rgstro IS record(
      id_impsto                  number,
      id_sjto_impsto             number,
      idntfccion_sjto_frmtda     varchar(25),
      id_impsto_sbmpsto          number,
      vgncia                     number,
      id_prdo                    number,
      id_dclrcion_vgncia_frmlrio number,
      id_dclrcion                number);

    TYPE v_tbla IS TABLE OF v_rgstro;

    v_tbla_dnmca v_tbla;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --se obtiene el programa y subprograma del lote
    BEGIN
      SELECT a.id_prgrma, a.id_sbprgrma, a.id_impsto
        INTO v_id_prgrma, v_id_sbprgrma, v_id_impsto
        FROM fi_g_fiscalizacion_lote a
       WHERE id_fsclzcion_lte = p_id_fsclzcion_lte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener el programa y subprograma del lote';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    --Se obtiene el nombre de la consulta
    BEGIN
      SELECT a.nmbre_cnslta
        INTO v_nmbre_cnslta
        FROM cs_g_consultas_maestro a
       WHERE a.id_cnslta_mstro = p_id_cnslta_mstro;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro consulta general parametrizada en el Constructor SQL.';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    -- Se obtiene el a?o limite para la declaracion segun el impuesto
    BEGIN
      SELECT a.vlor
        INTO v_anios
        FROM df_i_definiciones_impuesto a
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND a.id_impsto = v_id_impsto
         AND a.cdgo_dfncn_impsto = 'ANI';

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro parametrizado los a?os limetes de declaracion en definiciones del tributo con codigo ANI';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener la definicion de los a?os limetes de declaracion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    --Se construye el json de parametros
    p_json := '[{"parametro":"p_id_impsto","valor":' || v_id_impsto || '},
                {"parametro":"p_anios","valor":' || v_anios || '},
                {"parametro":"p_id_prgrma","valor":' ||
              v_id_prgrma || '},
                {"parametro":"p_id_sbprgrma","valor":' ||
              v_id_sbprgrma || '}]';

    --Se contruye la consulta general
    BEGIN
      v_sql := 'select id_impsto,
                            id_sjto_impsto,
                            idntfccion_sjto,
                            id_impsto_sbmpsto,
                            vgncia,
                            id_prdo,
                            id_dclrcion_vgncia_frmlrio,
                            id_dclrcion
                     from        (' ||
               pkg_cs_constructorsql.fnc_co_sql_dinamica(p_id_cnslta_mstro => p_id_cnslta_mstro,
                                                         p_cdgo_clnte      => p_cdgo_clnte,
                                                         p_json            => p_json) ||
               ') a ' || 'where ' || chr(39) || v_guid || chr(39) || ' = ' ||
               chr(39) || v_guid || chr(39);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                            v_nl,
                            'v_sql:' || v_sql,
                            6);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo ejecutar la consulta general ' || ' ' ||
                          v_nmbre_cnslta ||
                          ' verifique la parametrizacion el Constructor SQL';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    --Se procesa la poblacion
    o_mnsje_rspsta := 'Antes de entrar a v_pblcion ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                          v_nl,
                          o_mnsje_rspsta || '-' || sqlerrm,
                          6);

    BEGIN
      OPEN v_pblcion FOR v_sql;

      o_mnsje_rspsta := 'Entro a for de v_sql ';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                            v_nl,
                            o_mnsje_rspsta || '-' || sqlerrm,
                            6);

      LOOP
        FETCH v_pblcion bulk COLLECT
          INTO v_tbla_dnmca LIMIT 5000;

        o_mnsje_rspsta := 'Entro A  v_pblcion ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        EXIT WHEN v_tbla_dnmca.count = 0;

        FOR i IN 1 .. v_tbla_dnmca.count LOOP
          o_mnsje_rspsta := 'Entro a for de v_tbla_dnmca ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          BEGIN
            SELECT a.id_cnddto
              INTO v_id_cnddto
              FROM fi_g_candidatos a
             WHERE a.id_sjto_impsto = v_tbla_dnmca(i).id_sjto_impsto
               AND a.id_impsto = v_tbla_dnmca(i).id_impsto
               AND a.id_prgrma = v_id_prgrma
               AND a.id_fsclzcion_lte = p_id_fsclzcion_lte;

          EXCEPTION
            WHEN no_data_found THEN
              --Se inserta los candidatos
              BEGIN
                INSERT INTO fi_g_candidatos
                  (id_impsto,
                   id_impsto_sbmpsto,
                   id_sjto_impsto,
                   id_fsclzcion_lte,
                   cdgo_cnddto_estdo,
                   indcdor_asgndo,
                   id_prgrma,
                   id_sbprgrma,
                   cdgo_clnte)
                VALUES
                  (v_tbla_dnmca      (i).id_impsto,
                   v_tbla_dnmca      (i).id_impsto_sbmpsto,
                   v_tbla_dnmca      (i).id_sjto_impsto,
                   p_id_fsclzcion_lte,
                   'ACT',
                   'N',
                   v_id_prgrma,
                   v_id_sbprgrma,
                   p_cdgo_clnte)
                RETURNING id_cnddto INTO v_id_cnddto;

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 3;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'No se pudo guardar el candidato con identificacion ' || '-' || v_tbla_dnmca(i).idntfccion_sjto_frmtda;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                                        v_nl,
                                        o_mnsje_rspsta || '-' || sqlerrm,
                                        6);

                  ROLLBACK;

                  RETURN;

              END;

          END;

          BEGIN
            SELECT a.id_cnddto_vgncia
              INTO v_id_cnddto_vgncia
              FROM fi_g_candidatos_vigencia a
             WHERE a.id_cnddto = v_id_cnddto
               AND a.vgncia = v_tbla_dnmca(i).vgncia
               AND a.id_prdo = v_tbla_dnmca(i).id_prdo
               AND a.id_dclrcion_vgncia_frmlrio = v_tbla_dnmca(i).id_dclrcion_vgncia_frmlrio;

          EXCEPTION
            WHEN no_data_found THEN
              --Se inserta las vigencia periodo de los candidatos
              BEGIN
                INSERT INTO fi_g_candidatos_vigencia
                  (id_cnddto,
                   vgncia,
                   id_prdo,
                   id_dclrcion_vgncia_frmlrio,
                   id_dclrcion)
                VALUES
                  (v_id_cnddto,
                   v_tbla_dnmca(i).vgncia,
                   v_tbla_dnmca(i).id_prdo,
                   v_tbla_dnmca(i).id_dclrcion_vgncia_frmlrio,
                   v_tbla_dnmca(i).id_dclrcion);

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 4;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'No se pudo registrar las vigencia periodo del candidato con identificacion ' || '-' || v_tbla_dnmca(i).idntfccion_sjto_frmtda || '-' ||
                                    sqlerrm;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                                        v_nl,
                                        o_mnsje_rspsta || '-' || sqlerrm,
                                        6);

                  ROLLBACK;

                  RETURN;

              END;

          END;

        END LOOP;

      END LOOP;

      CLOSE v_pblcion;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo procesar el registro de la poblacion  ' || '-' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                          v_nl,
                          'Saliendo con Exito:' || systimestamp,
                          6);

  END prc_rg_fsclzcion_pblcion_msva;

  PROCEDURE prc_rg_cnddto_fncnrio_msvo(p_cdgo_clnte       IN df_s_clientes.cdgo_clnte%TYPE,
                                       p_id_usrio         IN sg_g_usuarios.id_usrio%TYPE,
                                       p_funcionario      IN CLOB,
                                       p_candidato        IN CLOB,
                                       p_id_fsclzcion_lte IN fi_g_fiscalizacion_lote.id_fsclzcion_lte%TYPE,
                                       p_id_fljo_trea     IN wf_d_flujos_tarea.id_fljo_trea%TYPE DEFAULT NULL,
                                       p_dstrbuir         IN varchar2 DEFAULT NULL,
                                       o_cnddto_x_asgnar  OUT number,
                                       o_cdgo_rspsta      OUT number,
                                       o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    v_id_fljo_trea number;

    v_funcionario number;

    v_total number;

    v_inicio number;

    v_fin number;

    v_contador number;

    v_mnsje_log varchar2(4000);

    --v_n_cnddto      number;
    --Objeto element
    TYPE t_element IS record(
      id_cnddto number);

    TYPE g_elements IS TABLE OF t_element;

    v_elements g_elements;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      IF p_dstrbuir = 'S' THEN
        --Se obtiene el total de funcionarios
        BEGIN
          SELECT count(*)
            INTO v_funcionario
            FROM table(pkg_gn_generalidades.fnc_ca_split_table(p_cdna           => p_funcionario,
                                                               p_crcter_dlmtdor => ':'));

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := 'No se pudo obtener el numero total de funcionarios';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

            RETURN;

        END;

        --Se llena la coleccion con los candidatos
        BEGIN
          SELECT *
            bulk COLLECT
            INTO v_elements
            FROM json_table(p_candidato,
                            '$[*]'
                            columns(id_cnddto varchar2 PATH '$.ID_CNDDTO'));

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := 'No se pudo llenar la coleccion de candidatos';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

            RETURN;

        END;

        --Se calcula cuantos candidatos se van asignar por funcionario
        v_total := floor(v_elements.LAST / v_funcionario);

        v_inicio := 1;

        v_fin := v_total;

        v_contador := v_elements.LAST;

        IF v_total = 0 THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'El numero de funcionarios seleccionados no puede ser mayor a los candidatos seleccionados para la distribucion';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

        END IF;

        WHILE v_contador > 0 LOOP
          BEGIN
            FOR c_fncnrio IN (SELECT *
                                FROM table(pkg_gn_generalidades.fnc_ca_split_table(p_cdna           => p_funcionario,
                                                                                   p_crcter_dlmtdor => ':'))) LOOP
              BEGIN
                FOR i IN v_inicio .. v_fin LOOP
                  --Se asigna el candidato al funcionario
                  BEGIN
                    prc_rg_candidato_funcionario(p_cdgo_clnte   => p_cdgo_clnte,
                                                 p_id_usrio     => p_id_usrio,
                                                 p_id_cnddto    => v_elements(i).id_cnddto,
                                                 p_id_fncnrio   => c_fncnrio.cdna,
                                                 p_id_fljo_trea => p_id_fljo_trea,
                                                 o_cdgo_rspsta  => o_cdgo_rspsta,
                                                 o_mnsje_rspsta => o_mnsje_rspsta);

                    IF o_cdgo_rspsta > 0 THEN
                      o_cdgo_rspsta := 4;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        o_mnsje_rspsta;

                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                            v_nl,
                                            o_mnsje_rspsta || '-' ||
                                            sqlerrm,
                                            6);

                      ROLLBACK;

                      RETURN;

                    END IF;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 5;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'Error al llamar el procedimiento que asigna los candidatos';

                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                            v_nl,
                                            o_mnsje_rspsta || '-' ||
                                            sqlerrm,
                                            6);

                      RETURN;

                  END;

                  v_contador := v_contador - 1;

                END LOOP;

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 6;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'Problema al recorrer la coleccion de candidatos';

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                        v_nl,
                                        o_mnsje_rspsta || '-' || sqlerrm,
                                        6);

                  RETURN;

              END;

              v_inicio := v_fin + 1;

              v_fin := v_fin + v_total;

              IF v_fin > v_elements.LAST THEN
                v_fin := v_elements.LAST;

              END IF;

            END LOOP;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 7;

              o_mnsje_rspsta := 'Problema al recorrer el cursor de los funcionarios';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              RETURN;

          END;

        END LOOP;

      ELSE
        FOR c_fncnrio IN (SELECT *
                            FROM table(pkg_gn_generalidades.fnc_ca_split_table(p_cdna           => p_funcionario,
                                                                               p_crcter_dlmtdor => ':'))) LOOP
          FOR c_cnddto IN (SELECT id_cnddto
                             FROM json_table(p_candidato,
                                             '$[*]'
                                             columns(id_cnddto varchar2 PATH
                                                     '$.ID_CNDDTO'))) LOOP
            BEGIN
              prc_rg_candidato_funcionario(p_cdgo_clnte   => p_cdgo_clnte,
                                           p_id_usrio     => p_id_usrio,
                                           p_id_cnddto    => c_cnddto.id_cnddto,
                                           p_id_fncnrio   => c_fncnrio.cdna,
                                           p_id_fljo_trea => p_id_fljo_trea,
                                           o_cdgo_rspsta  => o_cdgo_rspsta,
                                           o_mnsje_rspsta => o_mnsje_rspsta);

              IF o_cdgo_rspsta > 0 THEN
                o_cdgo_rspsta := 8;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' || o_mnsje_rspsta;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

                ROLLBACK;

                RETURN;

              END IF;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 9;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  'Error al llamar el procedimiento que asigna los candidatos';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

                RETURN;

            END;

          END LOOP;

        END LOOP;

      END IF;

      BEGIN
        SELECT count(c.id_cnddto)
          INTO o_cnddto_x_asgnar
          FROM fi_g_candidatos c
         WHERE c.id_fsclzcion_lte = p_id_fsclzcion_lte
           AND c.indcdor_asgndo = 'N';

        IF o_cnddto_x_asgnar = 0 THEN
          UPDATE fi_g_fiscalizacion_lote f
             SET f.indcdor_prcsdo = 'S'
           WHERE f.id_fsclzcion_lte = p_id_fsclzcion_lte;

        END IF;

      END;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 10;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al asignar los candidatos a los funcionarios';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

  END prc_rg_cnddto_fncnrio_msvo;

  PROCEDURE prc_rg_candidato_funcionario(p_cdgo_clnte   IN df_s_clientes.cdgo_clnte%TYPE,
                                         p_id_usrio     IN sg_g_usuarios.id_usrio%TYPE,
                                         p_id_cnddto    IN fi_g_candidatos_funcionario.id_cnddto%TYPE,
                                         p_id_fncnrio   IN fi_g_candidatos_funcionario.id_fncnrio%TYPE,
                                         p_id_fljo_trea IN wf_d_flujos_tarea.id_fljo_trea%TYPE DEFAULT NULL,
                                         o_cdgo_rspsta  OUT number,
                                         o_mnsje_rspsta OUT varchar2) AS
    v_nl number;

    v_id_cnddto_fncnrio number;

    v_mnsje_log varchar2(4000);

    v_funcionario varchar2(200);

  BEGIN
    --Se obtiene nombre del candidato
    BEGIN
      SELECT t.prmer_nmbre || ' ' || t.prmer_aplldo
        INTO v_funcionario
        FROM si_c_terceros t
       WHERE t.id_trcro = (SELECT a.id_trcro
                             FROM df_c_funcionarios a
                            WHERE a.id_fncnrio = p_id_fncnrio);

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' || 'El funcionario ' ||
                          v_funcionario ||
                          ' No existe en la tabla de terceros';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_candidato_funcionario',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

    BEGIN
      SELECT id_cnddto_fncnrio
        INTO v_id_cnddto_fncnrio
        FROM fi_g_candidatos_funcionario
       WHERE id_cnddto = p_id_cnddto
         AND id_fncnrio = p_id_fncnrio;

    EXCEPTION
      WHEN no_data_found THEN
        --Inserta el candidato y el funcionario
        BEGIN
          INSERT INTO fi_g_candidatos_funcionario
            (id_cnddto, id_fncnrio, actvo)
          VALUES
            (p_id_cnddto, p_id_fncnrio, 'S')
          RETURNING id_cnddto_fncnrio INTO v_id_cnddto_fncnrio;

          UPDATE fi_g_candidatos c
             SET c.indcdor_asgndo = 'S'
           WHERE c.id_cnddto = p_id_cnddto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo agregar el funcionario ' ||
                              v_funcionario || ' a la investigacion ' || '-' ||
                              sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_candidato_funcionario',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

            RETURN;

        END;

        BEGIN
          INSERT INTO fi_g_cnddtos_fncnrio_trza
            (id_cnddto_fncnrio,
             id_fljo_trea,
             id_fncnrio_inclsion,
             fcha_inclsion)
          VALUES
            (v_id_cnddto_fncnrio,
             p_id_fljo_trea,
             p_id_fncnrio,
             systimestamp);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo agregar la trazabilidad de inclusion';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_candidato_funcionario',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

            RETURN;

        END;

    END;

  END prc_rg_candidato_funcionario;

  PROCEDURE prc_rg_expediente_acto_masivo(p_cdgo_clnte         IN df_s_clientes.cdgo_clnte%TYPE,
                                          p_id_usrio           IN sg_g_usuarios.id_usrio%TYPE,
                                          p_id_fncnrio         IN number,
                                          p_candidato_vigencia IN CLOB,
                                          o_cdgo_rspsta        OUT number,
                                          o_mnsje_rspsta       OUT varchar2) AS
    v_nl number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_result number;

    v_id_sjto_impsto number;

    v_vgncia number;

    v_prdo number;

    v_nmbre varchar2(30);

    v_mnsje_log varchar2(4000);

    v_nmbre_prgrma varchar2(200);

    v_cdgo_fljo varchar2(5);

    v_nmbre_rzon_scial varchar2(300);

    v_array_candidato json_array_t := NEW
                                      json_array_t(p_candidato_vigencia);

    v_contador number;

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      v_contador := v_array_candidato.get_size;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                            v_nl,
                            'A Procesar: ' || v_contador,
                            6);

      FOR i IN 0 ..(v_array_candidato.get_size - 1) LOOP
        DECLARE
          v_json_candidato json_object_t := NEW
                                            json_object_t(v_array_candidato.get(i));

          json_candidato CLOB := v_json_candidato.to_clob;

          v_id_cnddto varchar2(1000) := v_json_candidato.get_String('ID_CNDDTO');

        BEGIN
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                                v_nl,
                                i || '-v_id_cnddto:' || v_id_cnddto,
                                6);

          --Se obtiene el codigo del flujo que se va a instanciar
          BEGIN
            SELECT b.cdgo_fljo, a.nmbre_prgrma, a.id_prgrma
              INTO v_cdgo_fljo, v_nmbre_prgrma, v_id_prgrma
              FROM fi_d_programas a
              JOIN wf_d_flujos b
                ON a.id_fljo = b.id_fljo
             WHERE a.id_prgrma =
                   (SELECT a.id_prgrma
                      FROM fi_g_candidatos a
                     WHERE a.id_cnddto = v_id_cnddto);

          EXCEPTION
            WHEN no_data_found THEN
              o_cdgo_rspsta := 1;

              o_mnsje_rspsta := 'No se encontro parametrizado el flujo del programa ' ||
                                v_nmbre_prgrma;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              CONTINUE;

            WHEN others THEN
              o_cdgo_rspsta := 2;

              o_mnsje_rspsta := 'No se pudo obtener el flujo del programa ' ||
                                v_nmbre_prgrma || ' , ' || sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente',
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              CONTINUE;

          END;

          --Se llama la up para registrar el expediente
          BEGIN
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                                  v_nl,
                                  i || '-v_id_cnddto:' || v_id_cnddto,
                                  6);

            prc_rg_expediente(p_cdgo_clnte   => p_cdgo_clnte,
                              p_id_usrio     => p_id_usrio,
                              p_id_fncnrio   => p_id_fncnrio,
                              p_id_cnddto    => v_json_candidato.get_String('ID_CNDDTO'),
                              p_cdgo_fljo    => v_cdgo_fljo,
                              p_json         => v_json_candidato.to_Clob,
                              o_cdgo_rspsta  => o_cdgo_rspsta,
                              o_mnsje_rspsta => o_mnsje_rspsta);

            IF o_cdgo_rspsta > 0 THEN
              -- o_mnsje_rspsta := 'Error prc_rg_expediente: Candidato: ' || v_id_cnddto || ' - ' || o_mnsje_rspsta;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente',
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              CONTINUE;

            END IF;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 3;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'Error al llamar el procedimiento que registra el expediente';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente',
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              CONTINUE;

          END;

        END;

      END LOOP;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                          v_nl,
                          'Saliendo con Exito:' || systimestamp,
                          6);

  END prc_rg_expediente_acto_masivo;

  /*
      prc actualizado para generar mas de un acto en una etapa.
  */
  PROCEDURE prc_rg_expediente(p_cdgo_clnte                IN df_s_clientes.cdgo_clnte%TYPE,
                              p_id_usrio                  IN sg_g_usuarios.id_usrio%TYPE,
                              p_id_fncnrio                IN number,
                              p_id_cnddto                 IN fi_g_candidatos.id_cnddto%TYPE,
                              p_cdgo_fljo                 IN wf_d_flujos.cdgo_fljo%TYPE,
                              p_id_fsclzcion_expdnte_pdre IN fi_g_fiscalizacion_expdnte.id_fsclzcion_expdnte_pdre%TYPE DEFAULT NULL,
                              p_json                      IN CLOB DEFAULT NULL,
                              o_cdgo_rspsta               OUT number,
                              o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_expediente';

    v_ntfccion_atmtco varchar2(1);

    nmncltra varchar2(20);

    v_nmro_expdnte varchar2(100);

    v_nmro_cnsctvo varchar2(100);

    v_nmbre varchar2(30);

    v_nmbre_rzon_scial varchar2(300);

    v_nmbre_prgrma varchar2(100);

    v_nmbre_sbprgrma varchar2(100);

    v_mnsje varchar2(4000);

    v_instncia_fljo number;

    v_id_fljo number;

    v_id_prcso number;

    v_fljo_trea number;

    v_id_srie number;

    v_id_fsclzcion_expdnte number;

    v_id_expdnte number;

    v_id_area number;

    v_id_prcso_cldad number;

    v_id_acto_tpo number;

    v_id_plntlla number;

    v_id_rprte number;

    v_id_acto_tpo_rqrdo number;

    v_id_sjto_impsto number;

    v_idntfccion_sjto number;

    o_id_fsclzcion_expdnte_acto number;

    v_id_impsto number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_vgncia number;

    v_prdo number;

    v_id_cnddto_vgncia number;

    v_dcmnto CLOB;

    v_xml CLOB;

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_expediente');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_expediente',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se obtiene el flujo de Fiscalizacion que se va instanciar para cada candidato
    BEGIN
      SELECT a.id_fljo, a.id_prcso
        INTO v_id_fljo, v_id_prcso
        FROM wf_d_flujos a
       WHERE a.cdgo_fljo = p_cdgo_fljo
         AND a.cdgo_clnte = p_cdgo_clnte;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro parametrizacion del flujo de Fiscalizacion con codigo ' ||
                          p_cdgo_fljo || ' para este cliente';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al consultar el flujo de Fiscalizacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    -- Se obtiene la serie de Fiscalizacion
    BEGIN
      SELECT a.id_srie
        INTO v_id_srie
        FROM gd_d_series a
       WHERE a.cdgo_srie = 'FIS-001'
         AND a.cdgo_clnte = p_cdgo_clnte;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro parametrizacion de la serie de Fiscalizacion con codigo FIS-001 para este cliente';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        prc_rg_expediente_error(p_id_cnddto  => p_id_cnddto,
                                p_mnsje      => v_mnsje,
                                p_cdgo_clnte => p_cdgo_clnte,
                                p_id_usrio   => p_id_usrio);

        ROLLBACK;

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 4;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al consultar la serie de Fiscalizacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se obtiene el proceso del cliente y el area
    BEGIN
      SELECT a.id_area, a.id_prcso
        INTO v_id_area, v_id_prcso_cldad
        FROM df_c_procesos a
       WHERE a.cdgo_prcso = 'FISCA'
         AND a.cdgo_clnte = p_cdgo_clnte;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro parametrizacion de la serie de Fiscalizacion con codigo FIS-001 para este cliente';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 6;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al consultar la serie de Fiscalizacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se manda a Instanciar el flujo de Fiscalizacion
    BEGIN
      pkg_pl_workflow_1_0.prc_rg_instancias_flujo(p_id_fljo          => v_id_fljo,
                                                  p_id_usrio         => p_id_usrio,
                                                  p_id_prtcpte       => p_id_usrio,
                                                  p_obsrvcion        => 'Instancia de flujo de Fiscalizacion',
                                                  o_id_instncia_fljo => v_instncia_fljo,
                                                  o_id_fljo_trea     => v_fljo_trea,
                                                  o_mnsje            => o_mnsje_rspsta);

      IF v_instncia_fljo IS NULL THEN
        o_cdgo_rspsta := 7;

        --o_mnsje_rspsta := o_cdgo_rspsta||' - '||'No se pudo instanciar el flujo de Fiscalizacion';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        v_mnsje := o_mnsje_rspsta;

        v_mnsje := replace(v_mnsje, '<br/>');

        prc_rg_expediente_error(p_id_cnddto  => p_id_cnddto,
                                p_mnsje      => v_mnsje,
                                p_cdgo_clnte => p_cdgo_clnte,
                                p_id_usrio   => p_id_usrio);

        ROLLBACK;

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 8;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al llamar el procedimiento que instancia los flujos de FIscalizacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se genera el numero del expediente
    BEGIN
      SELECT a.cdgo_impsto || a.cdgo_prgrma || a.cdgo_sbprgrma AS nomenclatura
        INTO nmncltra
        FROM v_fi_g_candidatos a
       WHERE a.id_cnddto = p_id_cnddto;

      --se agrega para migracion
      /* o_mnsje_rspsta := ' Antes de extraer el consecutivo FEX :  ' ;
       pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl,  o_mnsje_rspsta , 6);
       begin








              select  REPLACE(a.expediente, ' ','')
              into v_nmro_cnsctvo
              from fiscalizados_2016 a
              join v_fi_g_candidatos b on a.nit = b.idntfccion
              --join fiscalizados_2016 c on b.idntfccion = c.nit
              where b.id_cnddto = p_id_cnddto;






       o_mnsje_rspsta := ' Valor del consecutivo :  '||v_nmro_cnsctvo ;
          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl,  o_mnsje_rspsta , 6);
      exception
          when others then
              o_cdgo_rspsta := 7;
              o_mnsje_rspsta  := o_cdgo_rspsta||'-'||'Error al consultar el consecutivo FEX ';
              pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta, 6);
              rollback;
              return;
      end;*/
      v_nmro_cnsctvo := to_char(pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte,
                                                                        'FEX')); -- migra

      IF v_nmro_cnsctvo IS NULL THEN
        o_cdgo_rspsta := 9;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro parametrizado el consecutivo con codigo FEX para generar el numero de los expediente de fiscalizacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

      END IF;

      v_nmro_expdnte := nmncltra || v_nmro_cnsctvo; -- CONSECTUTIVO 20220000000
      --v_nmro_expdnte :=  v_nmro_cnsctvo; --MODIFICADO PARA MIGRACION

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 10;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo llamar la funcion que genera el numero del expediente ' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se crea el expediente en gestion documental
    BEGIN
      pkg_gd_gestion_documental.prc_rg_expediente(p_cdgo_clnte     => p_cdgo_clnte,
                                                  p_id_area        => v_id_area,
                                                  p_id_prcso_cldad => v_id_prcso_cldad,
                                                  p_id_prcso_sstma => v_id_prcso,
                                                  p_id_srie        => v_id_srie,
                                                  p_id_sbsrie      => NULL,
                                                  p_nmbre          => 'Expediente de Fiscalizacion',
                                                  p_obsrvcion      => 'Fisca',
                                                  p_nmro_expdnte   => v_nmro_expdnte,
                                                  o_cdgo_rspsta    => o_cdgo_rspsta,
                                                  o_mnsje_rspsta   => o_mnsje_rspsta,
                                                  o_id_expdnte     => v_id_expdnte);

      IF o_cdgo_rspsta > 0 THEN
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente..',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al llamar el procedimiento que crea el expediente';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se registra el expediente en fiscalizacion
    BEGIN
      INSERT INTO fi_g_fiscalizacion_expdnte
        (id_cnddto,
         id_instncia_fljo,
         cdgo_expdnte_estdo,
         id_expdnte,
         fcha_aprtra,
         id_fncnrio,
         id_fsclzcion_expdnte_pdre,
         nmro_expdnte)
      VALUES
        (p_id_cnddto,
         v_instncia_fljo,
         'ABT',
         v_id_expdnte,
         sysdate,
         p_id_fncnrio,
         p_id_fsclzcion_expdnte_pdre,
         v_nmro_expdnte)
      RETURNING id_fsclzcion_expdnte INTO v_id_fsclzcion_expdnte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 11;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo crear el expediente ' || ' , ' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se recorre las vigencias del candidato
    BEGIN
      FOR cnddto_vgncia IN (SELECT id_cnddto,
                                   vgncia,
                                   id_prdo,
                                   id_dclrcion_vgncia_frmlrio,
                                   id_sjto_impsto,
                                   id_cnddto_vgncia
                              FROM json_table(p_json,
                                              '$.VGNCIA[*]'
                                              columns(id_cnddto varchar2 PATH
                                                      '$.ID_CNDDTO',
                                                      vgncia varchar2 PATH
                                                      '$.VGNCIA',
                                                      id_prdo varchar2 PATH
                                                      '$.ID_PRDO',
                                                      id_dclrcion_vgncia_frmlrio
                                                      varchar2 PATH
                                                      '$.DCLRCION_VGNCIA_FRMLRIO',
                                                      id_sjto_impsto varchar2 PATH
                                                      '$.ID_SJTO_IMPSTO',
                                                      id_cnddto_vgncia
                                                      varchar2 PATH
                                                      '$.ID_CNDDTO_VGNCIA'))) LOOP
        --Se obtiene el programa y subprograma
        BEGIN
          SELECT a.id_prgrma,
                 a.nmbre_prgrma,
                 a.id_sbprgrma,
                 a.nmbre_sbprgrma
            INTO v_id_prgrma,
                 v_nmbre_prgrma,
                 v_id_sbprgrma,
                 v_nmbre_sbprgrma
            FROM v_fi_g_candidatos a
           WHERE a.id_cnddto = p_id_cnddto;

        EXCEPTION
          WHEN no_data_found THEN
            o_cdgo_rspsta := 12;

            o_mnsje_rspsta := 'Falta el programa y subprograma por el cual se esta fiscalizando el candidato';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_expediente',
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --Se obtiene el nombre de la persona o razon social
        BEGIN
          SELECT a.nmbre_rzon_scial
            INTO v_nmbre_rzon_scial
            FROM si_i_personas a
           WHERE a.id_sjto_impsto = cnddto_vgncia.id_sjto_impsto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 122;

            o_mnsje_rspsta := 'Problema al obtener el nombre de la persona o razon social';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_expediente',
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --se obtiene el  identificador de candidato vigencia
        o_mnsje_rspsta := 'p_cdgo_fljo ' || p_cdgo_fljo || ' p_id_cnddto ' ||
                          p_id_cnddto || 'cnddto_vgncia.vgncia ' ||
                          cnddto_vgncia.vgncia || 'cnddto_vgncia.id_prdo ' ||
                          cnddto_vgncia.id_prdo;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_expediente',
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        BEGIN
          IF p_cdgo_fljo IN ('FOD', 'FOL') THEN
            SELECT a.id_cnddto_vgncia
              INTO v_id_cnddto_vgncia
              FROM fi_g_candidatos_vigencia a
             WHERE a.id_cnddto = p_id_cnddto
               AND a.vgncia = cnddto_vgncia.vgncia
               AND a.id_prdo = cnddto_vgncia.id_prdo;

          ELSE
            SELECT a.id_cnddto_vgncia
              INTO v_id_cnddto_vgncia
              FROM fi_g_candidatos_vigencia a
             WHERE a.id_cnddto = p_id_cnddto
               AND a.vgncia = cnddto_vgncia.vgncia
               AND a.id_prdo = cnddto_vgncia.id_prdo
               AND a.id_dclrcion_vgncia_frmlrio =
                   nvl(cnddto_vgncia.id_dclrcion_vgncia_frmlrio, NULL); --se agrega nvl para LQ 06072022

          END IF;

        EXCEPTION
          WHEN no_data_found THEN
            o_cdgo_rspsta := 13;

            o_mnsje_rspsta := 'No se pudo obterner la vigencia por el cual se va abrir el expediente ' ||
                              ' , ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_expediente',
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --Se valida si el sujeto impuesto tiene un expediente para una vigencia periodo
        BEGIN
          SELECT a.id_sjto_impsto, e.nmbre, c.vgncia, f.prdo
            INTO v_id_sjto_impsto, v_nmbre, v_vgncia, v_prdo
            FROM fi_g_candidatos a
            JOIN fi_g_candidatos_vigencia c
              ON a.id_cnddto = c.id_cnddto
            JOIN fi_g_fsclzc_expdn_cndd_vgnc d
              ON c.id_cnddto_vgncia = d.id_cnddto_vgncia
            JOIN fi_g_fiscalizacion_expdnte b
              ON d.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
            JOIN fi_d_expediente_estado e
              ON b.cdgo_expdnte_estdo = e.cdgo_expdnte_estdo
            JOIN df_i_periodos f
              ON c.id_prdo = f.id_prdo
           WHERE a.id_sjto_impsto = cnddto_vgncia.id_sjto_impsto
             AND (c.id_dclrcion_vgncia_frmlrio =
                 cnddto_vgncia.id_dclrcion_vgncia_frmlrio OR
                 c.id_dclrcion_vgncia_frmlrio = NULL)
             AND a.id_prgrma = v_id_prgrma
             AND a.id_sbprgrma = v_id_sbprgrma
             AND e.cdgo_expdnte_estdo IN ('ABT', 'CER');

        EXCEPTION
          WHEN no_data_found THEN
            --Se registran las vigencias al expediente
            BEGIN
              INSERT INTO fi_g_fsclzc_expdn_cndd_vgnc
                (id_fsclzcion_expdnte, id_cnddto_vgncia, estdo)
              VALUES
                (v_id_fsclzcion_expdnte, v_id_cnddto_vgncia, 'F');

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 14;

                o_mnsje_rspsta := 'Problemas al registrar las vigencias del expedientes ';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      'pkg_fi_fiscalizacion.prc_rg_expediente',
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                ROLLBACK;

                RETURN;

            END;

          WHEN too_many_rows THEN
            o_cdgo_rspsta := 15;

            o_mnsje_rspsta := 'La razon social ' || v_nmbre_rzon_scial ||
                              ' tiene mas de un expediente para la vigencia ' ||
                              v_vgncia || ' periodo ' || v_prdo ||
                              ' del programa ' || v_nmbre_prgrma ||
                              ' y subprograma ' || v_nmbre_sbprgrma;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

          WHEN others THEN
            o_cdgo_rspsta := 15;

            o_mnsje_rspsta := 'Problema al validar si el candidato ya tiene un expediente ' ||
                              ' , ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

        --Se valida el sujeto impuesto
        IF v_id_sjto_impsto IS NOT NULL THEN
          o_cdgo_rspsta := 16;

          o_mnsje_rspsta := 'La razon social ' || v_nmbre_rzon_scial ||
                            ' tiene un expediente para la vigencia ' ||
                            v_vgncia || ' periodo ' || v_prdo ||
                            ' del programa ' || v_nmbre_prgrma ||
                            ' y subprograma ' || v_nmbre_sbprgrma;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          v_mnsje := o_mnsje_rspsta;

          v_mnsje := replace(v_mnsje, '<br/>');

          prc_rg_expediente_error(p_id_cnddto  => p_id_cnddto,
                                  p_mnsje      => v_mnsje,
                                  p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_usrio   => p_id_usrio --,
                                  --  p_id_instncia_fljo   =>  c_fljo.id_instncia_fljo,
                                  --p_id_fljo_trea       =>  v_id_fljo_trea
                                  );

          ROLLBACK;

          RETURN;

        END IF;

      END LOOP;

    END;

    /*
    Cursor agregado para generar varios actos en una misma etapa.
    */
    FOR c_acto IN (SELECT b.id_acto_tpo,
                          b.dscrpcion,
                          a.id_acto_tpo_rqrdo,
                          a.indcdor_oblgtrio
                     FROM gn_d_actos_tipo_tarea a
                     JOIN gn_d_actos_tipo b
                       ON a.id_acto_tpo = b.id_acto_tpo
                     JOIN fi_d_programas_acto c
                       ON b.id_acto_tpo = c.id_acto_tpo
                    WHERE b.cdgo_clnte = p_cdgo_clnte
                      AND c.indcdor_msvo = 'S'
                      AND a.indcdor_oblgtrio = 'S'

                      AND a.id_fljo_trea = v_fljo_trea
                      AND c.id_prgrma = v_id_prgrma
                      AND c.id_sbprgrma = v_id_sbprgrma) LOOP
      o_mnsje_rspsta := 'Creando acto  ' || c_acto.dscrpcion;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

      --Se obtiene el tipo de acto
      /* begin
          select id_acto_tpo
          into v_id_acto_tpo
          from gn_d_actos_tipo
          where cdgo_acto_tpo = 'ADA';
      exception
          when no_data_found then
              o_cdgo_rspsta := 17;
              o_mnsje_rspsta := o_cdgo_rspsta||' - '||'No se encontro parametrizado el acto con codigo ADA';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente',  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
              rollback;
              return;
          when others then
              o_cdgo_rspsta := 18;
              o_mnsje_rspsta := o_cdgo_rspsta||' - '||'Problema al obtener el tipo de acto';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente',  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
              rollback;
              return;
      end;*/ --Se obtiene la plantilla para el acto
      v_id_acto_tpo := c_acto.id_acto_tpo;

      o_mnsje_rspsta := 'v_id_acto_tpo ' || v_id_acto_tpo;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

      BEGIN
        SELECT id_plntlla, id_rprte
          INTO v_id_plntlla, v_id_rprte
          FROM gn_d_plantillas
         WHERE id_acto_tpo = v_id_acto_tpo
           AND actvo = 'S';

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 19;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se encontro parametrizado plantilla para el Acto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 20;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'Problema al obtener la plantilla para el acto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --Se obtiene si el acto es requerido
      BEGIN
        SELECT id_acto_tpo_rqrdo
          INTO v_id_acto_tpo_rqrdo
          FROM gn_d_actos_tipo_tarea
         WHERE id_acto_tpo = v_id_acto_tpo
           AND id_fljo_trea = v_fljo_trea;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 21;

          o_mnsje_rspsta := v_fljo_trea || ' - ' ||
                            'No se encontro parametrizado el Acto en la tarea';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 22;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'Problema al obtener si el acto es requerido';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --Se obtiene el identificador del sujeto impuesto
      BEGIN
        SELECT b.id_sjto_impsto, c.idntfccion_sjto, b.id_impsto
          INTO v_id_sjto_impsto, v_idntfccion_sjto, v_id_impsto
          FROM fi_g_fiscalizacion_expdnte a
          JOIN fi_g_candidatos b
            ON a.id_cnddto = b.id_cnddto
          JOIN v_si_i_sujetos_impuesto c
            ON b.id_sjto_impsto = c.id_sjto_impsto
         WHERE a.id_instncia_fljo = v_instncia_fljo;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 23;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'Problema al obtener sujeto impuesto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --Se valida si notifica automaticamente
      BEGIN
        SELECT a.ntfccion_atmtca
          INTO v_ntfccion_atmtco
          FROM gn_d_actos_tipo_tarea a
         WHERE a.cdgo_clnte = p_cdgo_clnte
           AND a.id_fljo_trea = v_fljo_trea
           AND a.id_acto_tpo = v_id_acto_tpo;

      EXCEPTION
        WHEN others THEN
          NULL;

      END;

      v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => '[{"ID_SJTO_IMPSTO": ' ||
                                                                     v_id_sjto_impsto || ',
                                                                          "ID_INSTNCIA_FLJO": ' ||
                                                                     v_instncia_fljo || ',
                                                                          "IDNTFCCION": ' ||
                                                                     v_idntfccion_sjto || ',
                                                                          "ID_ACTO_TPO": ' ||
                                                                     v_id_acto_tpo || '
                                                                        }]',
                                                     p_id_plntlla => v_id_plntlla);

      BEGIN
        prc_rg_expediente_acto(p_cdgo_clnte                => p_cdgo_clnte,
                               p_id_usrio                  => p_id_usrio, --se cambio el p_id_usrio
                               p_id_fljo_trea              => v_fljo_trea,
                               p_id_plntlla                => v_id_plntlla,
                               p_id_acto_tpo               => v_id_acto_tpo,
                               p_id_fsclzcion_expdnte      => v_id_fsclzcion_expdnte,
                               p_dcmnto                    => v_dcmnto,
                               p_json                      => p_json,
                               o_id_fsclzcion_expdnte_acto => o_id_fsclzcion_expdnte_acto,
                               o_cdgo_rspsta               => o_cdgo_rspsta,
                               o_mnsje_rspsta              => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 24;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'Problema al llamar al procedimiento prc_rg_expediente_acto ' ||
                            ' , ' || p_json;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      BEGIN
        prc_rg_acto(p_cdgo_clnte                => p_cdgo_clnte,
                    p_id_usrio                  => p_id_usrio, --p_id_fncnrio,
                    p_id_fsclzcion_expdnte_acto => o_id_fsclzcion_expdnte_acto,
                    p_id_cnddto                 => p_id_cnddto,
                    o_cdgo_rspsta               => o_cdgo_rspsta,
                    o_mnsje_rspsta              => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 25;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'Problema al llamar al procedimiento prc_rg_acto ' ||
                            ' , ' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_expediente',
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

    --v_id_acto_tpo := c_acto.id_acto_tpo;
    END LOOP; -- Cursor para generar mas de un acto en autor de apertura

  END prc_rg_expediente;

  PROCEDURE prc_rg_expediente_acto(p_cdgo_clnte                IN df_s_clientes.cdgo_clnte%TYPE,
                                   p_id_usrio                  IN sg_g_usuarios.id_usrio%TYPE,
                                   p_id_fljo_trea              IN wf_d_flujos_tarea.id_fljo_trea%TYPE,
                                   p_id_plntlla                IN gn_d_plantillas.id_plntlla%TYPE,
                                   p_id_acto_tpo               IN number,
                                   p_id_fsclzcion_expdnte      IN number,
                                   p_dcmnto                    IN CLOB,
                                   p_id_fsclzcion_expdnte_acto IN number,
                                   p_json                      IN CLOB DEFAULT NULL,
                                   o_id_fsclzcion_expdnte_acto OUT number,
                                   o_cdgo_rspsta               OUT number,
                                   o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_id_acto_rqrdo number;

    v_id_acto_tpo_rqrdo number;

    v_id_rprte number;

    v_id_fncnrio number;

    v_id_usrio number;

    v_id_acto_tpo number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_expediente_acto';

    v_mnsje_log varchar2(4000);

    v_json_parametros CLOB;

    v_dcmnto CLOB;

    --v_json              clob;
    v_cdgo_rspsta number;

    v_mnsje_rspsta varchar2(4000);

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp || ' JSON: ' ||
                          p_json,
                          6);

    IF p_dcmnto IS NULL THEN
      o_cdgo_rspsta := 23;

      o_mnsje_rspsta := 'Se debe cargar la plantilla en el documento'; --agregar grilla de errores

      ROLLBACK;

      RETURN;

    END IF;

    BEGIN
      SELECT a.id_prgrma, a.id_sbprgrma
        INTO v_id_prgrma, v_id_sbprgrma
        FROM v_fi_g_fiscalizacion_expdnte a
       WHERE a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al consultar el programa y sub-programa';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    IF p_id_fsclzcion_expdnte_acto IS NULL THEN
      --Se valida si el acto que se va a generar tiene un acto requerido
      BEGIN
        SELECT b.id_acto_tpo_rqrdo, a.id_rprte
          INTO v_id_acto_tpo_rqrdo, v_id_rprte
          FROM gn_d_plantillas a
         INNER JOIN gn_d_actos_tipo_tarea b
            ON b.id_acto_tpo = a.id_acto_tpo
          LEFT JOIN fi_d_programas_acto c
            ON b.id_acto_tpo_rqrdo = c.id_acto_tpo
           AND c.id_prgrma = v_id_prgrma
           AND c.id_sbprgrma = v_id_sbprgrma
         WHERE a.cdgo_clnte = p_cdgo_clnte
           AND b.id_fljo_trea = p_id_fljo_trea
           AND a.id_plntlla = p_id_plntlla;

      EXCEPTION
        WHEN others THEN
          NULL;

      END;

      --Se obtiene el acto que es requerido
      IF v_id_acto_tpo_rqrdo IS NOT NULL THEN
        BEGIN
          SELECT id_acto
            INTO v_id_acto_rqrdo
            FROM fi_g_fsclzcion_expdnte_acto
           WHERE id_acto_tpo = v_id_acto_tpo_rqrdo
             AND id_fsclzcion_expdnte = p_id_fsclzcion_expdnte;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo obtener el acto padre';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

      END IF;

      --se consulta el id funcionario
      BEGIN
        SELECT id_fncnrio
          INTO v_id_fncnrio
          FROM sg_g_usuarios a
          JOIN si_c_terceros b
            ON b.id_trcro = a.id_trcro
          JOIN df_c_funcionarios c
            ON c.id_trcro = b.id_trcro
         WHERE id_usrio = p_id_usrio;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 222;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No existe funcionario.. para Id Usuario: ' ||
                            p_id_usrio;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --IF pkg_gn_generalidades.fnc_vl_html(p_html => p_dcmnto) = TRUE THEN
      IF TRUE = TRUE THEN
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              'fnc_html_escape Entro ' ||
                              p_id_fsclzcion_expdnte || '-' || systimestamp,
                              6);

        --v_dcmnto := pkg_gn_generalidades.fnc_html_escape(p_html => p_dcmnto);
        v_dcmnto := p_dcmnto;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              'fnc_html_escape Salio ' ||
                              p_id_fsclzcion_expdnte || '-' || systimestamp,
                              6);

        --Se inserta el acto
        BEGIN
          INSERT INTO fi_g_fsclzcion_expdnte_acto
            (id_fljo_trea,
             id_plntlla,
             id_rprte,
             id_acto_rqrdo,
             id_acto_tpo,
             id_fsclzcion_expdnte,
             dcmnto,
             indcdor_aplcdo,
             fcha_crcion,
             id_fncnrio)
          VALUES
            (p_id_fljo_trea,
             p_id_plntlla,
             v_id_rprte,
             v_id_acto_rqrdo,
             p_id_acto_tpo,
             p_id_fsclzcion_expdnte,
             v_dcmnto,
             'N',
             sysdate,
             v_id_fncnrio)
          RETURNING id_fsclzcion_expdnte_acto INTO o_id_fsclzcion_expdnte_acto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo registrar el expediente acto.. ' ||
                              ' , ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --Dividimos el documento (v_dcmnto) en detalles
        BEGIN
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                'prc_html_dividir Entro ' ||
                                p_id_fsclzcion_expdnte || '-' ||
                                systimestamp,
                                6);

          pkg_gn_generalidades.prc_html_dividir(p_html         => v_dcmnto,
                                                p_tmno         => 10000,
                                                o_cdgo_mnsje   => v_cdgo_rspsta,
                                                o_mnsje_rspsta => v_mnsje_rspsta);

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                'prc_html_dividir Salio ' ||
                                p_id_fsclzcion_expdnte || '-' ||
                                systimestamp || '-' || v_cdgo_rspsta,
                                6);

          IF v_cdgo_rspsta > 0 THEN
            o_mnsje_rspsta := v_cdgo_rspsta || ': ' ||
                              'Problemas al dividir el documento' || ' - ' ||
                              v_mnsje_rspsta || ' , ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);

          ELSE
            --Insertamos el detalle del documento
            FOR c_dcmnto_dtlle IN (SELECT n001 AS orden, clob001 AS dcmnto
                                     FROM apex_collections
                                    WHERE collection_name = 'DATOS'
                                    ORDER BY orden) LOOP

              begin

                insert into fi_g_fsclzcion_expdnte_acto_det
                  (id_fsclzcion_expdnte_acto, orden, dcmnto)
                values
                  (o_id_fsclzcion_expdnte_acto,
                   c_dcmnto_dtlle.orden,
                   c_dcmnto_dtlle.dcmnto);
              exception
                when others then
                  o_cdgo_rspsta := 3;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'No se pudo registrar el fi_g_fsclzcion_expdnte_acto_det.. ' ||
                                    ' , ' || sqlerrm;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  rollback;

                  return;
              end;

            END LOOP;

          END IF;

        END;

      else
        o_cdgo_rspsta := 4;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al validar el html';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              p_dcmnto,
                              6);

        ROLLBACK;

        RETURN;

      END IF;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            'p_json ' || p_json,
                            6);

      IF (p_json IS JSON) THEN
        FOR c_vgncia IN (SELECT vgncia, id_prdo
                           FROM json_table(p_json,
                                           '$.VGNCIA[*]'
                                           columns(vgncia varchar2 PATH
                                                   '$.VGNCIA',
                                                   id_prdo varchar2 PATH
                                                   '$.ID_PRDO'))) LOOP
          BEGIN
            INSERT INTO fi_g_fsclzcion_acto_vgncia
              (id_fsclzcion_expdnte_acto, vgncia, id_prdo)
            VALUES
              (o_id_fsclzcion_expdnte_acto,
               c_vgncia.vgncia,
               c_vgncia.id_prdo);

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 3;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'No se pudo registrar las vigencias del acto';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

        END LOOP;

      END IF;

      --Se conculta si el acto esta parametrizado para revision
      BEGIN
        SELECT id_fncnrio, id_acto_tpo
          INTO v_id_fncnrio, v_id_acto_tpo
          FROM fi_d_actos_revision a
         WHERE a.id_acto_tpo = p_id_acto_tpo
           AND a.indcdor_rvsion = 'S';

      EXCEPTION
        WHEN others THEN
          NULL;

      END;

      --Si el acto esta parametrizado para revision se manda una alerta
      IF v_id_acto_tpo IS NOT NULL THEN
        --Se envia la alerta
        BEGIN
          SELECT json_object(KEY 'id_fncnrio' IS v_id_fncnrio,
                             KEY 'id_acto_tpo' IS v_id_acto_tpo)
            INTO v_json_parametros
            FROM dual;

          pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => p_cdgo_clnte,
                                                p_idntfcdor    => 'pkg_fi_fiscalizacion.prc_rg_expediente_acto',
                                                p_json_prmtros => v_json_parametros);

        END;

      END IF;

    ELSE
      BEGIN
        UPDATE fi_g_fsclzcion_expdnte_acto
           SET dcmnto = p_dcmnto
         WHERE id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

        o_id_fsclzcion_expdnte_acto := p_id_fsclzcion_expdnte_acto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el contenido del documento';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

    END IF;

  END prc_rg_expediente_acto;

  PROCEDURE prc_rg_acto(p_cdgo_clnte                IN df_s_clientes.cdgo_clnte%TYPE,
                        p_id_usrio                  IN sg_g_usuarios.id_usrio%TYPE,
                        p_id_fsclzcion_expdnte_acto IN number,
                        p_acto_vlor_ttal            IN number DEFAULT 0,
                        p_id_cnddto                 IN number,
                        o_cdgo_rspsta               OUT number,
                        o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_id_acto number;

    v_app_id number := v('APP_ID');

    v_page_id number := v('APP_PAGE_ID');

    v_id_fsclzcion_expdnte number;

    v_id_acto_tpo number;

    v_id_acto_rqrdo number;

    v_id_fncnrio number;

    v_id_rprte number;

    v_id_fljo_trea number;

    v_id_impsto number;

    v_id_sjto_impsto number;

    v_id_dclrcion number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_nmro_cnsctivo varchar2(200); --variable para migracion

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_acto';

    v_nmbre_cnslta varchar2(1000);

    v_nmbre_plntlla varchar2(1000);

    v_cdgo_frmto_plntlla varchar2(10);

    v_cdgo_frmto_tpo varchar2(10);

    v_ntfccion_atmtco varchar2(1);

    v_cdgo_acto_tpo varchar2(10);

    v_cdgo_cnsctvo varchar2(10);

    v_mnsje varchar2(1000);

    v_slct_sjto_impsto CLOB;

    v_slct_vgncias CLOB;

    v_slct_rspnsble CLOB;

    v_json_acto CLOB;

    v_xml CLOB;

    v_blob blob;

    v_user_name sg_g_usuarios.user_name%TYPE;

    v_id_instncia_fljo number;

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se valida si el acto ya fue generado
    BEGIN
      SELECT a.id_acto
        INTO v_id_acto
        FROM fi_g_fsclzcion_expdnte_acto a
       WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto
         AND NOT a.id_acto IS NULL;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    IF v_id_acto IS NOT NULL THEN
      o_cdgo_rspsta := 1;

      o_mnsje_rspsta := 'El acto ya fue generado ' ||
                        p_id_fsclzcion_expdnte_acto;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      ROLLBACK;

      RETURN;

    END IF;

    BEGIN
      SELECT c.id_impsto, d.id_fsclzcion_expdnte, d.id_instncia_fljo
        INTO v_id_impsto, v_id_fsclzcion_expdnte, v_id_instncia_fljo
        FROM fi_g_candidatos c
        JOIN fi_g_fiscalizacion_expdnte d
          ON c.id_cnddto = d.id_cnddto
       WHERE c.id_cnddto = p_id_cnddto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se puedo obtener el impuesto para generar el acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    BEGIN
      SELECT a.id_sjto_impsto
        INTO v_id_sjto_impsto
        FROM fi_g_candidatos a
       WHERE a.id_cnddto = p_id_cnddto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se puedo obtener el sujeto impuesto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se obtiene el sub_impuesto y sujeto_impuesto
    BEGIN
      v_slct_sjto_impsto := 'select id_impsto_sbmpsto,
                                      id_sjto_impsto
                               from fi_g_candidatos
                               where id_cnddto = ' ||
                            p_id_cnddto || '';

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo generar la consulta de los sujestos impuestos';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se obtienen las vigencias
    BEGIN
      /*v_slct_vgncias := 'select  nvl(c.id_sjto_impsto, a.id_sjto_impsto) id_sjto_impsto,
                 b.vgncia,
                 b.id_prdo,
                 nvl(c.vlor_sldo_cptal, 0)   vlor_cptal,
                 nvl(c.vlor_intres, 0)       vlor_intres
         from fi_g_candidatos                    a
         inner join fi_g_candidatos_vigencia     b on a.id_cnddto = b.id_cnddto
         join fi_g_fsclzc_expdn_cndd_vgnc        d on b.id_cnddto_vgncia = d.id_cnddto_vgncia
         left  join v_gf_g_cartera_x_vigencia    c on a.id_sjto_impsto = c.id_sjto_impsto
                                                    and b.vgncia = c.vgncia and b.id_prdo = c.id_prdo
         where a.id_cnddto = ' ||
      p_id_cnddto || '
         group by nvl(c.id_sjto_impsto, a.id_sjto_impsto),
                  b.vgncia,
                  b.id_prdo,
                  nvl(c.vlor_sldo_cptal, 0),
                  nvl(c.vlor_intres, 0)';*/
      v_slct_vgncias := 'select  --nvl(c.id_sjto_impsto, a.id_sjto_impsto) id_sjto_impsto,
                                   a.id_sjto_impsto,
                                   b.vgncia,
                                   b.id_prdo,
                                   nvl(c.vlor_sldo_cptal, 0)   vlor_cptal,
                                   nvl(c.vlor_intres, 0)       vlor_intres
                           from fi_g_candidatos                    a
                           inner join fi_g_candidatos_vigencia     b on a.id_cnddto = b.id_cnddto
                           join fi_g_fsclzc_expdn_cndd_vgnc        d on b.id_cnddto_vgncia = d.id_cnddto_vgncia
                           left  join v_gf_g_cartera_x_vigencia    c on a.cdgo_clnte = c.cdgo_clnte
                                                                     and a.id_impsto = c.id_impsto
                                                                     and a.id_impsto_sbmpsto = c.id_impsto_sbmpsto
                                                                     and b.vgncia = c.vgncia
                                                                     and b.id_prdo = c.id_prdo
                                                                     and a.id_sjto_impsto = c.id_sjto_impsto
                           where a.id_cnddto = ' ||
                        p_id_cnddto || '
                           group by --nvl(c.id_sjto_impsto, a.id_sjto_impsto),
                                    a.id_sjto_impsto,
                                    b.vgncia,
                                    b.id_prdo,
                                    nvl(c.vlor_sldo_cptal, 0),
                                    nvl(c.vlor_intres, 0)';

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo generar la consulta de las vigencias';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se obtiene los responsables
    BEGIN
      v_slct_rspnsble := 'select  b.idntfccion_rspnsble idntfccion,
                                b.prmer_nmbre,
                                b.sgndo_nmbre,
                                b.prmer_aplldo,
                                b.sgndo_aplldo,
                                b.cdgo_idntfccion_tpo,
                                nvl(b.drccion_ntfccion , b.drccion) drccion_ntfccion,
                                b.id_pais id_pais_ntfccion,
                                b.id_mncpio id_mncpio_ntfccion,
                                b.id_dprtmnto id_dprtmnto_ntfccion,
                                null email,
                                null tlfno
                        from fi_g_candidatos             a
                        join v_si_i_sujetos_responsable  b   on  a.id_sjto_impsto   =   b.id_sjto_impsto
                        where a.id_cnddto = ' ||
                         p_id_cnddto || '
                        and b.prncpal_s_n = ''S''
                        and b.actvo = ''S''';

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 4;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo generar la consulta de los responsables';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se obtiene la informacion de documento
    BEGIN
      SELECT a.id_fsclzcion_expdnte,
             b.id_acto_tpo,
             b.id_acto_rqrdo,
             b.id_fncnrio,
             b.id_rprte,
             b.id_fljo_trea
        INTO v_id_fsclzcion_expdnte,
             v_id_acto_tpo,
             v_id_acto_rqrdo,
             v_id_fncnrio,
             v_id_rprte,
             v_id_fljo_trea
        FROM fi_g_fiscalizacion_expdnte a
        JOIN fi_g_fsclzcion_expdnte_acto b
          ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
       WHERE b.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener la informacion del acto a generar';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se valida si notifica automaticamente
    BEGIN
      BEGIN
        SELECT a.id_prgrma, a.id_sbprgrma
          INTO v_id_prgrma, v_id_sbprgrma
          FROM v_fi_g_fiscalizacion_expdnte a
          JOIN fi_g_fsclzcion_expdnte_acto b
            ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
         WHERE b.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo consultar el programa y sub-programa';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      BEGIN
        SELECT cdgo_acto_tpo
          INTO v_cdgo_acto_tpo
          FROM gn_d_actos_tipo
         WHERE id_acto_tpo = v_id_acto_tpo;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 7;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo consultar el codigo acto tipo';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --ANALIZAR SELECT PARA APLICAR A LOS DEMAS ACTOS QUE NO REQUIEREN ACTOS REQUERIDOS.
      /*select      a.ntfccion_atmtca
      into    v_ntfccion_atmtco
      from        gn_d_actos_tipo_tarea   a
      where       a.cdgo_clnte    =    p_cdgo_clnte
      and         a.id_fljo_trea  =    v_id_fljo_trea
      and         a.id_acto_tpo   =    v_id_acto_tpo;*/
      IF v_cdgo_acto_tpo = 'ADA' OR v_cdgo_acto_tpo = 'ADACH' THEN
        SELECT a.ntfccion_atmtca
          INTO v_ntfccion_atmtco
          FROM gn_d_actos_tipo_tarea a
         WHERE a.cdgo_clnte = p_cdgo_clnte
           AND a.id_fljo_trea = v_id_fljo_trea
           AND a.id_acto_tpo = v_id_acto_tpo;

      ELSE
        SELECT a.ntfccion_atmtca
          INTO v_ntfccion_atmtco
          FROM gn_d_actos_tipo_tarea a
          JOIN fi_d_programas_acto b
            ON a.id_acto_tpo_rqrdo = b.id_acto_tpo
           AND b.id_prgrma = v_id_prgrma
           AND b.id_sbprgrma = v_id_sbprgrma
         WHERE a.cdgo_clnte = p_cdgo_clnte
           AND a.id_fljo_trea = v_id_fljo_trea
           AND a.id_acto_tpo = v_id_acto_tpo;

      END IF;

    EXCEPTION
      WHEN too_many_rows THEN
        o_cdgo_rspsta := 6;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Se encontro mas de un registro al consultar la informacion del acto a generar';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 6;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener la informacion del acto a generar';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se obtiene el codigo del tipo de acto
    BEGIN
      SELECT a.cdgo_acto_tpo
        INTO v_cdgo_acto_tpo
        FROM gn_d_actos_tipo a
       WHERE a.id_acto_tpo = v_id_acto_tpo;

      IF v_cdgo_acto_tpo = 'LODA' OR v_cdgo_acto_tpo = 'LODR' THEN
        SELECT a.id_sjto_impsto
          INTO v_id_sjto_impsto
          FROM fi_g_candidatos a
         WHERE a.id_cnddto = p_id_cnddto;

        FOR c_candidato IN (SELECT a.id_dclrcion_vgncia_frmlrio,
                                   b.id_cnddto_vgncia
                              FROM fi_g_candidatos_vigencia a
                              JOIN fi_g_fsclzc_expdn_cndd_vgnc b
                                ON a.id_cnddto_vgncia = b.id_cnddto_vgncia
                             WHERE a.id_cnddto = p_id_cnddto) LOOP
          --Se consulta la declaracion presentada
          BEGIN
            SELECT id_dclrcion
              INTO v_id_dclrcion
              FROM gi_g_declaraciones a --join gi_d_declaraciones_uso b on a.id_dclrcion_uso = b.id_dclrcion_uso

             WHERE a.id_dclrcion_vgncia_frmlrio =
                   c_candidato.id_dclrcion_vgncia_frmlrio
               AND a.id_sjto_impsto = v_id_sjto_impsto
               AND a.id_cnddto_vgncia = c_candidato.id_cnddto_vgncia
               AND a.cdgo_dclrcion_estdo = 'RLA';

          EXCEPTION
            WHEN no_data_found THEN
              o_cdgo_rspsta := 22;

              o_mnsje_rspsta := 'Relice todas las declaraciones que se estan fiscalizando';

              ROLLBACK;

              RETURN;

            WHEN others THEN
              o_cdgo_rspsta := 23;

              o_mnsje_rspsta := 'No se pudo validar si se realizaron las declaraciones por parte del funcionario';

              ROLLBACK;

              RETURN;

          END;

        END LOOP;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 7;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Problema al obtener el  codigo del tipo de acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        ROLLBACK;

        RETURN;

    END;

    /* --se agrega para migracion
     o_mnsje_rspsta := ' Antes de extraer el consecutivo :  ' ;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl,  o_mnsje_rspsta , 6);
     begin
            select  to_number(REPLACE(c.auto_de_apertura, 'APOC',''))
            into v_nmro_cnsctivo
            from fi_g_fiscalizacion_expdnte a
            join v_fi_g_candidatos b on a.id_cnddto = b.id_cnddto
            join fiscalizados_2016 c on b.idntfccion = c.nit
            where id_fsclzcion_expdnte = v_id_fsclzcion_expdnte;

             o_mnsje_rspsta := ' Valor del consecutivo :  '||v_nmro_cnsctivo ;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl,  o_mnsje_rspsta , 6);
    exception
        when others then
            o_cdgo_rspsta := 7;
            o_mnsje_rspsta  := o_cdgo_rspsta||'-'||'Error al consultar el consecutivo ';
            pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta, 6);
            rollback;
            return;
    end;
        o_mnsje_rspsta := ' despues de extraer el consecutivo :  ' ;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl,  o_mnsje_rspsta , 6);

     o_mnsje_rspsta := 'Nro consecutivo original:' ||v_nmro_cnsctivo ;
    -- o_mnsje_rspsta := 'Nro consecutivo :' ||to_number(v_nmro_cnsctivo) - 1;
     pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta, 6); */ /* begin

                                                                                                      update df_c_consecutivos a set vlor = (to_number(v_nmro_cnsctivo) - 1) where a.cdgo_cnsctvo  = 'FIS';

                                                                                                      select vlor
                                                                                                      into    v_nmro_cnsctivo
                                                                                                      from df_c_consecutivos a where a.cdgo_cnsctvo  = 'FIS';
                                                                                                       o_mnsje_rspsta := 'Nro consecutivo actualizado:' ||v_nmro_cnsctivo ;
                                                                                                       -- o_mnsje_rspsta  := 'Nro consecutivo :' ||to_number(v_nmro_cnsctivo) - 1;
                                                                                                       pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta, 6);
                                                                                                     -- commit;
                                                                                                  exception
                                                                                                      when others then
                                                                                                          o_cdgo_rspsta := 7;
                                                                                                          o_mnsje_rspsta  := o_cdgo_rspsta||'-'||'Erros al actualizar el consecutivo';
                                                                                                          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta, 6);
                                                                                                          rollback;
                                                                                                          return;
                                                                                                  end;*/ --Se construye el json del acto
    BEGIN
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            'Entro a se construye el json del acto - ' ||
                            systimestamp,
                            6);

      v_json_acto := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                           p_cdgo_acto_orgen     => 'FISCA',
                                                           p_id_orgen            => v_id_fsclzcion_expdnte,
                                                           p_id_undad_prdctra    => v_id_fsclzcion_expdnte,
                                                           p_id_acto_tpo         => v_id_acto_tpo,
                                                           p_acto_vlor_ttal      => p_acto_vlor_ttal,
                                                           p_cdgo_cnsctvo        => v_cdgo_acto_tpo,
                                                           p_id_acto_rqrdo_hjo   => NULL,
                                                           p_id_acto_rqrdo_pdre  => v_id_acto_rqrdo,
                                                           p_fcha_incio_ntfccion => sysdate,
                                                           p_id_usrio            => p_id_usrio,
                                                           p_slct_sjto_impsto    => v_slct_sjto_impsto,
                                                           p_slct_vgncias        => v_slct_vgncias,
                                                           p_slct_rspnsble       => v_slct_rspnsble);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            'Salió de construir el json del acto - ' ||
                            systimestamp,
                            6);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 8;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo generar el json para generar el acto ' ||
                          ' , ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se genera el acto
    BEGIN
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            ' Entro a se genera el acto - ' || systimestamp,
                            6);

      pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => p_cdgo_clnte,
                                       p_json_acto    => v_json_acto,
                                       o_id_acto      => v_id_acto,
                                       o_cdgo_rspsta  => o_cdgo_rspsta,
                                       o_mnsje_rspsta => o_mnsje_rspsta);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            ' Salio a se genera el acto - v_id_acto' ||
                            v_id_acto || systimestamp,
                            6);

      IF o_cdgo_rspsta > 0 THEN
        v_mnsje := o_mnsje_rspsta;

        v_mnsje := replace(v_mnsje, '<br/>');

        prc_rg_expediente_error(p_id_cnddto  => p_id_cnddto,
                                p_mnsje      => v_mnsje,
                                p_cdgo_clnte => p_cdgo_clnte,
                                p_id_usrio   => p_id_usrio);

        --    pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_cdgo_rspsta||'-'||o_mnsje_rspsta||' , '||sqlerrm, 6);
        --  rollback;
        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 9;

        o_mnsje_rspsta := 'Error al llamar el procedimiento prc_rg_acto ' ||
                          ' , ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                              ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se actualiza el campo id_acto
    BEGIN
      UPDATE fi_g_fsclzcion_expdnte_acto
         SET id_acto = v_id_acto
       WHERE id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 10;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo actualizar el campo acto en la tabla fiscalizacion expediente acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                              ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    v_xml := '<data>
                <id_fsclzcion_expdnte_acto>' ||
             p_id_fsclzcion_expdnte_acto || '</id_fsclzcion_expdnte_acto>
                <p_id_impsto>' || v_id_impsto ||
             '</p_id_impsto>
                <p_id_fsclzcion_expdnte>' ||
             v_id_fsclzcion_expdnte || '</p_id_fsclzcion_expdnte>
                <cdgo_srie>' || 'FI' ||
             '</cdgo_srie>
                <id_sjto_impsto>' || v_id_sjto_impsto ||
             '</id_sjto_impsto>
                <id_acto>' || v_id_acto ||
             '</id_acto>
                <cdgo_clnte>' || p_cdgo_clnte ||
             '</cdgo_clnte>
                <id_instncia_fljo>' || v_id_instncia_fljo ||
             '</id_instncia_fljo>
                <id_cnddto>' || p_id_cnddto ||
             '</id_cnddto>
                <id_usrio>' || p_id_usrio ||
             '</id_usrio>
              </data>';

    --Se obtiene informacion del reporte
    BEGIN
      SELECT /*+ RESULT_CACHE */
       a.nmbre_cnslta,
       a.nmbre_plntlla,
       a.cdgo_frmto_plntlla,
       a.cdgo_frmto_tpo
        INTO v_nmbre_cnslta,
             v_nmbre_plntlla,
             v_cdgo_frmto_plntlla,
             v_cdgo_frmto_tpo
        FROM gn_d_reportes a
       WHERE a.id_rprte = v_id_rprte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 11;

        o_mnsje_rspsta := 'Problema al obtener informacion del reporte';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                              ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se setean valores de sesion
    BEGIN
      IF v('APP_SESSION') IS NULL THEN
        apex_session.create_session(p_app_id   => 66000,
                                    p_page_id  => 2,
                                    p_username => '1111111112');

      ELSE
        apex_session.attach(p_app_id     => 66000,
                            p_page_id    => 2,
                            p_session_id => v('APP_SESSION'));

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 13;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Error al setear los valores de la sesion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                              ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Seteamos en session los items necesarios para generar el archivo
    BEGIN
      apex_util.set_session_state('P2_XML', v_xml);

      apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);

      apex_util.set_session_state('P2_ID_RPRTE', v_id_rprte);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 14;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Error al setear los valores de la sesion en los items';

        ROLLBACK;

        RETURN;

    END;

    --GENERAMOS EL DOCUMENTO
    BEGIN
      o_mnsje_rspsta := ' Entro a generar el blob del documento - v_nmbre_cnslta : ' ||
                        v_nmbre_cnslta || 'v_nmbre_plntlla :' ||
                        v_nmbre_plntlla || 'v_cdgo_frmto_plntlla: ' ||
                        v_cdgo_frmto_plntlla || 'v_cdgo_frmto_tpo : ' ||
                        v_cdgo_frmto_tpo || systimestamp;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

      v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                             p_report_query_name  => v_nmbre_cnslta,
                                             p_report_layout_name => v_nmbre_plntlla,
                                             p_report_layout_type => v_cdgo_frmto_plntlla,
                                             p_document_format    => v_cdgo_frmto_tpo);

      IF v_blob IS NOT NULL THEN
        BEGIN
          pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                           p_id_acto         => v_id_acto,
                                           p_ntfccion_atmtca => v_ntfccion_atmtco);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 15;

            o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                              'Problemas al ejecutar proceso que actualiza el acto';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ',' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

      ELSE
        o_cdgo_rspsta := 16;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Problemas generando el blob del acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 17;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Problemas generando el documento ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se setean valores de sesion
    BEGIN
      apex_session.attach(p_app_id     => nvl(v_app_id, 66000),
                          p_page_id    => nvl(v_page_id, 2),
                          p_session_id => v('APP_SESSION'));

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 18;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Problemas al crear la sesion de la pagina de destino ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Saliendo' || systimestamp,
                          6);

  END prc_rg_acto;

  PROCEDURE prc_co_expediente_acto(p_cdgo_clnte                IN df_s_clientes.cdgo_clnte%TYPE,
                                   p_id_usrio                  IN sg_g_usuarios.id_usrio%TYPE,
                                   p_id_fsclzcion_expdnte_acto IN number DEFAULT NULL,
                                   o_id_plntlla                OUT number,
                                   o_dcmnto                    OUT CLOB,
                                   o_cdgo_rspsta               OUT number,
                                   o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_co_expediente_acto';

  BEGIN
    BEGIN
      SELECT id_plntlla, dcmnto
        INTO o_id_plntlla, o_dcmnto
        FROM fi_g_fsclzcion_expdnte_acto
       WHERE id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se pudo obtener el contenido del documento';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        RETURN;

    END;

  END prc_co_expediente_acto;

  PROCEDURE prc_el_expediente_acto(p_cdgo_clnte                IN df_s_clientes.cdgo_clnte%TYPE,
                                   p_id_usrio                  IN sg_g_usuarios.id_usrio%TYPE,
                                   p_id_fsclzcion_expdnte_acto IN number,
                                   p_id_fljo_trea              IN number DEFAULT NULL,
                                   o_cdgo_rspsta               OUT number,
                                   o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_el_expediente_acto';

  BEGIN
    BEGIN
      prc_el_funcionario(p_cdgo_clnte   => p_cdgo_clnte,
                         p_id_fncnrio   => NULL,
                         p_id_fljo_trea => p_id_fljo_trea,
                         o_cdgo_rspsta  => o_cdgo_rspsta,
                         o_mnsje_rspsta => o_mnsje_rspsta);

      IF (o_cdgo_rspsta <> 0) THEN
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                              ' , ' || sqlerrm,
                              6);

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'Problema al llamar el procedimiento prc_el_funcionario';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

    END;

    --Se eliminan las porciones del acto
    BEGIN
      DELETE FROM fi_g_fsclzcion_expdnte_acto_det a
       WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'No se pudo eliminar el datalle del documento id_fsclzcion_expdnte_acto ' ||
                          p_id_fsclzcion_expdnte_acto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se eliminan las vigencias del acto
    BEGIN
      DELETE FROM fi_g_fsclzcion_acto_vgncia
       WHERE id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'No se pudo eliminar las vigencias del acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se elimina el acto
    BEGIN
      DELETE FROM fi_g_fsclzcion_expdnte_acto
       WHERE id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := 'No se pudo eliminar expediente acto ' || ',' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        RETURN;

    END;

  END prc_el_expediente_acto;

  PROCEDURE prc_rg_flujo_programa(p_cdgo_clnte       IN number,
                                  p_id_instncia_fljo IN number,
                                  p_id_fncnrio       IN number,
                                  p_id_usrio         IN number,
                                  p_id_fljo_trea     IN number,
                                  p_id_prgrma        IN number,
                                  p_funcionario      IN CLOB,
                                  p_cnddto_vgncia    IN CLOB,
                                  o_cdgo_rspsta      OUT number,
                                  o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_flujo_programa';

    v_id_cnddto_pdre number;

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_id_sjto_impsto number;

    v_id_fljo_hjo number;

    v_id_instncia_fljo_hjo number;

    v_id_cnddto number;

    v_id_fncnrio number;

    v_id_fsclzcion_expdnte number;

    v_id_fljo_trea number;

    v_indcdor_asgndo varchar(3);

    v_cdgo_cnddto_estdo varchar(3);

    v_cdgo_fljo varchar(3);

    v_type varchar2(1000);

    v_mnsje varchar2(1000);

    v_error varchar2(1000);

    v_json CLOB;

  BEGIN
    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    o_cdgo_rspsta := 0;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se obtienen los datos del candidato con su expediente
    BEGIN
      SELECT a.id_fncnrio, a.id_fsclzcion_expdnte
        INTO v_id_fncnrio, v_id_fsclzcion_expdnte
        FROM fi_g_fiscalizacion_expdnte a
        JOIN fi_g_candidatos b
          ON a.id_cnddto = b.id_cnddto
       WHERE a.id_instncia_fljo = p_id_instncia_fljo;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se pudo obtener el expediente del candidato';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se obtiene el flujo de programa que se va a instanciar
    BEGIN
      SELECT b.cdgo_fljo
        INTO v_cdgo_fljo
        FROM fi_d_programas a
        JOIN wf_d_flujos b
          ON a.id_fljo = b.id_fljo
       WHERE a.id_prgrma = p_id_prgrma;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'No se encontro parametrizado el flujo del programa que se va instanciar';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se obtiene los datos para construir el json
    /*begin
        select  a.id_cnddto,
                a.id_impsto,
                a.id_impsto_sbmpsto,
                a.id_sjto_impsto,
                a.indcdor_asgndo,
                a.cdgo_cnddto_estdo
        into    v_id_cnddto_pdre,
                v_id_impsto,
                v_id_impsto_sbmpsto,
                v_id_sjto_impsto,
                v_indcdor_asgndo,
                v_cdgo_cnddto_estdo
        from fi_g_candidatos            a
        join fi_g_fiscalizacion_expdnte b   on  a.id_cnddto =   b.id_cnddto
        where b.id_fsclzcion_expdnte = v_id_fsclzcion_expdnte;
    exception
        when no_data_found then
            o_cdgo_rspsta   := 3;
            o_mnsje_rspsta  :=  'No se encontro los datos del candidatos del expediente ' || v_id_fsclzcion_expdnte;
            pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta ||'-'|| sqlerrm, 6);
            return;
        when others then
            o_cdgo_rspsta   := 4;
            o_mnsje_rspsta  :=  'No se pudo obtener la informacion del candidato';
            pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta ||'-'|| sqlerrm, 6);
            return;
    end;*/ --Se construye el json para registrar candidato
    /*select json_object('ID_CNDDTO_PDRE'         VALUE  v_id_cnddto_pdre,
     'ID_IMPSTO'              VALUE  v_id_impsto,
     'ID_IMPSTO_SBMPSTO'      VALUE  v_id_impsto_sbmpsto,
     'ID_SJTO_IMPSTO'         VALUE  v_id_sjto_impsto,
     'ID_PRGRMA'              VALUE  p_id_prgrma,
     'ID_SBPRGRMA'            VALUE  p_id_sbprgrma,
     'ID_INSTNCIA_FLJO_PDRE'  VALUE  p_id_instncia_fljo,
     'ID_FSCLZCION_EXPDNTE'   VALUE  v_id_fsclzcion_expdnte,
     'VGNCIA'                 VALUE  (select json_arrayagg(
                                      json_object('VGNCIA'                        value   a.vgncia,
                                                  'ID_PRDO'                          value   a.id_prdo,
                                                  'DCLRCION_VGNCIA_FRMLRIO'       value   a.id_dclrcion_vgncia_frmlrio))
                                      from fi_g_candidatos_vigencia a
                                      where a.id_cnddto = v_id_cnddto_pdre
                                      )
    )into v_json
     from dual;*/
    FOR c_cnddto IN (SELECT *
                       FROM json_table(p_cnddto_vgncia,
                                       '$[*]'
                                       columns(id_cnddto_pdre varchar2 PATH
                                               '$.ID_CNDDTO_PDRE',
                                               id_impsto varchar2 PATH
                                               '$.ID_IMPSTO',
                                               id_impsto_sbmpsto varchar2 PATH
                                               '$.ID_IMPSTO_SBMPSTO',
                                               id_sjto_impsto varchar2 PATH
                                               '$.ID_SJTO_IMPSTO',
                                               id_prgrma varchar2 PATH
                                               '$.ID_PRGRMA',
                                               id_sbprgrma varchar2 PATH
                                               '$.ID_SBPRGRMA',
                                               id_instncia_fljo_pdre varchar2 PATH
                                               '$.ID_INSTNCIA_FLJO_PDRE',
                                               id_fsclzcion_expdnte varchar2 PATH
                                               '$.ID_FSCLZCION_EXPDNTE'))) LOOP
      --Se manda a registra el candidato
      BEGIN
        prc_rg_candidato(p_cdgo_clnte   => p_cdgo_clnte,
                         p_id_fncnrio   => p_id_fncnrio,
                         p_cnddto       => p_cnddto_vgncia,
                         p_funcionario  => p_funcionario,
                         p_prgrma       => c_cnddto.id_prgrma,
                         p_sbprgrma     => c_cnddto.id_sbprgrma,
                         o_id_cnddto    => v_id_cnddto,
                         o_cdgo_rspsta  => o_cdgo_rspsta,
                         o_mnsje_rspsta => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          o_cdgo_rspsta := 5;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_mnsje_rspsta := 'Error al llamar el procedimeinto que registra el candidato';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      BEGIN
        prc_rg_expediente(p_cdgo_clnte                => p_cdgo_clnte,
                          p_id_usrio                  => p_id_usrio,
                          p_id_fncnrio                => p_id_fncnrio,
                          p_id_cnddto                 => v_id_cnddto,
                          p_cdgo_fljo                 => v_cdgo_fljo,
                          p_id_fsclzcion_expdnte_pdre => c_cnddto.id_fsclzcion_expdnte,
                          p_json                      => p_cnddto_vgncia,
                          o_cdgo_rspsta               => o_cdgo_rspsta,
                          o_mnsje_rspsta              => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          o_cdgo_rspsta := 6;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 7;

          o_mnsje_rspsta := 'Error al llamar el procedimeinto que registra el expediente';

          RETURN;

      END;

    END LOOP;

  END prc_rg_flujo_programa;

  FUNCTION fnc_cl_obtener_responsables(p_id_instncia_fljo IN number)
    RETURN CLOB AS
    v_select CLOB;

  BEGIN
    v_select := '<table align="center" border="1" style="border-collapse:collapse;">' ||
                '<thead>' || '<tr>' ||
                '<th style="text-align: center; border:1px solid black">' ||
                'Nombre y Apellidos' || '</th>' ||
                '<th style="text-align: center; border:1px solid black">' ||
                'N? CC' || '</th>' ||
                '<th style="text-align: center; border:1px solid black">' ||
                'Cargo' || '</th>' || '</tr>' || '</thead>' || '<tbody>';

    FOR c_rspnsble IN (SELECT c.prmer_nmbre || ' ' || c.prmer_aplldo AS funcionario,
                              c.idntfccion,
                              d.nmbre_prfsion
                         FROM fi_g_candidatos_funcionario a
                         JOIN df_c_funcionarios b
                           ON a.id_fncnrio = b.id_fncnrio
                         JOIN si_c_terceros c
                           ON b.id_trcro = c.id_trcro
                         LEFT JOIN df_s_profesiones d
                           ON c.id_prfsion = d.id_prfsion
                         JOIN fi_g_fiscalizacion_expdnte e
                           ON a.id_cnddto = e.id_cnddto
                        WHERE e.id_instncia_fljo = p_id_instncia_fljo) LOOP
      v_select := v_select || '<tr>' ||
                  '<td style="text-align: center; border:1px solid black">' ||
                  c_rspnsble.funcionario || '</td>' ||
                  '<td style="text-align: center; border:1px solid black">' ||
                  c_rspnsble.idntfccion || '</td>' ||
                  '<td style="text-align: center; border:1px solid black">' ||
                  c_rspnsble.nmbre_prfsion || '</td>' || '</tr>';

    END LOOP;

    v_select := v_select || '<tbody></table>';

    RETURN v_select;

  END fnc_cl_obtener_responsables;

  FUNCTION fnc_vl_sancion(p_cdgo_clnte                 IN number,
                          p_id_sjto_impsto             IN number,
                          p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_sncion_dclrcion number;

    v_sncion number;

    v_id_dclrcion gi_g_declaraciones.id_dclrcion%TYPE;

    v_fcha_prsntcion gi_g_declaraciones.fcha_prsntcion%TYPE;

    v_id_dclrcion_crrccion gi_g_declaraciones.id_dclrcion_crrccion%TYPE;

    v_cdgo_dclrcion_uso gi_g_declaraciones.id_dclrcion_uso%TYPE;

    json_hmlgcion json_object_t;

  BEGIN
    /*begin
        select  id_dclrcion,
                fcha_prsntcion,
                id_dclrcion_crrccion,
                b.cdgo_dclrcion_uso
        into    v_id_dclrcion,
                v_fcha_prsntcion,
                v_id_dclrcion_crrccion,
                v_cdgo_dclrcion_uso
        from gi_g_declaraciones     a
        join gi_d_declaraciones_uso b   on a.id_dclrcion_uso = b.id_dclrcion_uso
        where id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
        and id_sjto_impsto = p_id_sjto_impsto
        and cdgo_dclrcion_estdo in ('PRS', 'APL');
    exception
        when others then
            null;
    end;*/ /*begin

                                                                                                      json_hmlgcion :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS', 921));

                                                                                                      v_sncion_dclrcion := json_hmlgcion.get_string('VASA');

                                                                                                      v_sncion := pkg_gi_sanciones.fnc_ca_valor_sancion(p_cdgo_clnte                  =>  p_cdgo_clnte,
                                                                                                                                                        p_id_dclrcion_vgncia_frmlrio  =>  p_id_dclrcion_vgncia_frmlrio,
                                                                                                                                                        p_idntfccion          =>  json_hmlgcion.get_string('IDEN'),
                                                                                                                                                        p_fcha_prsntcion        =>  to_timestamp(json_hmlgcion.get_string('FLPA')),
                                                                                                                                                        p_id_sjto_tpo                 =>  json_hmlgcion.get_number('SUTP'),
                                                                                                                                                        p_cdgo_sncion_tpo       =>  json_hmlgcion.get_string('CSTP'),
                                                                                                                                                        p_cdgo_dclrcion_uso       =>  v_cdgo_dclrcion_uso,
                                                                                                                                                        p_id_dclrcion_incial      =>  v_id_dclrcion_crrccion,
                                                                                                                                                        p_impsto_crgo         =>  json_hmlgcion.get_number('IMCA'),
                                                                                                                                                        p_ingrsos_brtos         =>  json_hmlgcion.get_number('INBR'),
                                                                                                                                                        p_saldo_favor         =>  json_hmlgcion.get_string('SAFV'));

                                                                                                      if v_sncion_dclrcion = v_sncion then
                                                                                                          return 'S';
                                                                                                      end if;

                                                                                                  end;*/
    RETURN 'N';

  END fnc_vl_sancion;

  FUNCTION fnc_co_tabla_auto_archivo(p_id_sjto_impsto             IN number,
                                     p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN CLOB AS
    v_tabla CLOB;

    v_nmbre_rzon_scial varchar2(200);

    v_nombres varchar2(200);

    v_nmbre_sjto_tpo varchar2(200);

    v_idntfccion number;

    v_drccion_ntfccion varchar2(200);

    v_nmbre_mncpio varchar2(200);

    v_nmbre_dprtmnto varchar2(200);

    v_vgncia varchar2(200);

  BEGIN
    SELECT DISTINCT b.nmbre_rzon_scial,
                    d.prmer_nmbre || d.prmer_aplldo,
                    c.nmbre_sjto_tpo,
                    d.idntfccion, --d.drccion_ntfccion,
                    e.nmbre_mncpio,
                    f.nmbre_dprtmnto,
                    a.vgncia
      INTO v_nmbre_rzon_scial,
           v_nombres,
           v_nmbre_sjto_tpo,
           v_idntfccion, --v_drccion_ntfccion,
           v_nmbre_mncpio,
           v_nmbre_dprtmnto,
           v_vgncia
      FROM gi_g_declaraciones a
      JOIN si_i_personas b
        ON a.id_sjto_impsto = b.id_sjto_impsto
      JOIN df_i_sujetos_tipo c
        ON b.id_sjto_tpo = c.id_sjto_tpo
      JOIN si_i_sujetos_responsable d
        ON a.id_sjto_impsto = d.id_sjto_impsto
      JOIN df_s_municipios e
        ON d.id_mncpio_ntfccion = e.id_mncpio
      JOIN df_s_departamentos f
        ON d.id_dprtmnto_ntfccion = f.id_dprtmnto
     WHERE a.id_dclrcion_vgncia_frmlrio = 41
       AND a.id_sjto_impsto = 719417;

    v_tabla := '<table align="center" border="1" style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">FECHA:</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               sysdate ||
               '</td>
                            </tr>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">ESTABLECIMIENTO O RAZON SOCIAL:</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_nmbre_rzon_scial ||
               '</td>
                            </tr>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">PROPIETARIO /  REPRESENTANTE LEGAL</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_nombres ||
               '</td>
                            </tr>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">CLASE CONTRIBUYENTE:</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_nmbre_sjto_tpo ||
               '</td>
                            </tr>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">IDENTIFICACION:  NIT / C.C.</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_idntfccion ||
               '</td>
                            </tr>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">DIRECCION DE NOTIFICACION:</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_drccion_ntfccion ||
               '</td>
                            </tr>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">MUNICIPIO</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_nmbre_mncpio ||
               '</td>
                            </tr>
                            <tr>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">DEPARTAMENTO</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_nmbre_dprtmnto ||
               '</td>
                            </tr>
                            <tr>
                               <td  align="center" style="border-collapse:collapse; border:1px solid black">A?O (S)  GRAVABLE (S):</td>
                                <td  align="center" style="border-collapse:collapse; border:1px solid black">' ||
               v_vgncia || '</td>
                            </tr>
                        </tbody>
                </table>';

    RETURN v_tabla;

  END fnc_co_tabla_auto_archivo;

  FUNCTION fnc_co_tabla(p_id_sjto_impsto   IN number,
                        p_id_instncia_fljo IN number /*p_id_acto_tpo                   in number*/)
    RETURN CLOB AS
    v_tabla CLOB;

    v_idntfccion_sjto_frmtda number;

    v_nmbre_rzon_scial varchar2(300);

    v_drccion varchar2(300);

    v_nmbre_mncpio varchar2(300);

    v_nmbre_dprtmnto varchar2(300);

    v_expediente fi_g_fiscalizacion_expdnte.nmro_expdnte%TYPE;

    v_vgncia varchar2(100);

    v_impsto df_c_impuestos.nmbre_impsto%TYPE;

    v_nmbre_prgrma fi_d_programas.nmbre_prgrma%TYPE;

    v_nmbre_sbprgrma fi_d_subprogramas.nmbre_sbprgrma%TYPE;

    v_email si_i_sujetos_impuesto.email%TYPE;

    v_fcha_aprtra timestamp;

  BEGIN
    BEGIN
      SELECT a.idntfccion_sjto_frmtda,
             b.nmbre_rzon_scial,
             a.drccion_ntfccion,
             a.nmbre_mncpio,
             a.nmbre_dprtmnto,
             a.nmbre_impsto,
             a.email
        INTO v_idntfccion_sjto_frmtda,
             v_nmbre_rzon_scial,
             v_drccion,
             v_nmbre_mncpio,
             v_nmbre_dprtmnto,
             v_impsto,
             v_email
        FROM v_si_i_sujetos_impuesto a
        JOIN si_i_personas b
          ON a.id_sjto_impsto = b.id_sjto_impsto
       WHERE a.id_sjto_impsto = p_id_sjto_impsto;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    --Numero del expediente
    BEGIN
      SELECT a.nmro_expdnte,
             b.nmbre_prgrma,

             b.nmbre_sbprgrma
        INTO v_expediente, v_nmbre_prgrma, v_nmbre_sbprgrma

        FROM fi_g_fiscalizacion_expdnte a
        JOIN v_fi_g_candidatos b
          ON b.id_cnddto = a.id_cnddto
       WHERE a.id_instncia_fljo = p_id_instncia_fljo;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    BEGIN
      SELECT replace(listagg(a.vgncia_prdo, ','), '(ANUAL)', '') AS vigencia_periodo
        INTO v_vgncia
        FROM (SELECT a.vgncia || '(' || listagg(a.dscrpcion, ',') within group(ORDER BY a.vgncia, a.prdo) || ')' AS vgncia_prdo
                FROM v_fi_g_candidatos_vigencia a
                JOIN fi_g_fsclzc_expdn_cndd_vgnc c
                  ON a.id_cnddto_vgncia = c.id_cnddto_vgncia
                JOIN fi_g_fiscalizacion_expdnte b
                  ON a.id_cnddto = b.id_cnddto
               WHERE b.id_instncia_fljo = p_id_instncia_fljo
               GROUP BY a.vgncia, b.fcha_aprtra) a;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    --v_dv := pkg_gi_declaraciones_funciones.fnc_ca_digito_verificacion(v_idntfccion_sjto_frmtda);
    v_tabla := '<table align="center" width="100%" border="1" style="border-collapse:collapse">
                <tbody>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      IMPUESTO:
                    </td>

                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_impsto || '
                    </td>
                  </tr>

                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      EXPEDIENTE:
                    </td>

                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_expediente || '
                    </td>
                  </tr>

                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      PROGRAMA:
                    </td>

                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_nmbre_prgrma || '
                    </td>

                  </tr>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      SUB-PROGRAMA:
                    </td>
                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_nmbre_sbprgrma || '
                    </td>
                  </tr>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      NOMBRE O RAZON SOCIAL:
                    </td>
                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_nmbre_rzon_scial || '
                    </td>
                  </tr>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      IDENTIFICACION:
                    </td>
                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_idntfccion_sjto_frmtda || '
                    </td>
                  </tr>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      DIRECCION:
                    </td>
                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_drccion || '
                    </td>
                  </tr>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      CIUDAD:
                    </td>
                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_nmbre_mncpio || ' - ' ||
               v_nmbre_dprtmnto || '
                    </td>
                  </tr>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      CORREO ELECTRONICO:
                    </td>
                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_email || '
                    </td>
                  </tr>
                  <tr>
                    <td width="35%" align="left" style="padding-left: 5px;">
                      PERIODO(S) GRAVABLE (S):
                    </td>
                    <td width="65%" align="left" style="padding-left: 5px;">
                      ' || v_vgncia || '
                    </td>
                  </tr>
                </tbody>
              </table>';

    RETURN v_tabla;

  END fnc_co_tabla;

  PROCEDURE prc_rg_candidato(p_cdgo_clnte   IN df_s_clientes.cdgo_clnte%TYPE,
                             p_id_fncnrio   IN number,
                             p_cnddto       IN CLOB,
                             p_funcionario  IN CLOB,
                             p_prgrma       IN number,
                             p_sbprgrma     IN number,
                             o_id_cnddto    OUT number,
                             o_cdgo_rspsta  OUT number,
                             o_mnsje_rspsta OUT varchar2) AS
    v_nl number;

    v_id_cnddto_pdre number;

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_id_sjto_impsto number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_id_fljo_trea number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_candidato';

  BEGIN
    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se obtiene el flujo tarea
    BEGIN
      SELECT c.id_fljo_trea
        INTO v_id_fljo_trea
        FROM wf_d_flujos a
        JOIN fi_d_programas b
          ON a.id_fljo = b.id_fljo
        JOIN wf_d_flujos_tarea c
          ON a.id_fljo = c.id_fljo
       WHERE b.id_prgrma = v_id_prgrma
         AND c.indcdor_incio = 'S';

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    FOR c_candidato IN (SELECT id_impsto,
                               id_impsto_sbmpsto,
                               id_sjto_impsto,
                               id_cnddto_pdre,
                               id_fsclzcion_lte
                          FROM JSON_TABLE(p_cnddto,
                                          '$[*]'
                                          COLUMNS(id_impsto varchar2 PATH
                                                  '$.ID_IMPSTO',
                                                  id_impsto_sbmpsto varchar2 PATH
                                                  '$.ID_IMPSTO_SBMPSTO',
                                                  id_sjto_impsto varchar2 PATH
                                                  '$.ID_SJTO_IMPSTO',
                                                  id_cnddto_pdre varchar2 PATH
                                                  '$.ID_CNDDTO_PDRE',
                                                  id_fsclzcion_lte varchar2 PATH
                                                  '$.ID_FSCLZCION_LTE'))) LOOP
      --Se inserta el candidato
      BEGIN
        INSERT INTO fi_g_candidatos
          (cdgo_clnte,
           id_impsto,
           id_impsto_sbmpsto,
           id_sjto_impsto,
           id_fsclzcion_lte,
           id_prgrma,
           id_sbprgrma,
           indcdor_asgndo,
           cdgo_cnddto_estdo,
           id_cnddto_pdre)
        VALUES
          (p_cdgo_clnte,
           c_candidato.id_impsto,
           c_candidato.id_impsto_sbmpsto,
           c_candidato.id_sjto_impsto,
           c_candidato.id_fsclzcion_lte,
           p_prgrma,
           p_sbprgrma,
           'S',
           'ACT',
           c_candidato.id_cnddto_pdre)
        RETURNING id_cnddto INTO o_id_cnddto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo guardar el candidato ' || '-' ||
                            sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

      END;

    END LOOP;

    FOR c_vgncia IN (SELECT vgncia,
                            id_prdo,
                            id_dclrcion_vgncia_frmlrio,
                            id_dclrcion
                       FROM json_table(p_cnddto,
                                       '$.VGNCIA[*]'
                                       columns(vgncia varchar2 PATH
                                               '$.VGNCIA',
                                               id_prdo varchar2 PATH
                                               '$.ID_PRDO',
                                               id_dclrcion_vgncia_frmlrio
                                               varchar2 PATH
                                               '$.DCLRCION_VGNCIA_FRMLRIO',
                                               id_dclrcion varchar2 PATH
                                               '$.ID_DCLRCION'))) LOOP
      --Se inserta las vigencia periodo de los candidatos
      BEGIN
        INSERT INTO fi_g_candidatos_vigencia
          (id_cnddto,
           vgncia,
           id_prdo,
           id_dclrcion_vgncia_frmlrio,
           id_dclrcion)
        VALUES
          (o_id_cnddto,
           c_vgncia.vgncia,
           c_vgncia.id_prdo,
           c_vgncia.id_dclrcion_vgncia_frmlrio,
           c_vgncia.id_dclrcion);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := o_cdgo_rspsta ||
                            ' No se pudo registrar las vigencia periodo del candidato';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

      END;

    END LOOP;

    BEGIN
      FOR c_fncnrio IN (SELECT *
                          FROM table(pkg_gn_generalidades.fnc_ca_split_table(p_cdna           => p_funcionario,
                                                                             p_crcter_dlmtdor => ':'))) LOOP
        BEGIN
          prc_rg_candidato_funcionario(p_cdgo_clnte   => p_cdgo_clnte,
                                       p_id_usrio     => p_id_fncnrio,
                                       p_id_cnddto    => o_id_cnddto,
                                       p_id_fncnrio   => c_fncnrio.cdna,
                                       p_id_fljo_trea => v_id_fljo_trea,
                                       o_cdgo_rspsta  => o_cdgo_rspsta,
                                       o_mnsje_rspsta => o_mnsje_rspsta);

          IF o_cdgo_rspsta > 0 THEN
            o_cdgo_rspsta := 3;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' || o_mnsje_rspsta;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

            RETURN;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 4;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'Error al llamar el procedimiento que asigna los candidatos';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

            RETURN;

        END;

      END LOOP;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'Error al llamar el procedimiento que asigna los candidatos';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

  END prc_rg_candidato;

  PROCEDURE prc_el_candidato(p_cdgo_clnte   IN df_s_clientes.cdgo_clnte%TYPE,
                             p_id_cnddto    IN number,
                             o_cdgo_rspsta  OUT number,
                             o_mnsje_rspsta OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_el_candidato';

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    UPDATE fi_g_candidatos
       SET cdgo_cnddto_estdo = 'INA'
     WHERE id_cnddto = p_id_cnddto;

  EXCEPTION
    WHEN others THEN
      o_cdgo_rspsta := 1;

      o_mnsje_rspsta := 'No se pudo eliminar el candidato';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || '-' || sqlerrm,
                            6);

  END prc_el_candidato;

  PROCEDURE prc_el_funcionario(p_cdgo_clnte   IN number,
                               p_id_fncnrio   IN number,
                               p_id_fljo_trea IN number,
                               o_cdgo_rspsta  OUT number,
                               o_mnsje_rspsta OUT varchar2) AS
    v_nl number;

    v_id_cnddto_fncnrio number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_el_funcionario';

  BEGIN
    o_cdgo_rspsta := 0;

    IF p_id_fncnrio IS NOT NULL THEN
      BEGIN
        SELECT a.id_cnddto_fncnrio
          INTO v_id_cnddto_fncnrio
          FROM fi_g_candidatos_funcionario a
         WHERE a.id_fncnrio = p_id_fncnrio;

      EXCEPTION
        WHEN no_data_found THEN
          NULL;

      END;

      BEGIN
        DELETE fi_g_cnddtos_fncnrio_trza a
         WHERE a.id_cnddto_fncnrio = v_id_cnddto_fncnrio;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := 'No se pudo eliminar la traza';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

      END;

      BEGIN
        DELETE FROM fi_g_candidatos_funcionario a
         WHERE a.id_fncnrio = p_id_fncnrio;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'No se pudo eliminar el funcionario';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

      END;

    ELSE
      FOR c_cnddto_fncnrio IN (SELECT a.id_cnddto_fncnrio
                                 FROM fi_g_cnddtos_fncnrio_trza a
                                WHERE a.id_fljo_trea = p_id_fljo_trea) LOOP
        BEGIN
          DELETE fi_g_cnddtos_fncnrio_trza a
           WHERE a.id_cnddto_fncnrio = c_cnddto_fncnrio.id_cnddto_fncnrio;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 4;

            o_mnsje_rspsta := 'No se pudo eliminar la traza';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

        END;

        BEGIN
          DELETE FROM fi_g_candidatos_funcionario a
           WHERE a.id_cnddto_fncnrio = c_cnddto_fncnrio.id_cnddto_fncnrio;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 5;

            o_mnsje_rspsta := 'No se pudo eliminar el funcionario';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

        END;

      END LOOP;

    END IF;

  END prc_el_funcionario;

  PROCEDURE prc_ac_candidato_vigencia(p_cdgo_clnte       IN df_s_clientes.cdgo_clnte%TYPE,
                                      p_id_dclrcion      IN gi_g_declaraciones.id_dclrcion%TYPE DEFAULT NULL,
                                      p_id_cnddto_vgncia IN number DEFAULT NULL,
                                      o_cdgo_rspsta      OUT number,
                                      o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    v_id_cnddto_vgncia number;

    v_cdgo_prgrma varchar2(3);

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_ac_candidato_vigencia';

    v_id_sjto_impsto gi_g_declaraciones.id_sjto_impsto%TYPE;

    v_id_dclrcion gi_g_declaraciones.id_dclrcion%TYPE;

    v_id_dclrcion_vgncia_frmlrio gi_g_declaraciones.id_dclrcion_vgncia_frmlrio%TYPE;

    v_vgncia gi_g_declaraciones.vgncia%TYPE;

    v_id_prdo gi_g_declaraciones.id_prdo%TYPE;

  BEGIN
    IF p_id_dclrcion IS NOT NULL THEN
      o_cdgo_rspsta := 0;

      v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            'Entrando:' || systimestamp,
                            6);

      BEGIN
        SELECT a.id_sjto_impsto,
               a.id_dclrcion,
               a.id_dclrcion_vgncia_frmlrio,
               a.vgncia,
               a.id_prdo
          INTO v_id_sjto_impsto,
               v_id_dclrcion,
               v_id_dclrcion_vgncia_frmlrio,
               v_vgncia,
               v_id_prdo
          FROM gi_g_declaraciones a
          JOIN gi_d_declaraciones_uso b
            ON a.id_dclrcion_uso = b.id_dclrcion_uso
         WHERE a.id_dclrcion = p_id_dclrcion;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se pudo obtener los datos de la declaraciÃ³n';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

        --return;
      END;

      BEGIN
        SELECT b.id_cnddto_vgncia, a.cdgo_prgrma
          INTO v_id_cnddto_vgncia, v_cdgo_prgrma
          FROM v_fi_g_candidatos a
          JOIN v_fi_g_fiscalizacion_expdnte_dtlle b
            ON a.id_cnddto = b.id_cnddto
         WHERE a.id_sjto_impsto = v_id_sjto_impsto
           AND b.vgncia = v_vgncia
           AND b.id_prdo = v_id_prdo
           AND b.id_dclrcion_vgncia_frmlrio = v_id_dclrcion_vgncia_frmlrio
           AND b.cdgo_expdnte_estdo = 'ABT'
           AND a.cdgo_prgrma IN ('O', 'I');

      EXCEPTION
        WHEN no_data_found THEN
          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := 'No se pudo obtener los datos del candidato';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

      END;

      IF v_id_dclrcion IS NOT NULL THEN
        IF v_cdgo_prgrma IN ('O', 'I') THEN
          BEGIN
            UPDATE fi_g_fsclzc_expdn_cndd_vgnc a
               SET a.estdo = 'P', a.id_dclrcion = v_id_dclrcion
             WHERE a.id_cnddto_vgncia = v_id_cnddto_vgncia;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 2;

              o_mnsje_rspsta := 'No se pudo actualizar el estado datos de la declaraciÃ³n';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              RETURN;

          END;

        END IF;

      END IF;

    ELSE
      BEGIN
        UPDATE fi_g_fsclzc_expdn_cndd_vgnc a
           SET a.estdo = 'P'
         WHERE a.id_cnddto_vgncia =
               nvl(p_id_cnddto_vgncia, v_id_cnddto_vgncia);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := 'No se pudo actualizar el estado datos de la declaraciÃ³n';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

      END;

    END IF;

  END prc_ac_candidato_vigencia;

  FUNCTION fnc_co_tbla_fncnrio_rspnsble(p_id_fncnrio IN CLOB) RETURN CLOB AS
    v_fncnrio varchar2(200);

    v_idntfccion number;

    v_nmbre_prfsion varchar2(200);

    v_select CLOB;

  BEGIN
    v_select := '<table align="center" border="1" style="border-collapse:collapse;">' ||
                '<thead>' || '<tr>' ||
                '<th style="text-align: center; border:1px solid black">' ||
                'Nombre y Apellidos' || '</th>' ||
                '<th style="text-align: center; border:1px solid black">' ||
                'N? CC' || '</th>' ||
                '<th style="text-align: center; border:1px solid black">' ||
                'Cargo' || '</th>' || '</tr>' || '</thead>' || '<tbody>';

    FOR c_fncnrio IN (SELECT *
                        FROM table(pkg_gn_generalidades.fnc_ca_split_table(p_cdna           => p_id_fncnrio,
                                                                           p_crcter_dlmtdor => ':'))) LOOP
      BEGIN
        SELECT a.prmer_nmbre || ' ' || a.prmer_aplldo AS funcionario,
               a.idntfccion,
               b.nmbre_prfsion
          INTO v_fncnrio, v_idntfccion, v_nmbre_prfsion
          FROM si_c_terceros a
          LEFT JOIN df_s_profesiones b
            ON a.id_prfsion = b.id_prfsion
         WHERE a.id_trcro =
               (SELECT c.id_trcro
                  FROM df_c_funcionarios c
                 WHERE c.id_fncnrio = c_fncnrio.cdna);

      EXCEPTION
        WHEN others THEN
          v_select := v_select || '<tbody></table>';

          RETURN v_select;

      END;

      v_select := v_select || '<tr>' ||
                  '<td style="text-align: center; border:1px solid black">' ||
                  v_fncnrio || '</td>' ||
                  '<td style="text-align: center; border:1px solid black">' ||
                  v_idntfccion || '</td>' ||
                  '<td style="text-align: center; border:1px solid black">' ||
                  nvl(v_nmbre_prfsion, 'No Registra') || '</td>' || '</tr>';

    END LOOP;

    v_select := v_select || '<tbody></table>';

    RETURN v_select;

  END fnc_co_tbla_fncnrio_rspnsble;

  PROCEDURE prc_rg_liquidacion(p_cdgo_clnte                IN number,
                               p_id_usrio                  IN number,
                               p_id_fsclzcion_expdnte      IN number,
                               p_id_fsclzcion_expdnte_acto IN number DEFAULT NULL,
                               p_tpo_fiscalizacion         IN varchar2 DEFAULT 'DC',
                               o_vlor_ttal                 OUT number,
                               o_cdgo_rspsta               OUT number,
                               o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_id_lqdcion_tpo number;

    v_id_lqdcion number;

    v_id_acto_tpo number;

    --agregador para mejor
    v_id_acto_rqrdo number;

    v_id_acto_actual number;

    ---fin----
    v_id_impsto number;

    v_vlor_lqddo number;

    v_vlor_sncion_mnmo number;

    v_id_impsto_acto_cncp_bse number;

    v_bse_grvble number;

    v_lqdcion_mnma number;

    v_lqdcion_mxma number;

    v_id_cnddto number;

    v_id_fljo_trea number;

    v_rdndeo df_s_redondeos_expresion.exprsion%TYPE;

    v_mnsje_log varchar2(4000);

    v_cdgo_prdcdad varchar2(5);

    v_cdgo_fljo varchar2(5);

    v_cdgo_acto_tpo varchar2(10);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_liquidacion';

    v_vlor_trfa gi_d_tarifas_esquema.vlor_trfa%TYPE;

    v_txto_trfa gi_d_tarifas_esquema.txto_trfa%TYPE;

    v_dvsor_trfa gi_d_tarifas_esquema.dvsor_trfa%TYPE;

    v_nmbre_impsto_acto varchar2(100);

    v_nmbre_frmlrio varchar2(500);

    --agregado para mejora
    v_cdgo_indcdor_tpo_lqdccion varchar2(100);

    v_vlor_cdgo_indcdor_tpo_lqd number;

    v_vlor_lqdcion_mnma number;

    v_vlor_lqdcion_mxma number;

    v_cdgo_tpo_bse_sncion varchar2(10);

    v_cdgo_acto_tpo_LODA varchar2(10);

  BEGIN
    o_vlor_ttal := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se obtiene el impuesto
    BEGIN
      SELECT id_impsto
        INTO v_id_impsto
        FROM v_fi_g_fiscalizacion_expdnte
       WHERE id_fsclzcion_expdnte = p_id_fsclzcion_expdnte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 11;

        o_mnsje_rspsta := 'No se pudo consultar el impuesto del expediente No. ' ||
                          p_id_fsclzcion_expdnte;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se obtiene el tipo de liquidación
    BEGIN
      SELECT a.id_lqdcion_tpo
        INTO v_id_lqdcion_tpo
        FROM df_i_liquidaciones_tipo a
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND a.id_impsto = v_id_impsto
         AND a.cdgo_lqdcion_tpo = 'FI';

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se encontro parametrizada el tipo de liquidación FI para el cliente';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se obtiene el código del flujo que se va a instanciar
    BEGIN
      SELECT b.cdgo_fljo
        INTO v_cdgo_fljo
        FROM fi_d_programas a
        JOIN wf_d_flujos b
          ON a.id_fljo = b.id_fljo
       WHERE a.id_prgrma =
             (SELECT a.id_prgrma
                FROM fi_g_candidatos a
               WHERE a.id_cnddto =
                     (SELECT c.id_cnddto
                        FROM fi_g_fiscalizacion_expdnte c
                       WHERE c.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte));

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se encontro parametrizado el flujo del programa ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'No se pudo obtener el flujo del programa  , ' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    BEGIN
      SELECT a.id_acto_tpo   AS id_acto_rqrdo,
             b.id_acto_tpo   AS id_acto_actual,
             c.cdgo_acto_tpo
        INTO v_id_acto_rqrdo, v_id_acto_actual, v_cdgo_acto_tpo
        FROM fi_g_fsclzcion_expdnte_acto a
        JOIN fi_g_fsclzcion_expdnte_acto b
          ON b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte

         AND a.id_acto = b.id_acto_rqrdo
        JOIN gn_d_actos_tipo c
          ON b.id_acto_tpo = c.id_acto_tpo
       WHERE b.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto
         AND a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 11;

        o_mnsje_rspsta := 'No se pudo consultar el tipo de acto del expediente' ||
                          p_id_fsclzcion_expdnte;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    o_mnsje_rspsta := 'v_id_acto_rqrdo : ' || v_id_acto_rqrdo || '-' ||
                      'v_id_acto_actual : ' || v_id_acto_actual || '-' ||
                      'v_cdgo_acto_tpo : ' || v_cdgo_acto_tpo;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || '-' || sqlerrm,
                          6);

    IF v_cdgo_acto_tpo = 'CEJE' THEN
      v_id_acto_tpo := v_id_acto_rqrdo;

    ELSE
      v_id_acto_tpo := v_id_acto_actual;

    END IF;

    BEGIN
      SELECT c.cdgo_acto_tpo
        INTO v_cdgo_acto_tpo_LODA
        FROM gn_d_actos_tipo c
       WHERE c.id_acto_tpo = nvl(v_id_acto_actual, v_id_acto_rqrdo);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 11;

        o_mnsje_rspsta := 'No se pudo consultar el tipo de acto LODA' ||
                          p_id_fsclzcion_expdnte;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    IF v_cdgo_acto_tpo_LODA = 'LODA' THEN
      BEGIN
        SELECT c.id_acto_tpo, c.cdgo_acto_tpo
          INTO v_id_acto_tpo, v_cdgo_acto_tpo_LODA
          FROM gn_d_actos_tipo c
         WHERE c.cdgo_acto_tpo = 'RXD';

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 11;

          o_mnsje_rspsta := 'No se pudo consultar el tipo de acto RXD' ||
                            p_id_fsclzcion_expdnte;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

    END IF;

    o_mnsje_rspsta := 'antes de entrar al cursor v_cdgo_fljo: ' ||
                      v_cdgo_fljo || 'v_id_acto_tpo: ' || v_id_acto_tpo ||
                      'p_id_fsclzcion_expdnte: ' || p_id_fsclzcion_expdnte ||
                      'v_cdgo_acto_tpo_LODA: ' || v_cdgo_acto_tpo_LODA;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || '-' || sqlerrm,
                          6);

    --Expediente con el tipo de acto que se va a liquidar

    FOR c_vgncia IN (SELECT a.id_fsclzcion_expdnte,
                            c.id_impsto,
                            c.id_impsto_sbmpsto,
                            c.id_sjto_impsto,
                            a.vgncia,
                            a.id_prdo,
                            a.prdo,
                            a.bse,
                            a.id_acto_tpo,
                            a.nmro_mses
                       FROM fi_g_fiscalizacion_sancion a
                       JOIN fi_g_fiscalizacion_expdnte b
                         ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
                       JOIN fi_g_candidatos c
                         ON b.id_cnddto = c.id_cnddto
                      WHERE a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte
                        AND CASE
                              WHEN v_cdgo_fljo != 'FOL' AND
                                   a.id_acto_tpo = v_id_acto_tpo THEN
                               1
                              WHEN v_cdgo_fljo = 'FOL' AND
                                   a.id_acto_tpo = a.id_acto_tpo THEN
                               1 /*when v_cdgo_fljo = 'FIO' and v_cdgo_acto_tpo = 'LODA' then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            1*/
                              ELSE
                               0
                            END = 1 --and a.id_acto_tpo = v_id_acto_tpo

                      GROUP BY a.id_fsclzcion_expdnte,
                               c.id_impsto,
                               c.id_impsto_sbmpsto,
                               c.id_sjto_impsto,
                               a.vgncia,
                               a.id_prdo,
                               a.prdo,
                               a.bse,
                               a.id_acto_tpo,
                               a.nmro_mses) LOOP
      o_mnsje_rspsta := 'Entro al cursor c_vgncia ';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || '-' || sqlerrm,
                            6);

      --Se obtiene el código del tipo de acto que se va a liquidar
      BEGIN
        SELECT b.cdgo_acto_tpo
          INTO v_cdgo_acto_tpo
          FROM gn_d_actos_tipo b
         WHERE b.cdgo_clnte = p_cdgo_clnte
           AND b.id_acto_tpo = c_vgncia.id_acto_tpo; --NOTA modificar select para procesar los impuestos liquidados

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := 'No se encontro el tipo de acto que se va a liquidar';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'Problema al obtener el tipo de acto que se va a liquidar';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --Se obtiene el código de periodicidad
      BEGIN
        SELECT cdgo_prdcdad
          INTO v_cdgo_prdcdad
          FROM df_i_periodos
         WHERE id_prdo = c_vgncia.id_prdo;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := 'No se encontro código de periodicidad para la vigencia ' ||
                            c_vgncia.vgncia || ' y período ' ||
                            c_vgncia.prdo || ' debe parametrizarlo';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        WHEN too_many_rows THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'Se encontro parametrizado mas de un código de periodicidad para la vigencia ' ||
                            c_vgncia.vgncia || ' y período ' ||
                            c_vgncia.prdo;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --Se registra la liquidación
      BEGIN
        INSERT INTO gi_g_liquidaciones
          (cdgo_clnte,
           id_impsto,
           id_impsto_sbmpsto,
           vgncia,
           id_prdo,
           id_sjto_impsto,
           fcha_lqdcion,
           cdgo_lqdcion_estdo,
           bse_grvble,
           id_lqdcion_tpo,
           cdgo_prdcdad,
           vlor_ttal,
           id_usrio,
           nmro_mses)
        VALUES
          (p_cdgo_clnte,
           c_vgncia.id_impsto,
           c_vgncia.id_impsto_sbmpsto,
           c_vgncia.vgncia,
           c_vgncia.id_prdo,
           c_vgncia.id_sjto_impsto,
           sysdate,
           'L',
           c_vgncia.bse,
           v_id_lqdcion_tpo,
           v_cdgo_prdcdad,
           0,
           p_id_usrio,
           c_vgncia.nmro_mses)
        RETURNING id_lqdcion INTO v_id_lqdcion;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                            'No se pudo generar la liquidación ' ||
                            v_id_lqdcion || ' , ' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      IF p_tpo_fiscalizacion = 'LQ' THEN
        BEGIN
          SELECT b.id_acto_tpo
            INTO v_id_acto_tpo
            FROM fi_g_fiscalizacion_expdnte a
            JOIN fi_g_fsclzcion_expdnte_acto b
              ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
           WHERE b.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 5;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo obtener la información del acto a generar';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

      END IF;

      o_mnsje_rspsta := 'Antes de entrar al cursor c_cncpto p_tpo_fiscalizacion:' ||
                        p_tpo_fiscalizacion || ', p_id_fsclzcion_expdnte:' ||
                        p_id_fsclzcion_expdnte || ', c_vgncia.id_prdo:' ||
                        c_vgncia.id_prdo || ', v_id_acto_tpo:' ||
                        v_id_acto_tpo;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || '-' || sqlerrm,
                            6);

      FOR c_cncpto IN (SELECT a.id_fsclzcion_sncion,
                              a.id_cncpto,
                              a.vgncia,
                              a.id_prdo,
                              a.bse,
                              a.prdo,
                              a.id_impsto_acto_cncpto,
                              a.id_tp_bs_sncn_dcl_vgn_frm,
                              c.id_impsto,
                              c.id_impsto_sbmpsto,
                              c.id_sjto_impsto,
                              a.id_cnddto_vgncia,
                              CASE
                                WHEN p_tpo_fiscalizacion = 'DC' THEN
                                 a.id_acto_tpo
                                WHEN p_tpo_fiscalizacion = 'LQ' THEN
                                 v_id_acto_tpo
                              END AS id_acto_tpo,
                              a.nmro_mses,
                              a.orden
                         FROM fi_g_fiscalizacion_sancion a
                         JOIN fi_g_fiscalizacion_expdnte b
                           ON a.id_fsclzcion_expdnte =
                              b.id_fsclzcion_expdnte
                         JOIN fi_g_candidatos c
                           ON b.id_cnddto = c.id_cnddto
                        WHERE a.id_fsclzcion_expdnte =
                              p_id_fsclzcion_expdnte
                          AND exists
                        (SELECT 1
                                 FROM fi_g_fsclzcion_expdnte_acto e
                                 JOIN fi_g_fsclzcion_acto_vgncia f
                                   ON e.id_fsclzcion_expdnte_acto =
                                      f.id_fsclzcion_expdnte_acto
                                WHERE e.id_fsclzcion_expdnte =
                                      a.id_fsclzcion_expdnte --  and e.id_acto_tpo = nvl(v_id_acto_tpo, a.id_acto_tpo)

                                  AND f.id_prdo = a.id_prdo
                                  AND nvl(f.acptda_jrdca, 'N') = 'N')
                          AND a.id_prdo = c_vgncia.id_prdo
                          AND a.id_acto_tpo =
                              nvl(v_id_acto_tpo, a.id_acto_tpo) --and a.id_acto_tpo =  a.id_acto_tpo

                        ORDER BY a.orden) LOOP
        o_mnsje_rspsta := 'Entro al cursor c_cncpto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        --Se obtiene la información de tarifa esquema
        BEGIN
          SELECT e.vlor_trfa,
                 e.txto_trfa,
                 e.dvsor_trfa,
                 e.id_impsto_acto_cncpto_bse,
                 lqdcion_mnma,
                 lqdcion_mxma,
                 exprsion_rdndeo,
                 e.cdgo_indcdor_tpo_lqdccion,
                 e.vlor_cdgo_indcdor_tpo_lqd, /*pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (e.vlor_lqdcion_mnma *  c_cncpto.nmro_mses ) ,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       p_expresion => exprsion_rdndeo) as vlor_lqdcion_mnma,

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (e.vlor_lqdcion_mxma *  c_cncpto.nmro_mses ) ,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       p_expresion => exprsion_rdndeo) as vlor_lqdcion_mxma,*/
                 e.vlor_lqdcion_mnma,
                 e.vlor_lqdcion_mxma
            INTO v_vlor_trfa,
                 v_txto_trfa,
                 v_dvsor_trfa,
                 v_id_impsto_acto_cncp_bse,
                 v_lqdcion_mnma,
                 v_lqdcion_mxma,
                 v_rdndeo,
                 v_cdgo_indcdor_tpo_lqdccion,
                 v_vlor_cdgo_indcdor_tpo_lqd,
                 v_vlor_lqdcion_mnma,
                 v_vlor_lqdcion_mxma
            FROM v_gi_d_tarifas_esquema e
           where (e.id_impsto_acto_cncpto = c_cncpto.id_impsto_acto_cncpto

                 AND e.id_tp_bs_sncn_dcl_vgn_frm IS NULL OR
                 e.id_impsto_acto_cncpto = c_cncpto.id_impsto_acto_cncpto AND
                 e.id_tp_bs_sncn_dcl_vgn_frm =
                 c_cncpto.id_tp_bs_sncn_dcl_vgn_frm)
             AND (e.cdgo_indcdor_tpo IS NOT NULL AND
                 ((e.indcdor_ecnmco_actual = 'N' AND
                 c_cncpto.vgncia BETWEEN
                 extract(YEAR FROM e.fcha_dsde_cdgo_indcdor_tpo) AND
                 extract(YEAR FROM e.fcha_hsta_cdgo_indcdor_tpo)) OR
                 (e.indcdor_ecnmco_actual = 'S' AND
                 extract(YEAR FROM sysdate) BETWEEN
                 extract(YEAR FROM e.fcha_dsde_cdgo_indcdor_tpo) AND
                 extract(YEAR FROM e.fcha_hsta_cdgo_indcdor_tpo) AND
                 rownum = 1)) OR e.cdgo_indcdor_tpo IS NULL)
             AND (e.cdgo_indcdor_tpo_lqdccion IS NOT NULL AND
                 ((e.indcdor_ecnmco_actual = 'N' AND
                 c_cncpto.vgncia BETWEEN
                 extract(YEAR FROM e.fcha_dsde_cdgo_indcdor_tpo_lqd) AND
                 extract(YEAR FROM e.fcha_hsta_cdgo_indcdor_tpo_lqd)) OR
                 (e.indcdor_ecnmco_actual = 'S' AND
                 extract(YEAR FROM sysdate) BETWEEN
                 extract(YEAR FROM e.fcha_dsde_cdgo_indcdor_tpo_lqd) AND
                 extract(YEAR FROM e.fcha_hsta_cdgo_indcdor_tpo_lqd) AND
                 rownum = 1)) OR e.cdgo_indcdor_tpo_lqdccion IS NULL)
             AND (e.cdgo_indcdor_tpo_bse IS NOT NULL AND
                 ((e.indcdor_ecnmco_actual = 'N' AND
                 c_cncpto.vgncia BETWEEN
                 extract(YEAR FROM e.fcha_dsde_cdgo_indcdor_tpo_bse) AND
                 extract(YEAR FROM e.fcha_hsta_cdgo_indcdor_tpo_bse)) OR
                 (e.indcdor_ecnmco_actual = 'S' AND
                 extract(YEAR FROM sysdate) BETWEEN
                 extract(YEAR FROM e.fcha_dsde_cdgo_indcdor_tpo_bse) AND
                 extract(YEAR FROM e.fcha_hsta_cdgo_indcdor_tpo_bse) AND
                 rownum = 1)) OR e.cdgo_indcdor_tpo_bse IS NULL);

        EXCEPTION
          WHEN no_data_found THEN
            BEGIN
              SELECT a.nmbre_impsto_acto
                INTO v_nmbre_impsto_acto
                FROM v_df_i_impuestos_acto_concepto a
               WHERE a.id_impsto_acto_cncpto =
                     c_cncpto.id_impsto_acto_cncpto;

            EXCEPTION
              WHEN others THEN
                --o_cdgo_rspsta := 5;
                o_mnsje_rspsta := 'Error al consultar el nombre del id_impsto_acto_cncpto ';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

            END;

            BEGIN
              select (a.dscrpcion || ' ' || b.vgncia || '-' || e.prdo)
                INTO v_nmbre_frmlrio
                FROM gi_d_declaraciones_tipo a
                JOIN gi_d_dclrcnes_tpos_vgncias b
                  ON a.id_dclrcn_tpo = b.id_dclrcn_tpo
                JOIN gi_d_dclrcnes_vgncias_frmlr c
                  ON b.id_dclrcion_tpo_vgncia = c.id_dclrcion_tpo_vgncia
                JOIN df_s_periodicidad d
                  ON a.cdgo_prdcdad = d.cdgo_prdcdad
                JOIN df_i_periodos e
                  ON b.id_prdo = e.id_prdo
                JOIN fi_d_tp_bs_sncn_dcl_vgn_frm f
                  ON c.id_dclrcion_vgncia_frmlrio =
                     f.id_dclrcion_vgncia_frmlrio
               WHERE a.cdgo_clnte = p_cdgo_clnte
                 AND c.actvo = 'S'
                 AND f.id_tp_bs_sncn_dcl_vgn_frm =
                     c_cncpto.id_tp_bs_sncn_dcl_vgn_frm;

            EXCEPTION
              WHEN others THEN
                --o_cdgo_rspsta := 5;
                o_mnsje_rspsta := 'Error al consultar el nombre del formulario ';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

            END;

            o_cdgo_rspsta := 4;

            o_mnsje_rspsta := 'El Impuesto Acto Concepto ' ||
                              c_cncpto.id_impsto_acto_cncpto || '-' ||
                              v_nmbre_impsto_acto ||
                              ' asociado al formulario ' || v_nmbre_frmlrio ||
                              ', no tiene Parametrizado valor tarifa y texto tarifa. ' ||
                              c_cncpto.id_tp_bs_sncn_dcl_vgn_frm;

            --o_mnsje_rspsta := 'El impuesto acto concepto id#[' || c_cncpto.id_impsto_acto_cncpto ||'-'|| c_cncpto.id_tp_bs_sncn_dcl_vgn_frm || '], no tiene parametrizado valor tarifa y texto tarifa.';
            o_mnsje_rspsta := lower(o_mnsje_rspsta);

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

          WHEN too_many_rows THEN
            o_cdgo_rspsta := 5;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'El impuesto acto concepto id#[' ||
                              c_cncpto.id_impsto_acto_cncpto ||
                              '], tiene mas de un valor tarifa y texto tarifa parametrizado.';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

          WHEN others THEN
            o_cdgo_rspsta := 6;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              ' No se pudo obtener la tarifa';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --Si es un concpeto que necesita un concepto base para liquidar
        IF v_id_impsto_acto_cncp_bse IS NOT NULL THEN
          BEGIN
            SELECT b.vlor_lqddo
              INTO v_bse_grvble
              FROM gi_g_liquidaciones_concepto b
             WHERE b.id_lqdcion = v_id_lqdcion
               AND b.id_impsto_acto_cncpto = v_id_impsto_acto_cncp_bse;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 6;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' No se pudo obtener la base del impuesto acto concepto base';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

        ELSE
          v_bse_grvble := (CASE
                            WHEN v_cdgo_acto_tpo IN
                                 ('RXD', 'PCM', 'PCN', 'RSELS', 'RSXNI') THEN
                             c_cncpto.bse
                            WHEN v_cdgo_acto_tpo IN ('PCE', 'RSPE') then
                             (c_cncpto.bse * c_cncpto.nmro_mses)
                            WHEN v_cdgo_acto_tpo IN ('PDI',

                                                     'RXN') then
                             (c_cncpto.bse * ceil(c_cncpto.nmro_mses / 12))
                            WHEN v_cdgo_fljo IN ('FOL') THEN
                             c_cncpto.bse
                          END);

        END IF;

        o_mnsje_rspsta := 'v_cdgo_acto_tpo :' || v_cdgo_acto_tpo ||
                          '- v_bse_grvble:' || v_bse_grvble;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        if v_cdgo_acto_tpo not in ('PCN', 'RSXNI') then
          BEGIN
            SELECT b.cdgo_tpo_bse_sncion
              INTO v_cdgo_tpo_bse_sncion
              FROM fi_d_tp_bs_sncn_dcl_vgn_frm a
              JOIN fi_d_tipo_base_sancion b
                ON a.id_tpo_bse_sncion = b.id_tpo_bse_sncion
             WHERE a.id_tp_bs_sncn_dcl_vgn_frm =
                   c_cncpto.id_tp_bs_sncn_dcl_vgn_frm;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 6;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' No se pudo obtener el código tipo base sanción.';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

        end if;
        o_mnsje_rspsta := 'v_cdgo_tpo_bse_sncion: ' ||
                          v_cdgo_tpo_bse_sncion ||
                          ', v_vlor_cdgo_indcdor_tpo_lqd:' ||
                          v_vlor_cdgo_indcdor_tpo_lqd || ', nmro_mses:' ||
                          c_cncpto.nmro_mses;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        IF v_cdgo_tpo_bse_sncion = 'BCR' THEN
          v_vlor_lqddo := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (v_vlor_cdgo_indcdor_tpo_lqd *
                                                                               v_vlor_trfa) *
                                                                               c_cncpto.nmro_mses,
                                                                p_expresion => v_rdndeo);

        ELSE
          v_vlor_lqddo := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (v_bse_grvble *
                                                                               v_vlor_trfa) /
                                                                               v_dvsor_trfa,
                                                                p_expresion => v_rdndeo);

        END IF;

        o_mnsje_rspsta := 'v_vlor_lqddo: ' || v_vlor_lqddo;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        --Si es un concpeto que necesita un concepto base para liquidar
        --  if v_id_impsto_acto_cncp_bse is not null then   VALIDAR USANDO CONCEPTO BASE
        /*v_vlor_lqddo := (case
          when v_vlor_lqddo < v_lqdcion_mnma then
           v_lqdcion_mnma
          when v_vlor_lqddo > v_lqdcion_mxma then
           v_lqdcion_mxma
          else
           v_vlor_lqddo
        end);*/ --  end if;
        CASE
          WHEN v_vlor_lqddo < v_vlor_lqdcion_mnma THEN
            v_bse_grvble := nvl(v_bse_grvble, v_vlor_cdgo_indcdor_tpo_lqd);

            v_vlor_lqddo := v_vlor_lqdcion_mnma;

            v_vlor_trfa := nvl(v_vlor_trfa, v_lqdcion_mnma);

            v_txto_trfa := nvl(v_txto_trfa, v_lqdcion_mnma || '%');

          WHEN v_vlor_lqddo > v_vlor_lqdcion_mxma THEN
            v_bse_grvble := nvl(v_bse_grvble, v_vlor_cdgo_indcdor_tpo_lqd);

            v_vlor_lqddo := v_vlor_lqdcion_mxma;

            v_vlor_trfa := nvl(v_vlor_trfa, v_lqdcion_mxma);

            v_txto_trfa := nvl(v_txto_trfa, v_lqdcion_mxma || '%');

          ELSE
            v_vlor_lqddo := v_vlor_lqddo;

        END CASE;

        /*begin

        o_mnsje_rspsta := 'v_cdgo_acto_tpo :' || v_cdgo_acto_tpo ||
        '- v_vlor_cdgo_indcdor_tpo_lqd:' || v_vlor_cdgo_indcdor_tpo_lqd ||

        '- v_lqdcion_mnma:' || v_lqdcion_mnma;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

                update fi_g_fiscalizacion_sancion a set a.bse = v_bse_grvble,
                                                        a.vlor_trfa = v_vlor_trfa,
                                                        a.vlor_trfa_clcldo = v_vlor_trfa,
                                                        a.dvsor_trfa = v_dvsor_trfa,
                                                        a.cdgo_indcdor_tpo = v_cdgo_indcdor_tpo_lqdccion,
                                                        a.vlor_cdgo_indcdor_tpo = v_vlor_cdgo_indcdor_tpo_lqd
                where a.id_fsclzcion_sncion = c_cncpto.id_fsclzcion_sncion;
        exception
            when others then
                o_mnsje_rspsta := 'Error al actualizar la información de la base sanción ';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);
                rollback;
                return;


















        end;*/ --Se registra los conceptos de la liquidación
        o_mnsje_rspsta := 'Insertar gi_g_liquidaciones_concepto: v_id_lqdcion: ' ||
                          v_id_lqdcion || 'id_impsto_acto_cncpto' ||
                          c_cncpto.id_impsto_acto_cncpto ||
                          'v_vlor_lqddo: ' || v_vlor_lqddo ||
                          'v_vlor_trfa: ' || v_vlor_trfa ||
                          'v_bse_grvble: ' || v_bse_grvble ||
                          'v_txto_trfa: ' || v_txto_trfa;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        /*if v_cdgo_acto_tpo in ('PCN','RSXNI') then
            begin
                  insert into gi_g_liquidaciones_concepto
                    (id_lqdcion,
                     id_impsto_acto_cncpto,
                     vlor_lqddo,
                     vlor_clcldo,
                     trfa,
                     bse_cncpto,
                     txto_trfa,
                     vlor_intres,
                     indcdor_lmta_impsto,
                     fcha_vncmnto) --BVM 17/05/2024
                  values
                    (v_id_lqdcion,
                     c_cncpto.id_impsto_acto_cncpto,
                     nvl(v_bse_grvble, ceil(v_vlor_lqddo)),
                     nvl(v_bse_grvble, ceil(v_vlor_lqddo)),
                     v_vlor_trfa,
                     v_bse_grvble,
                     v_txto_trfa,
                     0,
                     'N',
                     (sysdate + 30) --BVM 17/05/2024
                     );
            exception
              when others then
                o_cdgo_rspsta  := 7;
                o_mnsje_rspsta := 'No se pudo generar el detalle de la liquidación con el impuesto acto ' ||
                                  c_cncpto.id_impsto_acto_cncpto || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);
                rollback;
                return;
            end;
        else*/
        BEGIN
          INSERT INTO gi_g_liquidaciones_concepto
            (id_lqdcion,
             id_impsto_acto_cncpto,
             vlor_lqddo,
             vlor_clcldo,
             trfa,
             bse_cncpto,
             txto_trfa,
             vlor_intres,
             indcdor_lmta_impsto,
             fcha_vncmnto) --BVM 17/05/2024

          VALUES
            (v_id_lqdcion,
             c_cncpto.id_impsto_acto_cncpto,
             ceil(v_vlor_lqddo),
             ceil(v_vlor_lqddo),
             v_vlor_trfa,
             v_bse_grvble,
             v_txto_trfa,
             0,
             'N',
             (sysdate + 30) --BVM 17/05/2024
             );

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 7;

            o_mnsje_rspsta := 'No se pudo generar el detalle de la liquidación con el impuesto acto ' ||
                              c_cncpto.id_impsto_acto_cncpto || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --end if;
        --Se actualiza el valor total de la liquidacion
        /*if v_cdgo_acto_tpo in ('PCN','RSXNI') then
            begin
              update gi_g_liquidaciones
                 set vlor_ttal = vlor_ttal + nvl(v_bse_grvble, v_vlor_lqddo)
               where id_lqdcion = v_id_lqdcion;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    nmbre_up,
                                    v_nl,
                                    'valor liquidación:' || v_vlor_lqddo,
                                    6);
            exception
              when others then
                o_cdgo_rspsta  := 8;
                o_mnsje_rspsta := 'No se pudo actualizar el valor total de la liquidación ' ||
                                  v_id_lqdcion;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);
                rollback;
                return;
            end;



        else*/
        BEGIN
          UPDATE gi_g_liquidaciones
             SET vlor_ttal = vlor_ttal + ceil(v_vlor_lqddo)
           WHERE id_lqdcion = v_id_lqdcion;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                'valor liquidación:' || v_vlor_lqddo,
                                6);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 8;

            o_mnsje_rspsta := 'No se pudo actualizar el valor total de la liquidación ' ||
                              v_id_lqdcion;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --end if;
        BEGIN

          SELECT a.vlor_ttal
            INTO o_vlor_ttal
            FROM gi_g_liquidaciones a
           WHERE id_lqdcion = v_id_lqdcion;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 8;

            o_mnsje_rspsta := 'No se pudo actualizar el valor total de la liquidación ' ||
                              v_id_lqdcion;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --Se actualiza la columana liquidacion
        o_mnsje_rspsta := 'Actualizar el valor de p_id_fsclzcion_expdnte_acto ' ||
                          p_id_fsclzcion_expdnte_acto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        BEGIN
          UPDATE fi_g_fsclzc_expdn_cndd_vgnc
             SET id_lqdcion                = v_id_lqdcion,
                 id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto
           WHERE id_cnddto_vgncia = c_cncpto.id_cnddto_vgncia;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 8;

            o_mnsje_rspsta := 'No se pudo actualizar el valor de la liquidación en candidato vigencia' ||
                              v_id_lqdcion;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

      END LOOP;

      --Se registra la liquidación en movimiento financiero
      BEGIN
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              'valor v_id_lqdcion ' || v_id_lqdcion,
                              6);

        pkg_gf_movimientos_financiero.prc_gn_paso_liquidacion_mvmnto(p_cdgo_clnte        => p_cdgo_clnte,
                                                                     p_id_lqdcion        => v_id_lqdcion,
                                                                     p_cdgo_orgen_mvmnto => 'LQ',
                                                                     p_id_orgen_mvmnto   => v_id_lqdcion,
                                                                     o_cdgo_rspsta       => o_cdgo_rspsta,
                                                                     o_mnsje_rspsta      => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          o_mnsje_rspsta := 12 || '-' || o_cdgo_rspsta || o_mnsje_rspsta ||
                            sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 18;

          o_mnsje_rspsta := 'Error al llamar el procedimiento que registra los movimiento financieros, ' ||
                            sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      CASE
        WHEN v_cdgo_acto_tpo IN ('PCM', 'PCN', 'PCE', 'PDI') THEN
          --Se coloca la cartera con un estado de anulada para que no se visualice
          BEGIN
            UPDATE gf_g_movimientos_financiero
               SET cdgo_mvnt_fncro_estdo = 'AN', cdgo_mvmnto_orgn = 'FS' --BVM 17/05/2024

             WHERE cdgo_mvmnto_orgn = 'LQ'
               AND id_orgen = v_id_lqdcion;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 19;

              o_mnsje_rspsta := 'No se pudo actualizar el estado de la cartera anulada';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

        WHEN v_cdgo_fljo IN ('FOL') THEN
          BEGIN
            UPDATE gf_g_movimientos_financiero
               SET cdgo_mvnt_fncro_estdo = 'AN', cdgo_mvmnto_orgn = 'FS'
             WHERE cdgo_mvmnto_orgn = 'LQ'
               AND id_orgen = v_id_lqdcion;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 19;

              o_mnsje_rspsta := 'No se pudo actualizar el estado de la cartera anulada';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

        ELSE
          BEGIN
            UPDATE gf_g_movimientos_financiero
               SET cdgo_mvmnto_orgn = 'FS'
             WHERE cdgo_mvmnto_orgn = 'LQ'
               AND id_orgen = v_id_lqdcion;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 20;

              o_mnsje_rspsta := 'No se pudo actualizar el estado de la cartera anulada';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

      END CASE;

      --Se actualiza el consolidado
      BEGIN
        pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => p_cdgo_clnte,
                                                                  p_id_sjto_impsto => c_vgncia.id_sjto_impsto);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 18;

          o_mnsje_rspsta := 'No se pudo actulizar el consolidado';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

    END LOOP;

    o_mnsje_rspsta := 'Saliendo con éxito';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

  EXCEPTION
    WHEN others THEN
      o_cdgo_rspsta := 19;

      o_mnsje_rspsta := 'No fue posible realizar la liquidación, intente mas tarde.' ||
                        sqlerrm;

  END prc_rg_liquidacion;

  FUNCTION fnc_co_tabla_liquidacion(p_cdgo_clnte           IN number,
                                    p_id_cnddto            IN number,
                                    p_id_fsclzcion_expdnte IN number,
                                    p_mostrar              IN varchar2 DEFAULT 'S')
    RETURN CLOB AS
    v_vlor_sncion_mnmo number;

    v_vlor_lqddo number;

    v_tabla CLOB;

  BEGIN
    v_tabla := '<table align="center" border="1" style="border-collapse:collapse;">' ||
               '<thead>' || '<tr>' ||
               '<th style="text-align: center; border:1px solid black">' ||
               'Vigencia' || '</th>' ||
               '<th style="text-align: center; border:1px solid black">' ||
               'Periodo' || '</th>' || CASE
                 WHEN p_mostrar = 'S' THEN
                  '<th style="text-align: center; border:1px solid black">' ||
                  'Base' ||
                  '</th>
                            <th style="text-align: center; border:1px solid black">' ||
                  'Tarifa(%)' || '</th>'
               END ||
               '<th style="text-align: center; border:1px solid black">' ||
               'Valor Sancion' || '</th>' || '</tr>' || '</thead>' ||
               '<tbody>';

    BEGIN
      FOR c_sancion IN (SELECT *
                          FROM fi_g_fiscalizacion_sancion a
                         WHERE a.id_fsclzcion_expdnte =
                               p_id_fsclzcion_expdnte) LOOP

        FOR c_tarifa IN (SELECT *

                           FROM v_gi_d_tarifas_esquema e
                          where (e.id_impsto_acto_cncpto =
                                c_sancion.id_impsto_acto_cncpto AND
                                e.id_tp_bs_sncn_dcl_vgn_frm IS NULL OR
                                e.id_impsto_acto_cncpto =
                                c_sancion.id_impsto_acto_cncpto AND
                                e.id_tp_bs_sncn_dcl_vgn_frm =
                                c_sancion.id_tp_bs_sncn_dcl_vgn_frm)) LOOP
          v_vlor_lqddo := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (c_sancion.bse *
                                                                               c_tarifa.vlor_trfa) /
                                                                               c_tarifa.dvsor_trfa,
                                                                p_expresion => c_tarifa.exprsion_rdndeo);

          v_vlor_lqddo := (CASE
                            WHEN v_vlor_lqddo < c_tarifa.lqdcion_mnma THEN
                             c_tarifa.lqdcion_mnma
                            WHEN v_vlor_lqddo > c_tarifa.lqdcion_mxma THEN
                             c_tarifa.lqdcion_mxma
                            ELSE
                             v_vlor_lqddo
                          END);

          v_tabla := v_tabla || '<tr>' ||
                     '<td style="text-align: center; border:1px solid black">' ||
                     c_sancion.vgncia || '</td>' ||
                     '<td style="text-align: center; border:1px solid black">' ||
                     c_sancion.prdo || '</td>' || CASE
                       WHEN p_mostrar = 'S' THEN
                        '<td style="text-align: center; border:1px solid black">' ||
                        to_char(c_sancion.bse, 'FM$999G999G999G999G999G999G990') ||
                        '</td>
                                                         <td style="text-align: center; border:1px solid black">' ||
                        c_tarifa.vlor_trfa || '</td>'
                     END ||
                     '<td style="text-align: center; border:1px solid black">' ||
                     to_char(v_vlor_lqddo, 'FM$999G999G999G999G999G999G990') ||
                     '</td>' || '</tr>';

        END LOOP;

      END LOOP;

    END;

    v_tabla := v_tabla || '<tbody></table>';

    RETURN v_tabla;

  END fnc_co_tabla_liquidacion;

  FUNCTION fnc_co_total_sancion(p_id_fsclzcion_expdnte IN number)
    RETURN varchar2 AS
    v_vlor_lqddo number;

    v_sncion_ttal number := 0;

  BEGIN
    BEGIN
      FOR c_sancion IN (SELECT *
                          FROM fi_g_fiscalizacion_sancion a
                         WHERE a.id_fsclzcion_expdnte =
                               p_id_fsclzcion_expdnte) LOOP
        FOR c_tarifa IN (SELECT *
                           FROM v_gi_d_tarifas_esquema e
                          WHERE e.id_impsto_acto_cncpto =
                                c_sancion.id_impsto_acto_cncpto
                            AND e.id_tp_bs_sncn_dcl_vgn_frm =
                                c_sancion.id_tp_bs_sncn_dcl_vgn_frm) LOOP
          v_vlor_lqddo := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (c_sancion.bse *
                                                                               c_tarifa.vlor_trfa) /
                                                                               c_tarifa.dvsor_trfa,
                                                                p_expresion => c_tarifa.exprsion_rdndeo);

          v_vlor_lqddo := (CASE
                            WHEN v_vlor_lqddo < c_tarifa.lqdcion_mnma THEN
                             c_tarifa.lqdcion_mnma
                            WHEN v_vlor_lqddo > c_tarifa.lqdcion_mxma THEN
                             c_tarifa.lqdcion_mxma
                            ELSE
                             v_vlor_lqddo
                          END);

          v_sncion_ttal := v_sncion_ttal + v_vlor_lqddo;

        END LOOP;

      END LOOP;

    END;

    RETURN upper(pkg_gn_generalidades.fnc_number_to_text(v_sncion_ttal,
                                                         'd')) || to_char(v_sncion_ttal,
                                                                          'FM$999G999G999G999G999G999G990');

  END fnc_co_total_sancion;

  procedure prc_rg_aplccion_lqudcion_afro(p_cdgo_clnte     in df_s_clientes.cdgo_clnte%type,
                                          p_json_cnddto    in clob,
                                          o_vlor_sldo_fvor out number,
                                          o_cdgo_rspsta    out number,
                                          o_mnsje_rspsta   out varchar2) as

    v_nl        number;
    v_mnsje_log varchar2(4000);
    nmbre_up    varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_aplccion_lqudcion_afro';

  begin

    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        null,
                                        'pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo');
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          1);

    begin

      for dclrcion in (select c.id_dclrcion,
                              c.id_usrio_rgstro,
                              d.id_fsclzcion_expdnte_acto,
                              nmro_acto
                         from fi_g_candidatos_vigencia a
                         join fi_g_fsclzc_expdn_cndd_vgnc b
                           on a.id_cnddto_vgncia = b.id_cnddto_vgncia
                         join (select id_cnddto,
                                     id_fsclzcion_expdnte_acto,
                                     nmro_acto
                                from json_table(p_json_cnddto,
                                                '$[*]'
                                                columns(id_cnddto varchar2 path
                                                        '$.id_cnddto',
                                                        id_fsclzcion_expdnte_acto
                                                        varchar2 path
                                                        '$.id_fsclzcion_expdnte_acto',
                                                        nmro_acto varchar2 path
                                                        '$.nmro_acto'))) d
                           on a.id_cnddto = d.id_cnddto
                         join gi_g_declaraciones c
                           on a.id_cnddto_vgncia = c.id_cnddto_vgncia) loop

        begin
          pkg_gi_declaraciones_utlddes.prc_ap_declaracion(p_cdgo_clnte     => p_cdgo_clnte,
                                                          p_id_usrio       => dclrcion.id_usrio_rgstro,
                                                          p_id_dclrcion    => dclrcion.id_dclrcion,
                                                          o_vlor_sldo_fvor => o_vlor_sldo_fvor, --COMENTAR/DESCOMENTAR ESTA LINEA EN CASO DE NO COMPILAR EL PAQUETE
                                                          o_cdgo_rspsta    => o_cdgo_rspsta,
                                                          o_mnsje_rspsta   => o_mnsje_rspsta);

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'Despues de aplicar declaracion ' ||
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);
        exception
          when others then
            o_cdgo_rspsta  := 22;
            o_mnsje_rspsta := o_cdgo_rspsta || '-' || o_mnsje_rspsta;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ',' || sqlerrm,
                                  6);
            return;
        end;
        /*AGREGADO PARA ACTUALIZAR EL ID_DCLRCION del expediente */
        /*
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Antes de actualizar candidadto dclrcion.id_dclrcio: ' ||
                              dclrcion.id_dclrcion ||
                              '- dclrcion.id_dclrcion : ' ||
                              dclrcion.id_dclrcion ||
                              '-  dclrcion.id_usrio_rgstro : ' ||
                              dclrcion.id_usrio_rgstro ||
                              '-  dclrcion.id_fsclzcion_expdnte_acto: ' ||
                              dclrcion.id_fsclzcion_expdnte_acto ||
                              '- dclrcion.nmro_acto : ' ||
                              dclrcion.nmro_acto,

                              6);

        prc_ac_candidato_vigencia(p_cdgo_clnte   => p_cdgo_clnte,
                                  p_id_dclrcion  => dclrcion.id_dclrcion,
                                  o_cdgo_rspsta  => o_cdgo_rspsta,
                                  o_mnsje_rspsta => o_mnsje_rspsta);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Despues de actualizar candidadto dclrcion.id_dclrcio: ' ||
                              o_mnsje_rspsta,
                              6);

        if o_cdgo_rspsta > 0 then

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);

          o_cdgo_rspsta  := 23;
          o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                            'Error al llamar el procedimiento prc_ac_candidato_vigencia';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);
          return;
        end if;
        */
        begin
          update fi_g_fsclzcion_expdnte_acto a
             set a.indcdor_aplcdo = 'S'
           where a.id_fsclzcion_expdnte_acto =
                 dclrcion.id_fsclzcion_expdnte_acto;
        exception
          when others then
            o_cdgo_rspsta  := 23;
            o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                              'No se pudo marcar la liquidacion oficial ' ||
                              dclrcion.nmro_acto || 'como aplicada';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ',' || sqlerrm,
                                  6);
            return;
        end;
      end loop;
    end;
  end prc_rg_aplccion_lqudcion_afro;

  PROCEDURE prc_ac_crre_fsclzcion_expdnte(p_id_instncia_fljo IN number,
                                          p_id_fljo_trea     IN number) AS
    v_cdgo_clnte number;

    v_id_usrio number;

    v_nl number;

    o_cdgo_rspsta number;

    o_mnsje_rspsta varchar2(1000);

    nmbre_up varchar2(100) := 'pkg_fi_fiscalizacion.prc_ac_crre_fsclzcion_expdnte';

    v_o_error varchar2(500);

  BEGIN
    --Se identifica el cliente
    BEGIN
      SELECT b.cdgo_clnte
        INTO v_cdgo_clnte
        FROM wf_g_instancias_flujo a
       INNER JOIN wf_d_flujos b
          ON b.id_fljo = a.id_fljo
       WHERE a.id_instncia_fljo = p_id_instncia_fljo;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'No se pudo obtener el cliente';

        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(v_cdgo_clnte, NULL, nmbre_up);

    --Se valida el usuario de la ultima etapa antes de finalizar
    BEGIN
      SELECT DISTINCT first_value(a.id_usrio) over (ORDER BY a.id_instncia_trnscion DESC) id_usrio
        INTO v_id_usrio
        FROM wf_g_instancias_transicion a
       WHERE a.id_instncia_fljo = p_id_instncia_fljo
         AND a.id_fljo_trea_orgen = p_id_fljo_trea;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'No se pudo obtener el usuario';

        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    BEGIN
      UPDATE fi_g_fiscalizacion_expdnte a
         SET a.cdgo_expdnte_estdo = 'CER', a.fcha_crre = sysdate
       WHERE a.id_instncia_fljo = p_id_instncia_fljo;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'No se pudo cerrar el expediente';

        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se finaliza la instacia del flujo de fisca
    BEGIN
      pkg_pl_workflow_1_0.prc_rg_finalizar_instancia(p_id_instncia_fljo => p_id_instncia_fljo,
                                                     p_id_fljo_trea     => p_id_fljo_trea,
                                                     p_id_usrio         => v_id_usrio,
                                                     o_error            => v_o_error,
                                                     o_msg              => o_mnsje_rspsta);

      IF v_o_error = 'N' THEN
        o_cdgo_rspsta := 4;

        o_mnsje_rspsta := o_cdgo_rspsta || o_mnsje_rspsta;

        ROLLBACK;

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'No se pudo ejecutar la up que finaliza el flujo';

        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

  END prc_ac_crre_fsclzcion_expdnte;

  PROCEDURE prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           IN number,
                                         p_id_fsclzcion_expdnte IN number,
                                         p_id_acto_tpo          IN number,
                                         p_json                 IN CLOB,
                                         p_id_fsclzcn_rnta      IN number DEFAULT NULL,
                                         o_cdgo_rspsta          OUT number,
                                         o_mnsje_rspsta         OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion';

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            'p_id_fsclzcion_expdnte: ' ||
                            p_id_fsclzcion_expdnte || ', p_id_acto_tpo: ' ||
                            p_id_acto_tpo || ', p_id_fsclzcn_rnta: ' ||
                            p_id_acto_tpo,
                            6);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            'JSON: ' || p_json,
                            6);

      --insert into muerto (v_001, c_001, t_001)values('JSON: ',p_json,systimestamp);commit;

      FOR c_cncpto IN (SELECT cncpto,
                              vgncia,
                              id_prdo,
                              bse,
                              prdo,
                              id_impsto_acto_cncpto,
                              nmro_mses,
                              orden,
                              id_cnddto_vgncia,
                              id_tp_bs_sncn_dcl_vgn_frm,
                              Vlor_Trfa,
                              Vlor_Trfa_Clcldo,
                              Vlor_Cdgo_Indcdor_Tpo,
                              Cdgo_Indcdor_Tpo,
                              Dvsor_Trfa,
                              Exprsion_Rdndeo,
                              vlor_lqdcion_mnma
                         FROM JSON_TABLE(p_json,
                                         '$[*]'
                                         columns(cncpto VARCHAR2 PATH
                                                 '$.cncpto',
                                                 vgncia VARCHAR2 PATH
                                                 '$.vgncia',
                                                 id_prdo VARCHAR2 PATH
                                                 '$.id_prdo',
                                                 bse VARCHAR2 PATH '$.bse',
                                                 prdo VARCHAR2 PATH '$.prdo',
                                                 id_impsto_acto_cncpto
                                                 VARCHAR2 PATH
                                                 '$.id_impsto_acto_cncpto',
                                                 nmro_mses VARCHAR2 PATH
                                                 '$.nmro_mses',
                                                 orden VARCHAR2 PATH '$.orden',
                                                 id_cnddto_vgncia VARCHAR2 PATH
                                                 '$.id_cnddto_vgncia',
                                                 id_tp_bs_sncn_dcl_vgn_frm
                                                 VARCHAR2 PATH
                                                 '$.id_tp_bs_sncn_dcl_vgn_frm',
                                                 vlor_trfa VARCHAR2 PATH
                                                 '$.vlor_trfa',
                                                 dvsor_trfa VARCHAR2 PATH
                                                 '$.dvsor_trfa',
                                                 cdgo_indcdor_tpo VARCHAR2 PATH
                                                 '$.cdgo_indcdor_tpo',
                                                 vlor_cdgo_indcdor_tpo
                                                 VARCHAR2 PATH
                                                 '$.vlor_cdgo_indcdor_tpo',
                                                 vlor_trfa_clcldo VARCHAR2 PATH
                                                 '$.vlor_trfa_clcldo',
                                                 exprsion_rdndeo VARCHAR2 PATH
                                                 '$.exprsion_rdndeo',
                                                 vlor_lqdcion_mnma VARCHAR2 PATH
                                                 '$.vlor_lqdcion_mnma'))) LOOP
        BEGIN
          INSERT INTO fi_g_fiscalizacion_sancion
            (id_fsclzcion_expdnte,
             id_cncpto,
             vgncia,
             prdo,
             id_prdo,
             id_impsto_acto_cncpto,
             id_cnddto_vgncia,
             bse,
             id_acto_tpo,
             nmro_mses,
             orden,
             id_tp_bs_sncn_dcl_vgn_frm,
             Vlor_Trfa,
             Vlor_Trfa_Clcldo,
             Vlor_Cdgo_Indcdor_Tpo,
             Cdgo_Indcdor_Tpo,
             Dvsor_Trfa,
             Exprsion_Rdndeo,
             id_fsclzcn_rnta,
             vlor_lqdcion_mnma)
          VALUES
            (p_id_fsclzcion_expdnte,
             c_cncpto.cncpto,
             c_cncpto.vgncia,
             c_cncpto.prdo,
             c_cncpto.id_prdo,
             c_cncpto.id_impsto_acto_cncpto,
             c_cncpto.id_cnddto_vgncia,
             c_cncpto.bse,
             p_id_acto_tpo,
             nvl(c_cncpto.nmro_mses, 1),
             c_cncpto.orden,
             c_cncpto.id_tp_bs_sncn_dcl_vgn_frm,
             TO_NUMBER(c_cncpto.Vlor_Trfa, '999999999999999999.99'),
             TO_NUMBER(c_cncpto.Vlor_Trfa_Clcldo, '999999999999999999.999'),
             TO_NUMBER(c_cncpto.Vlor_Cdgo_Indcdor_Tpo,
                       '999999999999999999.99'),
             c_cncpto.Cdgo_Indcdor_Tpo,
             c_cncpto.Dvsor_Trfa,
             c_cncpto.Exprsion_Rdndeo,
             nvl(p_id_fsclzcn_rnta, NULL),
             to_number(c_cncpto.vlor_lqdcion_mnma));

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := 'No se pudo registrar la informacion para la sancion ' ||
                              sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

      END LOOP;

    END;

    o_mnsje_rspsta := 'Saliendo: ' || nmbre_up;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || systimestamp,
                          6);

  END prc_rg_fi_g_fsclzcion_sncion;

  PROCEDURE prc_rg_acto_transicion_masiva(p_cdgo_clnte   IN number,
                                          p_id_usrio     IN number,
                                          p_id_fncnrio   IN number,
                                          p_id_prgrma    IN number,
                                          p_json         IN CLOB,
                                          p_id_acto_tpo  IN number DEFAULT NULL,
                                          o_cdgo_rspsta  OUT number,
                                          o_mnsje_rspsta OUT varchar2) AS
    v_nl number;

    v_id_fljo_trea number;

    v_id_plntlla number;

    v_id_rprte number;

    v_id_acto_tpo_rqrdo number;

    v_id_acto_tpo number;

    o_id_fsclzcion_expdnte_acto number;

    v_id_acto_rqrdo number;

    v_sancion number;

    v_cdgo_acto_tpo_rqrdo varchar2(10);

    v_ntfccion_atmtco varchar2(10);

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_acto_transicion_masiva';

    v_indcdor_msvo varchar2(2);

    v_dscrpcion varchar2(200);

    v_type varchar2(1000);

    v_mnsje varchar2(4000);

    v_error varchar2(1000);

    v_cdgo_acto_tpo varchar2(5);

    v_cdgo_acto_tarea varchar2(5);

    v_id_acto_tpo_tarea number;

    v_dcmnto CLOB;

    v_cdgo_prgrma varchar2(5);

    v_cdgo_sbprgrma varchar2(5);

    v_vlor_ttal number;

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    FOR c_fljo IN (SELECT id_instncia_fljo,
                          id_fljo_trea_orgen,
                          id_sjto_impsto,
                          id_fsclzcion_expdnte,
                          id_cnddto,
                          idntfccion_sjto,
                          id_prgrma,
                          id_sbprgrma
                     FROM json_table(p_json,
                                     '$[*]'
                                     columns(id_instncia_fljo varchar2 PATH
                                             '$.ID_INSTNCIA_FLJO',
                                             id_fljo_trea_orgen varchar2 PATH
                                             '$.ID_FLJO_TREA_ORGEN',
                                             id_sjto_impsto varchar2 PATH
                                             '$.ID_SJTO_IMPSTO',
                                             id_fsclzcion_expdnte varchar2 PATH
                                             '$.ID_FSCLZCION_EXPDNTE',
                                             id_cnddto varchar2 PATH
                                             '$.ID_CNDDTO',
                                             idntfccion_sjto varchar2 PATH
                                             '$.IDNTFCCION_SJTO',
                                             id_prgrma varchar2 PATH
                                             '$.ID_PRGRMA',
                                             id_sbprgrma varchar2 PATH
                                             '$.ID_SBPRGRMA'))) LOOP
      BEGIN
        /*o_mnsje_rspsta := 'Antes de prc_rg_instancias_transicion: ' ||c_fljo.id_instncia_fljo||
                          ' - id_fljo_trea_orgen: '||c_fljo.id_fljo_trea_orgen||systimestamp;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);*/
        BEGIN
          SELECT p.cdgo_prgrma, s.cdgo_sbprgrma
            INTO v_cdgo_prgrma, v_cdgo_sbprgrma
            FROM fi_d_programas p
            JOIN fi_d_subprogramas s
              ON p.id_prgrma = s.id_prgrma
           WHERE p.id_prgrma = c_fljo.id_prgrma
             AND s.id_sbprgrma = c_fljo.id_sbprgrma
             AND p.actvo = 'S';

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              ' No se pudo consultar el codigo del programa y subprograma.';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

        END;

        BEGIN
          SELECT b.cdgo_acto_tpo
            INTO v_cdgo_acto_tpo
            FROM gn_d_actos_tipo_tarea a
            JOIN gn_d_actos_tipo b
              ON b.id_acto_tpo = a.id_acto_tpo
           WHERE a.id_fljo_trea = c_fljo.id_fljo_trea_orgen
             AND a.indcdor_oblgtrio = 'S';

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              ' No se pudo consultar el codigo del acto.';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

        END;

        IF v_cdgo_prgrma = 'S' AND v_cdgo_sbprgrma = 'NEI' AND
           v_cdgo_acto_tpo = 'CEJE' THEN
          pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                                           p_id_fljo_trea     => c_fljo.id_fljo_trea_orgen,
                                                           p_json             => NULL,
                                                           o_type             => v_type,
                                                           o_mnsje            => v_mnsje,
                                                           o_id_fljo_trea     => v_id_fljo_trea,
                                                           o_error            => v_error);

          prc_ac_crre_fsclzcion_expdnte(p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                        p_id_fljo_trea     => v_id_fljo_trea);

        ELSE
          pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                                           p_id_fljo_trea     => c_fljo.id_fljo_trea_orgen,
                                                           p_json             => NULL,
                                                           o_type             => v_type,
                                                           o_mnsje            => v_mnsje,
                                                           o_id_fljo_trea     => v_id_fljo_trea,
                                                           o_error            => v_error);

          /*o_mnsje_rspsta := 'Despues de prc_rg_instancias_transicion: '||systimestamp;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);*/ /*o_mnsje_rspsta := 'id_fljo_trea_orgen: ' ||
                                                                                                                                                                                                                                                                                                                                                                                                                          c_fljo.id_fljo_trea_orgen || '  o_type' || v_type;
                                                                                                                                                                                                                                                                                                                                                                                                        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                                                                                                                                                                                                                                                                                                                                                                                              null,
                                                                                                                                                                                                                                                                                                                                                                                                                              nmbre_up,
                                                                                                                                                                                                                                                                                                                                                                                                                              v_nl,
                                                                                                                                                                                                                                                                                                                                                                                                                              o_mnsje_rspsta,
                                                                                                                                                                                                                                                                                                                                                                                                                              6);*/ /*o_mnsje_rspsta := 'codigo respuesta prc_rg_instancias_transicion: ' ||
                                                                                                                                                                                                                                                                                                                                                                                                                          o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                                                                                                                                                                                                                                                                                                                                                                                                                          '- v_type: ' || v_type || '-' || v_mnsje;
                                                                                                                                                                                                                                                                                                                                                                                                        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                                                                                                                                                                                                                                                                                                                                                                                              null,
                                                                                                                                                                                                                                                                                                                                                                                                                              nmbre_up,
                                                                                                                                                                                                                                                                                                                                                                                                                              v_nl,
                                                                                                                                                                                                                                                                                                                                                                                                                              o_mnsje_rspsta,
                                                                                                                                                                                                                                                                                                                                                                                                                              6);*/
          IF v_type = 'N' AND o_cdgo_rspsta = 0 THEN
            /*o_mnsje_rspsta := 'Entro condicion  if v_type = N and o_cdgo_rspsta = 0 ';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);*/
            BEGIN
              SELECT b.cdgo_acto_tpo, a.id_acto_tpo
                INTO v_cdgo_acto_tarea, v_id_acto_tpo_tarea
                FROM gn_d_actos_tipo_tarea a
                JOIN gn_d_actos_tipo b
                  ON a.id_acto_tpo = b.id_acto_tpo
                JOIN fi_d_programas_acto c
                  ON c.id_acto_tpo = b.id_acto_tpo
                JOIN v_fi_g_fiscalizacion_expdnte d
                  ON c.id_prgrma = d.id_prgrma
                 AND c.id_sbprgrma = d.id_sbprgrma
               WHERE a.id_fljo_trea = v_id_fljo_trea
                 AND d.id_fsclzcion_expdnte = c_fljo.id_fsclzcion_expdnte
                 AND a.indcdor_oblgtrio = 'S';

            EXCEPTION
              WHEN too_many_rows THEN
                o_cdgo_rspsta := 1;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  'No se pudo consultar el acto tipo de la tarea, solo puede marcar un acto como obligatorio' ||
                                  c_fljo.id_fljo_trea_orgen ||
                                  ' , id flujo destino: ' || v_id_fljo_trea;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                ROLLBACK;

                RETURN;

              WHEN others THEN
                o_cdgo_rspsta := 1;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  'No se pudo consultar el acto tipo de la tarea id flujo origen: ' ||
                                  c_fljo.id_fljo_trea_orgen ||
                                  ' , id flujo destino: ' || v_id_fljo_trea;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                ROLLBACK;

                RETURN;

            END;

            IF v_cdgo_acto_tarea = 'RXD' THEN
              --   if c_fljo.id_fljo_trea_orgen = 10 then
              /*o_mnsje_rspsta := 'Entro a registrar la sancion: id c_fljo.id_fljo_trea_orgen : ' ||
                                c_fljo.id_fljo_trea_orgen;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);*/
              pkg_fi_fiscalizacion.prc_rg_sancion(p_cdgo_clnte           => p_cdgo_clnte,
                                                  p_id_fsclzcion_expdnte => c_fljo.id_fsclzcion_expdnte,
                                                  p_id_cnddto            => c_fljo.id_cnddto,
                                                  p_idntfccion_sjto      => c_fljo.idntfccion_sjto,
                                                  p_id_sjto_impsto       => c_fljo.id_sjto_impsto,
                                                  p_id_prgrma            => c_fljo.id_prgrma,
                                                  p_id_sbprgrma          => c_fljo.id_sbprgrma,
                                                  p_id_instncia_fljo     => c_fljo.id_instncia_fljo,
                                                  o_cdgo_rspsta          => o_cdgo_rspsta,
                                                  o_mnsje_rspsta         => o_mnsje_rspsta);

              /*o_mnsje_rspsta := 'valor del v_cdgo_acto_tarea  :' ||
              v_cdgo_acto_tarea;*/
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);

            ELSIF v_cdgo_acto_tarea IN ('PCE', 'PCM') THEN
              --Pliego de cargo extemporaneo - Pliego de cargo sancion mal liquidada
              BEGIN
                prc_rg_liquida_acto(p_cdgo_clnte       => p_cdgo_clnte,
                                    p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                    p_id_acto_tpo      => v_id_acto_tpo_tarea,
                                    o_cdgo_rspsta      => o_cdgo_rspsta,
                                    o_mnsje_rspsta     => o_mnsje_rspsta);

                IF o_cdgo_rspsta > 0 THEN
                  v_mnsje := o_mnsje_rspsta;

                  v_mnsje := replace(v_mnsje, '<br/>');

                  prc_rg_expediente_error(p_id_cnddto        => c_fljo.id_cnddto,
                                          p_mnsje            => v_mnsje,
                                          p_cdgo_clnte       => p_cdgo_clnte,
                                          p_id_usrio         => p_id_usrio,
                                          p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                          p_id_fljo_trea     => v_id_fljo_trea);

                  BEGIN
                    prc_rv_flujo_tarea(p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                       p_id_fljo_trea     => v_id_fljo_trea,
                                       p_cdgo_clnte       => p_cdgo_clnte); --Revierte la tarea

                  EXCEPTION
                    WHEN others THEN
                      o_mnsje_rspsta := 'Erro al llamar : pkg_pl_workflow_1_0.prc_rv_flujo_tarea: ' ||
                                        v_id_fljo_trea || ' - ' ||
                                        c_fljo.id_instncia_fljo;

                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta || ' , ' ||
                                            sqlerrm,
                                            6);

                  END;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  RETURN;

                END IF;

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 3;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'No se pudo llamar a la up prc_rg_liquida_acto';

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  RETURN;

              END;

            ELSIF v_cdgo_acto_tarea IN ('PCN', 'RSXNI') THEN
              --Pliego de cargo por no enviar información
              BEGIN
                /*o_mnsje_rspsta := 'Antes de prc_rg_sancion_nei: ' ||v_cdgo_acto_tarea||' - '||systimestamp;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);*/
                pkg_fi_fiscalizacion.prc_rg_sancion_nei(p_cdgo_clnte           => p_cdgo_clnte,
                                                        p_id_fsclzcion_expdnte => c_fljo.id_fsclzcion_expdnte,
                                                        p_id_cnddto            => c_fljo.id_cnddto,
                                                        p_idntfccion_sjto      => c_fljo.idntfccion_sjto,
                                                        p_id_sjto_impsto       => c_fljo.id_sjto_impsto,
                                                        p_id_prgrma            => c_fljo.id_prgrma,
                                                        p_id_sbprgrma          => c_fljo.id_sbprgrma,
                                                        p_id_instncia_fljo     => c_fljo.id_instncia_fljo,
                                                        p_cdgo_acto_tpo        => v_cdgo_acto_tarea,
                                                        o_cdgo_rspsta          => o_cdgo_rspsta,
                                                        o_mnsje_rspsta         => o_mnsje_rspsta);

                /*o_mnsje_rspsta := 'Despues de prc_rg_sancion_nei: ' ||sqlerrm||' - '||systimestamp;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);*/
                IF o_cdgo_rspsta > 0 THEN
                  v_mnsje := o_mnsje_rspsta;

                  v_mnsje := replace(v_mnsje, '<br/>');

                  prc_rg_expediente_error(p_id_cnddto        => c_fljo.id_cnddto,
                                          p_mnsje            => v_mnsje,
                                          p_cdgo_clnte       => p_cdgo_clnte,
                                          p_id_usrio         => p_id_usrio,
                                          p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                          p_id_fljo_trea     => v_id_fljo_trea);

                  BEGIN
                    prc_rv_flujo_tarea(p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                       p_id_fljo_trea     => v_id_fljo_trea,
                                       p_cdgo_clnte       => p_cdgo_clnte); --Revierte la tarea

                  EXCEPTION
                    WHEN others THEN
                      o_mnsje_rspsta := 'Error al llamar prc_rv_flujo_tarea: ' ||
                                        v_id_fljo_trea || ' - ' ||
                                        c_fljo.id_instncia_fljo;

                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta || ' - ' ||
                                            sqlerrm,
                                            6);

                  END;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' - ' || sqlerrm,
                                        6);

                  RETURN;

                END IF;

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 3;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'No se pudo llamar a la up prc_rg_liquida_acto';

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' - ' || sqlerrm,
                                        6);

                  RETURN;

              END;

            END IF;

            /*o_mnsje_rspsta := 'Inicio de generacion de actos de la tarea id_tarea: '||
                              v_id_fljo_trea||' codigo acto: '||v_cdgo_acto_tarea||
                              ' id_prgrma: '||c_fljo.id_prgrma||' id_sbprgrma: '||c_fljo.id_sbprgrma;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);*/
            FOR c_acto IN (SELECT b.id_acto_tpo,
                                  b.dscrpcion,
                                  a.id_acto_tpo_rqrdo,
                                  a.indcdor_oblgtrio
                             FROM gn_d_actos_tipo_tarea a
                             JOIN gn_d_actos_tipo b
                               ON a.id_acto_tpo = b.id_acto_tpo
                             JOIN fi_d_programas_acto c
                               ON b.id_acto_tpo = c.id_acto_tpo
                            WHERE b.cdgo_clnte = p_cdgo_clnte
                              AND a.indcdor_oblgtrio = 'S'
                              AND a.id_fljo_trea = v_id_fljo_trea
                              AND c.id_prgrma = c_fljo.id_prgrma
                              AND c.id_sbprgrma = c_fljo.id_sbprgrma) LOOP
              /*o_mnsje_rspsta := 'entro al cursor c_acto: v_id_fljo_trea :' ||
                                v_id_fljo_trea;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);*/ --Se valida el tipo de acto esta parametrizado para generarse masivamente
              BEGIN
                BEGIN
                  SELECT a.indcdor_msvo, b.cdgo_acto_tpo, b.id_acto_tpo
                    INTO v_indcdor_msvo, v_cdgo_acto_tpo, v_id_acto_tpo
                    FROM fi_d_programas_acto a
                    JOIN gn_d_actos_tipo b
                      ON a.id_acto_tpo = b.id_acto_tpo
                   WHERE a.id_prgrma = c_fljo.id_prgrma
                     AND a.id_sbprgrma = c_fljo.id_sbprgrma
                     AND a.id_acto_tpo = c_acto.id_acto_tpo
                     AND a.indcdor_msvo = 'S';

                EXCEPTION
                  WHEN others THEN
                    o_cdgo_rspsta := 3;

                    o_mnsje_rspsta := o_cdgo_rspsta || ' - ' || 'El acto ' ||
                                      c_acto.dscrpcion ||
                                      'no esta configurado como masivo en la parametrica de Programas Actos de Fiscalización';

                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          NULL,
                                          nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta || ' - ' ||
                                          sqlerrm,
                                          6);

                    RETURN;

                END;

                IF c_acto.id_acto_tpo_rqrdo IS NOT NULL THEN
                  --Se obtiene el acto que es requerido
                  /*o_mnsje_rspsta := 'entro al cursor select 1 condicion if 1 :' ||
                                    v_id_fljo_trea;
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta,
                                        6);*/
                  BEGIN
                    SELECT b.id_acto, c.cdgo_acto_tpo
                      INTO v_id_acto_rqrdo, v_cdgo_acto_tpo_rqrdo
                      FROM fi_g_fsclzcion_expdnte_acto b
                      JOIN gn_d_actos_tipo c
                        ON b.id_acto_tpo = c.id_acto_tpo
                     WHERE b.id_acto_tpo = c_acto.id_acto_tpo_rqrdo
                       AND id_fsclzcion_expdnte =
                           c_fljo.id_fsclzcion_expdnte;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 1;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo obtener el acto padre requerido';

                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta || ' , ' ||
                                            sqlerrm,
                                            6);

                      RETURN;

                  END;

                END IF;

                --Se obtiene la plantilla y el reporte para el acto
                BEGIN
                  SELECT id_plntlla, id_rprte
                    INTO v_id_plntlla, v_id_rprte
                    FROM gn_d_plantillas
                   WHERE id_acto_tpo = c_acto.id_acto_tpo
                     AND actvo = 'S';

                EXCEPTION
                  WHEN no_data_found THEN
                    o_cdgo_rspsta := 2;

                    o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                      'No se encontro parametrizado plantilla para el Acto';

                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          NULL,
                                          nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta || ' , ' ||
                                          sqlerrm,
                                          6);

                    RETURN;

                  WHEN others THEN
                    o_cdgo_rspsta := 3;

                    o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                      'Problema al obtener la plantilla para el acto';

                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          NULL,
                                          nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta || ' , ' ||
                                          sqlerrm,
                                          6);

                    RETURN;

                END;

                /*o_mnsje_rspsta := 'Consulta reporte: '||v_id_rprte;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);*/
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      'Generar documento ' || p_cdgo_clnte ||
                                      ' - ' || c_fljo.id_sjto_impsto ||
                                      ' - ' || c_fljo.id_instncia_fljo ||
                                      ' - ' || c_fljo.idntfccion_sjto ||
                                      ' - ' || c_fljo.id_fsclzcion_expdnte ||
                                      ' - ' || c_fljo.id_cnddto || ' - ' ||
                                      p_id_fncnrio || ' - ' || v_id_plntlla,
                                      6);

                --Se obtiene el contenido que va a tener el acto
                v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => '[{"CDGO_CLNTE":' ||
                                                                               p_cdgo_clnte || ',
                                                                                    "ID_SJTO_IMPSTO":' ||
                                                                               c_fljo.id_sjto_impsto || ',
                                                                                    "ID_INSTNCIA_FLJO":' ||
                                                                               c_fljo.id_instncia_fljo || ',
                                                                                    "IDNTFCCION":' ||
                                                                               c_fljo.idntfccion_sjto || ',
                                                                                    "ID_FSCLZCION_EXPDNTE":' ||
                                                                               c_fljo.id_fsclzcion_expdnte || ',
                                                                                    "ID_CNDDTO":' ||
                                                                               c_fljo.id_cnddto || ',
                                                                                    "ID_FNCNRIO":"' ||
                                                                               p_id_fncnrio || '"
                                                                                  }]',
                                                               p_id_plntlla => v_id_plntlla);

                IF v_dcmnto IS NULL THEN
                  o_cdgo_rspsta := 7;

                  o_mnsje_rspsta := 'No se pudo generar el contenido del acto ' ||
                                    c_acto.dscrpcion;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  RETURN;

                END IF;

                --Se obtiene las vigencias con las que se va a generar el acto
                DECLARE
                  vgncia_prdo JSON_OBJECT_T := JSON_OBJECT_T();

                  vgncia JSON_OBJECT_T := JSON_OBJECT_T();

                  vgncia_array JSON_ARRAY_T := JSON_ARRAY_T();

                  vigencia JSON_ARRAY_T := JSON_ARRAY_T();

                BEGIN
                  FOR c_candidato IN (SELECT a.vgncia, a.id_prdo
                                        FROM fi_g_candidatos_vigencia a
                                        JOIN fi_g_fsclzc_expdn_cndd_vgnc b
                                          ON a.id_cnddto_vgncia =
                                             b.id_cnddto_vgncia
                                       WHERE a.id_cnddto = c_fljo.id_cnddto) LOOP
                    vgncia_prdo.put('VGNCIA', c_candidato.vgncia);

                    vgncia_prdo.put('ID_PRDO', c_candidato.id_prdo);

                  END LOOP;

                  vgncia_array.append(vgncia_prdo);

                  vgncia.put('VGNCIA', JSON_ARRAY_T(vgncia_array));

                  vigencia.append(vgncia);

                  --Se llama a la up que registra el tipo de acto en fiscalizacion expediente acto
                  BEGIN
                    /*o_mnsje_rspsta := 'Antes de prc_rg_expediente_acto: ' ||systimestamp;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          null,
                                          nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta,
                                          6);*/
                    prc_rg_expediente_acto(p_cdgo_clnte                => p_cdgo_clnte,
                                           p_id_usrio                  => p_id_usrio,
                                           p_id_fljo_trea              => v_id_fljo_trea,
                                           p_id_plntlla                => v_id_plntlla,
                                           p_id_acto_tpo               => c_acto.id_acto_tpo,
                                           p_id_fsclzcion_expdnte      => c_fljo.id_fsclzcion_expdnte,
                                           p_dcmnto                    => v_dcmnto,
                                           p_json                      => vigencia.to_clob,
                                           o_id_fsclzcion_expdnte_acto => o_id_fsclzcion_expdnte_acto,
                                           o_cdgo_rspsta               => o_cdgo_rspsta,
                                           o_mnsje_rspsta              => o_mnsje_rspsta);

                    /*o_mnsje_rspsta := 'Despues de prc_rg_expediente_acto - o_id_fsclzcion_expdnte_acto: '||o_id_fsclzcion_expdnte_acto||systimestamp;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          null,
                                          nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta,
                                          6);*/
                    IF o_cdgo_rspsta > 0 THEN
                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta || ' , ' ||
                                            sqlerrm,
                                            6);

                      RETURN;

                    END IF;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 8;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'Problema al llamar al procedimiento prc_rg_expediente_acto ' ||
                                        ' , ' || p_json;

                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta || ' , ' ||
                                            sqlerrm,
                                            6);

                      RETURN;

                  END;

                END;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      'v_cdgo_acto_tpo:' || v_cdgo_acto_tpo ||
                                      '- Antes del case v_cdgo_acto_tpo_rqrdo' ||
                                      v_cdgo_acto_tpo_rqrdo || sqlerrm,
                                      6);

                CASE
                  WHEN v_cdgo_acto_tpo_rqrdo IN
                       ('RXD', 'RSPE', /*'RSXNI',*/ 'RSELS') THEN
                    --Resolucion sancion por no declarar (Se agregan los codigos de los actos de resolucion sancion)
                    BEGIN
                      SELECT a.id_lqdcion
                        INTO v_sancion
                        FROM fi_g_fsclzc_expdn_cndd_vgnc a
                       WHERE a.id_lqdcion IS NOT NULL
                         AND a.id_fsclzcion_expdnte =
                             c_fljo.id_fsclzcion_expdnte;

                    EXCEPTION
                      WHEN no_data_found THEN
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                              NULL,
                                              nmbre_up,
                                              v_nl,
                                              'No trajo datos, antes de prc_rg_liquidacion ' ||
                                              sqlerrm,
                                              6);

                        BEGIN
                          pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte           => p_cdgo_clnte,
                                                                  p_id_usrio             => p_id_usrio,
                                                                  p_id_fsclzcion_expdnte => c_fljo.id_fsclzcion_expdnte,
                                                                  o_vlor_ttal            => v_vlor_ttal,
                                                                  o_cdgo_rspsta          => o_cdgo_rspsta,
                                                                  o_mnsje_rspsta         => o_mnsje_rspsta);

                          IF o_cdgo_rspsta > 0 THEN
                            o_mnsje_rspsta := 'Entro a la condicion del rg_liquidacion : ' ||
                                              o_cdgo_rspsta || ' - ' ||
                                              c_fljo.id_instncia_fljo;

                            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                  NULL,
                                                  nmbre_up,
                                                  v_nl,
                                                  o_mnsje_rspsta || ' , ' ||
                                                  sqlerrm,
                                                  6);

                            /*o_mnsje_rspsta := 'v_id_fljo_trea : ' ||
                                              v_id_fljo_trea ||
                                              '-c_fljo.id_instncia_fljo ' ||
                                              c_fljo.id_instncia_fljo;
                            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                  null,
                                                  nmbre_up,
                                                  v_nl,
                                                  o_mnsje_rspsta || ' , ' ||
                                                  sqlerrm,
                                                  6);*/
                            prc_rg_expediente_error(p_id_cnddto        => c_fljo.id_cnddto,
                                                    p_mnsje            => v_mnsje,
                                                    p_cdgo_clnte       => p_cdgo_clnte,
                                                    p_id_usrio         => p_id_usrio,
                                                    p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                                    p_id_fljo_trea     => v_id_fljo_trea);

                            BEGIN
                              prc_rv_flujo_tarea(p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                                 p_id_fljo_trea     => v_id_fljo_trea,
                                                 p_cdgo_clnte       => p_cdgo_clnte); --Revierte la tarea

                            EXCEPTION
                              WHEN others THEN
                                o_mnsje_rspsta := 'Erro al llamar : pkg_pl_workflow_1_0.prc_rv_flujo_tarea: ' ||
                                                  v_id_fljo_trea || ' - ' ||
                                                  c_fljo.id_instncia_fljo;

                                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                      NULL,
                                                      nmbre_up,
                                                      v_nl,
                                                      o_mnsje_rspsta ||
                                                      ' , ' || sqlerrm,
                                                      6);

                            END;

                            ROLLBACK;

                            RETURN;

                          END IF;

                        EXCEPTION
                          WHEN others THEN
                            o_cdgo_rspsta := 2;

                            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                              'No se pudo llamar a la up que liquida el acto';

                            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                  NULL,
                                                  nmbre_up,
                                                  v_nl,
                                                  o_mnsje_rspsta || ' , ' ||
                                                  sqlerrm,
                                                  6);

                            RETURN;

                        END;

                    END;

                  WHEN v_cdgo_acto_tpo IN ('PCN', 'RSXNI') THEN
                    /*begin
                      select a.id_lqdcion
                        into v_sancion
                        from fi_g_fsclzc_expdn_cndd_vgnc a
                       where a.id_lqdcion is not null
                         and a.id_fsclzcion_expdnte = c_fljo.id_fsclzcion_expdnte;

                    exception
                      when no_data_found then*/
                    BEGIN
                      /*o_mnsje_rspsta := 'Antes de prc_rg_liquidacion: ' ||systimestamp;
                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            null,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta,
                                            6);*/
                      pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte                => p_cdgo_clnte,
                                                              p_id_usrio                  => p_id_usrio,
                                                              p_id_fsclzcion_expdnte      => c_fljo.id_fsclzcion_expdnte,
                                                              p_id_fsclzcion_expdnte_acto => o_id_fsclzcion_expdnte_acto,
                                                              o_vlor_ttal                 => v_vlor_ttal,
                                                              o_cdgo_rspsta               => o_cdgo_rspsta,
                                                              o_mnsje_rspsta              => o_mnsje_rspsta);

                      /*o_mnsje_rspsta := 'Despues de prc_rg_liquidacion: ' ||systimestamp;
                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            null,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta,
                                            6);*/
                      IF o_cdgo_rspsta > 0 THEN
                        /*o_mnsje_rspsta := 'Entro a la condicion de error rg_liquidacion: '||o_cdgo_rspsta||
                        ' - id_instncia_fljo: ' ||c_fljo.id_instncia_fljo||
                        ' - v_id_fljo_trea: ' ||v_id_fljo_trea;*/
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                              NULL,
                                              nmbre_up,
                                              v_nl,
                                              o_mnsje_rspsta || ' , ' ||
                                              sqlerrm,
                                              6);

                        prc_rg_expediente_error(p_id_cnddto        => c_fljo.id_cnddto,
                                                p_mnsje            => v_mnsje,
                                                p_cdgo_clnte       => p_cdgo_clnte,
                                                p_id_usrio         => p_id_usrio,
                                                p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                                p_id_fljo_trea     => v_id_fljo_trea);

                        BEGIN
                          prc_rv_flujo_tarea(p_id_instncia_fljo => c_fljo.id_instncia_fljo,
                                             p_id_fljo_trea     => v_id_fljo_trea,
                                             p_cdgo_clnte       => p_cdgo_clnte); --Revierte la tarea

                        EXCEPTION
                          WHEN others THEN
                            o_mnsje_rspsta := 'Erro al llamar : pkg_pl_workflow_1_0.prc_rv_flujo_tarea: ' ||
                                              v_id_fljo_trea || ' - ' ||
                                              c_fljo.id_instncia_fljo;

                            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                  NULL,
                                                  nmbre_up,
                                                  v_nl,
                                                  o_mnsje_rspsta || ' , ' ||
                                                  sqlerrm,
                                                  6);

                        END;

                        ROLLBACK;

                        RETURN;

                      END IF;

                    EXCEPTION
                      WHEN others THEN
                        o_cdgo_rspsta := 2;

                        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                          'No se pudo llamar a la up que liquida el acto';

                        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                              NULL,
                                              nmbre_up,
                                              v_nl,
                                              o_mnsje_rspsta || ' , ' ||
                                              sqlerrm,
                                              6);

                        RETURN;

                    END;

                --end;
                  ELSE
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          NULL,
                                          nmbre_up,
                                          v_nl,
                                          'El tipo de acto o codigo del acto no coinciden con las condiciones ' ||
                                          sqlerrm,
                                          6);

                    NULL;

                END CASE;

                IF v_cdgo_acto_tpo <> 'ADACH' THEN
                  --Se llama la up que genera el acto
                  BEGIN
                    /*o_mnsje_rspsta := 'Antes de prc_rg_acto: ' ||systimestamp;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          null,
                                          nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta || ' , ' || sqlerrm,
                                          6);*/
                    IF o_cdgo_rspsta = 0 THEN
                      prc_rg_acto(p_cdgo_clnte                => p_cdgo_clnte,
                                  p_id_usrio                  => p_id_usrio,
                                  p_id_fsclzcion_expdnte_acto => o_id_fsclzcion_expdnte_acto,
                                  p_id_cnddto                 => c_fljo.id_cnddto,
                                  p_acto_vlor_ttal            => v_vlor_ttal,
                                  o_cdgo_rspsta               => o_cdgo_rspsta,
                                  o_mnsje_rspsta              => o_mnsje_rspsta);

                      /*o_mnsje_rspsta := 'Despues de prc_rg_acto: ' ||sqlerrm||' - '||systimestamp;
                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            null,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta,
                                            6);*/
                    END IF;

                    IF o_cdgo_rspsta > 0 THEN
                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta || ' , ' ||
                                            sqlerrm,
                                            6);

                      RETURN;

                    END IF;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 9;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'Problema al llamar al procedimiento prc_rg_acto ';

                      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                            NULL,
                                            nmbre_up,
                                            v_nl,
                                            o_mnsje_rspsta || ' , ' ||
                                            sqlerrm,
                                            6);

                      RETURN;

                  END;

                END IF;

              EXCEPTION
                WHEN no_data_found THEN
                  NULL;

                WHEN others THEN
                  o_cdgo_rspsta := 10;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'Problema al consultar si el tipo de acto se encuentra parametrizado para generarse masivamente ' ||
                                    ' , ' || sqlerrm;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  RETURN;

              END;

              o_mnsje_rspsta := 'Registro exitoso ';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              COMMIT;

            END LOOP;

          ELSE
            --Se registras los motivos por el cual no se hizo la transicion
            BEGIN
              v_mnsje := replace(v_mnsje, '</br>');

              v_mnsje := replace(v_mnsje, '</br');

              --v_mnsje := replace(v_mnsje, '.','. '||CHR(13)||'');
              -- v_mnsje := v_mnsje ||CHAR(13);

              INSERT INTO fi_g_fsclzcn_expdnt_act_trnscn
                (id_sjto_impsto,
                 id_instncia_fljo,
                 id_fljo_trea,
                 obsrvciones,
                 id_fncnrio,
                 cdgo_clnte)
              VALUES
                (c_fljo.id_sjto_impsto,
                 c_fljo.id_instncia_fljo,
                 c_fljo.id_fljo_trea_orgen,
                 v_mnsje,
                 p_id_fncnrio,
                 p_cdgo_clnte);

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    v_mnsje || ' , ' || sqlerrm,
                                    6);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 11;

                o_mnsje_rspsta := 'No se pudo registrar el resultado de las transiciones';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          END IF;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 12;

          o_mnsje_rspsta := 'No se ha podido llamar al procedimiento que registra instancia transicion';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

    END LOOP;

  END prc_rg_acto_transicion_masiva;

  PROCEDURE prc_ac_expdnte_acto_vgncia(p_cdgo_clnte     IN number,
                                       p_id_acto        IN number,
                                       o_estdo_instncia OUT varchar2,
                                       o_cdgo_rspsta    OUT number,
                                       o_mnsje_rspsta   OUT varchar2) AS
    v_nl number;

    v_id_fsclzcion_expdnte_acto number;

    v_id_rcrso number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_ac_expdnte_acto_vgncia';

    o_json CLOB;

  BEGIN
    o_cdgo_rspsta := 0;

    BEGIN
      pkg_gj_recurso.prc_co_acto_recurso(p_cdgo_clnte   => p_cdgo_clnte,
                                         p_id_acto      => p_id_acto,
                                         o_json         => o_json,
                                         o_cdgo_rspsta  => o_cdgo_rspsta,
                                         o_mnsje_rspsta => o_mnsje_rspsta);

      IF o_cdgo_rspsta > 0 THEN
        RETURN;

      END IF;

      IF o_json IS NOT NULL THEN
        o_estdo_instncia := JSON_VALUE(o_json, '$.v_estdo_instncia');

        --Se obtiene el expediente acto al que se le interpuso un recurso
        BEGIN
          SELECT b.id_fsclzcion_expdnte_acto, b.id_rcrso
            INTO v_id_fsclzcion_expdnte_acto, v_id_rcrso
            FROM fi_g_fsclzcion_expdnte_acto b
           WHERE b.id_acto = p_id_acto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := 'No se pudo obtener el identificador del expediente acto ' ||
                              v_id_fsclzcion_expdnte_acto;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

        IF v_id_rcrso IS NULL THEN
          --Se actualiza el campo id_rcrso del expiente acto que se le interpuso un recurso
          BEGIN
            UPDATE fi_g_fsclzcion_expdnte_acto a
               SET a.id_rcrso = JSON_VALUE(o_json, '$.id_rcrso')
             WHERE a.id_acto = p_id_acto;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 2;

              o_mnsje_rspsta := 'No se actualizo el campo id_acto del acto ' ||
                                p_id_acto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              RETURN;

          END;

          COMMIT;

        END IF;

        FOR c_vgncia IN (SELECT vgncia, id_prdo, indcdr_fvrble
                           FROM json_table(o_json,
                                           '$.vgncias[*]'
                                           columns(vgncia varchar2 PATH
                                                   '$.vgncia',
                                                   id_prdo varchar2 PATH
                                                   '$.id_prdo',
                                                   indcdr_fvrble varchar2 PATH
                                                   '$.indcdr_fvrble'))) LOOP
          BEGIN
            UPDATE fi_g_fsclzcion_acto_vgncia a
               SET a.acptda_jrdca = c_vgncia.indcdr_fvrble
             WHERE a.id_fsclzcion_expdnte_acto =
                   v_id_fsclzcion_expdnte_acto
               AND a.vgncia = c_vgncia.vgncia
               AND a.id_prdo = c_vgncia.id_prdo;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 2;

              o_mnsje_rspsta := 'No se actualizo el campo aceptada juridica para el expediente acto ' ||
                                v_id_fsclzcion_expdnte_acto ||
                                ' vigencia-periodo ' || c_vgncia.vgncia -
                                c_vgncia.id_prdo;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              RETURN;

          END;

        END LOOP;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'Problema al llamar el procedimiento que valida existe un recurso para el acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

  END prc_ac_expdnte_acto_vgncia;

  FUNCTION fnc_co_detalle_declaracion(p_cdgo_clnte IN number,
                                      p_id_cnddto  IN number) RETURN CLOB AS
    v_tabla CLOB := '<table border="1" style="border-collapse:collapse;" width="100%">';

  BEGIN
    FOR c_dclrcion IN (SELECT a.id_dclrcion, c.vgncia, e.prdo, d.dscrpcion
                         FROM gi_g_declaraciones a
                         JOIN gi_d_dclrcnes_vgncias_frmlr b
                           ON a.id_dclrcion_vgncia_frmlrio =
                              b.id_dclrcion_vgncia_frmlrio
                         JOIN gi_d_dclrcnes_tpos_vgncias c
                           ON b.id_dclrcion_tpo_vgncia =
                              c.id_dclrcion_tpo_vgncia
                         JOIN gi_d_declaraciones_tipo d
                           ON c.id_dclrcn_tpo = d.id_dclrcn_tpo
                         JOIN df_i_periodos e
                           ON c.id_prdo = e.id_prdo
                        WHERE exists
                        (SELECT 1
                                 FROM fi_g_candidatos f
                                 JOIN fi_g_candidatos_vigencia g
                                   ON f.id_cnddto = g.id_cnddto
                                 JOIN fi_g_fsclzc_expdn_cndd_vgnc x
                                   ON g.id_cnddto_vgncia = x.id_cnddto_vgncia
                                WHERE f.cdgo_clnte = p_cdgo_clnte
                                  AND f.id_sjto_impsto = a.id_sjto_impsto
                                  AND g.id_dclrcion_vgncia_frmlrio =
                                      a.id_dclrcion_vgncia_frmlrio
                                  AND f.id_cnddto = p_id_cnddto)) LOOP
      v_tabla := v_tabla ||
                 '<thead>
                                <tr>
                                    <th style="text-align: center; border:1px solid black" colspan="12">' ||
                 c_dclrcion.dscrpcion || ' Vigencia ' || c_dclrcion.vgncia ||
                 ' Periodo ' || c_dclrcion.prdo ||
                 '</th>
                                </tr>
                            </thead><tbody>';

      FOR c_dtll IN (SELECT dscrpcion, vlor_dsplay
                       FROM json_table((SELECT pkg_gi_declaraciones.fnc_co_atributos_seleccion(p_id_dclrcion          => c_dclrcion.id_dclrcion,
                                                                                              p_cdgo_extrccion_objto => 'FIS')
                                         FROM dual),
                                       '$[*]'
                                       columns(cdgo_extrccion_objto
                                               varchar2(3) PATH
                                               '$.cdgo_extrccion_objto',
                                               id_frmlrio number PATH
                                               '$.id_frmlrio',
                                               id_frmlrio_rgion number PATH
                                               '$.id_frmlrio_rgion',
                                               id_frmlrio_rgion_atrbto number PATH
                                               '$.id_frmlrio_rgion_atrbto',
                                               dscrpcion varchar2(1000) PATH
                                               '$.dscrpcion',
                                               vlor CLOB PATH '$.vlor',
                                               vlor_dsplay CLOB PATH
                                               '$.vlor_dsplay'))) LOOP
        v_tabla := v_tabla ||
                   '<tr>
                                    <td colspan="6">' ||
                   c_dtll.dscrpcion ||
                   '</td>
                                    <td style="text-align: right" colspan="6">' ||
                   c_dtll.vlor_dsplay ||
                   '</td>
                                </tr>';

      END LOOP;

      v_tabla := v_tabla || '</tbody>';

    END LOOP;

    v_tabla := v_tabla || '</table>';

    RETURN v_tabla;

  END fnc_co_detalle_declaracion;

  FUNCTION fnc_vl_emplazamiento(p_cdgo_clnte                 IN number,
                                p_id_sjto_impsto             IN number,
                                p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_id_cnddto number;

    v_id_fsclzcion_expdnte number;

  BEGIN
    BEGIN
      SELECT c.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM v_fi_g_candidatos a
        JOIN fi_g_candidatos_vigencia b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzc_expdn_cndd_vgnc d
          ON b.id_cnddto_vgncia = d.id_cnddto_vgncia
        JOIN fi_g_fiscalizacion_expdnte c
          ON d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
       WHERE a.id_sjto_impsto = p_id_sjto_impsto
         AND b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND c.cdgo_expdnte_estdo = 'ABT'
         AND a.cdgo_prgrma = 'O'
         AND exists
       (SELECT 1
                FROM fi_g_fsclzcion_expdnte_acto d
                JOIN gn_d_actos_tipo e
                  ON d.id_acto_tpo = e.id_acto_tpo
                JOIN gn_g_actos f
                  ON d.id_acto = f.id_acto
               WHERE d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
                 AND e.cdgo_acto_tpo = 'EPD'
                 AND NOT f.fcha_ntfccion IS NULL);

      RETURN 'S';

    EXCEPTION
      WHEN no_data_found THEN
        RETURN 'N';

    END;

  END fnc_vl_emplazamiento;

  FUNCTION fnc_vl_emplazamiento_correcion(p_cdgo_clnte                 IN number,
                                          p_id_sjto_impsto             IN number,
                                          p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_id_fsclzcion_expdnte number;

  BEGIN
    BEGIN
      SELECT c.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM v_fi_g_candidatos a
        JOIN fi_g_candidatos_vigencia b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzc_expdn_cndd_vgnc d
          ON b.id_cnddto_vgncia = d.id_cnddto_vgncia
        JOIN fi_g_fiscalizacion_expdnte c
          ON a.id_cnddto = c.id_cnddto
       WHERE a.id_sjto_impsto = p_id_sjto_impsto
         AND b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND c.cdgo_expdnte_estdo = 'ABT'
         AND a.cdgo_prgrma = 'I'
         AND exists
       (SELECT 1
                FROM fi_g_fsclzcion_expdnte_acto d
                JOIN gn_d_actos_tipo e
                  ON d.id_acto_tpo = e.id_acto_tpo
                JOIN gn_g_actos f
                  ON d.id_acto = f.id_acto
               WHERE d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
                 AND e.cdgo_acto_tpo = 'EPC'
                 AND NOT f.fcha_ntfccion IS NULL);

      RETURN 'S';

    EXCEPTION
      WHEN no_data_found THEN
        RETURN 'N';

    END;

  END fnc_vl_emplazamiento_correcion;

  FUNCTION fnc_vl_requerimiento_especial(p_cdgo_clnte                 IN number,
                                         p_id_sjto_impsto             IN number,
                                         p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_id_fsclzcion_expdnte number;

  BEGIN
    BEGIN
      SELECT c.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM v_fi_g_candidatos a
        JOIN fi_g_candidatos_vigencia b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzc_expdn_cndd_vgnc d
          ON b.id_cnddto_vgncia = d.id_cnddto_vgncia
        JOIN fi_g_fiscalizacion_expdnte c
          ON a.id_cnddto = c.id_cnddto
       WHERE a.id_sjto_impsto = p_id_sjto_impsto
         AND b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND c.cdgo_expdnte_estdo = 'ABT'
         AND a.cdgo_prgrma = 'I'
         AND exists
       (SELECT 1
                FROM fi_g_fsclzcion_expdnte_acto d
                JOIN gn_d_actos_tipo e
                  ON d.id_acto_tpo = e.id_acto_tpo
                JOIN gn_g_actos f
                  ON d.id_acto = f.id_acto
               WHERE d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
                 AND e.cdgo_acto_tpo = 'RE'
                 AND NOT f.fcha_ntfccion IS NULL);

      RETURN 'S';

    EXCEPTION
      WHEN no_data_found THEN
        RETURN 'N';

    END;

  END fnc_vl_requerimiento_especial;

  FUNCTION fnc_vl_liquidacion_revision(p_cdgo_clnte                 IN number,
                                       p_id_sjto_impsto             IN number,
                                       p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_id_fsclzcion_expdnte number;

  BEGIN
    BEGIN
      SELECT a.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM fi_g_candidatos c
        JOIN fi_g_fiscalizacion_expdnte a
          ON c.id_cnddto = a.id_cnddto
        JOIN fi_g_fsclzcion_expdnte_acto b
          ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
         AND c.id_sjto_impsto = p_id_sjto_impsto
         AND a.cdgo_expdnte_estdo = 'ABT'
       WHERE b.id_acto_tpo =
             (SELECT id_acto_tpo
                FROM gn_d_actos_tipo c
               WHERE c.cdgo_clnte = p_cdgo_clnte
                 AND c.cdgo_acto_tpo = 'LODR');

      RETURN 'S';

    EXCEPTION
      WHEN no_data_found THEN
        RETURN 'N';

    END;

  END fnc_vl_liquidacion_revision;

  PROCEDURE prc_rg_liquida_acto(p_cdgo_clnte                IN number,
                                p_id_instncia_fljo          IN number,
                                p_id_fsclzcion_expdnte_acto IN number DEFAULT NULL,
                                p_id_acto_tpo               IN number DEFAULT NULL,
                                o_cdgo_rspsta               OUT number,
                                o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_sncion number;

    v_sncion_pcn number;

    v_cdgo_rspsta number;

    v_id_fsclzcion_expdnte number;

    v_id_acto_tpo number;

    v_id_usrio number;

    v_id_fncnrio number;

    v_id_cnddto number;

    v_id_prdo number;

    v_vgncia number;

    v_id_sjto_tpo number;

    n_mses number;

    v_idntfccion_sjto varchar2(100);

    v_nmbre_impsto_acto varchar2(500);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_liquida_acto';

    v_mnsje_log varchar2(4000);

    v_cdgo_dclrcion_uso varchar2(100);

    v_cdgo_acto_tpo varchar2(20);

    v_dscrpcion varchar2(100);

    v_id_dclrcion gi_g_declaraciones.id_dclrcion%TYPE;

    v_fcha_prsntcion gi_g_declaraciones.fcha_prsntcion%TYPE;

    v_id_dclrcion_crrccion gi_g_declaraciones.id_dclrcion_crrccion%TYPE;

    lqudcion_cncpto json_object_t := json_object_t();

    json_hmlgcion json_object_t;

    lqudcion_cncpto_array json_array_t := json_array_t();

    v_vlor_trfa number;

    v_dvsor_trfa number;

    v_cdgo_indcdor_tpo varchar2(5);

    v_vlor_cdgo_indcdor_tpo number(16, 2);

    v_vlor_trfa_clcldo number;

    v_exprsion_rdndeo VARCHAR2(50);

    v_id_fsclzcion_sncion number;

    v_vlor_ttal number;

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    o_mnsje_rspsta := 'Entrando: ' || p_id_fsclzcion_expdnte_acto || '-' ||
                      nmbre_up;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || systimestamp,
                          6);

    --Se obtiene el expediente
    BEGIN
      SELECT a.id_fsclzcion_expdnte, a.id_fncnrio, a.id_cnddto
        INTO v_id_fsclzcion_expdnte, v_id_fncnrio, v_id_cnddto
        FROM fi_g_fiscalizacion_expdnte a
       WHERE a.id_instncia_fljo = p_id_instncia_fljo;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' No se encontro el expediente del flujo ' ||
                          p_id_instncia_fljo;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se obtiene el usuario
    BEGIN
      SELECT a.id_usrio
        INTO v_id_usrio
        FROM v_sg_g_usuarios a
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND a.id_fncnrio = v_id_fncnrio;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' Problema al obtener el identificador del usuario del funcionario ' ||
                          v_id_fncnrio || ' , ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se obtiene el tipo de acto
    o_mnsje_rspsta := o_cdgo_rspsta ||
                      'Antes de if  p_id_fsclzcion_expdnte_acto ' ||
                      p_id_fsclzcion_expdnte_acto;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

    IF p_id_fsclzcion_expdnte_acto IS NOT NULL THEN
      BEGIN
        SELECT a.id_acto_tpo, b.cdgo_acto_tpo, b.dscrpcion
          INTO v_id_acto_tpo, v_cdgo_acto_tpo, v_dscrpcion
          FROM fi_g_fsclzcion_expdnte_acto a
          JOIN gn_d_actos_tipo b
            ON a.id_acto_tpo = b.id_acto_tpo
         WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'No se encontro el tipo de de acto que se va a liquidar en el expediente';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

    ELSE
      BEGIN
        SELECT a.dscrpcion, a.id_acto_tpo, a.cdgo_acto_tpo
          INTO v_dscrpcion, v_id_acto_tpo, v_cdgo_acto_tpo
          FROM gn_d_actos_tipo a
         WHERE a.cdgo_clnte = p_cdgo_clnte
           AND a.id_acto_tpo = p_id_acto_tpo;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'No se encontro el tipo de de acto que se va a liquidar';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

    END IF;

    --Se recorren las vigencias que se van a liquidar

    FOR c_vgnca IN (SELECT b.id_impsto,
                           b.id_impsto_sbmpsto,
                           b.id_sjto_impsto,
                           a.id_fsclzcion_expdnte,
                           c.vgncia,
                           c.id_prdo,
                           d.prdo,
                           c.id_cnddto_vgncia,
                           c.id_dclrcion_vgncia_frmlrio,
                           b.nmbre_impsto,
                           b.nmbre_impsto_sbmpsto
                      FROM fi_g_fiscalizacion_expdnte a
                      JOIN v_fi_g_candidatos b
                        ON a.id_cnddto = b.id_cnddto
                      JOIN fi_g_candidatos_vigencia c
                        ON b.id_cnddto = c.id_cnddto
                      JOIN fi_g_fsclzc_expdn_cndd_vgnc e
                        ON c.id_cnddto_vgncia = e.id_cnddto_vgncia
                      JOIN df_i_periodos d
                        ON c.id_prdo = d.id_prdo
                     WHERE a.id_fsclzcion_expdnte = v_id_fsclzcion_expdnte) LOOP
      BEGIN
        SELECT a.id_sjto_tpo, b.idntfccion_sjto
          INTO v_id_sjto_tpo, v_idntfccion_sjto
          FROM si_i_personas a
          JOIN v_si_i_sujetos_impuesto b
            ON a.id_sjto_impsto = b.id_sjto_impsto
         WHERE a.id_sjto_impsto = c_vgnca.id_sjto_impsto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 5;

          o_mnsje_rspsta := 'No se encontro el tipo de sujeto y la identificacion del sujeto impuesto ' ||
                            c_vgnca.id_sjto_impsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se consulta la declaracion presentada
      BEGIN
        /*select  max(id_dclrcion)--,
               --  id_dclrcion_crrccion,
                -- b.cdgo_dclrcion_uso
         into    v_id_dclrcion--,
                -- v_id_dclrcion_crrccion,
                -- v_cdgo_dclrcion_uso
         from gi_g_declaraciones     a
         join gi_d_declaraciones_uso b   on a.id_dclrcion_uso = b.id_dclrcion_uso
        -- join fi_g_candidatos_vigencia   c   on a.id_dclrcion = c.id_dclrcion
         where id_dclrcion_vgncia_frmlrio = c_vgnca.id_dclrcion_vgncia_frmlrio
         and id_sjto_impsto = c_vgnca.id_sjto_impsto
         and c.id_cnddto = v_id_cnddto
         --and a.indcdor_mgrdo is null-- validar que no traiga declaraciones de migracion
         and cdgo_dclrcion_estdo in ('PRS', 'APL');*/
        SELECT a.id_dclrcion
          INTO v_id_dclrcion
          FROM gi_g_declaraciones a
          JOIN gi_d_declaraciones_uso b
            ON a.id_dclrcion_uso = b.id_dclrcion_uso
          JOIN fi_g_candidatos_vigencia c
            ON a.id_dclrcion = c.id_dclrcion
         WHERE a.id_dclrcion_vgncia_frmlrio =
               c_vgnca.id_dclrcion_vgncia_frmlrio
           AND a.id_sjto_impsto = c_vgnca.id_sjto_impsto

           AND c.id_cnddto_vgncia = c_vgnca.id_cnddto_vgncia --and a.indcdor_mgrdo is null -- validar que no traiga declaraciones de migracion

           AND a.cdgo_dclrcion_estdo IN ('PRS', 'APL');

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 4;

          o_mnsje_rspsta := 'No se encontro la declaracion del sujeto impuesto ' ||
                            c_vgnca.id_sjto_impsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        WHEN too_many_rows THEN
          o_cdgo_rspsta := 5;

          o_mnsje_rspsta := 'Se encontro mas de una declaracion para la vigencia y periodo ' ||
                            c_vgnca.vgncia || '-' || c_vgnca.prdo ||
                            'del sujeto impuesto ' ||
                            c_vgnca.id_sjto_impsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 5;

          o_mnsje_rspsta := 'Problema al obtener la declaracion del sujeto impuesto ' ||
                            c_vgnca.id_sjto_impsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se obtiene el json de homologacion
      BEGIN
        json_hmlgcion := NEW
                         json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS',
                                                                                    v_id_dclrcion));

        o_mnsje_rspsta := 'Fecha presentacion : ' ||
                          to_date(json_hmlgcion.get_string('FLPA'));

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        IF v_cdgo_acto_tpo IN ('PCM', 'RSELS') THEN
          o_mnsje_rspsta := 'Entro en PCM o RSELS, valor de v_sncion: ' ||
                            json_hmlgcion.get_number('CSAN');

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          v_sncion := json_hmlgcion.get_number('CSAN');

        ELSIF v_cdgo_acto_tpo IN ('PCE', 'RSPE') THEN
          o_mnsje_rspsta := 'Entro en PCE o RSPE, valor de v_sncion: ' ||
                            json_hmlgcion.get_number('IMCA');

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          v_sncion := json_hmlgcion.get_number('IMCA');

        ELSIF v_cdgo_acto_tpo IN ('PCN', 'RSXNI') THEN
          o_mnsje_rspsta := 'Entro en PCN o RSXNI, valor de v_sncion: ' ||
                            json_hmlgcion.get_number('INNE');

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          v_sncion := json_hmlgcion.get_number('INNE');

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := 'No se pudo instanciar el objeto json de homologacion ' ||
                            sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      BEGIN
        n_mses := fnc_co_numero_meses_x_sancion(p_id_dclrcion_vgncia_frmlrio => c_vgnca.id_dclrcion_vgncia_frmlrio,
                                                p_idntfccion                 => v_idntfccion_sjto,
                                                p_id_sjto_tpo                => v_id_sjto_tpo,
                                                p_fcha_prsntcion             => to_date(json_hmlgcion.get_string('FLPA'),
                                                                                        'dd/mm/yy'));

        o_mnsje_rspsta := 'calculo de meses vencidos n_mses ' || n_mses ||
                          '-fecha presentacion :' ||
                          json_hmlgcion.get_string('FLPA');

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := 'Error al obtener el numero de meses ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      /*  if  v_cdgo_acto_tpo = 'PCN'  then
                 for c_sncion in (select vgncia,
                                      prdo,
                                      bse,
                                      sncion,
                                      sncion_dclrada,
                                      dfrncia_sncion,
                                      incrmnto,
                                      sncion_ttal,
                                      cdgo_rspsta,
                                      mnsje_rspsta
                                  from json_table (
                                                      (
                                                          select pkg_fi_fiscalizacion.fnc_co_sancion_no_enviar_informacion(v_id_cnddto, c_vgnca.id_sjto_impsto)
                                                          from dual
                                                      ), '$[*]'
                                  columns(
                                              vgncia          varchar2    path  '$.vgncia',
                                              prdo            varchar2    path  '$.prdo',
                                              bse             varchar2    path  '$.bse',
                                              sncion          varchar2    path  '$.sncion',
                                              sncion_dclrada  varchar2    path  '$.sncion_dclrada',
                                              dfrncia_sncion  varchar2    path  '$.dfrncia_sncion',
                                              incrmnto        varchar2    path  '$.incrmnto',
                                              sncion_ttal     varchar2    path  '$.sncion_ttal',
                                              cdgo_rspsta     varchar2    path  '$.cdgo_rspsta',
                                              mnsje_rspsta    varchar2    path  '$.mnsje_rspsta'
                                          )
                                  )) loop

                  if c_sncion.cdgo_rspsta > 0 then
                     /* return pkg_wf_funciones.fnc_wf_error( p_value   => false,
                                                            p_mensaje => c_sncion.mnsje_rspsta);
                     v_sncion_pcn := 0;
                  else
                    v_sncion_pcn  := c_sncion.sncion;

                  end if;

              end loop;


      end if;*/
      o_mnsje_rspsta := 'VALOR DE v_sncion_pcn: ' || v_sncion_pcn;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      o_mnsje_rspsta := 'Sancion antes de v_sncion ' || v_sncion;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      o_mnsje_rspsta := 'Sancion antes de v_cdgo_acto_tpo ' ||
                        v_cdgo_acto_tpo;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      v_sncion := (CASE
                    WHEN v_cdgo_acto_tpo IN ('PCM', 'RSELS') THEN --Si el acto que se va a liquidar pliego de cargos por sancion mal liquidada la base es la diferencia que dejo de pagar
                     (v_sncion - json_hmlgcion.get_number('VASA'))
                    WHEN v_cdgo_acto_tpo IN ('PCE', 'RSPE') THEN --Si el acto que se va a liquidar es un pliego de cargos por extemporaneo la base es el valor del item impuesto a cargo
                     v_sncion
                    WHEN v_cdgo_acto_tpo IN ('PCN', 'RSXNI') THEN --Si el acto que se va a liquidar es un pliego de cargos por no enviar informacion la base es el valor del item 10. ingresos netos
                     v_sncion -- v_sncion_pcn
                  END);

      IF v_sncion < 0 THEN
        o_cdgo_rspsta := 8;

        o_mnsje_rspsta := 'El valor de la sancion es negativo';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      END IF;

      --Se valida si el impuesto acto existe (El impuesto acto debe tener el mismo codigo del tipo de acto)
      BEGIN
        SELECT a.nmbre_impsto_acto
          INTO v_nmbre_impsto_acto
          FROM df_i_impuestos_acto a
         WHERE a.id_impsto = c_vgnca.id_impsto
           AND a.id_impsto_sbmpsto = c_vgnca.id_impsto_sbmpsto
           AND a.cdgo_impsto_acto = v_cdgo_acto_tpo;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 7;

          o_mnsje_rspsta := 'No se encontro parametrizado el impuesto acto de codigo ' ||
                            v_cdgo_acto_tpo || ' para el impuesto ' ||
                            c_vgnca.nmbre_impsto || ' subimpuesto ' ||
                            c_vgnca.nmbre_impsto_sbmpsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 7;

          o_mnsje_rspsta := o_cdgo_rspsta || '-' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se valida si la vigencia y el periodo que se esta fiscalizando esta parametrizada en impuesto acto concepto
      BEGIN
        SELECT b.vgncia, b.id_prdo
          INTO v_vgncia, v_id_prdo
          FROM df_i_impuestos_acto a
          JOIN df_i_impuestos_acto_concepto b
            ON a.id_impsto_acto = b.id_impsto_acto
          JOIN df_i_periodos c
            ON b.id_prdo = c.id_prdo
         WHERE a.cdgo_impsto_acto = v_cdgo_acto_tpo
           AND b.cdgo_clnte = p_cdgo_clnte
           AND b.vgncia = c_vgnca.vgncia
           AND b.id_prdo = c_vgnca.id_prdo
         GROUP BY b.vgncia, b.id_prdo;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 7;

          o_mnsje_rspsta := 'No se encontro parametrizado la vigencia ' ||
                            c_vgnca.vgncia || ' y periodo ' || c_vgnca.prdo ||
                            ' para el impuesto Acto ' ||
                            v_nmbre_impsto_acto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se recorre los conceptos del impuesto acto

      FOR c_acto_cncpto IN (SELECT b.id_impsto_acto_cncpto,
                                   b.id_cncpto,
                                   b.vgncia,
                                   b.id_prdo,
                                   b.orden
                              FROM df_i_impuestos_acto a
                              JOIN df_i_impuestos_acto_concepto b
                                ON a.id_impsto_acto = b.id_impsto_acto
                             WHERE b.cdgo_clnte = p_cdgo_clnte
                               AND a.cdgo_impsto_acto = v_cdgo_acto_tpo
                               AND b.vgncia = c_vgnca.vgncia
                               AND b.id_prdo = c_vgnca.id_prdo) LOOP
        BEGIN
          SELECT e.vlor_trfa,
                 e.dvsor_trfa,
                 e.cdgo_indcdor_tpo,
                 e.vlor_cdgo_indcdor_tpo,
                 e.vlor_trfa_clcldo,
                 e.exprsion_rdndeo
            INTO v_vlor_trfa,
                 v_dvsor_trfa,
                 v_cdgo_indcdor_tpo,
                 v_vlor_cdgo_indcdor_tpo,
                 v_vlor_trfa_clcldo,
                 v_exprsion_rdndeo
            FROM v_gi_d_tarifas_esquema e
           where (e.id_impsto_acto_cncpto =
                 c_acto_cncpto.id_impsto_acto_cncpto AND
                 e.id_tp_bs_sncn_dcl_vgn_frm IS NULL OR
                 e.id_impsto_acto_cncpto =
                 c_acto_cncpto.id_impsto_acto_cncpto AND
                 e.id_tp_bs_sncn_dcl_vgn_frm = NULL);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 6;

            o_mnsje_rspsta := 'Error al calcular la base, no existe tarifa esquema ';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

        lqudcion_cncpto.put('cncpto', c_acto_cncpto.id_cncpto);

        lqudcion_cncpto.put('vgncia', c_acto_cncpto.vgncia);

        lqudcion_cncpto.put('id_prdo', c_acto_cncpto.id_prdo);

        lqudcion_cncpto.put('bse', v_sncion);

        lqudcion_cncpto.put('prdo', c_vgnca.prdo);

        lqudcion_cncpto.put('id_impsto_acto_cncpto',
                            c_acto_cncpto.id_impsto_acto_cncpto);

        lqudcion_cncpto.put('nmro_mses', n_mses);

        lqudcion_cncpto.put('orden', c_acto_cncpto.orden);

        lqudcion_cncpto.put('id_cnddto_vgncia', c_vgnca.id_cnddto_vgncia);

        --detalle de calculo de sancion
        lqudcion_cncpto.put('vlor_trfa', v_vlor_trfa);

        lqudcion_cncpto.put('dvsor_trfa', v_dvsor_trfa);

        lqudcion_cncpto.put('cdgo_indcdor_tpo', v_cdgo_indcdor_tpo);

        lqudcion_cncpto.put('vlor_cdgo_indcdor_tpo',
                            v_vlor_cdgo_indcdor_tpo);

        lqudcion_cncpto.put('vlor_trfa_clcldo', v_vlor_trfa_clcldo);

        lqudcion_cncpto.put('exprsion_rdndeo', v_exprsion_rdndeo);

        lqudcion_cncpto_array.append(lqudcion_cncpto);

      END LOOP;

      IF v_cdgo_acto_tpo <> 'PCP' THEN
        --Se registra la informacion con que se va a liquidar
        BEGIN
          o_mnsje_rspsta := 'Entrando al llamado: prc_rg_fi_g_fsclzcion_sncion';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || systimestamp,
                                6);

          o_mnsje_rspsta := 'Cliente: ' || p_cdgo_clnte || ', Expediente: ' ||
                            v_id_fsclzcion_expdnte || ', Acto: ' ||
                            v_id_acto_tpo || ', Json: ' ||
                            lqudcion_cncpto_array.to_string;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || systimestamp,
                                6);

          SELECT a.id_fsclzcion_sncion
            INTO v_id_fsclzcion_sncion
            FROM fi_g_fiscalizacion_sancion a
           WHERE a.id_fsclzcion_expdnte = v_id_fsclzcion_expdnte
             AND rownum = 1;

        EXCEPTION
          WHEN no_data_found THEN
            pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           => p_cdgo_clnte,
                                                              p_id_fsclzcion_expdnte => v_id_fsclzcion_expdnte,
                                                              p_id_acto_tpo          => v_id_acto_tpo,
                                                              p_json                 => lqudcion_cncpto_array.to_string,
                                                              o_cdgo_rspsta          => o_cdgo_rspsta,
                                                              o_mnsje_rspsta         => o_mnsje_rspsta);

            o_mnsje_rspsta := 'Saliendo del llamado: ' || o_mnsje_rspsta;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || systimestamp,
                                  6);

            IF v_cdgo_rspsta > 0 THEN
              RETURN;

            END IF;

          WHEN others THEN
            o_cdgo_rspsta := 8;

            o_mnsje_rspsta := 'No se pudo llamar la up que registra la sancion';

            RETURN;

        END;

        o_mnsje_rspsta := 'Saliendo con exito del llamado: ' || nmbre_up ||
                          '.prc_rg_fi_g_fsclzcion_sncion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || systimestamp,
                              6);

      END IF;

    END LOOP;

    IF p_id_fsclzcion_expdnte_acto IS NOT NULL THEN
      --Se liquida el acto del expediente
      BEGIN
        o_mnsje_rspsta := 'Entrando al llamado: ' || nmbre_up ||
                          '.prc_rg_liquidacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || systimestamp,
                              6);

        pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte                => p_cdgo_clnte,
                                                p_id_usrio                  => v_id_usrio,
                                                p_id_fsclzcion_expdnte      => v_id_fsclzcion_expdnte,
                                                p_id_fsclzcion_expdnte_acto => p_id_fsclzcion_expdnte_acto,
                                                o_vlor_ttal                 => v_vlor_ttal,
                                                o_cdgo_rspsta               => o_cdgo_rspsta,
                                                o_mnsje_rspsta              => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          ROLLBACK;

          RETURN;

        END IF;

        o_mnsje_rspsta := 'Saliendo con exito del llamado: ' || nmbre_up ||
                          '.prc_rg_liquidacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || systimestamp,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 10;

          o_mnsje_rspsta := 'No se pudo llamar la up que registra la liquidacion ' ||
                            sqlerrm;

          RETURN;

      END;

    END IF;

    o_mnsje_rspsta := 'Saliendo: ' || nmbre_up;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || systimestamp,
                          6);

  END prc_rg_liquida_acto;

  FUNCTION fnc_vl_aplca_dscnto_plgo_crgo(p_xml IN CLOB) RETURN varchar2 AS
    v_nmbre_up varchar2(100) := 'pkg_gn_reglas_negocio.fnc_vl_aplca_dscnto_plgo_crgo';

    v_undad_drcion varchar2(10);

    v_dia_tpo varchar2(10);

    v_fcha_incial timestamp;

    v_fcha_fnal timestamp;

    v_drcion number;

    v_id_fljo_trea number;

    v_id_acto_tpo number;

    v_cdgo_acto_tpo varchar2(5);

    v_id_fsclzcion_expdnte number;

    v_indcdor_cmple varchar2(1);

    v_nmro_expdnte varchar2(100);

  BEGIN
    BEGIN
      SELECT c.id_acto_tpo,
             CASE
               WHEN fcha_ntfccion IS NULL THEN
                trunc(sysdate)
               ELSE
                fcha_ntfccion
             END AS fcha_ntfccion,
             id_fljo_trea,
             e.cdgo_acto_tpo,
             b.id_fsclzcion_expdnte,
             b.nmro_expdnte
        INTO v_id_acto_tpo,
             v_fcha_incial,
             v_id_fljo_trea,
             v_cdgo_acto_tpo,
             v_id_fsclzcion_expdnte,
             v_nmro_expdnte
        FROM fi_g_candidatos a
        JOIN fi_g_fiscalizacion_expdnte b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzcion_expdnte_acto c
          ON b.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
        JOIN fi_g_fsclzcion_acto_vgncia d
          ON c.id_fsclzcion_expdnte_acto = d.id_fsclzcion_expdnte_acto
        JOIN gn_d_actos_tipo e
          ON c.id_acto_tpo = e.id_acto_tpo
        JOIN gn_g_actos f
          ON c.id_acto = f.id_acto
       WHERE a.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
         AND a.id_impsto_sbmpsto =
             json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
         AND a.id_sjto_impsto = json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
         AND d.vgncia = json_value(p_xml, '$.P_VGNCIA')
         AND d.id_prdo = json_value(p_xml, '$.P_ID_PRDO')
         AND d.vgncia BETWEEN json_value(p_xml, '$.VGNCIA_DSDE') AND
             json_value(p_xml, '$.VGNCIA_HSTA')
         AND e.cdgo_acto_tpo IN ('PCN', 'PCE', 'PCM')
         AND b.cdgo_expdnte_estdo = 'ABT' -- and not f.fcha_ntfccion is null
      ;

    EXCEPTION
      WHEN others THEN
        RETURN 'N';

    END;

    IF v_cdgo_acto_tpo = 'PCN' THEN
      BEGIN
        SELECT b.indcdor_cmple
          INTO v_indcdor_cmple
          FROM fi_g_fiscalizacion_expdnte a
          JOIN fi_g_fsclzcion_expdnte_acto b
            ON b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte --where b.id_expdnte_sncntrio = v_id_fsclzcion_expdnte;

         WHERE b.nmro_expdnte_sncntrio = v_nmro_expdnte;

      EXCEPTION
        WHEN others THEN
          v_indcdor_cmple := 'N';

      END;

    END IF;

    BEGIN
      SELECT undad_drcion, drcion, dia_tpo
        INTO v_undad_drcion, v_drcion, v_dia_tpo
        FROM gn_d_actos_tipo_tarea
       WHERE id_acto_tpo = v_id_acto_tpo
         AND id_fljo_trea = v_id_fljo_trea;

    EXCEPTION
      WHEN others THEN
        RETURN 'N';

    END;

    --Se obtiene la fecha final
    v_fcha_fnal := pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => json_value(p_xml,
                                                                                       '$.P_CDGO_CLNTE'),
                                                         p_fecha_inicial => v_fcha_incial,
                                                         p_undad_drcion  => v_undad_drcion,
                                                         p_drcion        => v_drcion,
                                                         p_dia_tpo       => v_dia_tpo);

    IF v_fcha_fnal IS NOT NULL THEN
      IF v_fcha_fnal >=
         to_date(json_value(p_xml, '$.P_FCHA_PRYCCION'), 'DD/MM/YYYY') THEN
        IF v_cdgo_acto_tpo = 'PCN' THEN
          IF v_indcdor_cmple = 'S' THEN
            RETURN 'S';

          ELSE
            RETURN 'N';

          END IF;

        ELSE
          RETURN 'S';

        END IF;

      ELSE
        RETURN 'N';

      END IF;

    END IF;

    RETURN 'N';

  END fnc_vl_aplca_dscnto_plgo_crgo;

  FUNCTION fnc_vl_aplca_dscnto_rslcion_sncion(p_xml IN CLOB) RETURN varchar2 AS
    v_nmbre_up varchar2(100) := 'pkg_gn_reglas_negocio.fnc_vl_aplca_dscnto_plgo_crgo';

    v_undad_drcion varchar2(10);

    v_dia_tpo varchar2(10);

    v_fcha_incial timestamp;

    v_fcha_fnal timestamp;

    v_drcion number;

    v_id_fljo_trea number;

    v_id_acto_tpo number;

    v_cdgo_acto_tpo varchar2(5);

    v_id_fsclzcion_expdnte number;

    v_indcdor_cmple varchar2(1);

    v_nmro_expdnte varchar2(100);

  BEGIN
    BEGIN
      SELECT c.id_acto_tpo,
             CASE
               WHEN fcha_ntfccion IS NULL THEN
                trunc(sysdate)
               ELSE
                fcha_ntfccion
             END AS fcha_ntfccion,
             id_fljo_trea,
             e.cdgo_acto_tpo,
             b.id_fsclzcion_expdnte,
             b.nmro_expdnte
        INTO v_id_acto_tpo,
             v_fcha_incial,
             v_id_fljo_trea,
             v_cdgo_acto_tpo,
             v_id_fsclzcion_expdnte,
             v_nmro_expdnte
        FROM fi_g_candidatos a
        JOIN fi_g_fiscalizacion_expdnte b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzcion_expdnte_acto c
          ON b.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
        JOIN fi_g_fsclzcion_acto_vgncia d
          ON c.id_fsclzcion_expdnte_acto = d.id_fsclzcion_expdnte_acto
        JOIN gn_d_actos_tipo e
          ON c.id_acto_tpo = e.id_acto_tpo
        JOIN gn_g_actos f
          ON c.id_acto = f.id_acto
       WHERE a.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
         AND a.id_impsto_sbmpsto =
             json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
         AND a.id_sjto_impsto = json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
         AND d.vgncia = json_value(p_xml, '$.P_VGNCIA')
         AND d.id_prdo = json_value(p_xml, '$.P_ID_PRDO')
         AND d.vgncia BETWEEN json_value(p_xml, '$.VGNCIA_DSDE') AND
             json_value(p_xml, '$.VGNCIA_HSTA')
         AND e.cdgo_acto_tpo IN ('RSXNI', 'RSPE', 'RSELS')
         AND b.cdgo_expdnte_estdo = 'ABT' -- and not f.fcha_ntfccion is null
      ;

    EXCEPTION
      WHEN others THEN
        RETURN 'N';

    END;

    IF v_cdgo_acto_tpo = 'RSXNI' THEN
      BEGIN
        SELECT b.indcdor_cmple
          INTO v_indcdor_cmple
          FROM fi_g_fiscalizacion_expdnte a
          JOIN fi_g_fsclzcion_expdnte_acto b
            ON b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte --where b.id_expdnte_sncntrio = v_id_fsclzcion_expdnte;

         WHERE b.nmro_expdnte_sncntrio = v_nmro_expdnte;

      EXCEPTION
        WHEN others THEN
          v_indcdor_cmple := 'N';

      END;

    END IF;

    BEGIN
      SELECT undad_drcion, drcion, dia_tpo
        INTO v_undad_drcion, v_drcion, v_dia_tpo
        FROM gn_d_actos_tipo_tarea
       WHERE id_acto_tpo = v_id_acto_tpo
         AND id_fljo_trea = v_id_fljo_trea;

    EXCEPTION
      WHEN others THEN
        RETURN 'N';

    END;

    --Se obtiene la fecha final
    v_fcha_fnal := pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => json_value(p_xml,
                                                                                       '$.P_CDGO_CLNTE'),
                                                         p_fecha_inicial => v_fcha_incial,
                                                         p_undad_drcion  => v_undad_drcion,
                                                         p_drcion        => v_drcion,
                                                         p_dia_tpo       => v_dia_tpo);

    IF v_fcha_fnal IS NOT NULL THEN
      IF v_fcha_fnal >=
         to_date(json_value(p_xml, '$.P_FCHA_PRYCCION'), 'DD/MM/YYYY') THEN
        IF v_cdgo_acto_tpo = 'RSXNI' THEN
          IF v_indcdor_cmple = 'S' THEN
            RETURN 'S';

          ELSE
            RETURN 'N';

          END IF;

        ELSE
          RETURN 'S';

        END IF;

      ELSE
        RETURN 'N';

      END IF;

    END IF;

    RETURN 'N';

  END fnc_vl_aplca_dscnto_rslcion_sncion;

  FUNCTION fnc_co_base_sancion(p_id_dclrcion IN number) RETURN varchar2 AS
    v_id_dclrcion number;

    v_id_dclrcion_crrccion number;

    v_sncion number;

    v_id_dclrcion_vgncia_frmlrio number;

    v_cdgo_clnte number;

    v_cdgo_dclrcion_uso varchar2(100);

    json_hmlgcion json_object_t;

  BEGIN
    --Se consulta la declaracion presentada
    BEGIN
      SELECT a.cdgo_clnte,
             a.id_dclrcion,
             a.id_dclrcion_crrccion,
             a.id_dclrcion_vgncia_frmlrio,
             b.cdgo_dclrcion_uso
        INTO v_cdgo_clnte,
             v_id_dclrcion,
             v_id_dclrcion_crrccion,
             v_id_dclrcion_vgncia_frmlrio,
             v_cdgo_dclrcion_uso
        FROM gi_g_declaraciones a
        JOIN gi_d_declaraciones_uso b
          ON a.id_dclrcion_uso = b.id_dclrcion_uso
       WHERE a.id_dclrcion = p_id_dclrcion
         AND cdgo_dclrcion_estdo IN ('PRS', 'APL');

    EXCEPTION
      WHEN others THEN
        RETURN 'No se encontro la declaracion';

    END;

    --Se obtiene el json de homologacion
    BEGIN
      json_hmlgcion := NEW
                       json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS',
                                                                                  p_id_dclrcion));

    EXCEPTION
      WHEN others THEN
        RETURN 'No se pudo instanciar el objeto json de homologacion';

    END;

    v_sncion := json_hmlgcion.get_string('IMCA');

    RETURN v_sncion;

  END fnc_co_base_sancion;

  FUNCTION fnc_co_sancion(p_id_dclrcion IN number) RETURN varchar2 AS
    v_id_dclrcion number;

    v_id_dclrcion_crrccion number;

    v_sncion number;

    v_id_dclrcion_vgncia_frmlrio number;

    v_cdgo_clnte number;

    v_cdgo_dclrcion_uso varchar2(100);

    json_hmlgcion json_object_t;

  BEGIN
    --Se consulta la declaracion presentada
    BEGIN
      SELECT a.cdgo_clnte,
             a.id_dclrcion,
             a.id_dclrcion_crrccion,
             a.id_dclrcion_vgncia_frmlrio,
             b.cdgo_dclrcion_uso
        INTO v_cdgo_clnte,
             v_id_dclrcion,
             v_id_dclrcion_crrccion,
             v_id_dclrcion_vgncia_frmlrio,
             v_cdgo_dclrcion_uso
        FROM gi_g_declaraciones a
        JOIN gi_d_declaraciones_uso b
          ON a.id_dclrcion_uso = b.id_dclrcion_uso
       WHERE a.id_dclrcion = p_id_dclrcion
         AND cdgo_dclrcion_estdo IN ('PRS', 'APL');

    EXCEPTION
      WHEN others THEN
        RETURN 'No se encontro la declaracion';

    END;

    --Se obtiene el json de homologacion
    BEGIN
      json_hmlgcion := NEW
                       json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS',
                                                                                  p_id_dclrcion));

      v_sncion := json_hmlgcion.get_number('CSAN');

    EXCEPTION
      WHEN others THEN
        RETURN 'No se pudo instanciar el objeto json de homologacion';

    END;

    --Se llama la funcion que calcula la sancion
    /*begin
        v_sncion := pkg_gi_sanciones.fnc_ca_valor_sancion(p_cdgo_clnte                  =>  v_cdgo_clnte,
                                                          p_id_dclrcion_vgncia_frmlrio  =>  v_id_dclrcion_vgncia_frmlrio,
                                                          p_idntfccion          =>  json_hmlgcion.get_string('IDEN'),
                                                          p_fcha_prsntcion        =>  to_timestamp(json_hmlgcion.get_string('FLPA')),
                                                          p_id_sjto_tpo                 =>  json_hmlgcion.get_number('SUTP'),
                                                          p_cdgo_sncion_tpo       =>  json_hmlgcion.get_string('CSTP'),
                                                          p_cdgo_dclrcion_uso       =>  v_cdgo_dclrcion_uso,
                                                          p_id_dclrcion_incial      =>  null,
                                                          p_impsto_crgo         =>  json_hmlgcion.get_number('IMCA'),
                                                          p_ingrsos_brtos         =>  json_hmlgcion.get_number('INBR'),
                                                          p_saldo_favor         =>  json_hmlgcion.get_string('SAFV'));

    exception
        when others then
            return 'Problema al llamar la funcion que calcula el valor de la sancion ';
    end;*/
    RETURN v_sncion;

  END fnc_co_sancion;

  FUNCTION fnc_co_sancion_declaracion(p_id_dclrcion IN number)
    RETURN varchar2 AS
    v_id_dclrcion number;

    v_id_dclrcion_crrccion number;

    v_sncion number;

    v_id_dclrcion_vgncia_frmlrio number;

    v_cdgo_clnte number;

    v_cdgo_dclrcion_uso varchar2(100);

    json_hmlgcion json_object_t;

  BEGIN
    --Se consulta la declaracion presentada
    BEGIN
      SELECT a.cdgo_clnte,
             a.id_dclrcion,
             a.id_dclrcion_crrccion,
             a.id_dclrcion_vgncia_frmlrio,
             b.cdgo_dclrcion_uso
        INTO v_cdgo_clnte,
             v_id_dclrcion,
             v_id_dclrcion_crrccion,
             v_id_dclrcion_vgncia_frmlrio,
             v_cdgo_dclrcion_uso
        FROM gi_g_declaraciones a
        JOIN gi_d_declaraciones_uso b
          ON a.id_dclrcion_uso = b.id_dclrcion_uso
       WHERE a.id_dclrcion = p_id_dclrcion
         AND cdgo_dclrcion_estdo IN ('PRS', 'APL');

    EXCEPTION
      WHEN others THEN
        RETURN 'No se encontro la declaracion';

    END;

    --Se obtiene el json de homologacion
    BEGIN
      json_hmlgcion := NEW
                       json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS',
                                                                                  p_id_dclrcion));

    EXCEPTION
      WHEN others THEN
        RETURN 'No se pudo instanciar el objeto json de homologacion';

    END;

    v_sncion := json_hmlgcion.get_string('VASA');

    RETURN v_sncion;

  END fnc_co_sancion_declaracion;

  FUNCTION fnc_co_numero_meses_x_sancion(p_id_dclrcion_vgncia_frmlrio number,
                                         p_idntfccion                 varchar2,
                                         p_id_sjto_tpo                number DEFAULT NULL,
                                         p_fcha_prsntcion             IN gi_d_dclrcnes_fcha_prsntcn.fcha_fnal%TYPE)
    RETURN varchar2 AS
    v_fcha_lmte_dclrcion gi_d_dclrcnes_fcha_prsntcn.fcha_fnal%TYPE;

    v_numero_meses_sancion number;

    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.fnc_co_numero_meses_x_sancion';

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(23001,
                                        NULL,
                                        'pkg_fi_fiscalizacion.fnc_co_numero_meses_x_sancion');

    pkg_sg_log.prc_rg_log(23001,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    pkg_sg_log.prc_rg_log(23001,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'p_id_dclrcion_vgncia_frmlrio: ' ||
                          p_id_dclrcion_vgncia_frmlrio || '-p_idntfccion: ' ||
                          p_idntfccion || '-p_id_sjto_tpo: ' ||
                          p_id_sjto_tpo || '- p_fcha_prsntcion: ' ||
                          p_fcha_prsntcion,
                          6);

    v_fcha_lmte_dclrcion := pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                                           p_id_sjto_tpo                => p_id_sjto_tpo,
                                                                           p_idntfccion                 => p_idntfccion);

    pkg_sg_log.prc_rg_log(23001,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'v_fcha_lmte_dclrcion: ' || v_fcha_lmte_dclrcion,
                          6);

    v_numero_meses_sancion := ceil(months_between(p_fcha_prsntcion,
                                                  v_fcha_lmte_dclrcion));

    pkg_sg_log.prc_rg_log(23001,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'v_numero_meses_sancion: ' ||
                          v_numero_meses_sancion,
                          6);

    RETURN v_numero_meses_sancion;

  END fnc_co_numero_meses_x_sancion;

  FUNCTION fnc_co_sancion_mal_liquidada(p_id_cnddto      IN number,
                                        p_id_sjto_impsto IN number)
    RETURN CLOB AS
    v_id_dclrcion number;

    v_id_dclrcion_crrccion number;

    v_sncion number;

    v_id_dclrcion_vgncia_frmlrio number;

    v_cdgo_clnte number;

    v_vlor_trfa number;

    v_dvsor_trfa number;

    v_incrmnto number;

    v_incrmnto_rdcdo number;

    v_dfrncia_sncion number;

    v_id_impsto_acto_cncpto number;

    v_id_impsto_acto number;

    v_prcntje_dscnto number;

    v_id_cncpto number;

    v_rdndeo df_s_redondeos_expresion.exprsion%TYPE;

    v_lqdcion_mnma number;

    v_cdgo_dclrcion_uso varchar2(100);

    v_nmbre_impsto_acto varchar2(100);

    v_dscrpcion varchar2(100);

    json_hmlgcion json_object_t;

    objecto_json_array json_array_t := json_array_t();

    v_sncion_vlor number := 0;

    v_impsto_crgo number := 0;

  BEGIN
    DECLARE
      objecto_json JSON_OBJECT_T := JSON_OBJECT_T();

    BEGIN
      FOR c_dclracion IN (SELECT a.cdgo_clnte,
                                 a.id_impsto,
                                 a.id_impsto_sbmpsto,
                                 a.nmbre_impsto,
                                 a.nmbre_impsto_sbmpsto,
                                 c.id_dclrcion,
                                 c.id_dclrcion_crrccion,
                                 c.id_dclrcion_vgncia_frmlrio,
                                 d.cdgo_dclrcion_uso,
                                 c.vgncia,
                                 e.prdo,
                                 e.id_prdo
                            FROM v_fi_g_candidatos a
                            JOIN fi_g_candidatos_vigencia b
                              ON a.id_cnddto = b.id_cnddto
                            JOIN fi_g_fsclzc_expdn_cndd_vgnc f
                              ON b.id_cnddto_vgncia = f.id_cnddto_vgncia
                            JOIN gi_g_declaraciones c
                              ON b.id_dclrcion_vgncia_frmlrio =
                                 c.id_dclrcion_vgncia_frmlrio
                             AND a.id_sjto_impsto = c.id_sjto_impsto
                            JOIN gi_d_declaraciones_uso d
                              ON c.id_dclrcion_uso = d.id_dclrcion_uso
                            JOIN df_i_periodos e
                              ON c.id_prdo = e.id_prdo
                           WHERE a.id_cnddto = p_id_cnddto
                             AND cdgo_dclrcion_estdo IN ('PRS', 'APL')) LOOP
        --Se valida si el impuesto acto existe (El impuesto acto debe tener el mismo codigo del acto)
        BEGIN
          SELECT a.id_impsto_acto, a.nmbre_impsto_acto
            INTO v_id_impsto_acto, v_nmbre_impsto_acto
            FROM df_i_impuestos_acto a
           WHERE a.id_impsto = c_dclracion.id_impsto
             AND a.id_impsto_sbmpsto = c_dclracion.id_impsto_sbmpsto
             AND a.cdgo_impsto_acto = 'PCM';

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 1);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro parametrizado el impuesto acto de codigo PCM ' ||
                             ' para el impuesto ' ||
                             c_dclracion.nmbre_impsto || ' subimpuesto ' ||
                             c_dclracion.nmbre_impsto_sbmpsto);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 2);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se valida si la vigencia y el periodo que se esta fiscalizando esta parametrizada en impuesto acto concepto
        BEGIN
          SELECT b.id_impsto_acto
            INTO v_id_impsto_acto
            FROM df_i_impuestos_acto a
            JOIN df_i_impuestos_acto_concepto b
              ON a.id_impsto_acto = b.id_impsto_acto
            JOIN df_i_periodos c
              ON b.id_prdo = c.id_prdo
           WHERE b.cdgo_clnte = c_dclracion.cdgo_clnte
             AND a.id_impsto_acto = v_id_impsto_acto
             AND b.vgncia = c_dclracion.vgncia
             AND b.id_prdo = c_dclracion.id_prdo
           GROUP BY b.id_impsto_acto;

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 3);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro parametrizado la vigencia ' ||
                             c_dclracion.vgncia || ' y periodo ' ||
                             c_dclracion.prdo || ' para el impuesto Acto ' ||
                             v_nmbre_impsto_acto || '(PCM)');

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 4);

            objecto_json.put('mnsje_rspsta', v_id_impsto_acto || sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        BEGIN
          SELECT c.vlor_trfa,
                 c.dvsor_trfa,
                 b.id_cncpto,
                 b.id_impsto_acto_cncpto,
                 c.lqdcion_mnma,
                 c.exprsion_rdndeo
            INTO v_vlor_trfa,
                 v_dvsor_trfa,
                 v_id_cncpto,
                 v_id_impsto_acto_cncpto,
                 v_lqdcion_mnma,
                 v_rdndeo
            FROM df_i_impuestos_acto a
            JOIN df_i_impuestos_acto_concepto b
              ON a.id_impsto_acto = b.id_impsto_acto
            JOIN v_gi_d_tarifas_esquema c
              ON b.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto
           WHERE a.id_impsto_acto = v_id_impsto_acto
             AND b.vgncia = c_dclracion.vgncia
             AND b.id_prdo = c_dclracion.id_prdo; --and not c.id_impsto_acto_cncpto_bse is null;

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 5);

            objecto_json.put('mnsje_rspsta',
                             'Que el impuesto acto ' || v_id_impsto_acto || '-' ||
                             v_nmbre_impsto_acto ||
                             ' tenga parametrizado para ' ||
                             ' la vigencia ' || c_dclracion.vgncia ||
                             ' periodo ' || c_dclracion.prdo ||
                             ' una tarifa o que el concepto incremento sancion tenga parametrizado ' ||
                             ' el concepto base');

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 6);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        /*begin
          select b.prcntje_dscnto, a.dscrpcion
            into v_prcntje_dscnto, v_dscrpcion
            from df_i_conceptos a
            join re_g_descuentos_regla b
              on a.id_cncpto = b.id_cncpto
           where a.id_cncpto = v_id_cncpto;
        exception
          when no_data_found then
            objecto_json.put('cdgo_rspsta', 5);
            objecto_json.put('mnsje_rspsta',
                             'El concepto ' || v_dscrpcion ||
                             ', no tiene parametrizado la regla de descuento.');
            objecto_json_array.append(objecto_json);
            return objecto_json_array.to_string;
          when others then
            objecto_json.put('cdgo_rspsta', 6);
            objecto_json.put('mnsje_rspsta', sqlerrm);
            objecto_json_array.append(objecto_json);
            return objecto_json_array.to_string;
        end;*/ --Se obtiene el json de homologacion
        BEGIN
          json_hmlgcion := NEW
                           json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS',
                                                                                      c_dclracion.id_dclrcion));

          BEGIN
            v_sncion := json_hmlgcion.get_number('CSAN');

          EXCEPTION
            WHEN others THEN
              objecto_json.put('cdgo_rspsta', 7);

              objecto_json.put('mnsje_rspsta',
                               'No se pudo obtener el valor para la propiedad (CSAN) o no existe la parametrización para alguno de los formularios fiscalizados' ||
                               sqlerrm);

              objecto_json_array.append(objecto_json);

              RETURN objecto_json_array.to_string;

          END;

          BEGIN
            v_sncion_vlor := json_hmlgcion.get_number('VASA');

          EXCEPTION
            WHEN others THEN
              objecto_json.put('cdgo_rspsta', 7);

              objecto_json.put('mnsje_rspsta',
                               'No se pudo obtener el valor para la propiedad (VASA) o no existe la parametrización para alguno de los formularios fiscalizados' ||
                               sqlerrm);

              objecto_json_array.append(objecto_json);

              RETURN objecto_json_array.to_string;

          END;

          BEGIN
            v_impsto_crgo := json_hmlgcion.get_number('IMCA');

          EXCEPTION
            WHEN others THEN
              objecto_json.put('cdgo_rspsta', 7);

              objecto_json.put('mnsje_rspsta',
                               'No se pudo obtener el valor para la propiedad (IMCA) o no existe la parametrización para alguno de los formularios fiscalizados' ||
                               sqlerrm);

              objecto_json_array.append(objecto_json);

              RETURN objecto_json_array.to_string;

          END;

        EXCEPTION
          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 7);

            objecto_json.put('mnsje_rspsta',
                             'No se pudo instanciar el json de homologacion' ||
                             sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        v_incrmnto := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => ((v_sncion - --json_hmlgcion.get_number('VASA')) *
                                                                           v_sncion_vlor) *
                                                                           v_vlor_trfa) /
                                                                           v_dvsor_trfa,
                                                            p_expresion => v_rdndeo);

        IF v_incrmnto < v_lqdcion_mnma THEN
          v_incrmnto := v_lqdcion_mnma;

        END IF;

        v_incrmnto_rdcdo := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (v_incrmnto *
                                                                                 v_prcntje_dscnto),
                                                                  p_expresion => v_rdndeo);

        v_dfrncia_sncion := ceil(v_sncion - v_sncion_vlor);

        objecto_json.put('vgncia', c_dclracion.vgncia);

        objecto_json.put('prdo', c_dclracion.prdo);

        objecto_json.put('bse', v_impsto_crgo);

        objecto_json.put('sncion', v_sncion);

        objecto_json.put('sncion_dclrada', v_sncion_vlor);

        objecto_json.put('dfrncia_sncion', v_sncion - v_sncion_vlor);

        objecto_json.put('incrmnto', v_incrmnto);

        objecto_json.put('sncion_ttal', v_dfrncia_sncion + v_incrmnto);

        objecto_json.put('incrmnto_rdcido', v_incrmnto - v_incrmnto_rdcdo);

        objecto_json.put('sncion_ttal_rdcda',
                         v_dfrncia_sncion + v_incrmnto_rdcdo);

        objecto_json.put('cdgo_rspsta', 0);

        objecto_json.put('mnsje_rspsta', 'Solicitud procesada con exito');

        objecto_json_array.append(objecto_json);

      END LOOP;

      RETURN objecto_json_array.to_string;

    EXCEPTION
      WHEN others THEN
        objecto_json.put('cdgo_rspsta', 9);

        objecto_json.put('mnsje_rspsta', sqlerrm);

        objecto_json_array.append(objecto_json);

        RETURN objecto_json_array.to_string;

    END;

  END fnc_co_sancion_mal_liquidada;

  FUNCTION fnc_co_sancion_no_enviar_informacion(p_id_cnddto      IN number,
                                                p_id_sjto_impsto IN number)
    RETURN CLOB AS
    v_id_dclrcion number;

    v_id_dclrcion_crrccion number;

    v_sncion number;

    v_id_dclrcion_vgncia_frmlrio number;

    v_cdgo_clnte number;

    v_vlor_trfa number;

    v_dvsor_trfa number;

    v_vlor_cdgo_indcdor_tpo number;

    v_incrmnto number;

    v_incrmnto_rdcdo number;

    v_dfrncia_sncion number;

    v_id_impsto_acto_cncpto number;

    v_id_impsto_acto number;

    v_prcntje_dscnto number;

    v_id_cncpto number;

    v_rdndeo df_s_redondeos_expresion.exprsion%TYPE;

    v_lqdcion_mnma number;

    v_cdgo_dclrcion_uso varchar2(100);

    v_nmbre_impsto_acto varchar2(100);

    v_dscrpcion varchar2(100);

    json_hmlgcion json_object_t;

    objecto_json_array json_array_t := json_array_t();

  BEGIN
    DECLARE
      objecto_json JSON_OBJECT_T := JSON_OBJECT_T();

    BEGIN
      FOR c_dclracion IN (SELECT a.cdgo_clnte,
                                 a.id_impsto,
                                 a.id_impsto_sbmpsto,
                                 a.nmbre_impsto,
                                 a.nmbre_impsto_sbmpsto,
                                 c.id_dclrcion,
                                 c.id_dclrcion_crrccion,
                                 c.id_dclrcion_vgncia_frmlrio,
                                 d.cdgo_dclrcion_uso,
                                 c.vgncia,
                                 e.prdo,
                                 e.id_prdo
                            FROM v_fi_g_candidatos a
                            JOIN fi_g_candidatos_vigencia b
                              ON a.id_cnddto = b.id_cnddto
                            JOIN fi_g_fsclzc_expdn_cndd_vgnc f
                              ON b.id_cnddto_vgncia = f.id_cnddto_vgncia
                            JOIN gi_g_declaraciones c
                              ON b.id_dclrcion_vgncia_frmlrio =
                                 c.id_dclrcion_vgncia_frmlrio
                             AND a.id_sjto_impsto = c.id_sjto_impsto
                            JOIN gi_d_declaraciones_uso d
                              ON c.id_dclrcion_uso = d.id_dclrcion_uso
                            JOIN df_i_periodos e
                              ON c.id_prdo = e.id_prdo

                           WHERE a.id_cnddto = p_id_cnddto --and c.indcdor_mgrdo is null -- validar que no traiga declaraciones de migracion

                             AND cdgo_dclrcion_estdo IN ('PRS', 'APL')) LOOP
        --Se valida si el impuesto acto existe (El impuesto acto debe tener el mismo codigo del acto)
        BEGIN
          SELECT a.id_impsto_acto, a.nmbre_impsto_acto
            INTO v_id_impsto_acto, v_nmbre_impsto_acto
            FROM df_i_impuestos_acto a
           WHERE a.id_impsto = c_dclracion.id_impsto
             AND a.id_impsto_sbmpsto = c_dclracion.id_impsto_sbmpsto
             AND a.cdgo_impsto_acto = 'PCN';

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 1);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro parametrizado el impuesto acto de codigo PCN ' ||
                             ' para el impuesto ' ||
                             c_dclracion.nmbre_impsto || ' subimpuesto ' ||
                             c_dclracion.nmbre_impsto_sbmpsto);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 2);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se valida si la vigencia y el periodo que se esta fiscalizando esta parametrizada en impuesto acto concepto
        BEGIN
          SELECT b.id_impsto_acto
            INTO v_id_impsto_acto
            FROM df_i_impuestos_acto a
            JOIN df_i_impuestos_acto_concepto b
              ON a.id_impsto_acto = b.id_impsto_acto
            JOIN df_i_periodos c
              ON b.id_prdo = c.id_prdo
           WHERE b.cdgo_clnte = c_dclracion.cdgo_clnte
             AND a.id_impsto_acto = v_id_impsto_acto
             AND b.vgncia = c_dclracion.vgncia
             AND b.id_prdo = c_dclracion.id_prdo
           GROUP BY b.id_impsto_acto;

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 3);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro parametrizado la vigencia ' ||
                             c_dclracion.vgncia || ' y periodo ' ||
                             c_dclracion.prdo || ' para el impuesto Acto ' ||
                             v_nmbre_impsto_acto || '(PCN)');

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 4);

            objecto_json.put('mnsje_rspsta', v_id_impsto_acto || sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        BEGIN
          SELECT c.vlor_trfa,
                 c.dvsor_trfa,
                 b.id_cncpto,
                 b.id_impsto_acto_cncpto,
                 c.lqdcion_mnma,
                 c.exprsion_rdndeo,
                 c.vlor_cdgo_indcdor_tpo
            INTO v_vlor_trfa,
                 v_dvsor_trfa,
                 v_id_cncpto,
                 v_id_impsto_acto_cncpto,
                 v_lqdcion_mnma,
                 v_rdndeo,
                 v_vlor_cdgo_indcdor_tpo --v_vlor_trfa_clcldo

            FROM df_i_impuestos_acto a
            JOIN df_i_impuestos_acto_concepto b
              ON a.id_impsto_acto = b.id_impsto_acto
            JOIN v_gi_d_tarifas_esquema c
              ON b.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto
           WHERE a.id_impsto_acto = v_id_impsto_acto
             AND b.vgncia = c_dclracion.vgncia
             AND b.id_prdo = c_dclracion.id_prdo;

          -- and not c.id_impsto_acto_cncpto_bse is null;

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 5);

            objecto_json.put('mnsje_rspsta',
                             'Que el impuesto acto ' || v_id_impsto_acto ||
                             v_nmbre_impsto_acto ||
                             ' tenga parametrizado para ' ||
                             ' la vigencia ' || c_dclracion.vgncia ||
                             ' periodo ' || c_dclracion.prdo ||
                             ' una tarifa o que el concepto incremento sacnion tenga parametrizado ' ||
                             ' el concepto base');

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 6);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        /*begin
          select b.prcntje_dscnto, a.dscrpcion
            into v_prcntje_dscnto, v_dscrpcion
            from df_i_conceptos a
            join re_g_descuentos_regla b
              on a.id_cncpto = b.id_cncpto
           where a.id_cncpto = v_id_cncpto;
        exception
          when no_data_found then
            objecto_json.put('cdgo_rspsta', 5);
            objecto_json.put('mnsje_rspsta',
                             'El concepto ' || v_dscrpcion ||
                             ', no tiene parametrizado la regla de descuento.');
            objecto_json_array.append(objecto_json);
            return objecto_json_array.to_string;
          when others then
            objecto_json.put('cdgo_rspsta', 6);
            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            return objecto_json_array.to_string;



        end;*/ /*  --Se obtiene el json de homologacion
                                                                                                                                                                                                                                                                                                         begin
                                                                                                                                                                                                                                                                                                             json_hmlgcion :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS', c_dclracion.id_dclrcion));
                                                                                                                                                                                                                                                                                                      */
        v_sncion := v_vlor_cdgo_indcdor_tpo;

        /* exception
            when others then
               objecto_json.put('cdgo_rspsta', 7);
               objecto_json.put('mnsje_rspsta', 'No se pudo instanciar el json de homologacion'||sqlerrm);
               objecto_json_array.append(objecto_json);
               return objecto_json_array.to_string;
        end;*/
        v_incrmnto := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => ((v_sncion) *
                                                                           v_vlor_trfa) /
                                                                           v_dvsor_trfa,
                                                            p_expresion => v_rdndeo);

        IF v_incrmnto < v_lqdcion_mnma THEN
          v_incrmnto := v_lqdcion_mnma;

        END IF;

        v_incrmnto_rdcdo := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (v_incrmnto *
                                                                                 v_prcntje_dscnto),
                                                                  p_expresion => v_rdndeo);

        --v_dfrncia_sncion := ceil(v_sncion-json_hmlgcion.get_number('VASA'));
        objecto_json.put('vgncia', c_dclracion.vgncia);

        objecto_json.put('prdo', c_dclracion.prdo);

        objecto_json.put('bse', 0);

        objecto_json.put('sncion', v_sncion);

        objecto_json.put('sncion_dclrada', 0);

        objecto_json.put('dfrncia_sncion', 0);

        objecto_json.put('incrmnto', v_incrmnto);

        objecto_json.put('sncion_ttal', v_sncion);

        objecto_json.put('incrmnto_rdcido', v_incrmnto - v_incrmnto_rdcdo);

        objecto_json.put('sncion_ttal_rdcda', v_incrmnto_rdcdo);

        objecto_json.put('cdgo_rspsta', 0);

        objecto_json.put('mnsje_rspsta', 'Solicitud procesada con exito');

        objecto_json_array.append(objecto_json);

      END LOOP;

      RETURN objecto_json_array.to_string;

    EXCEPTION
      WHEN others THEN
        objecto_json.put('cdgo_rspsta', 9);

        objecto_json.put('mnsje_rspsta', sqlerrm);

        objecto_json_array.append(objecto_json);

        RETURN objecto_json_array.to_string;

    END;

  END fnc_co_sancion_no_enviar_informacion;

  FUNCTION fnc_co_tabla_sancion(p_id_cnddto      IN number,
                                p_id_sjto_impsto IN number,
                                p_mostrar        IN varchar2 DEFAULT 'S')
    RETURN CLOB AS
    v_tabla CLOB;

  BEGIN
    v_tabla := '<table border="1" align="center" style="border-collapse:collapse;" width="100%">' ||
               '<thead>' || '<tr>' ||
               '<th style="text-align: center; border:1px solid black"><span style="font-size:10px">Vigencia</span></th>' ||
               '<th style="text-align: center; border:1px solid black"><span style="font-size:10px">Periodo</span></th>' ||
               '<th style="text-align: center; border:1px solid black"><span style="font-size:10px">' || CASE
                 WHEN p_mostrar = 'S' THEN
                  'BASE CALCULO DE SANCION'
                 ELSE
                  'BASE'
               END || '</span></th>' ||
               '<th style="text-align: center; border:1px solid black"><span style="font-size:10px">' || CASE
                 WHEN p_mostrar = 'S' THEN
                  'VALOR SANCION'
                 ELSE
                  'VALOR SANCION PROPUESTA'
               END || '</span></th>' ||
               '<th style="text-align: center; border:1px solid black"><span style="font-size:10px">' || CASE
                 WHEN p_mostrar = 'S' THEN
                  'SANCION DECLARADA'
                 ELSE
                  'SANCION LIQUIDADA POR EL CONTRIBUYENTE'
               END || '</span></th>' ||
               '<th style="text-align: center; border:1px solid black"><span style="font-size:10px">' || CASE
                 WHEN p_mostrar = 'S' THEN
                  'DIFERENCIA'
                 ELSE
                  'DIFERENCIA POR NO LIQUIDACION DE SANCION'
               END || '</span></th>' || CASE
                 WHEN p_mostrar = 'S' THEN
                  '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">INCREMENTO 30%</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION TOTAL</span></th>'
               END || '</tr>' || '</thead>' || '<tbody>';

    FOR c_sncion IN (SELECT vgncia,
                            prdo,
                            bse,
                            sncion,
                            sncion_dclrada,
                            dfrncia_sncion,
                            incrmnto,
                            sncion_ttal,
                            cdgo_rspsta,
                            mnsje_rspsta
                       FROM json_table((SELECT pkg_fi_fiscalizacion.fnc_co_sancion_mal_liquidada(p_id_cnddto,
                                                                                                p_id_sjto_impsto)
                                         FROM dual),
                                       '$[*]'
                                       columns(vgncia varchar2 PATH
                                               '$.vgncia',
                                               prdo varchar2 PATH '$.prdo',
                                               bse varchar2 PATH '$.bse',
                                               sncion varchar2 PATH '$.sncion',
                                               sncion_dclrada varchar2 PATH
                                               '$.sncion_dclrada',
                                               dfrncia_sncion varchar2 PATH
                                               '$.dfrncia_sncion',
                                               incrmnto varchar2 PATH
                                               '$.incrmnto',
                                               sncion_ttal varchar2 PATH
                                               '$.sncion_ttal',
                                               cdgo_rspsta varchar2 PATH
                                               '$.cdgo_rspsta',
                                               mnsje_rspsta varchar2 PATH
                                               '$.mnsje_rspsta'))) LOOP
      IF c_sncion.cdgo_rspsta > 0 THEN
        v_tabla := '<table border="1" align="center" style="border-collapse:collapse;" width="100%">
                            <thead>
                                <tr>
                                    <th style="text-align: center; border:1px solid black"><span style="font-size:10px">' ||
                   c_sncion.mnsje_rspsta ||
                   '</span></th>
                                </tr>
                            </thead>
                        </table>';

        RETURN v_tabla;

      END IF;

      v_tabla := v_tabla || '<tr>' ||
                 '<td style="text-align: center; border:1px solid black">' ||
                 c_sncion.vgncia || '</td>' ||
                 '<td style="text-align: center; border:1px solid black">' ||
                 c_sncion.prdo || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.bse, 'FM$999G999G999G999G999G999G990') ||
                 '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.sncion, 'FM$999G999G999G999G999G999G990') ||
                 '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.sncion_dclrada,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.dfrncia_sncion,
                         'FM$999G999G999G999G999G999G990') || '</td>' || CASE
                   WHEN p_mostrar = 'S' THEN
                    '<td style="text-align: right; border:1px solid black">' ||
                    to_char(c_sncion.incrmnto, 'FM$999G999G999G999G999G999G990') ||
                    '</td>
                                     <td style="text-align: right; border:1px solid black">' ||
                    to_char(c_sncion.sncion_ttal,
                            'FM$999G999G999G999G999G999G990') || '</td>'
                 END || '</tr>';

    END LOOP;

    v_tabla := v_tabla || '<tbody></table>';

    RETURN v_tabla;

  END fnc_co_tabla_sancion;

  FUNCTION fnc_co_tabla_sancion_reducida(p_id_cnddto      IN number,
                                         p_id_sjto_impsto IN number)
    RETURN CLOB AS
    v_tabla CLOB;

  BEGIN
    v_tabla := '<table align="center" border="1" style="border-collapse:collapse;" width="100%">' ||
               '<thead>' || '<tr>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">VIGENCIA</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">PERIODO</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">VALOR SANCION PROPUESTA</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION LIQUIDADA POR EL CONTRIBUYENTE</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">DIFERENCIA POR OMISION EN LIQUIDACION DE SANCION</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">INCREMENTO 30%</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION TOTAL</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">INCREMENTO REDUCIDO 50%</span></th>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION TOTAL REDUCIDA</span></th>' ||
               '</tr>' || '</thead>' || '<tbody>';

    FOR c_sncion IN (SELECT vgncia,
                            prdo,
                            bse,
                            sncion,
                            sncion_dclrada,
                            dfrncia_sncion,
                            incrmnto,
                            sncion_ttal,
                            incrmnto_rdcido,
                            sncion_ttal_rdcda,
                            cdgo_rspsta,
                            mnsje_rspsta
                       FROM json_table((SELECT pkg_fi_fiscalizacion.fnc_co_sancion_mal_liquidada(p_id_cnddto,
                                                                                                p_id_sjto_impsto)
                                         FROM dual),
                                       '$[*]'
                                       columns(vgncia varchar2 PATH
                                               '$.vgncia',
                                               prdo varchar2 PATH '$.prdo',
                                               bse varchar2 PATH '$.bse',
                                               sncion varchar2 PATH '$.sncion',
                                               sncion_dclrada varchar2 PATH
                                               '$.sncion_dclrada',
                                               dfrncia_sncion varchar2 PATH
                                               '$.dfrncia_sncion',
                                               incrmnto varchar2 PATH
                                               '$.incrmnto',
                                               sncion_ttal varchar2 PATH
                                               '$.sncion_ttal',
                                               incrmnto_rdcido varchar2 PATH
                                               '$.incrmnto_rdcido',
                                               sncion_ttal_rdcda varchar2 PATH
                                               '$.sncion_ttal_rdcda',
                                               cdgo_rspsta varchar2 PATH
                                               '$.cdgo_rspsta',
                                               mnsje_rspsta varchar2 PATH
                                               '$.mnsje_rspsta'))) LOOP
      IF c_sncion.cdgo_rspsta > 0 THEN
        v_tabla := '<table border="1" align="center" style="border-collapse:collapse;" width="100%">
                            <thead>
                                <tr>
                                    <th style="text-align: center; border:1px solid black"><span style="font-size:10px">' ||
                   c_sncion.mnsje_rspsta ||
                   '</span></th>
                                </tr>
                            </thead>
                        </table>';

        RETURN v_tabla;

      END IF;

      v_tabla := v_tabla || '<tr>' ||
                 '<td style="text-align: center; border:1px solid black">' ||
                 c_sncion.vgncia || '</td>' ||
                 '<td style="text-align: center; border:1px solid black">' ||
                 c_sncion.prdo || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.sncion, 'FM$999G999G999G999G999G999G990') ||
                 '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.sncion_dclrada,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.dfrncia_sncion,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.incrmnto,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.sncion_ttal,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.incrmnto_rdcido,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '<td style="text-align: right; border:1px solid black">' ||
                 to_char(c_sncion.sncion_ttal_rdcda,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '</tr>';

    END LOOP;

    v_tabla := v_tabla || '<tbody></table>';

    RETURN v_tabla;

  END fnc_co_tabla_sancion_reducida;

  FUNCTION fnc_co_sancion_extemporanea(p_id_cnddto      IN number,
                                       p_id_sjto_impsto IN number)
    RETURN CLOB AS
    v_id_dclrcion number;

    v_id_dclrcion_crrccion number;

    v_sncion number;

    v_id_dclrcion_vgncia_frmlrio number;

    v_cdgo_clnte number;

    v_vlor_trfa number;

    v_dvsor_trfa number;

    v_incrmnto number;

    v_incrmnto_rdcdo number;

    n_mses number;

    v_vlor_sncion_mnmo number;

    v_id_sjto_tpo number;

    v_idntfccion_sjto number;

    v_id_impsto_acto number;

    v_id_cncpto number;

    v_id_impsto_acto_cncpto number;

    v_prcntje_dscnto number;

    v_base number;

    v_rdndeo df_s_redondeos_expresion.exprsion%TYPE;

    v_lqdcion_mnma number;

    v_nmbre_impsto_acto varchar2(100);

    v_cdgo_dclrcion_uso varchar2(100);

    json_hmlgcion json_object_t;

    objecto_json_array json_array_t := json_array_t();

    --log
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.fnc_co_sancion_extemporanea';

    v_cdgo_rspsta number;

    v_mnsje_rspsta varchar2(4000);

    p_cdgo_clnte number;

  BEGIN
    v_cdgo_rspsta := 0;

    p_cdgo_clnte := 23001;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_sancion',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    DECLARE
      objecto_json JSON_OBJECT_T := JSON_OBJECT_T();

    BEGIN
      FOR c_dclracion IN (SELECT a.cdgo_clnte,
                                 a.id_sjto_impsto,
                                 a.id_impsto,
                                 a.id_impsto_sbmpsto,
                                 a.nmbre_impsto,
                                 a.nmbre_impsto_sbmpsto,
                                 c.id_dclrcion,
                                 c.id_dclrcion_crrccion,
                                 c.id_dclrcion_vgncia_frmlrio,
                                 d.cdgo_dclrcion_uso,
                                 c.vgncia,
                                 e.prdo,
                                 e.id_prdo,
                                 c.nmro_cnsctvo,
                                 c.fcha_prsntcion
                            FROM v_fi_g_candidatos a
                            JOIN fi_g_candidatos_vigencia b
                              ON a.id_cnddto = b.id_cnddto
                            JOIN fi_g_fsclzc_expdn_cndd_vgnc f
                              ON b.id_cnddto_vgncia = f.id_cnddto_vgncia
                            JOIN gi_g_declaraciones c
                              ON b.id_dclrcion_vgncia_frmlrio =
                                 c.id_dclrcion_vgncia_frmlrio
                             AND a.id_sjto_impsto = c.id_sjto_impsto
                            JOIN gi_d_declaraciones_uso d
                              ON c.id_dclrcion_uso = d.id_dclrcion_uso
                            JOIN df_i_periodos e
                              ON c.id_prdo = e.id_prdo
                           WHERE a.id_cnddto = p_id_cnddto
                             AND cdgo_dclrcion_estdo IN
                                 ('PRS',

                                  'APL')) LOOP
        --Se obtiene la identificacion y el tipo de sujeto
        BEGIN
          SELECT a.id_sjto_tpo, b.idntfccion_sjto
            INTO v_id_sjto_tpo, v_idntfccion_sjto
            FROM si_i_personas a
            JOIN v_si_i_sujetos_impuesto b
              ON a.id_sjto_impsto = b.id_sjto_impsto
           WHERE a.id_sjto_impsto = c_dclracion.id_sjto_impsto;

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 1);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro el sujeto impuesto');

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 2);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se obtiene el valor de la sancion minima
        BEGIN
          SELECT c.vlor_sncion_mnmo
            INTO v_vlor_sncion_mnmo
            FROM gi_d_sanciones c
           WHERE c.cdgo_clnte = c_dclracion.cdgo_clnte
             AND c.vgncia = c_dclracion.vgncia
             AND c.id_prdo = c_dclracion.id_prdo
             AND c.cdgo_sncion_tpo = 'EXT';

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 3);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro sancion minima con codigo EXT para la vigencia y periodo ' ||
                             c_dclracion.vgncia || '-' ||
                             c_dclracion.id_prdo);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 4);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se valida si el impuesto acto existe (El impuesto acto debe tener el mismo codigo del acto)
        BEGIN
          SELECT a.id_impsto_acto, a.nmbre_impsto_acto
            INTO v_id_impsto_acto, v_nmbre_impsto_acto
            FROM df_i_impuestos_acto a
           WHERE a.id_impsto = c_dclracion.id_impsto
             AND a.id_impsto_sbmpsto = c_dclracion.id_impsto_sbmpsto
             AND a.cdgo_impsto_acto = 'PCE';

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 5);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro parametrizado el impuesto acto de codigo PCE ' ||
                             ' para el impuesto ' ||
                             c_dclracion.nmbre_impsto || ' subimpuesto ' ||
                             c_dclracion.nmbre_impsto_sbmpsto);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 6);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se valida si la vigencia y el periodo que se esta fiscalizando esta parametrizada en impuesto acto concepto
        BEGIN
          SELECT b.id_impsto_acto
            INTO v_id_impsto_acto
            FROM df_i_impuestos_acto a
            JOIN df_i_impuestos_acto_concepto b
              ON a.id_impsto_acto = b.id_impsto_acto
            JOIN df_i_periodos c
              ON b.id_prdo = c.id_prdo
           WHERE b.cdgo_clnte = c_dclracion.cdgo_clnte
             AND a.id_impsto_acto = v_id_impsto_acto
             AND b.vgncia = c_dclracion.vgncia
             AND b.id_prdo = c_dclracion.id_prdo
           GROUP BY b.id_impsto_acto;

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 7);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro parametrizado la vigencia ' ||
                             c_dclracion.vgncia || ' y periodo ' ||
                             c_dclracion.prdo || ' para el impuesto Acto ' ||
                             v_nmbre_impsto_acto || '(PCE)');

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 8);

            objecto_json.put('mnsje_rspsta', v_id_impsto_acto || sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se obtiene la tarifa
        BEGIN
          SELECT c.vlor_trfa,
                 c.dvsor_trfa,
                 b.id_cncpto,
                 b.id_impsto_acto_cncpto,
                 lqdcion_mnma,
                 exprsion_rdndeo
            INTO v_vlor_trfa,
                 v_dvsor_trfa,
                 v_id_cncpto,
                 v_id_impsto_acto_cncpto,
                 v_lqdcion_mnma,
                 v_rdndeo
            FROM df_i_impuestos_acto a
            JOIN df_i_impuestos_acto_concepto b
              ON a.id_impsto_acto = b.id_impsto_acto
            JOIN v_gi_d_tarifas_esquema c
              ON b.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto
           WHERE a.id_impsto_acto = v_id_impsto_acto
             AND b.vgncia = c_dclracion.vgncia
             AND b.id_prdo = c_dclracion.id_prdo
             AND c.id_impsto_acto_cncpto_bse IS NULL -- and not c.id_impsto_acto_cncpto_bse is null

             AND b.actvo = 'S';

        EXCEPTION
          WHEN no_data_found THEN
            objecto_json.put('cdgo_rspsta', 9);

            objecto_json.put('mnsje_rspsta',
                             'El Impuesto Acto ' || v_nmbre_impsto_acto ||
                             ' no tiene parametrizado para ' ||
                             ' la vigencia ' || c_dclracion.vgncia ||
                             ' periodo ' || c_dclracion.prdo ||
                             ' una tarifa o acto concepto incremento sancion no tiene ' ||
                             ' el acto concepto base');

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 10);

            objecto_json.put('mnsje_rspsta', sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se obtiene el porcentaje de descuento
        /* begin
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, 'Paso antes de v_id_cncpto '||v_id_cncpto || systimestamp, 6);

            select b.prcntje_dscnto
            into   v_prcntje_dscnto
            from df_i_conceptos        a
            join re_g_descuentos_regla b on a.id_cncpto = b.id_cncpto
            where a.id_cncpto = v_id_cncpto;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, 'Paso despues de v_id_cncpto ' || systimestamp, 6);


        exception
            when no_data_found then
                objecto_json.put('cdgo_rspsta', 11);
                objecto_json.put('mnsje_rspsta', 'El concepto id#['||v_id_cncpto||'], no tiene parametrizado el concepto de descuento.');
                objecto_json_array.append(objecto_json);
                return objecto_json_array.to_string;4
            when others then
                objecto_json.put('cdgo_rspsta', 12);
                objecto_json.put('mnsje_rspsta', sqlerrm);
                objecto_json_array.append(objecto_json);
                return objecto_json_array.to_string;
        end;*/ --Se obtiene el json de homologacion
        BEGIN
          json_hmlgcion := NEW
                           json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades('FIS',
                                                                                      c_dclracion.id_dclrcion));

          -- v_sncion := json_hmlgcion.get_number('CSAN');
          v_base := json_hmlgcion.get_number('IMCA');

          IF v_base IS NULL THEN
            objecto_json.put('cdgo_rspsta', 13);

            objecto_json.put('mnsje_rspsta',
                             'No se encontro parametrizada la propiedad con codigo IMCA en la parametrica de homologacion de objeto');

            objecto_json_array.append(objecto_json);

          END IF;

        EXCEPTION
          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 13);

            objecto_json.put('mnsje_rspsta',
                             'No su pudo instanciar el json de homologacion verifique la parametrizacion de homologacion de objetos ' ||
                             sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        --Se obtiene los numetos de meses por extemporaneo
        BEGIN
          n_mses := fnc_co_numero_meses_x_sancion(p_id_dclrcion_vgncia_frmlrio => c_dclracion.id_dclrcion_vgncia_frmlrio,
                                                  p_idntfccion                 => v_idntfccion_sjto,
                                                  p_id_sjto_tpo                => v_id_sjto_tpo,
                                                  p_fcha_prsntcion             => c_dclracion.fcha_prsntcion --json_hmlgcion.get_string('FLPA')
                                                  );

        EXCEPTION
          WHEN others THEN
            objecto_json.put('cdgo_rspsta', 14);

            objecto_json.put('mnsje_rspsta',
                             'No se pudo llamar la funcion que calcula los numero de meses' ||
                             sqlerrm);

            objecto_json_array.append(objecto_json);

            RETURN objecto_json_array.to_string;

        END;

        v_sncion := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      => (v_base *
                                                                         v_vlor_trfa) /
                                                                         v_dvsor_trfa,
                                                          p_expresion => v_rdndeo);

        v_sncion := v_sncion * n_mses;

        /* v_incrmnto := pkg_gn_generalidades.fnc_ca_expresion( p_vlor      => (v_sncion*v_vlor_trfa) / v_dvsor_trfa,
        p_expresion => v_rdndeo );*/
        IF v_sncion < v_lqdcion_mnma THEN
          v_sncion := v_lqdcion_mnma;

        END IF;

        IF v_sncion > v_base THEN
          v_sncion := v_base;

        END IF;

        /*
        v_incrmnto_rdcdo := pkg_gn_generalidades.fnc_ca_expresion( p_vlor      => (v_incrmnto*v_prcntje_dscnto),
                                                                   p_expresion => v_rdndeo ); */
        objecto_json.put('vgncia', c_dclracion.vgncia);

        objecto_json.put('prdo', c_dclracion.prdo);

        objecto_json.put('bse', v_base);

        objecto_json.put('vlor_trfa', v_vlor_trfa);

        objecto_json.put('n_mses', n_mses);

        objecto_json.put('sncion', v_sncion);

        objecto_json.put('sncion_mnma', v_vlor_sncion_mnmo);

        objecto_json.put('incrmnto', v_incrmnto);

        -- objecto_json.put('sncion_ttal', v_sncion+v_incrmnto);
        objecto_json.put('sncion_ttal', v_sncion);

        objecto_json.put('prdo_grvble',
                         c_dclracion.vgncia || '(' || c_dclracion.prdo || ')');

        objecto_json.put('dclrcion_nmro', c_dclracion.nmro_cnsctvo);

        objecto_json.put('fcha_prsntda',
                         to_char(c_dclracion.fcha_prsntcion, 'dd/mm/yyyy'));

        objecto_json.put('impsto_crgo', json_hmlgcion.get_number('IMCA'));

        objecto_json.put('fcha_dcrtda',
                         to_char(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(c_dclracion.id_dclrcion_vgncia_frmlrio,
                                                                                v_idntfccion_sjto,
                                                                                v_id_sjto_tpo),
                                 'dd/mm/yyyy'));

        objecto_json.put('cdgo_rspsta', 0);

        objecto_json.put('mnsje_rspsta', 'Operacion realizada con extio');

        objecto_json_array.append(objecto_json);

      END LOOP;

      RETURN objecto_json_array.to_string;

    EXCEPTION
      WHEN others THEN
        objecto_json.put('cdgo_rspsta', 16);

        objecto_json.put('mnsje_rspsta',
                         'No se pudo llamar la funcion que calcula los numero de meses' ||
                         sqlerrm);

        objecto_json_array.append(objecto_json);

        RETURN objecto_json_array.to_string;

    END;

    RETURN objecto_json_array.to_string;

  END fnc_co_sancion_extemporanea;

  FUNCTION fnc_co_tabla_sancion_extemporanea(p_id_cnddto      IN number,
                                             p_id_sjto_impsto IN number,
                                             p_mostrar        IN varchar2 DEFAULT 'S')
    RETURN CLOB AS
    v_tabla CLOB;

  BEGIN
    v_tabla := '<table align="center" border="1" style="border-collapse:collapse;" width="100%">' ||
               '<thead>' || '<tr>' || CASE
                 WHEN p_mostrar = 'S' THEN
                  '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">VIGENCIA</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">PERIODO</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">BASE</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">TARIFA(%)</span></th>
                             <!--<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">MESES</span></th>-->
                             <!--<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION MINIMA</span></th>-->
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">INCREMENTO</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION TOTAL</span></th>'
               END || CASE
                 WHEN p_mostrar = 'N' THEN
                  '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">PERIODO GRAVABLE</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">NO. DECLARACION</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">FECHA DECRETADA</span></th>
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">FECHA PRESENTACION</span></th>
                             <!--<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">MESES DE RETRASO</span></th>-->
                             <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">IMPUESTO A CARGO</span></th>'
               END || '</tr>' || '</thead>' || '<tbody>';

    FOR c_sncion IN (SELECT vgncia,
                            prdo,
                            bse,
                            vlor_trfa,
                            n_mses,
                            sncion_mnma,
                            incrmnto,
                            sncion,
                            sncion_ttal,
                            prdo_grvble,
                            dclrcion_nmro,
                            fcha_prsntda,
                            impsto_crgo,
                            fcha_dcrtda,
                            cdgo_rspsta,
                            mnsje_rspsta
                       FROM json_table((SELECT pkg_fi_fiscalizacion.fnc_co_sancion_extemporanea(p_id_cnddto,
                                                                                               p_id_sjto_impsto)
                                         FROM dual),
                                       '$[*]'
                                       columns(vgncia varchar2 PATH
                                               '$.vgncia',
                                               prdo varchar2 PATH '$.prdo',
                                               bse varchar2 PATH '$.bse',
                                               vlor_trfa varchar2 PATH
                                               '$.vlor_trfa',
                                               n_mses varchar2 PATH '$.n_mses',
                                               sncion_mnma varchar2 PATH
                                               '$.sncion_mnma',
                                               incrmnto varchar2 PATH
                                               '$.incrmnto',
                                               sncion varchar2 PATH '$.sncion',
                                               sncion_ttal varchar2 PATH
                                               '$.sncion_ttal',
                                               prdo_grvble varchar2 PATH
                                               '$.prdo_grvble',
                                               dclrcion_nmro varchar2 PATH
                                               '$.dclrcion_nmro',
                                               fcha_prsntda varchar2 PATH
                                               '$.fcha_prsntda',
                                               impsto_crgo varchar2 PATH
                                               '$.impsto_crgo',
                                               fcha_dcrtda varchar2 PATH
                                               '$.fcha_dcrtda',
                                               cdgo_rspsta varchar2 PATH
                                               '$.cdgo_rspsta',
                                               mnsje_rspsta varchar2 PATH
                                               '$.mnsje_rspsta'))) LOOP
      IF c_sncion.cdgo_rspsta > 0 THEN
        v_tabla := '<table border="1" align="center" style="border-collapse:collapse;" width="100%">
                            <thead>
                                <tr>
                                    <th style="text-align: center; border:1px solid black"><span style="font-size:10px">' ||
                   c_sncion.mnsje_rspsta ||
                   '</span></th>
                                </tr>
                            </thead>
                        </table>';

        RETURN v_tabla;

      END IF;

      v_tabla := v_tabla || '<tr>' || CASE
                   WHEN p_mostrar = 'S' THEN
                    '<td style="text-align: center;">' || c_sncion.vgncia ||
                    '</td>
                                     <td style="text-align: center;">' ||
                    c_sncion.prdo ||
                    '</td>
                                     <td style="text-align: right; ">' ||
                    to_char(c_sncion.bse, 'FM$999G999G999G999G999G999G990') ||
                    '</td>
                                     <td style="text-align: center;">' ||
                    c_sncion.vlor_trfa ||
                    '</td>
                                     <!--<td style="text-align: right; ">' ||
                    c_sncion.n_mses ||
                    '</td>-->
                                     <!--<td style="text-align: right; ">' ||
                    to_char(c_sncion.sncion_mnma,
                            'FM$999G999G999G999G999G999G990') ||
                    '</td>-->
                                     <td style="text-align: right; ">' ||
                    to_char(c_sncion.sncion, 'FM$999G999G999G999G999G999G990') ||
                    '</td>
                                     <td style="text-align: right; ">' ||
                    to_char(c_sncion.incrmnto, 'FM$999G999G999G999G999G999G990') ||
                    '</td>
                                     <td style="text-align: right; ">' ||
                    to_char(c_sncion.sncion_ttal,
                            'FM$999G999G999G999G999G999G990') || '</td>'
                 END || CASE
                   WHEN p_mostrar = 'N' THEN
                    '<td style="text-align: right;">' || c_sncion.prdo_grvble ||
                    '</td>
                                     <td style="text-align: right;">' ||
                    c_sncion.dclrcion_nmro ||
                    '</td>
                                     <td style="text-align: right;">' ||
                    c_sncion.fcha_dcrtda ||
                    '</td>
                                     <td style="text-align: right;">' ||
                    c_sncion.fcha_prsntda ||
                    '</td>
                                     <!--<td style="text-align: right;">' ||
                    c_sncion.n_mses ||
                    '</td>-->
                                     <td style="text-align: right;">' ||
                    to_char(c_sncion.impsto_crgo,
                            'FM$999G999G999G999G999G999G990') || '</td>'
                 END || '</tr>';

    END LOOP;

    RETURN v_tabla || '<tbody></table>';

  END fnc_co_tabla_sancion_extemporanea;

  FUNCTION fnc_co_tbla_sncion_extmprnea_sncion(p_id_cnddto      IN number,
                                               p_id_sjto_impsto IN number)
    RETURN CLOB AS
    v_tabla CLOB;

  BEGIN
    v_tabla := '<table align="center" border="1" style="border-collapse:collapse;" width="100%">' ||
               '<thead>' || '<tr>' ||
               '<th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">VIGENCIA</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">PERIODO</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">FECHA DECRETADA</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">FECHA PRESENTACION</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">IMPUESTO A CARGO</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">TARIFA(%)</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">MONTO DE LA SACION POR EXTEMPORANEIDAD</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">INCREMENTO</span></th>
                           <th style="text-align: center; font-size:10px; border:1px solid black"><span style="font-size:10px">SANCION TOTAL</span></th>' ||
               '</tr>' || '</thead>' || '<tbody>';

    FOR c_sncion IN (SELECT vgncia,
                            prdo,
                            bse,
                            vlor_trfa,
                            n_mses,
                            sncion_mnma,
                            incrmnto,
                            sncion_ttal,
                            prdo_grvble,
                            dclrcion_nmro,
                            fcha_prsntda,
                            impsto_crgo,
                            fcha_dcrtda,
                            cdgo_rspsta,
                            mnsje_rspsta
                       FROM json_table((SELECT pkg_fi_fiscalizacion.fnc_co_sancion_extemporanea(p_id_cnddto,
                                                                                               p_id_sjto_impsto)
                                         FROM dual),
                                       '$[*]'
                                       columns(vgncia varchar2 PATH
                                               '$.vgncia',
                                               prdo varchar2 PATH '$.prdo',
                                               bse varchar2 PATH '$.bse',
                                               vlor_trfa varchar2 PATH
                                               '$.vlor_trfa',
                                               n_mses varchar2 PATH '$.n_mses',
                                               sncion_mnma varchar2 PATH
                                               '$.sncion_mnma',
                                               incrmnto varchar2 PATH
                                               '$.incrmnto',
                                               sncion_ttal varchar2 PATH
                                               '$.sncion_ttal',
                                               prdo_grvble varchar2 PATH
                                               '$.prdo_grvble',
                                               dclrcion_nmro varchar2 PATH
                                               '$.dclrcion_nmro',
                                               fcha_prsntda varchar2 PATH
                                               '$.fcha_prsntda',
                                               impsto_crgo varchar2 PATH
                                               '$.impsto_crgo',
                                               fcha_dcrtda varchar2 PATH
                                               '$.fcha_dcrtda',
                                               cdgo_rspsta varchar2 PATH
                                               '$.cdgo_rspsta',
                                               mnsje_rspsta varchar2 PATH
                                               '$.mnsje_rspsta'))) LOOP
      IF c_sncion.cdgo_rspsta > 0 THEN
        v_tabla := '<table border="1" align="center" style="border-collapse:collapse;" width="100%">
                            <thead>
                                <tr>
                                    <th style="text-align: center; border:1px solid black"><span style="font-size:10px">' ||
                   c_sncion.mnsje_rspsta ||
                   '</span></th>
                                </tr>
                            </thead>
                        </table>';

        RETURN v_tabla;

      END IF;

      v_tabla := v_tabla ||
                 '<tr>
                                    <td style="text-align: center;">' ||
                 c_sncion.vgncia ||
                 '</td>
                                     <td style="text-align: center;">' ||
                 c_sncion.prdo ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 c_sncion.fcha_dcrtda ||
                 '</td>
                                     <td style="text-align: center;">' ||
                 c_sncion.fcha_prsntda ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 to_char(c_sncion.impsto_crgo,
                         'FM$999G999G999G999G999G999G990') ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 c_sncion.vlor_trfa ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 to_char(c_sncion.bse, 'FM$999G999G999G999G999G999G990') ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 to_char(c_sncion.incrmnto,
                         'FM$999G999G999G999G999G999G990') ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 to_char(c_sncion.sncion_ttal,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '</tr>';

    END LOOP;

    RETURN v_tabla || '<tbody></table>';

  END fnc_co_tbla_sncion_extmprnea_sncion;

  FUNCTION fnc_co_tbla_dclrcion_prsntda(p_id_cnddto      IN number,
                                        p_id_sjto_impsto IN number)
    RETURN CLOB AS
    v_tabla CLOB;

  BEGIN
    v_tabla := '<table align="center" border="1" style="border-collapse:collapse;" width="100%">' ||
               '<thead>' || '<tr>' ||
               '<th style="text-align: center;"><span style="font-size:10px">VIGENCIA</span></th>
                           <th style="text-align: center;"><span style="font-size:10px">PERIODO</span></th>
                           <th style="text-align: center;"><span style="font-size:10px">No.DECLARACION</span></th>
                           <th style="text-align: center;"><span style="font-size:10px">FECHA PRESENTACION</span></th>
                           <th style="text-align: center;"><span style="font-size:10px">SANCION DECLARADA</span></th>' ||
               '</tr>' || '</thead>' || '<tbody>';

    FOR c_sncion IN (SELECT vgncia,
                            prdo,
                            bse,
                            vlor_trfa,
                            n_mses,
                            sncion_mnma,
                            incrmnto,
                            sncion_ttal,
                            prdo_grvble,
                            dclrcion_nmro,
                            fcha_prsntda,
                            impsto_crgo,
                            fcha_dcrtda
                       FROM json_table((SELECT pkg_fi_fiscalizacion.fnc_co_sancion_extemporanea(p_id_cnddto,
                                                                                               p_id_sjto_impsto)
                                         FROM dual),
                                       '$[*]'
                                       columns(vgncia varchar2 PATH
                                               '$.vgncia',
                                               prdo varchar2 PATH '$.prdo',
                                               bse varchar2 PATH '$.bse',
                                               vlor_trfa varchar2 PATH
                                               '$.vlor_trfa',
                                               n_mses varchar2 PATH '$.n_mses',
                                               sncion_mnma varchar2 PATH
                                               '$.sncion_mnma',
                                               incrmnto varchar2 PATH
                                               '$.incrmnto',
                                               sncion_ttal varchar2 PATH
                                               '$.sncion_ttal',
                                               prdo_grvble varchar2 PATH
                                               '$.prdo_grvble',
                                               dclrcion_nmro varchar2 PATH
                                               '$.dclrcion_nmro',
                                               fcha_prsntda varchar2 PATH
                                               '$.fcha_prsntda',
                                               impsto_crgo varchar2 PATH
                                               '$.impsto_crgo',
                                               fcha_dcrtda varchar2 PATH
                                               '$.fcha_dcrtda'))) LOOP
      v_tabla := v_tabla ||
                 '<tr>
                                    <td style="text-align: center;">' ||
                 c_sncion.vgncia ||
                 '</td>
                                     <td style="text-align: center;">' ||
                 c_sncion.prdo ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 c_sncion.dclrcion_nmro ||
                 '</td>
                                     <td style="text-align: center;">' ||
                 c_sncion.fcha_prsntda ||
                 '</td>
                                     <td style="text-align: right; ">' ||
                 to_char(c_sncion.impsto_crgo,
                         'FM$999G999G999G999G999G999G990') || '</td>' ||
                 '</tr>';

    END LOOP;

    RETURN v_tabla || '<tbody></table>';

  END fnc_co_tbla_dclrcion_prsntda;

  FUNCTION fnc_co_tbla_no_envr_infrmcion(p_id_fsclzcion_expdnte IN number)
    RETURN CLOB AS
  BEGIN
    -- TAREA: Se necesita implantacion para function PKG_FI_FISCALIZACION.fnc_co_tbla_no_envr_infrmcion
    RETURN NULL;

  END fnc_co_tbla_no_envr_infrmcion;

  --Crud de Candidato Manual Coleccion
  PROCEDURE prc_cd_cnddato_mnual(p_collection_name   IN varchar2,
                                 p_seq_id            IN number,
                                 p_status            IN varchar2,
                                 p_cdgo_prgrma       IN varchar2,
                                 p_cdgo_clnte        IN df_s_clientes.cdgo_clnte%TYPE,
                                 p_id_impsto         IN df_c_impuestos.id_impsto%TYPE,
                                 p_id_impsto_sbmpsto IN df_i_impuestos_subimpuesto.id_impsto_sbmpsto%TYPE,
                                 p_id_sjto_impsto    IN si_i_sujetos_impuesto.id_sjto_impsto%TYPE,
                                 p_vgncia            IN df_s_vigencias.vgncia%TYPE,
                                 p_id_prdo           IN df_i_periodos.id_prdo%TYPE,
                                 p_idntfccion_sjto   IN varchar2,
                                 p_nmbre_rzon_scial  IN varchar2,
                                 o_cdgo_rspsta       OUT number,
                                 o_mnsje_rspsta      OUT varchar2) AS
    v_prdo df_i_periodos.prdo%TYPE;

    v_id_dclrcion_vgncia_frmlrio gi_g_declaraciones.id_dclrcion_vgncia_frmlrio%TYPE;

    v_id_dclrcion gi_g_declaraciones.id_dclrcion%TYPE;

  BEGIN
    IF (p_status IN ('C', 'U')) THEN
      --Verifica Filas Duplicadas
      DECLARE
        v_flas number;

      BEGIN
        SELECT count(*)
          INTO v_flas
          FROM apex_collections
         WHERE collection_name = p_collection_name
           AND c003 = p_id_sjto_impsto
           AND c002 = p_id_impsto_sbmpsto
           AND c006 = p_vgncia
           AND c007 = p_id_prdo
           AND seq_id <> nvl(p_seq_id, 0);

        IF (v_flas > 0) THEN
          RETURN;

        END IF;

      END;

      --Busca los Datos del Periodo
      BEGIN
        SELECT prdo
          INTO v_prdo
          FROM df_i_periodos
         WHERE id_prdo = p_id_prdo;

      EXCEPTION
        WHEN no_data_found THEN
          NULL;

      END;

      --Verifica si el Programa es Omiso
      IF (p_cdgo_prgrma = 'O') THEN
        BEGIN
          SELECT z.id_dclrcion_vgncia_frmlrio
            INTO v_id_dclrcion_vgncia_frmlrio
            FROM gi_d_dclrcnes_vgncias_frmlr z
           WHERE z.id_dclrcion_tpo_vgncia IN
                 (SELECT c.id_dclrcion_tpo_vgncia
                    FROM si_i_personas a
                    JOIN gi_d_dclrcnes_tpos_sjto b
                      ON a.id_sjto_tpo = b.id_sjto_tpo
                    JOIN gi_d_dclrcnes_tpos_vgncias c
                      ON b.id_dclrcn_tpo = c.id_dclrcn_tpo
                    JOIN gi_d_declaraciones_tipo e
                      ON b.id_dclrcn_tpo = e.id_dclrcn_tpo
                   WHERE e.id_impsto = p_id_impsto
                     AND e.id_impsto_sbmpsto = p_id_impsto_sbmpsto
                     AND a.id_sjto_impsto = p_id_sjto_impsto
                     AND c.vgncia = p_vgncia
                     AND c.id_prdo = p_id_prdo)
             AND z.actvo = 'S';

        EXCEPTION
          WHEN no_data_found THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := 'No existe la declaracion vigencia formulario [' ||
                              p_vgncia || '], para el tipo de sujeto.';

            RETURN;

          WHEN too_many_rows THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := 'Existe mas de una declaracion formulario vigencia [' ||
                              p_vgncia ||
                              '] activa, para el tipo de sujeto.';

            RETURN;

        END;

      ELSE
        --Busca Los de Datos de la Declaracion
        BEGIN
          SELECT a.id_dclrcion_vgncia_frmlrio, a.id_dclrcion
            INTO v_id_dclrcion_vgncia_frmlrio, v_id_dclrcion
            FROM gi_g_declaraciones a
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.id_impsto = p_id_impsto
             AND a.id_impsto_sbmpsto = p_id_impsto_sbmpsto
             AND a.id_sjto_impsto = p_id_sjto_impsto
             AND a.vgncia = p_vgncia
             AND a.id_prdo = p_id_prdo
             AND NOT a.cdgo_dclrcion_estdo IN ('REG', 'AUT')
           ORDER BY a.id_dclrcion DESC
           FETCH FIRST 1 ROW ONLY;

        EXCEPTION
          WHEN no_data_found THEN
            o_cdgo_rspsta := 3;

            o_mnsje_rspsta := 'No fue posible encontrar los datos de la declaracion.';

            RETURN;

        END;

      END IF;

    END IF;

    --Crud de Candidato
    CASE p_status
      WHEN 'C' THEN
        --Guarda los Datos de la Coleccion
        apex_collection.add_member(p_collection_name => p_collection_name,
                                   p_c001            => p_id_impsto,
                                   p_c002            => p_id_impsto_sbmpsto,
                                   p_c003            => p_id_sjto_impsto,
                                   p_c004            => p_idntfccion_sjto,
                                   p_c005            => p_nmbre_rzon_scial,
                                   p_c006            => p_vgncia,
                                   p_c007            => p_id_prdo,
                                   p_c008            => v_prdo,
                                   p_c009            => v_id_dclrcion_vgncia_frmlrio,
                                   p_c010            => v_id_dclrcion);

      WHEN 'U' THEN
        --Actualiza los Datos de la Coleccion
        apex_collection.update_member(p_collection_name => p_collection_name,
                                      p_seq             => p_seq_id,
                                      p_c001            => p_id_impsto,
                                      p_c002            => p_id_impsto_sbmpsto,
                                      p_c003            => p_id_sjto_impsto,
                                      p_c004            => p_idntfccion_sjto,
                                      p_c005            => p_nmbre_rzon_scial,
                                      p_c006            => p_vgncia,
                                      p_c007            => p_id_prdo,
                                      p_c008            => v_prdo,
                                      p_c009            => v_id_dclrcion_vgncia_frmlrio,
                                      p_c010            => v_id_dclrcion);

      WHEN 'D' THEN
        --Elimina los Datos de la Coleccion
        apex_collection.delete_member(p_collection_name => p_collection_name,
                                      p_seq             => p_seq_id);

    END CASE;

  END prc_cd_cnddato_mnual;

  PROCEDURE prc_ac_fcha_vncmnto_trmno(p_cdgo_clnte                IN number,
                                      p_id_fsclzcion_expdnte_acto IN number,
                                      p_fcha_vncmnto_trmno        fi_g_fsclzcion_expdnte_acto.fcha_vncmnto_trmno%TYPE,
                                      o_cdgo_rspsta               OUT number,
                                      o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_ac_fcha_vncmnto_trmno';

    v_fcha_vncmnto_trmno fi_g_fsclzcion_expdnte_acto.fcha_vncmnto_trmno%TYPE;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_ac_fcha_vncmnto_trmno');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_ac_fcha_vncmnto_trmno',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se consulta la fecha vencimiento de termino
    BEGIN
      SELECT a.fcha_vncmnto_trmno
        INTO v_fcha_vncmnto_trmno
        FROM fi_g_fsclzcion_expdnte_acto a
       WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se puedo obtener la fecha de vencimiento de termino';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    IF v_fcha_vncmnto_trmno IS NULL THEN
      BEGIN
        UPDATE fi_g_fsclzcion_expdnte_acto a
           SET fcha_vncmnto_trmno = p_fcha_vncmnto_trmno
         WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

        COMMIT;

      END;

    END IF;

  END prc_ac_fcha_vncmnto_trmno;

  PROCEDURE prc_ac_estdo_fsclz_exp_cnd_vgn(p_cdgo_clnte           IN number,
                                           p_id_fsclzcion_expdnte IN number,
                                           o_cdgo_rspsta          OUT number,
                                           o_mnsje_rspsta         OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_ac_estdo_fsclz_exp_cnd_vgn';

  BEGIN
    o_cdgo_rspsta := 0;

    FOR c_expdnte IN (SELECT id_fsclzc_expdn_cndd_vgnc
                        FROM fi_g_fsclzc_expdn_cndd_vgnc
                       WHERE id_fsclzcion_expdnte = p_id_fsclzcion_expdnte) LOOP
      BEGIN
        UPDATE fi_g_fsclzc_expdn_cndd_vgnc
           SET estdo = 'P'
         WHERE id_fsclzc_expdn_cndd_vgnc =
               c_expdnte.id_fsclzc_expdn_cndd_vgnc;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se puedo actualizar el estado';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

    END LOOP;

    COMMIT;

  END prc_ac_estdo_fsclz_exp_cnd_vgn;

  PROCEDURE prc_ac_estado_liquidacion(p_cdgo_clnte           IN df_s_clientes.cdgo_clnte%TYPE,
                                      p_id_fsclzcion_expdnte IN fi_g_fsclzc_expdn_cndd_vgnc.id_fsclzcion_expdnte%TYPE,
                                      o_cdgo_rspsta          OUT number,
                                      o_mnsje_rspsta         OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_ac_estado_liquidacion';

    v_cdgo_fljo varchar2(5);

    v_id_lqdcion number;

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      SELECT a.id_lqdcion
        INTO v_id_lqdcion
        FROM fi_g_fsclzc_expdn_cndd_vgnc a
       WHERE a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se pudo obtener el numero de la liquidacion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

    o_mnsje_rspsta := 'id v_id_lqdcion : ' || v_id_lqdcion;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || '-' || sqlerrm,
                          6);

    --Se obtiene el codigo del flujo que se va a instanciar
    BEGIN
      SELECT b.cdgo_fljo
        INTO v_cdgo_fljo
        FROM fi_d_programas a
        JOIN wf_d_flujos b
          ON a.id_fljo = b.id_fljo
       WHERE a.id_prgrma =
             (SELECT a.id_prgrma
                FROM fi_g_candidatos a
               WHERE a.id_cnddto =
                     (SELECT c.id_cnddto
                        FROM fi_g_fiscalizacion_expdnte c
                       WHERE c.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte));

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'No se encontro parametrizado el flujo del programa ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := 'No se pudo obtener el flujo del programa  , ' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'v_id_lqdcion: ' || v_id_lqdcion ||
                          '-v_cdgo_fljo: ' || v_cdgo_fljo,
                          6);

    IF v_id_lqdcion IS NOT NULL AND v_cdgo_fljo = 'FOL' THEN
      BEGIN
        UPDATE gf_g_movimientos_financiero
           SET cdgo_mvnt_fncro_estdo = 'NO'
         WHERE cdgo_mvmnto_orgn = 'LQ'
           AND id_orgen = v_id_lqdcion;

        o_mnsje_rspsta := 'Actualizacion en la tabla gf_g_movimientos_financiero de la liquidacion No ' ||
                          v_id_lqdcion || ', de Anulada a Normal ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := 'No se pudo actualizar el estado de la liquidacion';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

      END;

      BEGIN
        UPDATE gf_g_mvmntos_cncpto_cnslddo a
           SET a.cdgo_mvnt_fncro_estdo = 'NO'
         WHERE a.cdgo_mvmnto_orgn = 'LQ'
           AND a.id_orgen = v_id_lqdcion;

        o_mnsje_rspsta := 'Actualizacion a la tabla gf_g_mvmntos_cncpto_cnslddo de la liquidacion No ' ||
                          v_id_lqdcion || ', de Anulada a Normal ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := 'No se pudo actualizar el estado datos de la declaracion';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

      END;

    END IF;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Salida exitosa' || systimestamp,
                          6);

  END prc_ac_estado_liquidacion;

  /*
  Funcion que actualiza la sancion creada, actualizandola por el acto de resolucion sancion
  */
  PROCEDURE prc_ac_sancion_resolucion_acto(p_cdgo_clnte                IN number,
                                           p_id_fsclzcion_expdnte      IN number,
                                           p_id_fsclzcion_expdnte_acto IN number,
                                           o_cdgo_rspsta               OUT number,
                                           o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_ac_sancion_resolucion_acto';

    v_id_acto_tpo number;

    v_cdgo_impsto_acto varchar2(5);

    v_prdo varchar2(50);

    v_vgncia number;

    v_id_prdo number;

    v_id_impsto_acto number;

    v_validar number := 0;

    v_nmbre_impsto_acto varchar2(50);

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se consulta la informacion del acto de resolucion sancion del programa sancionatorio.
    BEGIN
      SELECT a.id_acto_tpo, b.cdgo_acto_tpo, c.vgncia, c.id_prdo
        INTO v_id_acto_tpo, v_cdgo_impsto_acto, v_vgncia, v_id_prdo
        FROM fi_g_fsclzcion_expdnte_acto a
        JOIN gn_d_actos_tipo b
          ON a.id_acto_tpo = b.id_acto_tpo
        JOIN fi_g_fsclzcion_acto_vgncia c
          ON a.id_fsclzcion_expdnte_acto = c.id_fsclzcion_expdnte_acto
       WHERE a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte
         AND a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' No se encontraron dato para el acto de resolucion sancion. Valide si ya se genero el acto.';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' No se puede obtener la informacion del acto de resolucion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    SELECT prdo || '-' || dscrpcion AS prdo
      INTO v_prdo
      FROM df_i_periodos a
     WHERE a.id_prdo = v_id_prdo;

    --Se consulta si el codigo impuesto acto existe.
    BEGIN
      SELECT a.id_impsto_acto, a.nmbre_impsto_acto
        INTO v_id_impsto_acto, v_nmbre_impsto_acto
        FROM df_i_impuestos_acto a
       WHERE a.cdgo_impsto_acto = v_cdgo_impsto_acto;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' No se encuentra paramitrizado el impuesto acto de resolucion sancion para este programa. Crear el impuesto acto con el siguiente codigo ' ||
                          v_cdgo_impsto_acto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 4;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' No se puedo consultar el impuesto acto con codigo ' ||
                          v_cdgo_impsto_acto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    IF v_id_impsto_acto IS NOT NULL THEN
      BEGIN
        FOR c_sancion IN (SELECT b.id_impsto_acto_cncpto,
                                 b.id_cncpto,
                                 b.vgncia,
                                 b.id_prdo,
                                 b.orden
                            FROM df_i_impuestos_acto a
                            JOIN df_i_impuestos_acto_concepto b
                              ON a.id_impsto_acto = b.id_impsto_acto
                           WHERE b.cdgo_clnte = p_cdgo_clnte
                             AND a.cdgo_impsto_acto = v_cdgo_impsto_acto
                             AND b.vgncia = v_vgncia
                             AND b.id_prdo = v_id_prdo
                           ORDER BY b.orden ASC) LOOP
          v_validar := 1;

          UPDATE fi_g_fiscalizacion_sancion a
             SET a.id_acto_tpo           = v_id_acto_tpo,
                 a.id_impsto_acto_cncpto = c_sancion.id_impsto_acto_cncpto,
                 a.id_cncpto             = c_sancion.id_cncpto
           WHERE a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte
             AND a.orden = c_sancion.orden;

          UPDATE fi_g_fsclzc_expdn_cndd_vgnc a
             SET a.id_lqdcion = NULL
           WHERE a.id_lqdcion IS NOT NULL
             AND a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte;

        END LOOP;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 5;

          o_mnsje_rspsta := o_cdgo_rspsta ||
                            ' No se encontraron datos del impuesto acto, validar que tenga parametrizado los conceptos para la vigencia ' ||
                            v_vgncia || ' y periodo ' || v_prdo;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := o_cdgo_rspsta ||
                            ' No se puedo consultar el impuesto acto con codigo ' ||
                            v_cdgo_impsto_acto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      IF v_validar = 0 THEN
        o_cdgo_rspsta := 7;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' No se encontraron conceptos asociados al impuesto acto ' ||
                          v_nmbre_impsto_acto ||
                          ', validar que tenga parametrizado los conceptos para la vigencia ' ||
                          v_vgncia || ' y periodo ' || v_prdo;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      END IF;

    END IF;

    --o_cdgo_rspsta := 0;
    o_mnsje_rspsta := 'Saliendo con exito';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

  END prc_ac_sancion_resolucion_acto;

  FUNCTION fnc_co_indicador_fisca(p_cdgo_clnte        number,
                                  p_id_impsto         number,
                                  p_id_impsto_sbmpsto number,
                                  p_id_sjto_tpo       number) RETURN varchar2 AS
    v_indcdor_fsca number;

  BEGIN
    SELECT count(*)
      INTO v_indcdor_fsca
      FROM gi_g_liquidaciones a
      JOIN df_i_liquidaciones_tipo b
        ON a.id_lqdcion_tpo = b.id_lqdcion_tpo
     WHERE a.cdgo_clnte = p_cdgo_clnte
       AND a.cdgo_lqdcion_estdo = 'L'
       AND b.cdgo_lqdcion_tpo = 'FI'
       AND a.id_sjto_impsto = p_id_sjto_tpo
       AND a.id_impsto = p_id_impsto
       AND a.id_impsto_sbmpsto = p_id_impsto_sbmpsto
       AND exists (SELECT 1
              FROM v_gf_g_cartera_x_concepto c
             WHERE c.cdgo_clnte = a.cdgo_clnte
               AND c.id_impsto = a.id_impsto
               AND c.id_impsto_sbmpsto = a.id_impsto_sbmpsto
               AND c.id_sjto_impsto = a.id_sjto_impsto
               AND c.id_orgen = a.id_lqdcion
               AND c.cdgo_mvmnto_orgn = 'LQ' HAVING
             sum(c.vlor_sldo_cptal) > 0);

    IF v_indcdor_fsca > 0 THEN
      RETURN 'S';

    ELSE
      RETURN 'N';

    END IF;

  END fnc_co_indicador_fisca;

  PROCEDURE prc_co_columnas_etl(p_cdgo_clnte    IN number,
                                p_id_prcso_crga IN number,
                                o_clmnas        OUT CLOB,
                                o_cdgo_rspsta   OUT number,
                                o_mnsje_rspsta  OUT varchar2) AS
    v_nl number;

    v_id_crga number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_co_columnas_etl';

    columnas json_array_t := json_array_t();

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se obtiene el identificador de la carga
    BEGIN
      SELECT a.id_crga
        INTO v_id_crga
        FROM et_g_procesos_carga a
       WHERE a.id_prcso_crga = p_id_prcso_crga;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se encontro el proceso de carga';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'Problema al obtener el proceso de carga';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    BEGIN
      FOR c IN (SELECT a.dscrpcion, a.nmbre_clmna
                  FROM et_d_reglas_intermedia a
                 WHERE id_crga = v_id_crga) LOOP
        DECLARE
          columna JSON_OBJECT_T := JSON_OBJECT_T();

        BEGIN
          columna.put('columna', c.nmbre_clmna);

          columna.put('descrpcion', c.dscrpcion);

          columnas.append(columna);

        END;

      END LOOP;

      o_clmnas := columnas.to_clob;

    END;

  END prc_co_columnas_etl;

  PROCEDURE prc_rg_fuentes_externa(p_cdgo_clnte          IN number,
                                   p_id_usrio            IN number,
                                   p_id_prcso_crga       IN number,
                                   p_id_archvo_cnddto    IN number,
                                   o_id_fnte_extrna_crga OUT number,
                                   o_cdgo_rspsta         OUT number,
                                   o_mnsje_rspsta        OUT varchar2) AS
    v_nl number;

    v_id_crga number;

    v_cdgo_crga varchar2(5);

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_fuentes_externa';

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se obtiene el codigo de carga
    BEGIN
      SELECT cdgo_crga
        INTO v_cdgo_crga
        FROM fi_g_fuentes_externa
       WHERE id_prcso_crga = p_id_prcso_crga
       GROUP BY cdgo_crga;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se encontro el codigo de carga para el proceso carga ' ||
                          p_id_prcso_crga;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'Problema al obtener el codigo de carga para el proceso carga ' ||
                          p_id_prcso_crga;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    CASE
      WHEN v_cdgo_crga = 'CDC' THEN
        --Camara de comercio
        --Se llama la up que procesa la informacion del archivo de camara de comercio
        BEGIN
          prc_rg_fuente_camara_comercio(p_cdgo_clnte          => p_cdgo_clnte,
                                        p_id_usrio            => p_id_usrio,
                                        p_id_prcso_crga       => p_id_prcso_crga,
                                        p_id_archvo_cnddto    => p_id_archvo_cnddto,
                                        o_id_fnte_extrna_crga => o_id_fnte_extrna_crga,
                                        o_cdgo_rspsta         => o_cdgo_rspsta,
                                        o_mnsje_rspsta        => o_mnsje_rspsta);

          IF o_cdgo_rspsta > 0 THEN
            o_cdgo_rspsta := 3;

            o_mnsje_rspsta := 'prc_rg_camara_comercio..' || p_cdgo_clnte || '-' ||
                              o_id_fnte_extrna_crga;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 3;

            o_mnsje_rspsta := 'Problema al llamar la up prc_rg_camara_comercio' ||
                              ' , ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      WHEN v_cdgo_crga = 'DAN' THEN
        --DIAN
        --Se llama la up que procesa la informacion del archivo de la DIAN
        BEGIN
          prc_rg_fuente_dian(p_cdgo_clnte          => p_cdgo_clnte,
                             p_id_usrio            => p_id_usrio,
                             p_id_prcso_crga       => p_id_prcso_crga,
                             o_id_fnte_extrna_crga => o_id_fnte_extrna_crga,
                             o_cdgo_rspsta         => o_cdgo_rspsta,
                             o_mnsje_rspsta        => o_mnsje_rspsta);

          IF o_cdgo_rspsta > 0 THEN
            RETURN;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 3;

            o_mnsje_rspsta := 'Problema al llamar la up prc_rg_fuente_dian';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      WHEN v_cdgo_crga = 'REN' THEN
        --Se llama la up que procesa la informacion del archivo de Renta
        BEGIN
          prc_rg_fuente_renta(p_cdgo_clnte          => p_cdgo_clnte,
                              p_id_usrio            => p_id_usrio,
                              p_id_prcso_crga       => p_id_prcso_crga,
                              o_id_fnte_extrna_crga => o_id_fnte_extrna_crga,
                              o_cdgo_rspsta         => o_cdgo_rspsta,
                              o_mnsje_rspsta        => o_mnsje_rspsta);

          IF o_cdgo_rspsta > 0 THEN
            RETURN;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 3;

            o_mnsje_rspsta := 'Problema al llamar la up prc_rg_fuente_renta ' ||
                              ' , ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      WHEN v_cdgo_crga = 'IVA' THEN
        --Se llama la up que procesa la informacion del archivo de IVA
        BEGIN
          prc_rg_fuente_iva(p_cdgo_clnte          => p_cdgo_clnte,
                            p_id_usrio            => p_id_usrio,
                            p_id_prcso_crga       => p_id_prcso_crga,
                            o_id_fnte_extrna_crga => o_id_fnte_extrna_crga,
                            o_cdgo_rspsta         => o_cdgo_rspsta,
                            o_mnsje_rspsta        => o_mnsje_rspsta);

          IF o_cdgo_rspsta > 0 THEN
            RETURN;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 3;

            o_mnsje_rspsta := 'Problema al llamar la up prc_rg_fuente_dian';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      ELSE
        o_cdgo_rspsta := 4;

        o_mnsje_rspsta := 'No se encontro una up para ejecutar para el codigo de carga ' ||
                          v_cdgo_crga;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END CASE;

  END prc_rg_fuentes_externa;

  PROCEDURE prc_rg_fuente_camara_comercio(p_cdgo_clnte          IN number,
                                          p_id_usrio            IN number,
                                          p_id_prcso_crga       IN number,
                                          p_id_archvo_cnddto    IN number,
                                          o_id_fnte_extrna_crga OUT number,
                                          o_cdgo_rspsta         OUT number,
                                          o_mnsje_rspsta        OUT varchar2) AS
    v_nl number;

    v_id_crga number;

    v_rsltdo number;

    v_id_impsto number;

    v_id_dprtmnto number;

    v_nit number;

    v_id_sjto number;

    v_id_fnte_extrna_crga number;

    v_sjto_impsto number;

    v_id_mdio_ntfccion number;

    v_obsrvcion varchar2(4000);

    v_cdgo_dprtmnto varchar2(5);

    v_ntfcble varchar2(1);

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_fuente_camara_comercio';

    v_json CLOB;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      --Se registra
      BEGIN
        INSERT INTO fi_g_fuente_externa_carga
          (id_prcso_crga)
        VALUES
          (p_id_prcso_crga)
        RETURNING id_fnte_extrna_crga INTO v_id_fnte_extrna_crga;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 11;

          o_mnsje_rspsta := 'No se pudo registrar el proceso carga';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se obtiene el impuesto
      BEGIN
        SELECT id_impsto
          INTO v_id_impsto
          FROM df_c_impuestos
         WHERE cdgo_clnte = p_cdgo_clnte
           AND cdgo_impsto = 'ICA';

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el identificador del impuesto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      BEGIN
        SELECT id_mdio_ntfccion
          INTO v_id_mdio_ntfccion
          FROM fi_g_archivos_candidato
         WHERE id_archvo_cnddto = p_id_archvo_cnddto;

      EXCEPTION
        WHEN others THEN
          v_id_mdio_ntfccion := NULL;

      END;

      FOR cc IN (SELECT id_fnte_extrna,
                        clumna1 AS numeral,
                        clumna2 AS consecutivo,
                        clumna3 AS accion,
                        clumna4 AS matricula,
                        clumna5 AS categoria,
                        clumna6 AS descripcion_categoria,
                        substr(trim(clumna7), 1, 99) AS razon_social,
                        to_date(clumna8, 'DD/MM/YYYY HH24:MI:SS') AS fecha_matricula,
                        to_date(clumna9, 'DD/MM/YYYY HH24:MI:SS') AS fecha_renovacion,
                        to_date(clumna10, 'DD/MM/YYYY HH24:MI:SS') AS fecha_cancelacion, --  to_date (clumna8, 'DD/MM/YYYY') as fecha_matricula,
                        --  to_date (clumna9, 'DD/MM/YYYY') as fecha_renovacion,
                        --  to_date (clumna10, 'DD/MM/YYYY') as fecha_cancelacion,
                        clumna11 AS nit,
                        trim(clumna12) AS digito_verificacion,
                        clumna13 AS tipo_identificacion,
                        clumna14 AS numero_identificacion,
                        clumna15 AS cargo,
                        clumna16 AS nombre,
                        clumna17 AS direccion_comercial,
                        clumna18 AS telefono_comercial,
                        clumna19 AS ciudad_comercial,
                        clumna20 AS apartado_comercial,
                        clumna21 AS fax_comercial,
                        clumna22 AS pagina_web,
                        clumna23 AS mail,
                        clumna24 AS direccion_judicial,
                        clumna25 AS telefono_judicial,
                        clumna26 AS ciudad_judicial,
                        clumna27 AS activo_sin_inflacion,
                        to_date(clumna28, 'DD/MM/YYYY HH24:MI:SS') AS fecha_reportado,
                        clumna29 AS ciiu_1,
                        clumna30 AS descripcion_ciiu_1,
                        to_date(clumna31, 'DD/MM/YYYY HH24:MI:SS') AS fecha_actividad_1,
                        clumna32 AS ciiu_2,
                        clumna33 AS descripcion_ciiu_2,
                        to_date(clumna34, 'DD/MM/YYYY HH24:MI:SS') AS fecha_actividad_2,
                        clumna35 AS ciiu_3,
                        clumna36 AS descripcion_ciiu_3,
                        to_date(clumna37, 'DD/MM/YYYY HH24:MI:SS') AS fecha_actividad_3
                   FROM fi_g_fuentes_externa
                  WHERE id_prcso_crga = p_id_prcso_crga) LOOP
        --Se consulta si existe el registro en la tabla de camara comercio
        BEGIN
          SELECT a.nit
            INTO v_nit
            FROM fi_g_fntes_extrna_cmra_cmrc a
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.nit = trim(cc.nit);

        EXCEPTION
          WHEN no_data_found THEN
            --Valida si el sujeto existe
            BEGIN
              SELECT s.id_sjto
                INTO v_id_sjto
                FROM si_c_sujetos s
               WHERE s.cdgo_clnte = p_cdgo_clnte
                 AND s.idntfccion = trim(cc.nit);

            EXCEPTION
              WHEN no_data_found THEN
                v_id_sjto := NULL;

            END;

            --Valida que el sujeto no tenga asociado el mismo impuesto
            BEGIN
              SELECT id_sjto_impsto
                INTO v_sjto_impsto
                FROM v_si_i_sujetos_impuesto
               WHERE id_sjto = v_id_sjto
                 AND id_impsto = v_id_impsto;

            EXCEPTION
              WHEN no_data_found THEN
                v_sjto_impsto := NULL;

            END;

            IF v_sjto_impsto IS NOT NULL THEN
              UPDATE fi_g_fuentes_externa a
                 SET a.indcdor_rgstro = 'S', a.indcdor_sjto_exste = 'S'
               WHERE id_fnte_extrna = cc.id_fnte_extrna;

            ELSE
              UPDATE fi_g_fuentes_externa a
                 SET a.indcdor_rgstro = 'N'
               WHERE id_fnte_extrna = cc.id_fnte_extrna;

            END IF;

            v_ntfcble := 'N';

            v_obsrvcion := NULL;

            --Se valida el tipo de medio de notificacion
            IF v_id_mdio_ntfccion IS NOT NULL THEN
              IF v_id_mdio_ntfccion IN (1, 2) THEN
                IF cc.mail IS NULL AND cc.direccion_comercial IS NOT NULL THEN
                  v_id_mdio_ntfccion := 2;

                  v_obsrvcion := 'No se puede notificar por Correo Electronico, porque el campo email' ||
                                 ' se encuentra vacio. Se notifica por medio de Correo Certificado.';

                  v_ntfcble := 'S';

                elsif (cc.mail IS NOT NULL AND (regexp_like(cc.mail,
                                                            '^[A-Za-z]+[A-Za-z0-9._]+@[A-Za-z0-9.-]+\.[A-Za-z]{?2,4}?$') =
                      FALSE)) THEN
                  v_id_mdio_ntfccion := 2;

                  v_obsrvcion := 'El email del sujeto no es valido para la notificacion de Correo Electronico.' ||
                                 ' Se notifica por medio de Correo Certificado.';

                  v_ntfcble := 'S';

                ELSIF cc.direccion_comercial IS NULL THEN
                  v_id_mdio_ntfccion := 1;

                  v_obsrvcion := 'No se puede notificar por Correo Certificado, porque el campo direccion comercial' ||
                                 ' se encuentra vacio. Se notifica por medio de Correo Electronico.';

                  v_ntfcble := 'S';

                END IF;

              END IF;

            END IF;

            --Se registra
            BEGIN
              INSERT INTO fi_g_fntes_extrna_cmra_cmrc
                (cdgo_clnte,
                 accion,
                 mtrcla,
                 ctgria,
                 dscrpcion_ctgria,
                 rzon_scial,
                 fcha_mtrcla,
                 fcha_rnvcion,
                 fcha_cnclcion,
                 nit,
                 dgto_vrfccion,
                 tpo_idntfccion,
                 nro_idntfccion,
                 crgo_rprsntnte_lgal,
                 nmbre_rprsntnte_lgal,
                 drccion_cmrcial,
                 tlfno_cmrcial,
                 cdad_cmrcial,
                 aprtdo_cmrcial,
                 fax_cmrcial,
                 pgna_web,
                 mail,
                 drccion_jdcial,
                 tlfno_jdcial,
                 cdad_jdcial,
                 actvo_sin_inflcion,
                 fcha_rprtdo,
                 ciiu_1,
                 dscrpcion_ciiu_1,
                 fcha_actvdad_1,
                 ciiu_2,
                 dscrpcion_ciiu_2,
                 fcha_actvdad_2,
                 ciiu_3,
                 dscrpcion_ciiu_3,
                 fcha_actvdad_3,
                 id_sjto_impsto,
                 id_fnte_extrna_crga,
                 id_mdio_ntfccion,
                 ntfcble,
                 obsrvcion)
              VALUES
                (p_cdgo_clnte,
                 cc.accion,
                 cc.matricula,
                 cc.categoria,
                 cc.descripcion_categoria,
                 cc.razon_social,
                 cc.fecha_matricula,
                 cc.fecha_renovacion,
                 cc.fecha_cancelacion,
                 cc.nit,
                 cc.digito_verificacion,
                 cc.tipo_identificacion,
                 cc.numero_identificacion,
                 cc.cargo,
                 cc.nombre,
                 cc.direccion_comercial,
                 cc.telefono_comercial,
                 cc.ciudad_comercial,
                 cc.apartado_comercial,
                 cc.fax_comercial,
                 cc.pagina_web,
                 cc.mail,
                 cc.direccion_judicial,
                 cc.telefono_judicial,
                 cc.ciudad_judicial,
                 cc.activo_sin_inflacion,
                 cc.fecha_reportado,
                 cc.ciiu_1,
                 cc.descripcion_ciiu_1,
                 cc.fecha_actividad_1,
                 cc.ciiu_2,
                 cc.descripcion_ciiu_2,
                 cc.fecha_actividad_2,
                 cc.ciiu_3,
                 cc.descripcion_ciiu_3,
                 cc.fecha_actividad_3,
                 v_sjto_impsto,
                 v_id_fnte_extrna_crga,
                 v_id_mdio_ntfccion,
                 v_ntfcble,
                 v_obsrvcion);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 1;

                o_mnsje_rspsta := 'No se pudo procesar el archivo, error al insertar el registro de fuente externa ' ||
                                  cc.id_fnte_extrna || sqlerrm;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := 'Problema al validar si el NIT ' || cc.nit ||
                              ' se encuentra registrado';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      END LOOP;

      --Se actualiza el proceso carga como procesado
      BEGIN
        UPDATE et_g_procesos_carga
           SET indcdor_prcsdo = 'S'
         WHERE id_prcso_crga = p_id_prcso_crga;

      END;

    END;

  END prc_rg_fuente_camara_comercio;

  PROCEDURE prc_rg_fuente_dian(p_cdgo_clnte          IN number,
                               p_id_usrio            IN number,
                               p_id_prcso_crga       IN number,
                               o_id_fnte_extrna_crga OUT number,
                               o_cdgo_rspsta         OUT number,
                               o_mnsje_rspsta        OUT varchar2) AS
    v_nl number;

    v_id_crga number;

    v_nit number;

    v_id_impsto number;

    v_id_mncpio number;

    v_id_dprtmnto number;

    v_mtrcla number;

    o_sjto_impsto number;

    v_id_sjto number;

    v_id_fnte_extrna_crga number;

    v_sjto_impsto number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_fuente_dian';

    v_fcha_mtrcla date;

    v_json CLOB;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      --Se registra
      BEGIN
        INSERT INTO fi_g_fuente_externa_carga
          (id_prcso_crga)
        VALUES
          (p_id_prcso_crga)
        RETURNING id_fnte_extrna_crga INTO v_id_fnte_extrna_crga;

        o_id_fnte_extrna_crga := v_id_fnte_extrna_crga;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 11;

          o_mnsje_rspsta := 'No se pudo registrar el proceso carga';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se obtiene el impuesto
      BEGIN
        SELECT id_impsto
          INTO v_id_impsto
          FROM df_c_impuestos
         WHERE cdgo_clnte = p_cdgo_clnte
           AND cdgo_impsto = 'ICA';

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el identificador del impuesto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      FOR dian IN (SELECT id_fnte_extrna,
                          clumna1        AS nit,
                          clumna2        AS dv,
                          clumna3        AS tipo_contribuyente,
                          clumna4        AS tipo_documento,
                          clumna5        AS identificacion,
                          clumna6        AS razon_social,
                          clumna7        AS nombre_comercial,
                          clumna8        AS codigo_municipio,
                          clumna9        AS direccion,
                          clumna10       AS corre_electronico,
                          clumna11       AS apartado_aereo,
                          clumna12       AS telefoneo_1,
                          clumna13       AS telefoneo_2,
                          clumna14       AS actividad,
                          clumna15       AS fecha_inicio_actividad,
                          clumna16       AS administracion
                     FROM fi_g_fuentes_externa a
                    WHERE a.id_prcso_crga = p_id_prcso_crga) LOOP
        --Se consulta si existe el registro
        BEGIN
          SELECT a.nit
            INTO v_nit
            FROM fi_g_fuentes_externa_dian a
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.nit = trim(dian.nit);

        EXCEPTION
          WHEN no_data_found THEN
            --Valida que el sujeto no se encuentre registrado
            BEGIN
              SELECT s.id_sjto
                INTO v_id_sjto
                FROM si_c_sujetos s
               WHERE s.cdgo_clnte = p_cdgo_clnte
                 AND s.idntfccion = trim(dian.nit);

            EXCEPTION
              WHEN no_data_found THEN
                v_id_sjto := NULL;

            END;

            --Valida que el sujeto no tenga asociado el mismo impuesto
            BEGIN
              SELECT id_sjto_impsto
                INTO v_sjto_impsto
                FROM v_si_i_sujetos_impuesto
               WHERE id_sjto = v_id_sjto
                 AND id_impsto = v_id_impsto;

            EXCEPTION
              WHEN no_data_found THEN
                v_sjto_impsto := NULL;

            END;

            IF v_sjto_impsto IS NOT NULL THEN
              UPDATE fi_g_fuentes_externa a
                 SET a.indcdor_rgstro = 'S', a.indcdor_sjto_exste = 'S'
               WHERE id_fnte_extrna = dian.id_fnte_extrna;

            ELSE
              UPDATE fi_g_fuentes_externa a
                 SET a.indcdor_rgstro = 'N'
               WHERE id_fnte_extrna = dian.id_fnte_extrna;

            END IF;

            --Registra
            BEGIN
              INSERT INTO fi_g_fuentes_externa_dian
                (cdgo_clnte,
                 nit,
                 dgto_vrfccion,
                 tpo_cntrbynte,
                 tpo_dcmnto,
                 idntfccion,
                 rzon_scial,
                 nmbre_cmrcial,
                 cdgo_mncpio,
                 drccion,
                 crreo_elctrnico,
                 aprtdo_aereo,
                 tlfno_1,
                 tlfno_2,
                 actvdad,
                 fcha_incio_actvdad,
                 admnstrcion,
                 id_fnte_extrna_crga,
                 id_sjto_impsto)
              VALUES
                (p_cdgo_clnte,
                 dian.nit,
                 dian.dv,
                 dian.tipo_contribuyente,
                 dian.tipo_documento,
                 dian.identificacion,
                 dian.razon_social,
                 dian.nombre_comercial,
                 dian.codigo_municipio,
                 dian.direccion,
                 dian.corre_electronico,
                 dian.apartado_aereo,
                 dian.telefoneo_1,
                 0 /*dian.telefoneo_2*/,
                 dian.actividad,
                 sysdate /*dian.fecha_inicio_actividad*/,
                 dian.administracion,
                 v_id_fnte_extrna_crga,
                 v_sjto_impsto);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 1;

                o_mnsje_rspsta := 'No se pudo procesar el archivo, error al insertar el registro de fuente externa ' ||
                                  dian.id_fnte_extrna || ' , ' || sqlerrm;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := 'Problema al validar si el registro existe ' ||
                              dian.id_fnte_extrna;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      END LOOP;

      --Se actualiza el proceso carga como procesado
      BEGIN
        UPDATE et_g_procesos_carga
           SET indcdor_prcsdo = 'S'
         WHERE id_prcso_crga = p_id_prcso_crga;

      END;

    END;

  END prc_rg_fuente_dian;

  PROCEDURE prc_rg_fuente_iva(p_cdgo_clnte          IN number,
                              p_id_usrio            IN number,
                              p_id_prcso_crga       IN number,
                              o_id_fnte_extrna_crga OUT number,
                              o_cdgo_rspsta         OUT number,
                              o_mnsje_rspsta        OUT varchar2) AS
    v_nl number;

    v_id_crga number;

    v_nit number;

    v_id_sjto number;

    v_sjto_impsto number;

    v_id_fnte_extrna_crga number;

    v_id_impsto number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_fuente_iva';

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      --Se obtiene el impuesto
      BEGIN
        SELECT id_impsto
          INTO v_id_impsto
          FROM df_c_impuestos
         WHERE cdgo_clnte = p_cdgo_clnte
           AND cdgo_impsto = 'ICA';

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el identificador del impuesto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se registra
      BEGIN
        INSERT INTO fi_g_fuente_externa_carga
          (id_prcso_crga)
        VALUES
          (p_id_prcso_crga)
        RETURNING id_fnte_extrna_crga INTO v_id_fnte_extrna_crga;

        o_id_fnte_extrna_crga := v_id_fnte_extrna_crga;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 11;

          o_mnsje_rspsta := 'No se pudo registrar el proceso carga';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      FOR iva IN (SELECT id_fnte_extrna,
                         clumna1        AS nit,
                         clumna2        AS periodo,
                         clumna3        AS vigencia,
                         clumna4        AS ingresos_operaciones_gravadas,
                         clumna5        AS ingresos_brutos_por_gravadas,
                         clumna6        AS aiu_operaciones_gravadas,
                         clumna7        AS exportacion_bienes,
                         clumna8        AS exportacion_servicios,
                         clumna9        AS ingresos_comercializadora_int,
                         clumna10       AS ingresos_ventas_zonas_francas,
                         clumna11       AS ingresos_juegos,
                         clumna12       AS ing_brutos_operaciones_exentas,
                         clumna13       AS ingresos_venta_cerveza,
                         clumna14       AS ingresos_brutos_operaciones_excluidad,
                         clumna15       AS ingresos_brutos_operaciones_gravadas,
                         clumna16       AS total_ingresos_brutos,
                         clumna17       AS devolucion_ventas,
                         clumna18       AS ingresos_netos
                    FROM fi_g_fuentes_externa a
                   WHERE a.id_prcso_crga = p_id_prcso_crga) LOOP
        v_sjto_impsto := 0;

        --Se consulta si existe el registro
        BEGIN
          SELECT a.nit
            INTO v_nit
            FROM fi_g_fuentes_externa_iva a
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.nit = iva.nit
             AND a.vgncia = iva.vigencia
             AND a.prdo = iva.periodo;

        EXCEPTION
          WHEN no_data_found THEN
            --Valida que el sujeto no se encuentre registrado
            BEGIN
              SELECT s.id_sjto
                INTO v_id_sjto
                FROM si_c_sujetos s
               WHERE s.cdgo_clnte = p_cdgo_clnte
                 AND s.idntfccion = trim(iva.nit);

            EXCEPTION
              WHEN no_data_found THEN
                NULL;

            END;

            --Valida que el sujeto no tenga asociado el mismo impuesto
            BEGIN
              SELECT id_sjto_impsto
                INTO v_sjto_impsto
                FROM v_si_i_sujetos_impuesto
               WHERE id_sjto = v_id_sjto
                 AND id_impsto = v_id_impsto;

            EXCEPTION
              WHEN no_data_found THEN
                NULL;

            END;

            --Registra
            BEGIN
              INSERT INTO fi_g_fuentes_externa_iva
                (cdgo_clnte,
                 nit,
                 vgncia,
                 prdo,
                 ingrso_oprcnes_grvda,
                 ingrso_brto_pr_grvda,
                 aiu_oprcnes_grvda,
                 exprtcion_bne,
                 exprtcion_srvcio,
                 ingrso_cmrclzdra_int,
                 ingrso_vnta_znas_frnca,
                 ingrso_jgos,
                 ingrso_brto_oprcne_exnta,
                 ingrso_vnta_crvza,
                 ingrso_brto_oprcne_exclda,
                 ingrso_brto_oprcne_no_grvda,
                 ttal_ingrso_brto,
                 dvlcion_vnta,
                 ingrso_nto,
                 id_sjto_impsto,
                 id_fnte_extrna_crga)
              VALUES
                (p_cdgo_clnte,
                 iva.nit,
                 iva.vigencia,
                 iva.periodo,
                 iva.ingresos_operaciones_gravadas,
                 iva.ingresos_brutos_por_gravadas,
                 iva.aiu_operaciones_gravadas,
                 iva.exportacion_bienes,
                 iva.exportacion_servicios,
                 iva.ingresos_comercializadora_int,
                 iva.ingresos_ventas_zonas_francas,
                 iva.ingresos_juegos,
                 iva.ing_brutos_operaciones_exentas,
                 iva.ingresos_venta_cerveza,
                 iva.ingresos_brutos_operaciones_excluidad,
                 iva.ingresos_brutos_operaciones_gravadas,
                 iva.total_ingresos_brutos,
                 iva.devolucion_ventas,
                 iva.ingresos_netos,
                 v_sjto_impsto,
                 v_id_fnte_extrna_crga);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 1;

                o_mnsje_rspsta := 'No se pudo procesar el archivo IVA, error al insertar el registro de fuente externa ' ||
                                  iva.id_fnte_extrna;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := 'Problema al validar si el registro existe ' ||
                              iva.id_fnte_extrna;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      END LOOP;

      --Se actualiza el proceso carga como procesado
      BEGIN
        UPDATE et_g_procesos_carga
           SET indcdor_prcsdo = 'S'
         WHERE id_prcso_crga = p_id_prcso_crga;

      END;

    END;

  END prc_rg_fuente_iva;

  PROCEDURE prc_rg_fuente_renta(p_cdgo_clnte          IN number,
                                p_id_usrio            IN number,
                                p_id_prcso_crga       IN number,
                                o_id_fnte_extrna_crga OUT number,
                                o_cdgo_rspsta         OUT number,
                                o_mnsje_rspsta        OUT varchar2) AS
    v_nl number;

    v_id_crga number;

    v_nit number;

    v_id_fnte_extrna_crga number;

    v_id_impsto number;

    v_id_sjto number;

    v_sjto_impsto number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_fuente_renta';

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      --Se registra
      BEGIN
        INSERT INTO fi_g_fuente_externa_carga
          (id_prcso_crga)
        VALUES
          (p_id_prcso_crga)
        RETURNING id_fnte_extrna_crga INTO v_id_fnte_extrna_crga;

        o_id_fnte_extrna_crga := v_id_fnte_extrna_crga;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 11;

          o_mnsje_rspsta := 'No se pudo registrar el proceso carga';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se obtiene el impuesto
      BEGIN
        SELECT id_impsto
          INTO v_id_impsto
          FROM df_c_impuestos
         WHERE cdgo_clnte = p_cdgo_clnte
           AND cdgo_impsto = 'ICA';

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el identificador del impuesto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      FOR renta IN (SELECT id_fnte_extrna,
                           clumna1        AS vigencia,
                           clumna2        AS nit,
                           clumna3        AS patrimonio_bruto,
                           clumna4        AS pasivos,
                           clumna5        AS patrimonio_liquido,
                           clumna6        AS ingresos_brutos_opera,
                           clumna7        AS ingresos_brutos_no_opera,
                           clumna8        AS intereses_rendim_financieros,
                           clumna9        AS total_ingresos_brutos,
                           clumna10       AS drd_ventas,
                           clumna11       AS ingresos_const_de_renta,
                           clumna12       AS total_ingreso_netos
                      FROM fi_g_fuentes_externa a
                     WHERE a.id_prcso_crga = p_id_prcso_crga) LOOP
        --Se consulta si no existe el registro
        BEGIN
          SELECT a.nit
            INTO v_nit
            FROM fi_g_fuentes_externa_renta a
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.nit = renta.nit
             AND a.vgncia = renta.vigencia;

        EXCEPTION
          WHEN no_data_found THEN
            --Valida que el sujeto no se encuentre registrado
            BEGIN
              SELECT s.id_sjto
                INTO v_id_sjto
                FROM si_c_sujetos s
               WHERE s.cdgo_clnte = p_cdgo_clnte
                 AND s.idntfccion = trim(renta.nit);

            EXCEPTION
              WHEN no_data_found THEN
                NULL;

            END;

            --Valida que el sujeto no tenga asociado el mismo impuesto
            BEGIN
              SELECT id_sjto_impsto
                INTO v_sjto_impsto
                FROM v_si_i_sujetos_impuesto
               WHERE id_sjto = v_id_sjto
                 AND id_impsto = v_id_impsto;

            EXCEPTION
              WHEN no_data_found THEN
                NULL;

            END;

            --Registra
            BEGIN
              INSERT INTO fi_g_fuentes_externa_renta
                (cdgo_clnte,
                 nit,
                 vgncia,
                 ptrmnio_brto,
                 psvo,
                 ptrmnio_lqudo,
                 ingrso_brto_oprcnles,
                 ingrso_brto_no_oprcnles,
                 intres_rndmnto_fnncro,
                 ttal_ingrsos_brtos,
                 dvlcion_rbja_dscnto_vnta,
                 ingrso_const_de_rnta,
                 ttl_ingrso_ntos,
                 id_sjto_impsto,
                 id_fnte_extrna_crga)
              VALUES
                (p_cdgo_clnte,
                 to_number(renta.nit),
                 renta.vigencia,
                 renta.patrimonio_bruto,
                 renta.pasivos,
                 renta.patrimonio_liquido,
                 renta.ingresos_brutos_opera,
                 renta.ingresos_brutos_no_opera,
                 renta.intereses_rendim_financieros,
                 renta.total_ingresos_brutos,
                 renta.drd_ventas,
                 renta.ingresos_const_de_renta,
                 renta.total_ingreso_netos,
                 v_sjto_impsto,
                 v_id_fnte_extrna_crga);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 1;

                o_mnsje_rspsta := 'No se pudo procesar el archivo, error al insertar el registro de fuente externa ' ||
                                  renta.id_fnte_extrna;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := 'Problema al validar si el registro existe ' ||
                              renta.id_fnte_extrna;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      END LOOP;

      --Se actualiza el proceso carga como procesado
      BEGIN
        UPDATE et_g_procesos_carga
           SET indcdor_prcsdo = 'S'
         WHERE id_prcso_crga = p_id_prcso_crga;

      END;

    END;

  END prc_rg_fuente_renta;

  PROCEDURE prc_rg_sujetos(p_cdgo_clnte   IN number,
                           p_id_usrio     IN number,
                           p_id_sjto_tpo  IN number,
                           p_sujeto       IN CLOB,
                           o_cdgo_rspsta  OUT number,
                           o_mnsje_rspsta OUT varchar2) AS
    v_nl number;

    o_sjto_impsto number;

    v_id_dprtmnto number;

    v_id_mncpio number;

    v_cdgo_mncpio number;

    v_id_impsto number;

    v_id_sjto_tpo number;

    v_mtrcla number;

    v_nit number;

    v_cdgo_dprtmnto varchar2(5);

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_sujetos';

    v_fcha_mtrcla date;

    v_json CLOB;

    v_fi_g_fuentes_externa fi_g_fuentes_externa%rowtype;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      /*  o_mnsje_rspsta := 'p_sujeto-  '|| p_sujeto;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta, 6);*/ --Se obtiene el impuesto
      BEGIN
        SELECT id_impsto
          INTO v_id_impsto
          FROM df_c_impuestos
         WHERE cdgo_clnte = p_cdgo_clnte
           AND cdgo_impsto = 'ICA';

        o_mnsje_rspsta := 'consulto el id_impsto :' || v_id_impsto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el identificador del impuesto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      o_mnsje_rspsta := 'Entrar a crear cursos sjto';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      FOR sjto IN (SELECT id_fnte_extrna
                     FROM json_table(p_sujeto,
                                     '$[*]' columns(id_fnte_extrna varchar2 PATH
                                             '$.id_fnte_extrna'))) LOOP
        --Se obtiene el registro de fuentes externa
        BEGIN
          SELECT /*+ RESULT_CACHE */
           a.*
            INTO v_fi_g_fuentes_externa
            FROM fi_g_fuentes_externa a
           WHERE id_fnte_extrna = sjto.id_fnte_extrna;

          o_mnsje_rspsta := 'consula registro fuente externa';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := 'Problema al obtener el registro de fuente externa';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

        CASE
          WHEN v_fi_g_fuentes_externa.cdgo_crga = 'CDC' THEN
            o_mnsje_rspsta := 'Entro al case CDC';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            v_nit := to_number(v_fi_g_fuentes_externa.clumna11);

            /* --Se obtiene el codigo del departamento
            begin
                select substr(v_fi_g_fuentes_externa.clumna19,1, 2)
                into v_cdgo_mncpio
                from dual;
            exception
                when others then
                    o_cdgo_rspsta := 2;
                    o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el codigo del departamento';
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                    return;
            end;*/ --Se obtiene el id municipio y departamento
            BEGIN
              SELECT id_mncpio, id_dprtmnto
                INTO v_id_mncpio, v_id_dprtmnto
                FROM df_s_municipios
               WHERE cdgo_mncpio = v_fi_g_fuentes_externa.clumna19;

              o_mnsje_rspsta := 'consulta departamento y municipio';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 2;

                o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el codigo del municipio';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

            /* begin
            select a.id_sjto_tpo
            into   v_id_sjto_tpo
            from df_i_sujetos_tipo a
            where a.cdgo_sjto_tpo  in  ( select  case  when clumna5 = '01'  then 'N' else 'PJR' end
                                         from fi_g_fuentes_externa b where b.clumna11 = v_fi_g_fuentes_externa.clumna11)
            and a.id_impsto = v_id_impsto
            and a.cdgo_clnte = p_cdgo_clnte;

            exception
                when others then

                    o_cdgo_rspsta := 3;
                    o_mnsje_rspsta := 'No se pudo consultar el id sujeto tipo. ';
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                    return;
            end;*/ --Se construye el json para el registro de sujeto impuesto
            o_mnsje_rspsta := 'Se construye el json para el registro de sujeto impuesto';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            DECLARE
              v_cdgo_idntfccion_tpo varchar2(1);

              v_sjto_impsto json_object_t := NEW json_object_t();

              v_rspnsble json_object_t := NEW json_object_t();

              v_rspnsbles json_array_t := NEW json_array_t();

            BEGIN
              v_sjto_impsto.put('cdgo_clnte', p_cdgo_clnte);

              v_sjto_impsto.put_null('id_sjto');

              v_sjto_impsto.put_null('id_sjto_impsto');

              v_sjto_impsto.put('idntfccion',
                                v_fi_g_fuentes_externa.clumna11);

              v_sjto_impsto.put('id_dprtmnto', v_id_dprtmnto);

              v_sjto_impsto.put('id_mncpio', v_id_mncpio);

              v_sjto_impsto.put('drccion', v_fi_g_fuentes_externa.clumna17);

              v_sjto_impsto.put('id_impsto', v_id_impsto);

              v_sjto_impsto.put('id_dprtmnto_ntfccion', v_id_dprtmnto);

              v_sjto_impsto.put('id_mncpio_ntfccion', v_id_mncpio);

              v_sjto_impsto.put('drccion_ntfccion',
                                v_fi_g_fuentes_externa.clumna17);

              v_sjto_impsto.put('email', v_fi_g_fuentes_externa.clumna23);

              v_sjto_impsto.put('tlfno', v_fi_g_fuentes_externa.clumna18);

              v_sjto_impsto.put('id_usrio', p_id_usrio);

              v_sjto_impsto.put('cdgo_idntfccion_tpo',
                                CASE WHEN
                                v_fi_g_fuentes_externa.clumna5 = '01' THEN 'C' ELSE 'N' END);

              v_sjto_impsto.put('tpo_prsna',
                                CASE WHEN
                                v_fi_g_fuentes_externa.clumna5 = '01' THEN 'N' ELSE 'J' END);

              v_sjto_impsto.put('prmer_nmbre',
                                substr(trim(v_fi_g_fuentes_externa.clumna7),
                                       1,
                                       99));

              v_sjto_impsto.put_null('sgndo_nmbre');

              v_sjto_impsto.put_null('prmer_aplldo');

              --v_sjto_impsto.put('prmer_aplldo', trim(v_fi_g_fuentes_externa.clumna7));
              v_sjto_impsto.put_null('sgndo_aplldo');

              v_sjto_impsto.put('nmbre_rzon_scial',
                                substr(trim(v_fi_g_fuentes_externa.clumna7),
                                       1,
                                       99));

              v_sjto_impsto.put('nmro_rgstro_cmra_cmrcio',
                                v_fi_g_fuentes_externa.clumna4);

              v_sjto_impsto.put('fcha_rgstro_cmra_cmrcio',
                                v_fi_g_fuentes_externa.clumna8);

              v_sjto_impsto.put('fcha_incio_actvddes',
                                v_fi_g_fuentes_externa.clumna8); -- v_fi_g_fuentes_externa.clumna31

              v_sjto_impsto.put_null('nmro_scrsles');

              v_sjto_impsto.put('drccion_cmra_cmrcio',
                                v_fi_g_fuentes_externa.clumna17);

              v_sjto_impsto.put('id_sjto_tpo', p_id_sjto_tpo);

              v_sjto_impsto.put_null('id_actvdad_ecnmca');

              v_rspnsble.put('cdgo_clnte', p_cdgo_clnte);

              v_rspnsble.put_null('id_sjto_impsto');

              v_rspnsble.put('cdgo_idntfccion_tpo', 'C');

              v_rspnsble.put('idntfccion',
                             nvl(v_fi_g_fuentes_externa.clumna14,
                                 v_fi_g_fuentes_externa.clumna11));

              v_rspnsble.put('prmer_nmbre',
                             nvl(trim(v_fi_g_fuentes_externa.clumna16),
                                 v_fi_g_fuentes_externa.clumna7));

              v_rspnsble.put_null('sgndo_nmbre');

              -- v_rspnsble.put('prmer_aplldo', nvl(trim(v_fi_g_fuentes_externa.clumna16), v_fi_g_fuentes_externa.clumna7));
              v_rspnsble.put('prmer_aplldo', '.');

              v_rspnsble.put_null('sgndo_aplldo');

              v_rspnsble.put('prncpal', 'S');

              v_rspnsble.put('cdgo_tpo_rspnsble', 'L');

              v_rspnsble.put('id_dprtmnto_ntfccion', v_id_dprtmnto);

              v_rspnsble.put('id_mncpio_ntfccion', v_id_mncpio);

              v_rspnsble.put('drccion_ntfccion',
                             v_fi_g_fuentes_externa.clumna17);

              v_rspnsble.put('email', v_fi_g_fuentes_externa.clumna23);

              v_rspnsble.put('tlfno', v_fi_g_fuentes_externa.clumna18);

              v_rspnsble.put('cllar', v_fi_g_fuentes_externa.clumna18);

              v_rspnsble.put('actvo', 'S');

              v_rspnsble.put_null('id_sjto_rspnsble');

              v_rspnsble.put('cdgo_inscrpcion', 'FIS');

              v_rspnsbles.append(v_rspnsble);

              v_sjto_impsto.put('rspnsble', JSON_ARRAY_T(v_rspnsbles));

              v_json := v_sjto_impsto.to_clob;

              o_mnsje_rspsta := 'Se construyo json para el registro de sujeto impuesto';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 4;

                o_mnsje_rspsta := 'Problema al construir el JSON para registrar el sujeto impuesto ' ||
                                  ' , ' || sqlerrm || ' , ' ||
                                  sjto.id_fnte_extrna;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          WHEN v_fi_g_fuentes_externa.cdgo_crga = 'DAN' THEN
            v_nit := to_number(v_fi_g_fuentes_externa.clumna1);

            --Se obtiene el codigo del departamento y municipio
            BEGIN
              SELECT a.id_mncpio, a.id_dprtmnto
                INTO v_id_mncpio, v_id_dprtmnto
                FROM df_s_municipios a
               WHERE cdgo_mncpio =
                     to_number(v_fi_g_fuentes_externa.clumna8);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 2;

                o_mnsje_rspsta := 'No se pudo procesar el archivo, no se pudo obtener el codigo del departamento';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

            BEGIN
              SELECT a.mtrcla, a.fcha_mtrcla
                INTO v_mtrcla, v_fcha_mtrcla
                FROM fi_g_fntes_extrna_cmra_cmrc a
               WHERE a.nit = trim(v_fi_g_fuentes_externa.clumna1);

            EXCEPTION
              WHEN no_data_found THEN
                NULL;

              WHEN others THEN
                o_cdgo_rspsta := 2;

                o_mnsje_rspsta := 'Problema al obtener el numero registro camara comercio';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

            --Se construye el json para el registro de sujeto impuesto
            DECLARE
              v_cdgo_idntfccion_tpo varchar2(1);

              v_sjto_impsto json_object_t := NEW json_object_t();

              v_rspnsble json_object_t := NEW json_object_t();

              v_rspnsbles json_array_t := NEW json_array_t();

            BEGIN
              v_sjto_impsto.put('cdgo_clnte', p_cdgo_clnte);

              v_sjto_impsto.put_null('id_sjto');

              v_sjto_impsto.put_null('id_sjto_impsto');

              v_sjto_impsto.put('idntfccion',
                                v_fi_g_fuentes_externa.clumna1);

              v_sjto_impsto.put('id_dprtmnto', v_id_dprtmnto);

              v_sjto_impsto.put('id_mncpio', v_id_mncpio);

              v_sjto_impsto.put('drccion', v_fi_g_fuentes_externa.clumna9);

              v_sjto_impsto.put('id_impsto', v_id_impsto);

              v_sjto_impsto.put('id_dprtmnto_ntfccion', v_id_dprtmnto);

              v_sjto_impsto.put('id_mncpio_ntfccion', v_id_mncpio);

              v_sjto_impsto.put('drccion_ntfccion',
                                v_fi_g_fuentes_externa.clumna9);

              v_sjto_impsto.put('email', v_fi_g_fuentes_externa.clumna10);

              v_sjto_impsto.put('tlfno', v_fi_g_fuentes_externa.clumna12);

              v_sjto_impsto.put('id_usrio', p_id_usrio);

              v_sjto_impsto.put('cdgo_idntfccion_tpo',
                                CASE WHEN
                                v_fi_g_fuentes_externa.clumna4 = '1' THEN 'C' ELSE 'N' END);

              v_sjto_impsto.put('tpo_prsna',
                                CASE WHEN
                                v_fi_g_fuentes_externa.clumna3 = '1' THEN 'N' ELSE 'J' END);

              v_sjto_impsto.put('prmer_nmbre',
                                trim(v_fi_g_fuentes_externa.clumna6));

              v_sjto_impsto.put_null('sgndo_nmbre');

              v_sjto_impsto.put('prmer_aplldo',
                                trim(v_fi_g_fuentes_externa.clumna6));

              v_sjto_impsto.put_null('sgndo_aplldo');

              v_sjto_impsto.put('nmbre_rzon_scial',
                                trim(v_fi_g_fuentes_externa.clumna6));

              v_sjto_impsto.put('nmro_rgstro_cmra_cmrcio', v_mtrcla);

              v_sjto_impsto.put('fcha_rgstro_cmra_cmrcio',
                                v_fi_g_fuentes_externa.clumna15);

              v_sjto_impsto.put('fcha_incio_actvddes',
                                v_fi_g_fuentes_externa.clumna15);

              v_sjto_impsto.put_null('nmro_scrsles');

              v_sjto_impsto.put('drccion_cmra_cmrcio',
                                v_fi_g_fuentes_externa.clumna9);

              v_sjto_impsto.put_null('id_sjto_tpo');

              v_sjto_impsto.put_null('id_actvdad_ecnmca');

              v_rspnsble.put('cdgo_clnte', p_cdgo_clnte);

              v_rspnsble.put_null('id_sjto_impsto');

              v_rspnsble.put('cdgo_idntfccion_tpo', 'C');

              v_rspnsble.put('idntfccion', v_fi_g_fuentes_externa.clumna1);

              v_rspnsble.put('prmer_nmbre',
                             trim(v_fi_g_fuentes_externa.clumna6));

              v_rspnsble.put_null('sgndo_nmbre');

              v_rspnsble.put('prmer_aplldo',
                             trim(v_fi_g_fuentes_externa.clumna6));

              v_rspnsble.put_null('sgndo_aplldo');

              v_rspnsble.put('prncpal', 'S');

              v_rspnsble.put('cdgo_tpo_rspnsble', 'L');

              v_rspnsble.put('id_dprtmnto_ntfccion', v_id_dprtmnto);

              v_rspnsble.put('id_mncpio_ntfccion', v_id_mncpio);

              v_rspnsble.put('drccion_ntfccion',
                             v_fi_g_fuentes_externa.clumna9);

              v_rspnsble.put('email', v_fi_g_fuentes_externa.clumna10);

              v_rspnsble.put('tlfno',
                             CASE WHEN
                             v_fi_g_fuentes_externa.clumna12 = 'NULL' THEN 0 ELSE
                             v_fi_g_fuentes_externa.clumna12 END);

              v_rspnsble.put('cllar',
                             CASE WHEN
                             v_fi_g_fuentes_externa.clumna13 = 'NULL' THEN 0 ELSE
                             v_fi_g_fuentes_externa.clumna12 END);

              v_rspnsble.put('actvo', 'S');

              v_rspnsble.put_null('id_sjto_rspnsble');

              v_rspnsbles.append(v_rspnsble);

              v_sjto_impsto.put('rspnsble', JSON_ARRAY_T(v_rspnsbles));

              v_json := v_sjto_impsto.to_clob;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 4;

                o_mnsje_rspsta := 'Problema al construir el JSON para registrar el sujeto impuesto ' ||
                                  sqlerrm;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          ELSE
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := 'No se pudo identificar el codigo de la carga';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END CASE;

        --Se registra el sujeto impuesto
        BEGIN
          o_mnsje_rspsta := 'Se registra el sujeto impuesto ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          pkg_si_sujeto_impuesto.prc_rg_general_sujeto_impuesto(p_json         => v_json,
                                                                o_sjto_impsto  => o_sjto_impsto,
                                                                o_cdgo_rspsta  => o_cdgo_rspsta,
                                                                o_mnsje_rspsta => o_mnsje_rspsta);

          o_mnsje_rspsta := 'prc_rg_general_sujeto_impuesto registro el sujeto ' ||
                            o_mnsje_rspsta;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          IF o_cdgo_rspsta > 0 THEN
            o_mnsje_rspsta := 'codigo respuesta ' || o_cdgo_rspsta;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

          ELSE
            -- Se actualiza el estado del sujeto a 3 - Desconocido
            o_mnsje_rspsta := 'Actualizar estado 3 ';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            BEGIN
              UPDATE si_i_sujetos_impuesto
                 SET id_sjto_estdo = 3
               WHERE id_sjto_impsto = o_sjto_impsto;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 2;

                o_mnsje_rspsta := 'No se pudo actualizar el estado del sujeto a estado Desconocido';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

            --Se actualiza la columna de sujeto impuesto en la tabla de fuentes externa camara comercio
            o_mnsje_rspsta := 'Actualizo la columna sujeto id_sjto_impsto --> ' ||
                              o_sjto_impsto;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            BEGIN
              UPDATE fi_g_fntes_extrna_cmra_cmrc
                 SET id_sjto_impsto = o_sjto_impsto
               WHERE nit = v_nit;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 2;

                o_mnsje_rspsta := 'No se pudo actualizar la columna sujeto impuesto en la tabla camara de comercio';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

            --Se actualiza la columna de sujeto impuesto en la tabla de fuentes externa dian
            BEGIN
              UPDATE fi_g_fuentes_externa_dian
                 SET id_sjto_impsto = o_sjto_impsto
               WHERE nit = v_nit;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 2;

                o_mnsje_rspsta := 'No se pudo actualizar la columna sujeto impuesto en la tabla camara de comercio';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

            o_mnsje_rspsta := 'v_nit --> ' || v_nit;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);

            --Se actualiza en la tabla intermedia el indicador registro en S
            BEGIN
              UPDATE fi_g_fuentes_externa
                 SET id_sjto_impsto = o_sjto_impsto,

                     indcdor_rgstro = 'S'
               where (clumna1 = to_char(v_nit) OR clumna11 = to_char(v_nit));

              --where id_fnte_extrna = sjto.id_fnte_extrna;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 2;

                o_mnsje_rspsta := 'No se pudo actualizar la columna indicador de registro en la tabla intermedia fuente externa';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

            END;

          END IF;

        END;

      END LOOP;

      o_cdgo_rspsta := 0;

      o_mnsje_rspsta := 'Saliendo de pkg_fiscalizacion_prc_rg_sujetos exitoso';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

    END;

  END prc_rg_sujetos;

  FUNCTION fnc_vl_aplca_dscnto_inxcto(P_XML IN CLOB) RETURN varchar2 AS
    v_undad_drcion varchar2(10);

    v_dia_tpo varchar2(10);

    v_fcha_incial timestamp;

    v_fcha_fnal timestamp;

    v_drcion number;

    v_id_fljo_trea number;

    v_id_acto_tpo number;

  BEGIN
    BEGIN
      SELECT c.id_acto_tpo, fcha_ntfccion, id_fljo_trea
        INTO v_id_acto_tpo, v_fcha_incial, v_id_fljo_trea
        FROM fi_g_candidatos a
        JOIN fi_g_fiscalizacion_expdnte b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzcion_expdnte_acto c
          ON b.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
        JOIN fi_g_fsclzcion_acto_vgncia d
          ON c.id_fsclzcion_expdnte_acto = d.id_fsclzcion_expdnte_acto
        JOIN gn_d_actos_tipo e
          ON c.id_acto_tpo = e.id_acto_tpo
        JOIN gn_g_actos f
          ON c.id_acto = f.id_acto
       WHERE a.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
         AND a.id_impsto_sbmpsto =
             json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
         AND a.id_sjto_impsto = json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
         AND d.vgncia = json_value(p_xml, '$.P_VGNCIA')
         AND d.id_prdo = json_value(p_xml, '$.P_ID_PRDO')
         AND e.cdgo_acto_tpo IN ('LODR', 'RE')
         AND b.cdgo_expdnte_estdo = 'ABT'
         AND NOT f.fcha_ntfccion IS NULL;

    EXCEPTION
      WHEN others THEN
        RETURN 'N';

    END;

    BEGIN
      SELECT undad_drcion, drcion, dia_tpo
        INTO v_undad_drcion, v_drcion, v_dia_tpo
        FROM gn_d_actos_tipo_tarea
       WHERE id_acto_tpo = v_id_acto_tpo
         AND id_fljo_trea = v_id_fljo_trea;

    EXCEPTION
      WHEN others THEN
        RETURN 'N';

    END;

    --Se obtiene la fecha final
    v_fcha_fnal := pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => json_value(p_xml,
                                                                                       '$.P_CDGO_CLNTE'),
                                                         p_fecha_inicial => v_fcha_incial,
                                                         p_undad_drcion  => v_undad_drcion,
                                                         p_drcion        => v_drcion,
                                                         p_dia_tpo       => v_dia_tpo);

    IF v_fcha_fnal IS NOT NULL THEN
      IF v_fcha_fnal >=
         to_date(json_value(p_xml, '$.P_FCHA_PRYCCION'), 'DD/MM/YYYY') THEN
        RETURN 'S';

      ELSE
        RETURN 'N';

      END IF;

    END IF;

  END fnc_vl_aplca_dscnto_inxcto;

  FUNCTION fnc_co_acto_revision(p_cdgo_clnte  number,
                                p_id_fncnrio  number,
                                p_id_acto_tpo number) RETURN varchar2 AS
    v_fncnrio number;

  BEGIN
    SELECT count(id_fncnrio)
      INTO v_fncnrio
      FROM fi_d_actos_revision a
     WHERE a.cdgo_clnte = p_cdgo_clnte
       AND a.id_fncnrio = p_id_fncnrio
       AND a.id_acto_tpo = p_id_acto_tpo
       AND a.indcdor_rvsion = 'S';

    IF v_fncnrio > 0 THEN
      RETURN 'S';

    END IF;

    RETURN 'N';

  END fnc_co_acto_revision;

  PROCEDURE prc_rg_infrmcion_fntes_extrna(p_cdgo_clnte       IN number,
                                          p_id_archvo_cnddto IN number,
                                          p_id_usrio         IN number,
                                          p_id_carga         IN number,
                                          p_id_fsclzcion_lte IN number,
                                          o_cdgo_rspsta      OUT number,
                                          o_mnsje_rspsta     OUT varchar2) AS
    t_fi_g_archivos_candidato fi_g_archivos_candidato%rowtype;

    v_id_prcso_crga number;

    v_id_fnte_extrna_crga number;

    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna';

    v_ttal number;

    v_sujetos CLOB;

  BEGIN
    o_cdgo_rspsta := 0;

    o_mnsje_rspsta := 'OK';

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    -- Obtener la informacion del archivo cargado
    BEGIN
      SELECT *
        INTO t_fi_g_archivos_candidato
        FROM fi_g_archivos_candidato
       WHERE id_archvo_cnddto = p_id_archvo_cnddto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := 'Error al intentar obtener la informacion de archivo.' ||
                          sqlerrm;

        RETURN;

    END;

    o_mnsje_rspsta := ' Obtuvo la informacion de fi_g_archivos_candidato';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

    -- **************************** PROCESO ETL ****************************
    -- NOTA: Para que esto funcione debe hacerse la parametrizacion del tipo
    -- de carga de archivos en el modulo de ETL y asociar el ID de la carga
    -- en la tabla fi_d_fuentes_externa_carga
    BEGIN
      INSERT INTO et_g_procesos_carga
        (id_crga,
         cdgo_clnte,
         id_impsto,
         vgncia,
         file_blob,
         file_name,
         file_mimetype,
         lneas_encbzdo,
         lneas_rsmen,
         fcha_rgstro,
         id_usrio)
      VALUES
        (p_id_carga,
         p_cdgo_clnte,
         t_fi_g_archivos_candidato.id_impsto,
         EXTRACT(YEAR FROM sysdate),
         t_fi_g_archivos_candidato.file_blob,
         t_fi_g_archivos_candidato.file_name,
         t_fi_g_archivos_candidato.file_mimetype,
         1,
         0,
         systimestamp,
         p_id_usrio)
      RETURNING id_prcso_crga INTO v_id_prcso_crga;

      o_mnsje_rspsta := ' Inserto en la tabla et_g_procesos_carga - v_id_prcso_crga ' ||
                        v_id_prcso_crga;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 10;

        o_mnsje_rspsta := 'Error al intentar registrar archivo en ETL.' ||
                          sqlerrm;

        RETURN;

    END;

    o_mnsje_rspsta := ' t_fi_g_archivos_candidato.file_name ' ||
                      t_fi_g_archivos_candidato.file_name;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Cargar archivo al directorio
    pk_etl.prc_carga_archivo_directorio(p_file_blob => t_fi_g_archivos_candidato.file_blob,
                                        p_file_name => t_fi_g_archivos_candidato.file_name);

    o_mnsje_rspsta := ' Cargar archivo al directorio ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

    o_mnsje_rspsta := ' p_cdgo_clnte  ' || p_cdgo_clnte ||
                      ' t_fi_g_archivos_candidato.id_impsto ' ||
                      t_fi_g_archivos_candidato.id_impsto ||
                      ' v_id_prcso_crga ' || v_id_prcso_crga;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Ejecutar proceso de ETL para cargar a tabla intermedia de ETL
    pk_etl.prc_carga_intermedia_from_dir(p_cdgo_clnte    => p_cdgo_clnte,
                                         p_id_impsto     => t_fi_g_archivos_candidato.id_impsto,
                                         p_id_prcso_crga => v_id_prcso_crga);

    o_mnsje_rspsta := ' Ejecutar proceso de ETL para cargar a tabla intermedia de ETL ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Ejecutar proceso ETL para cargar a tabla de gestion
    pk_etl.prc_carga_gestion(p_cdgo_clnte    => p_cdgo_clnte,
                             p_id_impsto     => t_fi_g_archivos_candidato.id_impsto,
                             p_id_prcso_crga => v_id_prcso_crga);

    o_mnsje_rspsta := ' Ejecutar proceso ETL para cargar a tabla de gestion ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -----------------------------
    --v_id_prcso_crga := 320;
    -- Se registra en las tablas especificas segun la fuente externa
    BEGIN
      -- Se verifica si se cargaron los registros a la tabla principal de gestion

      SELECT count(1)
        INTO v_ttal
        FROM fi_g_fuentes_externa a
       WHERE a.id_prcso_crga = v_id_prcso_crga
         AND a.indcdor_rgstro IS NULL;

      IF v_ttal > 0 THEN
        pkg_fi_fiscalizacion.prc_rg_fuentes_externa(p_cdgo_clnte          => p_cdgo_clnte,
                                                    p_id_usrio            => p_id_usrio,
                                                    p_id_prcso_crga       => v_id_prcso_crga,
                                                    p_id_archvo_cnddto    => p_id_archvo_cnddto,
                                                    o_id_fnte_extrna_crga => v_id_fnte_extrna_crga,
                                                    o_cdgo_rspsta         => o_cdgo_rspsta,
                                                    o_mnsje_rspsta        => o_mnsje_rspsta);

        IF o_cdgo_rspsta != 0 THEN
          o_cdgo_rspsta := 15;

          o_mnsje_rspsta := 'Error al registrar la informacion en tablas especificas de la fuente externa ';

          RETURN;

        END IF;

      ELSE
        o_cdgo_rspsta := 20;

        o_mnsje_rspsta := 'No existen registros a procesar para el proceso carga No.  ' ||
                          v_id_prcso_crga;

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        ROLLBACK;

        o_cdgo_rspsta := 25;

        o_mnsje_rspsta := 'Ha ocurrido un error al intentar registrar informacion de las fuentes externas.' ||
                          sqlerrm;

        RETURN;

    END;

    BEGIN
      --Se verifica si hay sujetos impuestos por crear
      --select json_object ('ID_FNTE_EXTRNA' value
      --          json_arrayagg(json_object('id_fnte_extrna' value id_fnte_extrna)))

      SELECT json_arrayagg(json_object('id_fnte_extrna' value
                                       id_fnte_extrna))
        INTO v_sujetos
        FROM fi_g_fuentes_externa a
       WHERE a.id_prcso_crga = v_id_prcso_crga
         AND a.indcdor_rgstro IS NULL;

      --and a.indcdor_rgstro = 'N';
      o_mnsje_rspsta := ' JSON para crear sujetos ' || v_sujetos;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

      -- Se crean los sujetos nuevos en estado 3 - Omisos
      BEGIN
        pkg_fi_fiscalizacion.prc_rg_sujetos(p_cdgo_clnte   => p_cdgo_clnte,
                                            p_id_usrio     => p_id_usrio,
                                            p_id_sjto_tpo  => 1, --:P59_ID_SJTO_TPO,   ?????
                                            p_sujeto       => v_sujetos,
                                            o_cdgo_rspsta  => o_cdgo_rspsta,
                                            o_mnsje_rspsta => o_mnsje_rspsta);

        o_mnsje_rspsta := ' JSON para crear sujetos ' || v_sujetos;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        o_mnsje_rspsta := ' JSON para crear sujetos ' || v_sujetos;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        IF o_cdgo_rspsta != 0 THEN
          o_cdgo_rspsta := 30;

          o_mnsje_rspsta := 'Error al registrar los sujetos impuestos ' ||
                            sqlerrm;

          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          ROLLBACK;

          o_cdgo_rspsta := 31;

          o_mnsje_rspsta := 'Error al llamar  pkg_fi_fiscalizacion.prc_rg_sujetos .' ||
                            v_sujetos || '-' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          RETURN;

      END;

    EXCEPTION
      WHEN others THEN
        ROLLBACK;

        o_cdgo_rspsta := 32;

        o_mnsje_rspsta := 'Ha ocurrido un error al intentar registrar los sujetos .' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        RETURN;

    END;

    -------------------------------
    o_cdgo_rspsta := 0;

    o_mnsje_rspsta := ' Archivo cargado exitosamente ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

  EXCEPTION
    WHEN others THEN
      ROLLBACK;

      o_cdgo_rspsta := 99;

      o_mnsje_rspsta := 'Ha ocurrido un error al intentar registrar informacion exogena. ' ||
                        sqlerrm;

      RETURN;

  END prc_rg_infrmcion_fntes_extrna;

  PROCEDURE prc_rg_infrmcion_fntes_extrna_sjto(p_cdgo_clnte       IN number,
                                               p_id_archvo_cnddto IN number,
                                               p_id_usrio         IN number,
                                               p_id_carga         IN number,
                                               p_id_fsclzcion_lte IN number,
                                               o_cdgo_rspsta      OUT number,
                                               o_mnsje_rspsta     OUT varchar2) AS
    t_fi_g_archivos_candidato fi_g_archivos_candidato%rowtype;

    v_id_prcso_crga number;

    v_id_fnte_extrna_crga number;

    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto';

    v_ttal number;

    v_sujetos NCLOB;

    v_anios number;

    v_dias number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_id_sjto_impsto number;

    v_vgncia number;

    v_id_cnddto_vgncia number;

    v_id_prdo number;

    v_id_cnddto number;

    v_id_fsclzcion_lte number;

    v_id_usrio_apex number;

  BEGIN
    o_cdgo_rspsta := 0;

    o_mnsje_rspsta := 'OK';

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    -- Obtener la informacion del archivo cargado

    INSERT INTO muerto
      (v_001, v_002, t_001, n_001)
    VALUES
      ('Id archivo',
       'p_id_archvo_cnddto ->' || p_id_archvo_cnddto,
       systimestamp,
       6);

    COMMIT;

    BEGIN
      SELECT *
        INTO t_fi_g_archivos_candidato
        FROM fi_g_archivos_candidato
       WHERE id_archvo_cnddto = p_id_archvo_cnddto;

      o_mnsje_rspsta := 'Selecet a fi_g_archivos_candidato  ' ||
                        t_fi_g_archivos_candidato.id_archvo_cnddto;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := 'Error al intentar obtener la informacion de archivo.' ||
                          sqlerrm;

        RETURN;

    END;

    o_mnsje_rspsta := ' Obtuvo la informacion de fi_g_archivos_candidato';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

    /*
    --SI NO EXISTE UNA SESSION EN APEX, LA CREAMOS
    if v('APP_SESSION') is null then
    v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => p_cdgo_clnte
                                                                  , p_cdgo_dfncion_clnte_ctgria => 'CLN'
                                                                  , p_cdgo_dfncion_clnte        => 'USR');

        apex_session.create_session (   p_app_id   => 74000
                                      , p_page_id  => 64
                                      , p_username => v_id_usrio_apex );
    else
        --dbms_output.put_line('EXISTE SESION'||v('APP_SESSION'));
        apex_session.attach( p_app_id     => 74000,
                             p_page_id    => 64,
                             p_session_id => v('APP_SESSION') );
    end if;

    */ -- **************************** PROCESO ETL ****************************
    -- NOTA: Para que esto funcione debe hacerse la parametrizacion del tipo
    -- de carga de archivos en el modulo de ETL y asociar el ID de la carga
    -- en la tabla fi_d_fuentes_externa_carga
    BEGIN
      SELECT a.id_prcso_crga
        INTO v_id_prcso_crga
        FROM et_g_procesos_carga a
       WHERE a.file_name = t_fi_g_archivos_candidato.file_name;

      o_mnsje_rspsta := ' Inserto el id proceso carga - v_id_prcso_crga ' ||
                        v_id_prcso_crga;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 10;

        o_mnsje_rspsta := 'Error al intentar registrar archivo en ETL.' ||
                          sqlerrm;

        RETURN;

    END;

    o_mnsje_rspsta := ' t_fi_g_archivos_candidato.file_name ' ||
                      t_fi_g_archivos_candidato.file_name;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Cargar archivo al directorio
    pk_etl.prc_carga_archivo_directorio(p_file_blob => t_fi_g_archivos_candidato.file_blob,
                                        p_file_name => t_fi_g_archivos_candidato.file_name);

    o_mnsje_rspsta := ' Cargar archivo al directorio ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

    o_mnsje_rspsta := ' p_cdgo_clnte  ' || p_cdgo_clnte ||
                      ' t_fi_g_archivos_candidato.id_impsto ' ||
                      t_fi_g_archivos_candidato.id_impsto ||
                      ' v_id_prcso_crga ' || v_id_prcso_crga;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Ejecutar proceso de ETL para cargar a tabla intermedia de ETL
    pk_etl.prc_carga_intermedia_from_dir(p_cdgo_clnte    => p_cdgo_clnte,
                                         p_id_impsto     => t_fi_g_archivos_candidato.id_impsto,
                                         p_id_prcso_crga => v_id_prcso_crga);

    o_mnsje_rspsta := ' Ejecutar proceso de ETL para cargar a tabla intermedia de ETL ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Ejecutar proceso ETL para cargar a tabla de gestion
    pk_etl.prc_carga_gestion(p_cdgo_clnte    => p_cdgo_clnte,
                             p_id_impsto     => t_fi_g_archivos_candidato.id_impsto,
                             p_id_prcso_crga => v_id_prcso_crga);

    --insert into muerto(v_001, v_002, t_001, n_001) values('Realizao carga gestion', 'p_id_prcso_crga ->'||v_id_prcso_crga,systimestamp, 6); commit;
    o_mnsje_rspsta := ' Ejecutar proceso ETL para cargar a tabla de gestion ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Se registra en las tablas especificas segun la fuente externa
    BEGIN
      -- Se verifica si se cargaron los registros a la tabla principal de gestion

      SELECT count(1)
        INTO v_ttal
        FROM fi_g_fuentes_externa a
       WHERE a.id_prcso_crga = v_id_prcso_crga
         AND ((a.indcdor_rgstro IS NULL) OR (a.indcdor_rgstro = 'N'));

      o_mnsje_rspsta := ' Numero de registro ' || v_ttal;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      -- and a.indcdor_rgstro is null;
      IF v_ttal > 0 THEN
        o_mnsje_rspsta := ' codigo cliente ' || p_cdgo_clnte ||
                          ' id usuario ' || p_id_usrio ||
                          ' id proceso carga ' || v_id_prcso_crga ||
                          ' id archivo cnddto ' || p_id_archvo_cnddto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        pkg_fi_fiscalizacion.prc_rg_fuentes_externa(p_cdgo_clnte          => p_cdgo_clnte,
                                                    p_id_usrio            => p_id_usrio,
                                                    p_id_prcso_crga       => v_id_prcso_crga,
                                                    p_id_archvo_cnddto    => p_id_archvo_cnddto,
                                                    o_id_fnte_extrna_crga => v_id_fnte_extrna_crga,
                                                    o_cdgo_rspsta         => o_cdgo_rspsta,
                                                    o_mnsje_rspsta        => o_mnsje_rspsta);

        o_mnsje_rspsta := ' llamado al prc_rg_fuentes_externa codigo repsuesta ' ||
                          o_cdgo_rspsta || 'mesaje repsuesta' ||
                          o_mnsje_rspsta;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        IF o_cdgo_rspsta != 0 THEN
          o_cdgo_rspsta := 15;

          o_mnsje_rspsta := 'Error al registrar la informacion en tablas especificas de la fuente externa ';

          RETURN;

        END IF;

      ELSE
        o_cdgo_rspsta := 20;

        o_mnsje_rspsta := 'No existen registros a procesar para el proceso carga No.  ' ||
                          v_id_prcso_crga;

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        ROLLBACK;

        o_cdgo_rspsta := 25;

        o_mnsje_rspsta := 'Ha ocurrido un error al intentar registrar informacion de las fuentes externas.' ||
                          sqlerrm;

        RETURN;

    END;

    --proceso para registrar sujeto
    BEGIN
      o_mnsje_rspsta := ' entrando a crear el json_objetc v_sujetos ';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      BEGIN
        SELECT JSON_ARRAYAGG(json_object('id_fnte_extrna' value
                                         id_fnte_extrna RETURNING CLOB)
                             RETURNING CLOB)
          INTO v_sujetos
          FROM fi_g_fuentes_externa a
         WHERE a.id_prcso_crga = v_id_prcso_crga
           AND ((a.indcdor_rgstro IS NULL) OR (a.indcdor_rgstro = 'N'));

        --and a.indcdor_rgstro = 'N';

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 100;

          o_mnsje_rspsta := ' NO SE PUDO CREAR EL JERSON ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      /* o_mnsje_rspsta := ' JSON para crear sujetos ' || v_sujetos;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta , 6);
      */
      IF v_sujetos IS NOT NULL THEN
        -- Se crean los sujetos nuevos en estado 3 - Omisos
        o_mnsje_rspsta := ' entrando a prc_rg_sujetos ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        pkg_fi_fiscalizacion.prc_rg_sujetos(p_cdgo_clnte   => p_cdgo_clnte,
                                            p_id_usrio     => p_id_usrio,
                                            p_id_sjto_tpo  => 1, --:P59_ID_SJTO_TPO,   ?????
                                            p_sujeto       => v_sujetos,
                                            o_cdgo_rspsta  => o_cdgo_rspsta,
                                            o_mnsje_rspsta => o_mnsje_rspsta);

        o_mnsje_rspsta := ' llamado al prc_rg_sujetos codigo repsuesta ' ||
                          o_cdgo_rspsta || 'mesaje repsuesta' ||
                          o_mnsje_rspsta;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        IF o_cdgo_rspsta != 0 THEN
          o_cdgo_rspsta := 30;

          o_mnsje_rspsta := 'Error al registrar los sujetos impuestos ' ||
                            sqlerrm;

          RETURN;

        END IF;

      END IF;

      BEGIN
        SELECT a.id_prgrma, a.id_sbprgrma, a.id_impsto, a.id_impsto_sbmpsto
          INTO v_id_prgrma, v_id_sbprgrma, v_id_impsto, v_id_impsto_sbmpsto
          FROM fi_g_archivos_candidato a
         WHERE id_fsclzcion_lte = p_id_fsclzcion_lte;

        o_mnsje_rspsta := ' select fi_g_archivos_candidato ' || v_id_prgrma || '-' ||
                          v_id_sbprgrma || '-' || v_id_impsto || '-' ||
                          v_id_impsto_sbmpsto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo obtener el programa y subprograma del lote ' ||
                            p_id_fsclzcion_lte ||
                            ' de la tabla fi_g_archivos_candidato';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto',
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

      END;

      BEGIN
        -- Se obtiene el a?o limite para la sancion segun el impuesto
        BEGIN
          SELECT a.vlor
            INTO v_anios
            FROM df_i_definiciones_impuesto a
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.id_impsto = v_id_impsto
             AND a.cdgo_dfncn_impsto = 'ADE';

        EXCEPTION
          WHEN no_data_found THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se encontro parametrizado los a?os limetes de sancion en definiciones del tributo con codigo ADE';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo obtener la definicion de los a?os limetes de sancion';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

        END;

        -- Se obtiene los dias de plazo para inscripcion segun el impuesto
        BEGIN
          SELECT a.vlor
            INTO v_dias
            FROM df_i_definiciones_impuesto a
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.id_impsto = v_id_impsto
             AND a.cdgo_dfncn_impsto = 'DIN';

        EXCEPTION
          WHEN no_data_found THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se encontro parametrizado los dias limetes de inscripcion en definiciones del tributo con codigo DIN';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo obtener la definicion de los dias  limetes de inscripcion';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

        END;

        --Se recorren los sujetos que crearon

        FOR sjto IN (SELECT id_fnte_extrna
                       FROM json_table(v_sujetos,
                                       '$[*]' columns(id_fnte_extrna varchar2 PATH
                                               '$.id_fnte_extrna'))) LOOP
          -- Se busca el id_sjto_impsto para insertar en candidatos de los
          -- sujetos impuestos que no existian
          BEGIN
            SELECT id_sjto_impsto,
                   CASE
                     when ((to_date(a.clumna8, 'DD-MM-YYYY HH24:MI:SS') +
                          v_dias) <
                          to_date(to_char(sysdate, 'DD-MM-') ||
                                   to_number(to_char(to_date(trunc(sysdate)),
                                                     'YYYY') - v_anios),
                                   'DD-MM-YYYY HH24:MI:SS')) THEN
                      to_char(to_date(to_char(sysdate, 'DD-MM-') ||
                                      to_number(to_char(to_date(trunc(sysdate)),
                                                        'YYYY') - v_anios),
                                      'DD-MM-YYYY HH24:MI:SS'),
                              'YYYY')
                     ELSE
                      to_char(to_date(clumna8, 'DD/MM/YYYY HH24:MI:SS'),
                              'YYYY')
                   END fcha_inicio_sancion
              INTO v_id_sjto_impsto, v_vgncia
              FROM fi_g_fuentes_externa a
             WHERE a.indcdor_rgstro = 'S'
               AND a.indcdor_sjto_exste = 'N'
               AND a.id_fnte_extrna = sjto.id_fnte_extrna -- and a.clumna11 = sjto.clumna11

               AND a.id_sjto_impsto IS NOT NULL;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 33;

              o_mnsje_rspsta := 'Error al extrae el v_id_impsto_sbmpsto  ' ||
                                v_id_impsto_sbmpsto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

          END;

          /* begin
          select id_sjto_impsto,
                 to_char(to_date(clumna8, 'DD/MM/YYYY HH24:MI:SS'), 'YYYY' ) as vgncia
          into v_id_sjto_impsto,
               v_vgncia
          from fi_g_fuentes_externa a
          where a.indcdor_rgstro = 'S'
                  and a.indcdor_sjto_exste = 'N'
                  and a.id_fnte_extrna = sjto.id_fnte_extrna
                 -- and a.clumna11 = sjto.clumna11
                  and a.id_sjto_impsto is not null;

          exception
              when others then
                o_cdgo_rspsta := 33;
              o_mnsje_rspsta := 'Extrae el v_id_impsto_sbmpsto  ' || v_id_impsto_sbmpsto;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta ||'-'||sqlerrm, 6);

          end;*/
          BEGIN
            INSERT INTO fi_g_candidatos
              (id_impsto,
               id_impsto_sbmpsto,
               id_sjto_impsto,
               id_fsclzcion_lte,
               cdgo_cnddto_estdo,
               indcdor_asgndo,
               id_prgrma,
               id_sbprgrma,
               cdgo_clnte)
            VALUES
              (v_id_impsto,
               v_id_impsto_sbmpsto,
               v_id_sjto_impsto,
               p_id_fsclzcion_lte,
               'ACT',
               'N',
               v_id_prgrma,
               v_id_sbprgrma,
               p_cdgo_clnte)
            RETURNING id_cnddto INTO v_id_cnddto;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 3;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'No se pudo guardar el candidato con identificacion - v_id_sjto_impsto :  ' ||
                                v_id_sjto_impsto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

          --Se valida si la vigencia de inscripcion del sujeto procesado esta parametrizada
          --en la tabla df_i_periodos
          BEGIN
            SELECT a.vgncia, a.id_prdo
              INTO v_id_cnddto_vgncia, v_id_prdo
              FROM df_i_periodos a --2015

             WHERE id_impsto = v_id_impsto
               AND id_impsto_sbmpsto = v_id_impsto_sbmpsto
               AND vgncia = v_vgncia
               AND a.prdo = 1
               AND a.dscrpcion = 'ANUAL';

          EXCEPTION
            WHEN no_data_found THEN
              o_cdgo_rspsta := 4;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'No se encontro parametrizada la vigencia: ' ||
                                v_vgncia || ' para el impuesto: ' ||
                                v_id_impsto || '-' || sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

          BEGIN
            SELECT a.id_cnddto_vgncia
              INTO v_id_cnddto_vgncia
              FROM fi_g_candidatos_vigencia a
             WHERE a.id_cnddto = v_id_cnddto
               AND a.vgncia = v_vgncia
               AND a.id_prdo = v_id_prdo;

          EXCEPTION
            WHEN no_data_found THEN
              --Se inserta las vigencia periodo de los candidatos
              BEGIN
                INSERT INTO fi_g_candidatos_vigencia
                  (id_cnddto, vgncia, id_prdo, id_dclrcion_vgncia_frmlrio)
                VALUES
                  (v_id_cnddto, v_vgncia, v_id_prdo, NULL);

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 5;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'No se pudo registrar las vigencia periodo del candidato con identificacion ' || '-' ||
                                    v_id_sjto_impsto || '-' || sqlerrm;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto',
                                        v_nl,
                                        o_mnsje_rspsta || '-' || sqlerrm,
                                        6);

                  ROLLBACK;

                  RETURN;

              END;

          END;

        END LOOP;

      EXCEPTION
        WHEN others THEN
          ROLLBACK;

          o_cdgo_rspsta := 10;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'Error al leer el json sjto ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto',
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

    EXCEPTION
      WHEN others THEN
        ROLLBACK;

        o_cdgo_rspsta := 30;

        o_mnsje_rspsta := 'Ha ocurrido un error al intentar registrar los sujetos s .' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        RETURN;

    END;

    -------------------------------
    o_cdgo_rspsta := 0;

    o_mnsje_rspsta := ' Archivo cargado exitosamente ';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

  EXCEPTION
    WHEN others THEN
      ROLLBACK;

      o_cdgo_rspsta := 99;

      o_mnsje_rspsta := 'Ha ocurrido un error al intentar registrar informacion fiscalizacion.' ||
                        sqlerrm;

      RETURN;

  END prc_rg_infrmcion_fntes_extrna_sjto;

  PROCEDURE prc_rg_fsclzcion_pblcion_desc(p_cdgo_clnte       IN df_s_clientes.cdgo_clnte%TYPE,
                                          p_id_usrio         IN sg_g_usuarios.id_usrio%TYPE,
                                          p_id_cnslta_mstro  IN cs_g_consultas_maestro.id_cnslta_mstro%TYPE,
                                          p_id_fsclzcion_lte IN fi_g_fiscalizacion_lote.id_fsclzcion_lte%TYPE,
                                          o_cdgo_rspsta      OUT number,
                                          o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_id_sjto_impsto number;

    v_id_cnddto_vgncia number;

    v_id_impsto number;

    v_anios number;

    v_mnsje_log varchar2(4000);

    v_guid varchar2(33) := sys_guid();

    v_nmbre_cnslta varchar2(1000);

    v_sql CLOB;

    p_json CLOB;

    v_pblcion sys_refcursor;

    v_id_cnddto fi_g_candidatos.id_cnddto%TYPE;

    TYPE v_rgstro IS record(
      id_impsto              number,
      id_sjto_impsto         number,
      idntfccion_sjto_frmtda number,
      id_impsto_sbmpsto      number);

    TYPE v_tbla IS TABLE OF v_rgstro;

    v_tbla_dnmca v_tbla;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --se obtiene el programa y subprograma del lote
    BEGIN
      SELECT a.id_prgrma, a.id_sbprgrma, a.id_impsto
        INTO v_id_prgrma, v_id_sbprgrma, v_id_impsto
        FROM fi_g_fiscalizacion_lote a
       WHERE id_fsclzcion_lte = p_id_fsclzcion_lte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener el programa y subprograma del lote';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    --Se obtiene el nombre de la consulta
    BEGIN
      SELECT a.nmbre_cnslta
        INTO v_nmbre_cnslta
        FROM cs_g_consultas_maestro a
       WHERE a.id_cnslta_mstro = p_id_cnslta_mstro;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro consulta general parametrizada en el Constructor SQL.';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    -- Se obtiene el a?o limite para la declaracion segun el impuesto
    BEGIN
      SELECT a.vlor
        INTO v_anios
        FROM df_i_definiciones_impuesto a
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND a.id_impsto = v_id_impsto
         AND a.cdgo_dfncn_impsto = 'ADO';

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro parametrizado los a?os limetes de declaracion en definiciones del tributo con codigo ANI';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener la definicion de los a?os limetes de declaracion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    --Se construye el json de parametros
    p_json := '[{"parametro":"p_id_impsto","valor":' || v_id_impsto || '},
                {"parametro":"p_anios","valor":' || NULL ||
              '},--v_anios
                {"parametro":"p_id_prgrma","valor":' ||
              v_id_prgrma || '},
                {"parametro":"p_id_sbprgrma","valor":' ||
              v_id_sbprgrma || '}]';

    --Se contruye la consulta general
    BEGIN
      v_sql := 'select id_impsto,
                            id_sjto_impsto,
                            idntfccion_sjto,
                            61 id_impsto_sbmpsto
                        from        (' ||
               pkg_cs_constructorsql.fnc_co_sql_dinamica(p_id_cnslta_mstro => p_id_cnslta_mstro,
                                                         p_cdgo_clnte      => p_cdgo_clnte,
                                                         p_json            => p_json) ||
               ') a ' || 'where ' || chr(39) || v_guid || chr(39) || ' = ' ||
               chr(39) || v_guid || chr(39);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                            v_nl,
                            'v_sql:' || v_sql,
                            6);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo ejecutar la consulta general ' || ' ' ||
                          v_nmbre_cnslta ||
                          ' verifique la parametrizacion el Constructor SQL';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    --Se procesa la poblacion
    BEGIN
      OPEN v_pblcion FOR v_sql;

      LOOP
        FETCH v_pblcion bulk COLLECT
          INTO v_tbla_dnmca LIMIT 5000;

        EXIT WHEN v_tbla_dnmca.count = 0;

        FOR i IN 1 .. v_tbla_dnmca.count LOOP
          BEGIN
            SELECT a.id_cnddto
              INTO v_id_cnddto
              FROM fi_g_candidatos a
             WHERE a.id_sjto_impsto = v_tbla_dnmca(i).id_sjto_impsto
               AND a.id_impsto = v_tbla_dnmca(i).id_impsto
               AND a.id_prgrma = v_id_prgrma
               AND a.id_fsclzcion_lte = p_id_fsclzcion_lte;

          EXCEPTION
            WHEN no_data_found THEN
              --Se inserta los candidatos
              BEGIN
                INSERT INTO fi_g_candidatos
                  (id_impsto,
                   id_impsto_sbmpsto,
                   id_sjto_impsto,
                   id_fsclzcion_lte,
                   cdgo_cnddto_estdo,
                   indcdor_asgndo,
                   id_prgrma,
                   id_sbprgrma,
                   cdgo_clnte)
                VALUES
                  (v_tbla_dnmca      (i).id_impsto,
                   v_tbla_dnmca      (i).id_impsto_sbmpsto,
                   v_tbla_dnmca      (i).id_sjto_impsto,
                   p_id_fsclzcion_lte,
                   'ACT',
                   'N',
                   v_id_prgrma,
                   v_id_sbprgrma,
                   p_cdgo_clnte)
                RETURNING id_cnddto INTO v_id_cnddto;

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 3;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    'No se pudo guardar el candidato con identificacion ' || '-' || v_tbla_dnmca(i).idntfccion_sjto_frmtda;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                                        v_nl,
                                        o_mnsje_rspsta || '-' || sqlerrm,
                                        6);

                  ROLLBACK;

                  RETURN;

              END;

          END;

        /* begin
                                                                                                                                                                                                                                                                                                                                                                                                            select a.id_cnddto_vgncia
                                                                                                                                                                                                                                                                                                                                                                                                            into v_id_cnddto_vgncia
                                                                                                                                                                                                                                                                                                                                                                                                            from fi_g_candidatos_vigencia   a
                                                                                                                                                                                                                                                                                                                                                                                                            where a.id_cnddto = v_id_cnddto;
                                                                                                                                                                                                                                                                                                                                                                                                        exception
                                                                                                                                                                                                                                                                                                                                                                                                            when no_data_found then
                                                                                                                                                                                                                                                                                                                                                                                                                --Se inserta las vigencia periodo de los candidatos
                                                                                                                                                                                                                                                                                                                                                                                                                begin
                                                                                                                                                                                                                                                                                                                                                                                                                    insert into fi_g_candidatos_vigencia (id_cnddto)
                                                                                                                                                                                                                                                                                                                                                                                                                                                   values(v_id_cnddto       );
                                                                                                                                                                                                                                                                                                                                                                                                                exception
                                                                                                                                                                                                                                                                                                                                                                                                                    when others then
                                                                                                                                                                                                                                                                                                                                                                                                                        o_cdgo_rspsta := 4;
                                                                                                                                                                                                                                                                                                                                                                                                                        o_mnsje_rspsta  := o_cdgo_rspsta||' - '||'No se pudo registrar las vigencia periodo del candidato con identificacion ' || '-' || v_tbla_dnmca(i).idntfccion_sjto_frmtda || '-'||sqlerrm;
                                                                                                                                                                                                                                                                                                                                                                                                                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',  v_nl, o_mnsje_rspsta||'-'||sqlerrm, 6);
                                                                                                                                                                                                                                                                                                                                                                                                                        rollback;
                                                                                                                                                                                                                                                                                                                                                                                                                        return;
                                                                                                                                                                                                                                                                                                                                                                                                                end;
                                                                                                                                                                                                                                                                                                                                                                                                        end;*/
        END LOOP;

      END LOOP;

      CLOSE v_pblcion;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo procesar el registro de la poblacion  ' || '-' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc',
                          v_nl,
                          'Saliendo con Exito:' || systimestamp,
                          6);

  END prc_rg_fsclzcion_pblcion_desc;

  PROCEDURE prc_rg_sancion(p_cdgo_clnte           IN number,
                           p_id_fsclzcion_expdnte IN number,
                           p_id_cnddto            IN number,
                           p_idntfccion_sjto      IN number,
                           p_id_sjto_impsto       IN number,
                           p_id_prgrma            IN number,
                           p_id_sbprgrma          IN number,
                           p_id_instncia_fljo     IN number,
                           o_cdgo_rspsta          OUT number,
                           o_mnsje_rspsta         OUT varchar2) AS
    v_id_fsclzcion_expdnte number;

    v_id_impsto_acto number;

    v_nl number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_sancion';

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_id_sjto_impsto number;

    v_id_cnddto_vgncia number;

    v_vgncia number;

    v_id_dclrcion_vgncia_frmlrio number;

    v_prdo number;

    v_id_prdo number;

    v_id_cncpto number;

    v_id_impsto_acto_cncpto number;

    v_dscrpcion varchar2(1000);

    v_orden number;

    v_base number;

    v_base_dclrcion number;

    v_id_dclrcion number;

    v_id_sjto_tpo number;

    v_id_acto_tpo number;

    v_cdgo_prdcdad varchar2(5);

    v_cdgo_fuente varchar2(5);

    v_cdgo_tpo_bse_sncion varchar2(100);

    v_id_tp_bs_sncn_dcl_vgn_frm number;

    v_nmro_meses number;

    v_vlor_sancion number;

    v_fcha_prsntcion gi_g_declaraciones.fcha_prsntcion%TYPE;

    v_fcha_aprtra fi_g_fiscalizacion_expdnte.fcha_aprtra%TYPE;

    v_fcha_mxma_prsntcion timestamp;

    v_sql CLOB;

    p_json CLOB;

    v_actos sys_refcursor; --recibe los conceptos a los cuales se registran las sanciones

    TYPE v_rgstro IS record(
      id_impsto                  number,
      id_impsto_sbmpsto          number,
      id_sjto_impsto             number,
      id_cnddto_vgncia           number,
      vgncia                     number,
      id_dclrcion_vgncia_frmlrio number,
      prdo                       number,
      id_prdo                    number,
      id_cncpto                  number,
      id_impsto_acto_cncpto      number,
      dscrpcion                  varchar2(1000),
      orden                      number,
      base                       number);

    TYPE v_tbla IS TABLE OF v_rgstro;

    v_tbla_dnmca v_tbla;

    --Se consulta si el candidato tiene sancion por no declarar
  BEGIN
    BEGIN
      SELECT id_impsto_sbmpsto
        INTO v_id_impsto_sbmpsto
        FROM fi_g_candidatos
       WHERE id_cnddto = p_id_cnddto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          ' No se pudo consultar el id_impsto_sbmpsto ' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_sancion',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_sancion');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_sancion',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    v_id_fsclzcion_expdnte := 0;

    o_mnsje_rspsta := 'Consultar el id fiscalizacion :' ||
                      v_id_fsclzcion_expdnte;

    SELECT a.id_fsclzcion_expdnte
      INTO v_id_fsclzcion_expdnte
      FROM fi_g_fiscalizacion_sancion a
      JOIN df_i_impuestos_acto_concepto b
        ON b.id_impsto_acto_cncpto = a.id_impsto_acto_cncpto
      JOIN df_i_impuestos_acto c
        ON b.id_impsto_acto = c.id_impsto_acto
       AND c.cdgo_impsto_acto = 'RXD'
       AND c.id_impsto_sbmpsto = v_id_impsto_sbmpsto
     WHERE a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte; --2501

    o_cdgo_rspsta := 111;

    o_mnsje_rspsta := o_cdgo_rspsta || ' - ' || 'El expediente ' || '-' ||
                      p_id_fsclzcion_expdnte ||
                      ' ya tiene una sancion registrada';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_sancion',
                          v_nl,
                          o_mnsje_rspsta,
                          6);

  EXCEPTION
    WHEN no_data_found THEN
      --se validad si existe el impuesto acto RXD
      BEGIN
        SELECT b.id_impsto_acto, a.id_acto_tpo
          INTO v_id_impsto_acto, v_id_acto_tpo
          FROM gn_d_actos_tipo a
          JOIN df_i_impuestos_acto b
            ON a.cdgo_acto_tpo = b.cdgo_impsto_acto
          JOIN fi_g_candidatos c
            ON c.id_cnddto = p_id_cnddto --2624

           AND b.id_impsto_sbmpsto = c.id_impsto_sbmpsto
         WHERE a.cdgo_clnte = p_cdgo_clnte
           AND a.cdgo_acto_tpo = 'RXD'
           AND b.id_impsto_sbmpsto = v_id_impsto_sbmpsto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            ' No se encontro el impuesto acto RXD ' ||
                            'p_id_cnddto :' || p_id_cnddto || '-' ||
                            sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_sancion',
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      --se extrae la informacion relacionada al tipo de impuesto y el tipo de declaracion.
      BEGIN
        v_sql := 'select a.id_impsto,
                                a.id_impsto_sbmpsto ,
                                a.id_sjto_impsto,
                                b.id_cnddto_vgncia,
                                b.vgncia,
                                b.id_dclrcion_vgncia_frmlrio,
                                d.prdo,
                                b.id_prdo,
                                c.id_cncpto,
                                c.id_impsto_acto_cncpto,
                                e.dscrpcion ,
                                c.orden ,
                                0 base
                    from fi_g_candidatos           a
                    join fi_g_candidatos_vigencia       b   on  a.id_cnddto =   b.id_cnddto
                    join fi_g_fsclzc_expdn_cndd_vgnc    f   on  b.id_cnddto_vgncia  = f.id_cnddto_vgncia
                    join df_i_impuestos_acto_concepto   c   on  b.vgncia    =   c.vgncia
                                                            and b.id_prdo   =   c.id_prdo
                    join df_i_periodos                  d   on  b.id_prdo   =   d.id_prdo
                    join df_i_conceptos                 e   on  c.id_cncpto =   e.id_cncpto
                    where c.id_impsto_acto = ' ||
                 v_id_impsto_acto || --56
                 ' and a.id_cnddto = ' || p_id_cnddto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_sancion',
                              v_nl,
                              'v_sql:' || v_sql,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 2;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo consultar los conceptos a liquidar sancion ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                'pkg_fi_fiscalizacion.prc_rg_sancion',
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

      END;

      --se consulta cada acto sancion del candidato
      OPEN v_actos

      FOR v_sql;

      LOOP
        FETCH v_actos bulk COLLECT
          INTO v_tbla_dnmca LIMIT 5000;

        EXIT WHEN v_tbla_dnmca.count = 0;

        FOR i IN 1 .. v_tbla_dnmca.count LOOP
          --Se consulta la vigencia, periodo y periodicidad del candidato
          --para buscar en la fuente de informacion externa
          BEGIN
            SELECT a.vgncia, d.id_prdo, d.prdo, d.cdgo_prdcdad
              INTO v_vgncia, v_id_prdo, v_prdo, v_cdgo_prdcdad
              FROM fi_g_candidatos_vigencia a
              JOIN fi_g_candidatos b
                ON a.id_cnddto = b.id_cnddto
              JOIN fi_g_fiscalizacion_expdnte c
                ON a.id_cnddto = c.id_cnddto
               AND c.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte --2501

              JOIN df_i_periodos d
                ON a.id_prdo = d.id_prdo
             WHERE a.id_cnddto_vgncia = v_tbla_dnmca(i).id_cnddto_vgncia;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 3;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' Problema al extraer la vigencia, periodo y periodicidad del candidato' ||
                                sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_sancion',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              RETURN;

          END;

          --se consulta en fuente de informacion externa la base de la sacion
          BEGIN
            SELECT a.vlr_base, a.cdgo_fuente
              INTO v_base, v_cdgo_fuente
              FROM fi_g_fuentes_origen a
             WHERE a.idntfccion = p_idntfccion_sjto -- 111222333444--IDNTFCCION_SJTO

               AND a.vgncia = v_vgncia --2019

               AND a.prdo = v_prdo --1

               AND a.cdgo_prdcdad = v_cdgo_prdcdad; --'ANU';

          EXCEPTION
            WHEN no_data_found THEN
              v_base := 0;

            WHEN others THEN
              o_cdgo_rspsta := 4;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' Error al consultar el valor base sancion' ||
                                sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_sancion',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              RETURN;

              CONTINUE;

          END;

          --se consulta el valor de la ultima declaracion presentada
          BEGIN
            SELECT a.id_dclrcion,
                   a.vlor_ttal,
                   a.vgncia,
                   max(a.fcha_prsntcion)
              INTO v_id_dclrcion,
                   v_base_dclrcion,
                   v_vgncia,
                   v_fcha_prsntcion
              FROM gi_g_declaraciones a
             WHERE a.id_sjto_impsto = p_idntfccion_sjto
               AND a.fcha_prsntcion IS NOT NULL
               AND rownum <= 1
               AND a.cdgo_dclrcion_estdo = 'APL'
             GROUP BY a.id_dclrcion,
                      a.vlor_ttal,
                      a.vgncia,
                      a.fcha_prsntcion;

          EXCEPTION
            WHEN no_data_found THEN
              v_base_dclrcion := 0;

            WHEN others THEN
              o_cdgo_rspsta := 5;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' error al consultar la ultima declaracion' ||
                                sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_sancion',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

          END;

          BEGIN
            SELECT id_dclrcion_vgncia_frmlrio
              INTO v_id_dclrcion_vgncia_frmlrio
              FROM fi_g_candidatos_vigencia a --join fi_g_fsclzc_expdn_cndd_vgnc    f   on  a.id_cnddto_vgncia  = f.id_cnddto_vgncia

             WHERE a.id_cnddto = p_id_cnddto
               AND a.id_cnddto_vgncia = v_tbla_dnmca(i).id_cnddto_vgncia;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 5;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' error al consultar el id declaracion vigencia formularios' ||
                                sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_sancion',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

          END;

          --se pregunta que valor de sancion es mayor.

          BEGIN
            IF (v_base > 0 AND v_base > v_base_dclrcion) THEN
              SELECT a.cdgo_tpo_bse_sncion, b.id_tp_bs_sncn_dcl_vgn_frm
                INTO v_cdgo_tpo_bse_sncion, v_id_tp_bs_sncn_dcl_vgn_frm
                FROM fi_d_tipo_base_sancion a
                JOIN fi_d_tp_bs_sncn_dcl_vgn_frm b
                  ON a.id_tpo_bse_sncion = b.id_tpo_bse_sncion
                JOIN gi_d_dclrcnes_vgncias_frmlr c
                  ON b.id_dclrcion_vgncia_frmlrio =
                     c.id_dclrcion_vgncia_frmlrio
                JOIN gi_d_dclrcnes_tpos_vgncias d
                  ON c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia
                JOIN gi_d_declaraciones_tipo e
                  ON d.id_dclrcn_tpo = e.id_dclrcn_tpo
               WHERE a.cdgo_clnte = p_cdgo_clnte
                 AND d.vgncia = v_vgncia
                 AND d.id_prdo = v_id_prdo
                 AND c.id_dclrcion_vgncia_frmlrio =
                     v_id_dclrcion_vgncia_frmlrio
                 AND a.cdgo_tpo_bse_sncion = 'CBI';

              v_vlor_sancion := v_base;

            elsif (v_base_dclrcion > 0 AND v_base < v_base_dclrcion) THEN
              SELECT a.cdgo_tpo_bse_sncion, b.id_tp_bs_sncn_dcl_vgn_frm
                INTO v_cdgo_tpo_bse_sncion, v_id_tp_bs_sncn_dcl_vgn_frm
                FROM fi_d_tipo_base_sancion a
                JOIN fi_d_tp_bs_sncn_dcl_vgn_frm b
                  ON a.id_tpo_bse_sncion = b.id_tpo_bse_sncion
                JOIN gi_d_dclrcnes_vgncias_frmlr c
                  ON b.id_dclrcion_vgncia_frmlrio =
                     c.id_dclrcion_vgncia_frmlrio
                JOIN gi_d_dclrcnes_tpos_vgncias d
                  ON c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia
                JOIN gi_d_declaraciones_tipo e
                  ON d.id_dclrcn_tpo = e.id_dclrcn_tpo
               WHERE a.cdgo_clnte = p_cdgo_clnte
                 AND d.vgncia = v_vgncia
                 AND d.id_prdo = v_id_prdo
                 AND c.id_dclrcion_vgncia_frmlrio =
                     v_id_dclrcion_vgncia_frmlrio
                 AND a.cdgo_tpo_bse_sncion = 'IBD';

              v_vlor_sancion := v_base_dclrcion;

            ELSE
              --valor base sancion minima
              BEGIN
                SELECT b.vlr_sncion
                  INTO v_vlor_sancion
                  FROM fi_g_candidatos a
                  JOIN fi_d_programas_sancion b
                    ON a.id_prgrma = b.id_prgrma
                 WHERE b.cdgo_clnte = p_cdgo_clnte
                   AND a.id_cnddto = p_id_cnddto;

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 6;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    ' No se encontro parametrizado la sancion. ';

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_sancion',
                                        v_nl,
                                        o_mnsje_rspsta || '-' || sqlerrm,
                                        6);

              END;

              BEGIN
                SELECT a.cdgo_tpo_bse_sncion, b.id_tp_bs_sncn_dcl_vgn_frm
                  INTO v_cdgo_tpo_bse_sncion, v_id_tp_bs_sncn_dcl_vgn_frm
                  FROM fi_d_tipo_base_sancion a
                  JOIN fi_d_tp_bs_sncn_dcl_vgn_frm b
                    ON a.id_tpo_bse_sncion = b.id_tpo_bse_sncion
                  JOIN gi_d_dclrcnes_vgncias_frmlr c
                    ON b.id_dclrcion_vgncia_frmlrio =
                       c.id_dclrcion_vgncia_frmlrio
                  JOIN gi_d_dclrcnes_tpos_vgncias d
                    ON c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia
                  JOIN gi_d_declaraciones_tipo e
                    ON d.id_dclrcn_tpo = e.id_dclrcn_tpo
                 WHERE a.cdgo_clnte = p_cdgo_clnte
                   AND d.vgncia = v_vgncia
                   AND d.id_prdo = v_id_prdo
                   AND c.id_dclrcion_vgncia_frmlrio =
                       v_id_dclrcion_vgncia_frmlrio
                   AND a.cdgo_tpo_bse_sncion = 'CBI';

              EXCEPTION
                WHEN no_data_found THEN
                  NULL;

                WHEN others THEN
                  o_cdgo_rspsta := 6;

                  o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                    ' No se encontro parametrizado el formulario de declaracion' ||
                                    v_id_sjto_impsto || '-' || sqlerrm;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_sancion',
                                        v_nl,
                                        o_mnsje_rspsta || '-' || sqlerrm,
                                        6);

              END;

            END IF;

          END;

          BEGIN
            SELECT a.id_sjto_tpo
              INTO v_id_sjto_tpo
              FROM si_i_personas a
             WHERE a.id_sjto_impsto = p_id_sjto_impsto;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 6;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' No se encontro el sujeto tipo para el id_sjto_impsto' ||
                                v_id_sjto_impsto || '-' || sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_sancion',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

          END;

          --se consulta la fecha de apartura del expediente

          SELECT a.fcha_aprtra AS fecha_aprtura
            INTO v_fcha_aprtra
            FROM fi_g_fiscalizacion_expdnte a
           WHERE id_fsclzcion_expdnte = p_id_fsclzcion_expdnte; --2501

          --se consulta la fecha maxima de presentacion
          --para calcular el numero de meses vencidos para el calulo de la sancion
          v_fcha_mxma_prsntcion := trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => v_id_dclrcion_vgncia_frmlrio,
                                                                                        p_idntfccion                 => p_idntfccion_sjto,
                                                                                        p_id_sjto_tpo                => v_id_sjto_tpo));

          v_nmro_meses := trunc(months_between(v_fcha_aprtra,
                                               v_fcha_mxma_prsntcion));

          --se realiza el calculo de la sacion valor_base_sancion * numero_meses_vencido
          --v_vlor_sancion := v_vlor_sancion * v_nmro_meses;
          BEGIN
            INSERT INTO fi_g_fiscalizacion_sancion
              (id_fsclzcion_expdnte,
               id_cncpto,
               vgncia,
               prdo,
               id_prdo,
               id_impsto_acto_cncpto,
               id_cnddto_vgncia,
               bse,
               id_acto_tpo,
               nmro_mses,
               orden,
               id_tp_bs_sncn_dcl_vgn_frm,
               cdgo_fuente)
            VALUES
              (p_id_fsclzcion_expdnte,
               v_tbla_dnmca               (i).id_cncpto,
               v_vgncia,
               v_prdo,
               v_id_prdo,
               v_tbla_dnmca               (i).id_impsto_acto_cncpto,
               v_tbla_dnmca               (i).id_cnddto_vgncia,
               v_vlor_sancion,
               v_id_acto_tpo,
               v_nmro_meses,
               v_tbla_dnmca               (i).orden,
               v_id_tp_bs_sncn_dcl_vgn_frm,
               v_cdgo_tpo_bse_sncion);

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 7;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                ' No se pudo registrar la informacion para la sancion' ||
                                sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_sancion',
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

        END LOOP;

      END LOOP;

      CLOSE v_actos;

      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                        ' Saliendo prc_rg_sancion';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            'pkg_fi_fiscalizacion.prc_rg_sancion',
                            v_nl,
                            o_mnsje_rspsta,
                            6);

    WHEN others THEN
      o_cdgo_rspsta := 8;

      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                        ' Error al intentar registrar la sancion' ||
                        sqlerrm;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            'pkg_fi_fiscalizacion.prc_rg_sancion',
                            v_nl,
                            o_mnsje_rspsta || '-' || sqlerrm,
                            6);

      ROLLBACK;

      RETURN;

  END prc_rg_sancion;

  PROCEDURE prc_rg_expediente_acto_masivo(p_cdgo_clnte       IN df_s_clientes.cdgo_clnte%TYPE,
                                          p_id_usrio         IN sg_g_usuarios.id_usrio%TYPE,
                                          p_id_fncnrio       IN number,
                                          p_id_fsclzcion_lte IN number,
                                          o_cdgo_rspsta      OUT number,
                                          o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_result number;

    v_id_sjto_impsto number;

    v_vgncia number;

    v_prdo number;

    v_nmbre varchar2(30);

    v_mnsje varchar2(4000);

    v_mnsje_log varchar2(4000);

    v_nmbre_prgrma varchar2(200);

    v_cdgo_fljo varchar2(5);

    v_nmbre_rzon_scial varchar2(300);

    v_array_candidato json_array_t;

    p_candidato_vigencia CLOB;

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    -- Construir el JSON de Candidatos - Vigencias
    BEGIN
      SELECT json_arrayagg(json_object(KEY 'ID_CNDDTO' value a.id_cnddto,
                                       KEY 'VGNCIA' value
                                       json_arrayagg(json_object(KEY
                                                                 'VGNCIA'
                                                                 value
                                                                 e.vgncia,
                                                                 KEY
                                                                 'ID_PRDO'
                                                                 value
                                                                 e.id_prdo,
                                                                 KEY
                                                                 'ID_SJTO_IMPSTO'
                                                                 value
                                                                 a.id_sjto_impsto,
                                                                 KEY
                                                                 'ID_CNDDTO_VGNCIA'
                                                                 value
                                                                 e.id_cnddto_vgncia)
                                                     RETURNING CLOB)
                                       RETURNING CLOB) RETURNING CLOB)
        INTO p_candidato_vigencia
        FROM v_fi_g_candidatos a
        JOIN fi_g_candidatos_funcionario b
          ON a.id_cnddto = b.id_cnddto
        JOIN v_si_i_sujetos_impuesto d
          ON a.id_sjto_impsto = d.id_sjto_impsto
        JOIN fi_g_candidatos_vigencia e
          ON a.id_cnddto = e.id_cnddto
        LEFT JOIN fi_g_fiscalizacion_expdnte c
          ON a.id_cnddto = c.id_cnddto
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND b.id_fncnrio = p_id_fncnrio
         AND a.cdgo_cnddto_estdo = 'ACT'
         AND a.cdgo_prgrma = 'OD'
         AND a.id_fsclzcion_lte = p_id_fsclzcion_lte
         AND c.id_expdnte IS NULL
         AND a.indcdor_asgndo = 'S'
       GROUP BY a.id_cnddto;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    v_array_candidato := NEW json_array_t(p_candidato_vigencia);

    BEGIN
      FOR i IN 0 ..(v_array_candidato.get_size - 1) LOOP
        DECLARE
          v_json_candidato json_object_t := NEW
                                            json_object_t(v_array_candidato.get(i));

          json_candidato CLOB := v_json_candidato.to_clob;

          v_id_cnddto varchar2(1000) := v_json_candidato.get_String('ID_CNDDTO');

        BEGIN
          --Se obtiene el codigo del flujo que se va a instanciar
          BEGIN
            SELECT b.cdgo_fljo, a.nmbre_prgrma, a.id_prgrma
              INTO v_cdgo_fljo, v_nmbre_prgrma, v_id_prgrma
              FROM fi_d_programas a
              JOIN wf_d_flujos b
                ON a.id_fljo = b.id_fljo
             WHERE a.id_prgrma =
                   (SELECT a.id_prgrma
                      FROM fi_g_candidatos a
                     WHERE a.id_cnddto = v_id_cnddto);

          EXCEPTION
            WHEN no_data_found THEN
              o_cdgo_rspsta := 1;

              o_mnsje_rspsta := 'No se encontro parametrizado el flujo del programa ' ||
                                v_nmbre_prgrma;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              RETURN;

            WHEN others THEN
              o_cdgo_rspsta := 2;

              o_mnsje_rspsta := 'No se pudo obtener el flujo del programa ' ||
                                v_nmbre_prgrma || ' , ' || sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente',
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              RETURN;

          END;

          --Se llama la up para registrar el expediente
          BEGIN
            prc_rg_expediente(p_cdgo_clnte   => p_cdgo_clnte,
                              p_id_usrio     => p_id_usrio,
                              p_id_fncnrio   => p_id_fncnrio,
                              p_id_cnddto    => v_json_candidato.get_String('ID_CNDDTO'),
                              p_cdgo_fljo    => v_cdgo_fljo,
                              p_json         => v_json_candidato.to_Clob,
                              o_cdgo_rspsta  => o_cdgo_rspsta,
                              o_mnsje_rspsta => o_mnsje_rspsta);

            IF o_cdgo_rspsta > 0 THEN
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente',
                                    v_nl,
                                    '2 ' || o_mnsje_rspsta || ' , ' ||
                                    sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

            END IF;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 3;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'Error al llamar el procedimiento que registra el expediente';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    'pkg_fi_fiscalizacion.prc_rg_expediente',
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              RETURN;

          END;

        END;

      END LOOP;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',
                          v_nl,
                          'Saliendo con Exito:' || systimestamp,
                          6);

  END prc_rg_expediente_acto_masivo;

  FUNCTION fnc_co_numero_meses_x_sancion2(p_id_sjto_impsto       number,
                                          p_id_fsclzcion_expdnte number)
    RETURN varchar2 AS
    v_fcha_incio_actvddes si_i_personas.fcha_incio_actvddes%TYPE;

    v_fcha_crcion fi_g_fsclzcion_expdnte_acto.fcha_crcion%TYPE;

    v_numero_meses_sancion number;

    o_mnsje_rspsta varchar2(4000);

  BEGIN
    BEGIN
      Select (a.fcha_incio_actvddes + 30), b.fcha_rgstro
        INTO v_fcha_incio_actvddes, v_fcha_crcion
        FROM si_i_personas a
        JOIN si_i_sujetos_impuesto b
          ON b.id_sjto_impsto = a.id_sjto_impsto
       WHERE a.id_sjto_impsto = p_id_sjto_impsto; --3167949 ;

    EXCEPTION
      WHEN no_data_found THEN
        RETURN 0;

      WHEN others THEN
        RETURN 0;

    END;

    /*
      begin
        select a.fcha_crcion
          into v_fcha_crcion
          from fi_g_fsclzcion_expdnte_acto a
          join gn_d_actos_tipo c
            on a.id_acto_tpo = c.id_acto_tpo
         where a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte --21
           and c.cdgo_acto_tpo = 'PDI';
        o_mnsje_rspsta := 'Fecha creacion ' || v_fcha_crcion;
        pkg_sg_log.prc_rg_log(23001,
                              null,
                              'fnc_co_numero_meses_x_sancion2',
                              6,
                              o_mnsje_rspsta,
                              6);
      exception
        when no_data_found then
          return 0;
        when others then
          return 0;
      end;
    */
    v_numero_meses_sancion := ceil(months_between(v_fcha_crcion,
                                                  v_fcha_incio_actvddes));

    o_mnsje_rspsta := 'Numero de meses ' || v_numero_meses_sancion;

    pkg_sg_log.prc_rg_log(23001,
                          NULL,
                          'fnc_co_numero_meses_x_sancion2',
                          6,
                          o_mnsje_rspsta,
                          6);

    RETURN v_numero_meses_sancion;

  END fnc_co_numero_meses_x_sancion2;

  PROCEDURE prc_rg_liquida_acto_sancion(p_cdgo_clnte                IN number,
                                        p_id_instncia_fljo          IN number,
                                        p_id_fsclzcion_expdnte_acto IN number DEFAULT NULL,
                                        p_id_acto_tpo               IN number DEFAULT NULL,
                                        o_cdgo_rspsta               OUT number,
                                        o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_sncion number;

    v_cdgo_rspsta number;

    v_id_fsclzcion_expdnte number;

    v_id_acto_tpo number;

    v_id_usrio number;

    v_id_fncnrio number;

    v_id_prdo number;

    v_vgncia number;

    v_id_sjto_tpo number;

    n_mses number;

    v_cntidad_minima number;

    v_idntfccion_sjto varchar2(100);

    v_nmbre_impsto_acto varchar2(500);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_liquida_acto';

    v_mnsje_log varchar2(4000);

    v_cdgo_dclrcion_uso varchar2(100);

    v_cdgo_acto_tpo varchar2(20);

    v_dscrpcion varchar2(100);

    v_id_dclrcion gi_g_declaraciones.id_dclrcion%TYPE;

    v_fcha_prsntcion gi_g_declaraciones.fcha_prsntcion%TYPE;

    v_id_dclrcion_crrccion gi_g_declaraciones.id_dclrcion_crrccion%TYPE;

    lqudcion_cncpto json_object_t := json_object_t();

    json_hmlgcion json_object_t;

    lqudcion_cncpto_array json_array_t := json_array_t();

    ----detalle de la sancion
    v_vlor_trfa number;

    v_dvsor_trfa number;

    v_cdgo_indcdor_tpo varchar2(5);

    v_vlor_cdgo_indcdor_tpo number(16, 2);

    v_vlor_trfa_clcldo number;

    v_exprsion_rdndeo VARCHAR2(50);

    v_vlor_ttal number;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se obtiene el expediente
    BEGIN
      SELECT a.id_fsclzcion_expdnte, a.id_fncnrio
        INTO v_id_fsclzcion_expdnte, v_id_fncnrio
        FROM fi_g_fiscalizacion_expdnte a
       WHERE a.id_instncia_fljo = p_id_instncia_fljo;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' No se encontro el expediente del flujo ' ||
                          p_id_instncia_fljo;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se obtiene el usuario
    BEGIN
      SELECT a.id_usrio
        INTO v_id_usrio
        FROM v_sg_g_usuarios a
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND a.id_fncnrio = v_id_fncnrio;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' Problema al obtener el identificador del usuario del funcionario ' ||
                          v_id_fncnrio || ' , ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    --Se obtiene el tipo de acto
    IF p_id_fsclzcion_expdnte_acto IS NOT NULL THEN
      BEGIN
        SELECT a.id_acto_tpo, b.cdgo_acto_tpo, b.dscrpcion
          INTO v_id_acto_tpo, v_cdgo_acto_tpo, v_dscrpcion
          FROM fi_g_fsclzcion_expdnte_acto a
          JOIN gn_d_actos_tipo b
            ON a.id_acto_tpo = b.id_acto_tpo
         WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'No se encontro el tipo de de acto que se va a liquidar en el expediente';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

    ELSE
      BEGIN
        SELECT a.dscrpcion, a.id_acto_tpo, a.cdgo_acto_tpo
          INTO v_dscrpcion, v_id_acto_tpo, v_cdgo_acto_tpo
          FROM gn_d_actos_tipo a
         WHERE a.cdgo_clnte = p_cdgo_clnte
           AND a.id_acto_tpo = p_id_acto_tpo;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'prc_rg_liquida_acto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

    END IF;

    --Se recorren las vigencias que se van a liquidar

    FOR c_vgnca IN (SELECT b.id_impsto,
                           b.id_impsto_sbmpsto,
                           b.id_sjto_impsto,
                           a.id_fsclzcion_expdnte,
                           c.vgncia,
                           c.id_prdo,
                           d.prdo,
                           c.id_cnddto_vgncia,
                           c.id_dclrcion_vgncia_frmlrio,
                           b.nmbre_impsto,
                           b.nmbre_impsto_sbmpsto
                      FROM fi_g_fiscalizacion_expdnte a
                      JOIN v_fi_g_candidatos b
                        ON a.id_cnddto = b.id_cnddto
                      JOIN fi_g_candidatos_vigencia c
                        ON b.id_cnddto = c.id_cnddto
                      JOIN fi_g_fsclzc_expdn_cndd_vgnc e
                        ON c.id_cnddto_vgncia = e.id_cnddto_vgncia
                      JOIN df_i_periodos d
                        ON c.id_prdo = d.id_prdo
                     WHERE a.id_fsclzcion_expdnte = v_id_fsclzcion_expdnte) LOOP
      BEGIN
        SELECT a.id_sjto_tpo, b.idntfccion_sjto
          INTO v_id_sjto_tpo, v_idntfccion_sjto
          FROM si_i_personas a
          JOIN v_si_i_sujetos_impuesto b
            ON a.id_sjto_impsto = b.id_sjto_impsto
         WHERE a.id_sjto_impsto = c_vgnca.id_sjto_impsto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 5;

          o_mnsje_rspsta := 'No se encontro el tipo de sujeto y la identificacion del sujeto impuesto ' ||
                            c_vgnca.id_sjto_impsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se consulta la vigencia del acto a liquidar en el expediente
      IF p_id_fsclzcion_expdnte_acto IS NOT NULL THEN
        BEGIN
          SELECT a.vgncia
            INTO v_vgncia
            FROM fi_g_fsclzcion_acto_vgncia a
            JOIN fi_g_fsclzcion_expdnte_acto b
              ON a.id_fsclzcion_expdnte_acto = b.id_fsclzcion_expdnte_acto
           WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 6;

            o_mnsje_rspsta := 'No se encontro la vigencia a liquidar para el sujeto ' ||
                              c_vgnca.id_sjto_impsto;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

      END IF;

      --Se consulta el valor de la sancion para la etapa.
      /* begin
        select count(*)
          into v_sncion
          from fi_d_sanciones_valor a
         where a.id_acto_tpo = v_id_acto_tpo
           and a.actvo = 'S';
        begin
           select a.valor_sancion, a.cntidad_minima
            into v_sncion, v_cntidad_minima
            from fi_d_sanciones_valor a
           where a.id_acto_tpo = v_id_acto_tpo
             and a.vgncia = c_vgnca.vgncia
             and a.cdgo_sancion in ('UVT')
             and a.actvo = 'S'
             and trunc(sysdate) between fcha_incio and fcha_fin;
        exception
          when no_data_found then
            o_cdgo_rspsta  := 7;
            o_mnsje_rspsta := 'No se encontro parametrizado valor sancion para el acto ' ||
                              v_dscrpcion;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);
            return;
          when others then
            o_cdgo_rspsta  := 8;
            o_mnsje_rspsta := 'El rango de fecha valido para este acto esta vencido ' ||
                              v_dscrpcion;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);
            return;
        end;
      exception
        when others then
          o_cdgo_rspsta  := 8;
          o_mnsje_rspsta := 'No se encontro sancion parametrizada para el acto ' ||
                            v_dscrpcion;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);
          return;
      end;*/
      IF v_sncion < 0 THEN
        o_cdgo_rspsta := 9;

        o_mnsje_rspsta := 'El valor de la sancion es negativo';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      END IF;

      --Se valida si el impuesto acto existe (El impuesto acto debe tener el mismo codigo del tipo de acto)
      BEGIN
        SELECT a.nmbre_impsto_acto
          INTO v_nmbre_impsto_acto
          FROM df_i_impuestos_acto a
         WHERE a.id_impsto = c_vgnca.id_impsto
           AND a.id_impsto_sbmpsto = c_vgnca.id_impsto_sbmpsto
           AND a.cdgo_impsto_acto = v_cdgo_acto_tpo;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 10;

          o_mnsje_rspsta := 'No se encontro parametrizado el impuesto acto de codigo ' ||
                            v_cdgo_acto_tpo || ' para el impuesto ' ||
                            c_vgnca.nmbre_impsto || ' subimpuesto ' ||
                            c_vgnca.nmbre_impsto_sbmpsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 7;

          o_mnsje_rspsta := o_cdgo_rspsta || '-' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se valida si la vigencia que se esta fiscalizando esta parametrizada en impuesto acto concepto
      BEGIN
        SELECT b.vgncia
          INTO v_vgncia
          FROM df_i_impuestos_acto a
          JOIN df_i_impuestos_acto_concepto b
            ON a.id_impsto_acto = b.id_impsto_acto
         WHERE a.cdgo_impsto_acto = v_cdgo_acto_tpo
           AND b.cdgo_clnte = p_cdgo_clnte
           AND b.vgncia = c_vgnca.vgncia
         GROUP BY b.vgncia;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 11;

          o_mnsje_rspsta := 'No se encontro parametrizado la vigencia ' ||
                            c_vgnca.vgncia || ' para el impuesto Acto ' ||
                            v_nmbre_impsto_acto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se calcula el valor
      BEGIN
        n_mses := fnc_co_numero_meses_x_sancion2(p_id_sjto_impsto       => c_vgnca.id_sjto_impsto,
                                                 p_id_fsclzcion_expdnte => v_id_fsclzcion_expdnte);

        -- v_sncion := v_sncion * v_cntidad_minima;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              'Valor sancion: ' || v_sncion,
                              6);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := 'Error al obtener el numero de meses ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se recorre los conceptos del impuesto acto

      FOR c_acto_cncpto IN (SELECT b.id_impsto_acto_cncpto,
                                   b.id_cncpto,
                                   b.vgncia,
                                   b.id_prdo,
                                   b.orden
                              FROM df_i_impuestos_acto a
                              JOIN df_i_impuestos_acto_concepto b
                                ON a.id_impsto_acto = b.id_impsto_acto
                             WHERE b.cdgo_clnte = p_cdgo_clnte
                               AND a.cdgo_impsto_acto = v_cdgo_acto_tpo
                               AND b.vgncia = c_vgnca.vgncia) LOOP
        BEGIN
          SELECT e.vlor_trfa,
                 e.dvsor_trfa,
                 e.cdgo_indcdor_tpo,
                 e.vlor_cdgo_indcdor_tpo,
                 e.vlor_trfa_clcldo,
                 e.exprsion_rdndeo
            INTO v_vlor_trfa,

                 v_dvsor_trfa,
                 v_cdgo_indcdor_tpo,
                 v_vlor_cdgo_indcdor_tpo,
                 v_vlor_trfa_clcldo,
                 v_exprsion_rdndeo

            FROM v_gi_d_tarifas_esquema e
           where (e.id_impsto_acto_cncpto =
                 c_acto_cncpto.id_impsto_acto_cncpto AND
                 e.id_tp_bs_sncn_dcl_vgn_frm IS NULL OR
                 e.id_impsto_acto_cncpto =
                 c_acto_cncpto.id_impsto_acto_cncpto AND
                 e.id_tp_bs_sncn_dcl_vgn_frm = NULL);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 6;

            o_mnsje_rspsta := 'Error al calcular la base, no existe tarifa esquema ';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              'Valor sancion: ' || v_sncion,
                              6);

        lqudcion_cncpto.put('cncpto', c_acto_cncpto.id_cncpto);

        lqudcion_cncpto.put('vgncia', c_acto_cncpto.vgncia);

        lqudcion_cncpto.put('id_prdo', c_acto_cncpto.id_prdo);

        lqudcion_cncpto.put('bse', v_vlor_cdgo_indcdor_tpo);

        lqudcion_cncpto.put('prdo', c_vgnca.prdo);

        lqudcion_cncpto.put('id_impsto_acto_cncpto',
                            c_acto_cncpto.id_impsto_acto_cncpto);

        lqudcion_cncpto.put('nmro_mses', n_mses);

        lqudcion_cncpto.put('orden', c_acto_cncpto.orden);

        lqudcion_cncpto.put('id_cnddto_vgncia', c_vgnca.id_cnddto_vgncia);

        --detalle de calculo de sancion
        lqudcion_cncpto.put('vlor_trfa', v_vlor_trfa);

        lqudcion_cncpto.put('dvsor_trfa', v_dvsor_trfa);

        lqudcion_cncpto.put('cdgo_indcdor_tpo', v_cdgo_indcdor_tpo);

        lqudcion_cncpto.put('vlor_cdgo_indcdor_tpo',
                            v_vlor_cdgo_indcdor_tpo);

        lqudcion_cncpto.put('vlor_trfa_clcldo', v_vlor_trfa_clcldo);

        lqudcion_cncpto.put('exprsion_rdndeo', v_exprsion_rdndeo);

        lqudcion_cncpto_array.append(lqudcion_cncpto);

      END LOOP;

      o_mnsje_rspsta := 'lqudcion_cncpto  ' || lqudcion_cncpto.to_string;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

      IF v_cdgo_acto_tpo <> 'PCN' THEN
        --Se registra la informacion con que se va a liquidar
        BEGIN
          o_mnsje_rspsta := 'Entro en registrar prc_rg_fi_g_fsclzcion_sncion ' ||
                            v_cdgo_acto_tpo;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           => p_cdgo_clnte,
                                                            p_id_fsclzcion_expdnte => v_id_fsclzcion_expdnte,
                                                            p_id_acto_tpo          => v_id_acto_tpo,
                                                            p_json                 => lqudcion_cncpto_array.to_string,
                                                            o_cdgo_rspsta          => o_cdgo_rspsta,
                                                            o_mnsje_rspsta         => o_mnsje_rspsta);

          o_mnsje_rspsta := 'Registro sancion ' || o_mnsje_rspsta;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          IF v_cdgo_rspsta > 0 THEN
            --o_cdgo_rspsta := o_cdgo_rspsta;
            o_mnsje_rspsta := o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                              sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 8;

            o_mnsje_rspsta := 'No se pudo llamar la up que registra la sancion';

            RETURN;

        END;

      END IF;

    END LOOP;

    o_mnsje_rspsta := 'antes de  registrar prc_rg_liquidacion ' ||
                      v_cdgo_acto_tpo;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    --se valida si el acto ha sido generado.
    IF p_id_fsclzcion_expdnte_acto IS NOT NULL THEN
      --Se liquida el acto del expediente
      BEGIN
        pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte                => p_cdgo_clnte,
                                                p_id_usrio                  => v_id_usrio,
                                                p_id_fsclzcion_expdnte      => v_id_fsclzcion_expdnte,
                                                p_id_fsclzcion_expdnte_acto => p_id_fsclzcion_expdnte_acto,
                                                o_vlor_ttal                 => v_vlor_ttal,
                                                o_cdgo_rspsta               => o_cdgo_rspsta,
                                                o_mnsje_rspsta              => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 10;

          o_mnsje_rspsta := 'No se pudo llamar la up que registra la liquidacion ' ||
                            sqlerrm;

          RETURN;

      END;

    END IF;

  END prc_rg_liquida_acto_sancion;

  PROCEDURE prc_rg_expediente_error(p_id_cnddto        IN number,
                                    p_mnsje            IN varchar2,
                                    p_cdgo_clnte       IN number,
                                    p_id_usrio         IN number,
                                    p_id_instncia_fljo IN number DEFAULT NULL,
                                    p_id_fljo_trea     IN number DEFAULT NULL) IS
    PRAGMA autonomous_transaction;

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_expediente_error';

    v_mnsje_log varchar2(4000);

    o_mnsje_rspsta varchar2(4000);

    v_nl number;

    o_cdgo_rspsta number;

    v_id_sjto_impsto number;

    v_id_fncrio number;

    v_mnsje varchar2(4000);

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      -- v_mnsje := replace(p_mnsje, '<br/>');
      v_mnsje := p_mnsje;

      BEGIN
        SELECT id_sjto_impsto
          INTO v_id_sjto_impsto
          FROM fi_g_candidatos
         WHERE id_cnddto = p_id_cnddto;

      EXCEPTION
        WHEN others THEN
          o_mnsje_rspsta := 'Error al consultar el sujeto impuesto del candidato No. ' ||
                            p_id_cnddto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

      END;

      BEGIN
        SELECT b.id_fncnrio
          INTO v_id_fncrio
          FROM v_sg_g_usuarios a
          JOIN v_df_c_funcionarios b
            ON a.id_fncnrio = b.id_fncnrio
         WHERE a.id_usrio = p_id_usrio;

      EXCEPTION
        WHEN others THEN
          o_mnsje_rspsta := 'Error al consultar el usuario No. ' ||
                            p_id_usrio;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

      END;

      BEGIN
        o_mnsje_rspsta := 'Antes de realizar el insert' ||
                          'p_id_sjto_impsto: ' || p_id_cnddto ||
                          '-p_cdgo_clnte: ' || p_cdgo_clnte || '-p_mnsje :' ||
                          p_mnsje;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        INSERT INTO fi_g_fsclzcn_expdnt_act_trnscn
          (id_sjto_impsto,
           id_instncia_fljo,
           id_fljo_trea,
           obsrvciones,
           id_fncnrio,
           cdgo_clnte)
        VALUES
          (v_id_sjto_impsto,
           p_id_instncia_fljo,
           p_id_fljo_trea,
           v_mnsje,
           v_id_fncrio,
           p_cdgo_clnte);

        COMMIT;

        o_mnsje_rspsta := 'despues de realizar el insert' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        --   insert into muerto (v_001, t_001)values (v_mnsje, sysdate);commit;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'No se pudo registrar el resultado de las transiciones';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 12;

        o_mnsje_rspsta := 'Error al llamar el procedimiento ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END COMMIT;

  END prc_rg_expediente_error;

  PROCEDURE prc_rv_flujo_tarea(p_id_instncia_fljo IN number,
                               p_id_fljo_trea     IN number,
                               p_cdgo_clnte       IN number) IS
    PRAGMA autonomous_transaction;

    v_trnscion_actl wf_g_instancias_transicion.id_instncia_trnscion%TYPE;

    v_trnscion_antrr wf_g_instancias_transicion.id_instncia_trnscion%TYPE;

    v_id_instncia_fljo wf_g_instancias_transicion.id_instncia_fljo%TYPE;

    v_id_trea_orgen wf_g_instancias_transicion.id_instncia_trnscion%TYPE;

    v_id_fljo_trea wf_g_instancias_transicion.id_fljo_trea_orgen%TYPE;

    v_count number;

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rv_flujo_tarea';

    v_mnsje_log varchar2(4000);

    o_mnsje_rspsta varchar2(4000);

    v_nl number;

    o_cdgo_rspsta number := 0;

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      SELECT id_fljo_trea
        INTO v_id_fljo_trea
        FROM v_wf_d_flujos_tarea
       WHERE id_fljo_trea IN
             (SELECT first_value(id_fljo_trea_orgen) over (ORDER BY id_instncia_trnscion DESC)
                FROM wf_g_instancias_transicion
               WHERE id_instncia_fljo = p_id_instncia_fljo);

    EXCEPTION
      WHEN others THEN
        o_mnsje_rspsta := 'Error al consultar al tarea : ' ||
                          p_id_instncia_fljo;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

    END;

    BEGIN
      SELECT a.id_instncia_trnscion
        INTO v_trnscion_actl
        FROM wf_g_instancias_transicion a
       WHERE a.id_instncia_fljo = p_id_instncia_fljo
         AND a.id_estdo_trnscion IN (1, 2)
         AND 0 = CASE
               WHEN p_id_fljo_trea = a.id_fljo_trea_orgen THEN
                0
               ELSE
                p_id_fljo_trea
             END;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '- No se puede reversar. No se encontraron datos ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    SELECT count(1)
      INTO v_count
      FROM wf_g_instancias_transicion a
      JOIN wf_g_instancias_flujo b
        ON a.id_instncia_fljo = b.id_instncia_fljo
      JOIN v_wf_d_flujos_transicion c
        ON b.id_fljo = c.id_fljo
       AND c.id_fljo_trea = a.id_fljo_trea_orgen
      JOIN wf_g_instancias_transicion d
        ON d.id_instncia_fljo = a.id_instncia_fljo
       AND d.id_fljo_trea_orgen = c.id_fljo_trea_dstno
     WHERE a.id_instncia_fljo = p_id_instncia_fljo
       AND a.id_instncia_trnscion = v_trnscion_actl;

    /*and 1 = case when :p_id_fljo_trea = 0 and a.id_estdo_trnscion in (1,2) or :p_id_fljo_trea = a.id_fljo_trea_orgen then
         1
         else
         0
    end;*/
    IF v_count > 1 THEN
      o_cdgo_rspsta := 2;

      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '-No se puede reversar. Se encontraron tareas posteriores a esta ';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      RETURN;

    END IF;

    BEGIN
      SELECT trnscion_actl,
             trnscion_antrr,
             id_instncia_fljo,
             id_trea_orgen,
             id_fljo_trea
        INTO v_trnscion_actl,
             v_trnscion_antrr,
             v_id_instncia_fljo,
             v_id_trea_orgen,
             v_id_fljo_trea
        FROM (SELECT a.id_instncia_trnscion trnscion_actl,
                     d.id_instncia_trnscion trnscion_antrr,
                     a.id_instncia_fljo,
                     c.id_trea_orgen,
                     c.id_fljo_trea
                FROM wf_g_instancias_transicion a
                JOIN wf_g_instancias_flujo b
                  ON a.id_instncia_fljo = b.id_instncia_fljo
                JOIN v_wf_d_flujos_transicion c
                  ON b.id_fljo = c.id_fljo
                 AND c.id_fljo_trea_dstno = a.id_fljo_trea_orgen
                JOIN wf_g_instancias_transicion d
                  ON d.id_instncia_fljo = a.id_instncia_fljo
                 AND d.id_fljo_trea_orgen = c.id_fljo_trea
               WHERE a.id_instncia_trnscion = v_trnscion_actl
               ORDER BY d.id_instncia_trnscion DESC)
       WHERE rownum = 1;

      --BORRAMOS LOS VALORES DE LOS ITEMS DE LA TRANSICION ACTUAL

      DELETE FROM wf_g_instancias_item_valor
       WHERE id_instncia_trnscion = v_trnscion_actl;

      --BORRAMOS LOS ATRIBUTOS DE LA TRANSICION ACTUAL

      DELETE FROM wf_g_instancias_atributo
       WHERE id_fljo_trnscion = v_trnscion_actl;

      --BORRAMOS LA TRANSCION ACTUAL

      DELETE FROM wf_g_instancias_transicion
       WHERE id_instncia_trnscion = v_trnscion_actl;

      --BORRAMOS LOS ESTADOS DE LA TAREA

      DELETE FROM wf_g_instncias_trnscn_estdo
       WHERE id_instncia_trnscion = v_trnscion_actl;

      DELETE FROM wf_g_instncs_trnscn_estdtca
       WHERE id_instncia_trnscion = v_trnscion_actl;

      --ACTUALIZAMOS LA TRANSACCION ANTERIOR

      UPDATE wf_g_instancias_transicion
         SET id_estdo_trnscion = 2
       WHERE id_instncia_trnscion = v_trnscion_antrr;

      --ACTUALIZAMOS LA TRANSACCION ANTERIOR

      UPDATE wf_g_instancias_flujo
         SET estdo_instncia = 'INICIADA'
       WHERE id_instncia_fljo = v_id_instncia_fljo;

      COMMIT;

      o_mnsje_rspsta := 'Reverso la tarea con exito ';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := o_cdgo_rspsta || '-No se Pudo Reversar la Tarea ' ||
                          p_id_fljo_trea;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

    END;

  END prc_rv_flujo_tarea;

  FUNCTION fnc_gn_json_propiedades(p_id_dclrcion IN number DEFAULT NULL)
    RETURN CLOB AS
    --Generacion JSON
    v_json_array json_array_t := json_array_t();

    v_json CLOB;

    CURSOR c_propiedades IS
      SELECT a.id_dclrcion,
             c.id_hmlgcion,
             d.cdgo_hmlgcion,
             c.cdgo_prpdad,
             a.vlor,
             a.vlor_dsplay
        FROM gi_g_declaraciones_detalle a
       INNER JOIN gi_d_hmlgcnes_prpddes_items b
          ON a.id_frmlrio_rgion_atrbto = b.id_frmlrio_rgion_atrbto
         AND a.fla = b.fla
       INNER JOIN gi_d_hmlgcnes_prpdad c
          ON b.id_hmlgcion_prpdad = c.id_hmlgcion_prpdad
       INNER JOIN gi_d_homologaciones d
          ON d.id_hmlgcion = c.id_hmlgcion --where       a.id_dclrcion   =   nvl(p_id_dclrcion, a.id_dclrcion);

       WHERE a.id_dclrcion = p_id_dclrcion
         AND d.cdgo_hmlgcion = 'FIS'
         AND c.cdgo_prpdad IN ('VASA', 'CSAN');

    TYPE type_prpddes IS record(
      id_dclrcion   number,
      id_hmlgcion   number,
      cdgo_hmlgcion varchar2(3),
      cdgo_prpdad   varchar2(50),
      vlor          CLOB,
      vlor_dsplay   CLOB);

    TYPE table_prpddes IS TABLE OF type_prpddes;

    v_table_prpddes table_prpddes;

  BEGIN
    OPEN c_propiedades;

    LOOP
      FETCH c_propiedades bulk COLLECT
        INTO v_table_prpddes LIMIT 2000;

      EXIT WHEN v_table_prpddes.count = 0;

      FOR i IN 1 .. v_table_prpddes.count LOOP
        v_json_array.append(json_object_t('{"id_dclrcion" : "' || v_table_prpddes(i).id_dclrcion ||
                                          '", ' || '"id_hmlgcion" : "' || v_table_prpddes(i).id_hmlgcion ||
                                          '", ' || '"cdgo_hmlgcion" : "' || v_table_prpddes(i).cdgo_hmlgcion ||
                                          '", ' || '"cdgo_prpdad" : "' || v_table_prpddes(i).cdgo_prpdad ||
                                          '", ' || '"vlor" : "' || v_table_prpddes(i).vlor ||
                                          '", ' || '"vlor_dsplay" : "' || v_table_prpddes(i).vlor_dsplay || '"}'));

      END LOOP;

    END LOOP;

    CLOSE c_propiedades;

    v_json := v_json_array.to_clob;

    RETURN v_json;

  END fnc_gn_json_propiedades;

  PROCEDURE prc_rg_seleccion_puntual(p_cdgo_clnte       IN fi_g_fiscalizacion_lote.cdgo_clnte %TYPE,
                                     p_id_fsclzcion_lte IN fi_g_fiscalizacion_lote.id_fsclzcion_lte%TYPE,
                                     p_id_sjto_impsto   IN si_i_sujetos_impuesto.id_sjto_impsto%TYPE,
                                     p_id_usuario       IN sg_g_usuarios.id_usrio%TYPE,
                                     p_json             IN CLOB DEFAULT NULL,
                                     p_fcha_expdcion    IN varchar2 DEFAULT NULL,
                                     p_nmro_rnta        IN number DEFAULT NULL,
                                     o_cdgo_rspsta      OUT number,
                                     o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_seleccion_puntual';

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_id_sjto_impsto number;

    v_id_cnddto_vgncia number;

    v_id_impsto number;

    v_anios number;

    v_dias number;

    v_indcdor_fsclzcion_tpo varchar2(5);

    v_mnsje_log varchar2(4000);

    v_id_dclrcion_vgncia_frmlrio number;

    v_id_fsclzcion_lte number;

    --v_guid            varchar2(33) := sys_guid();
    --v_nmbre_cnslta      varchar2(1000);
    --v_sql           clob;
    v_json CLOB;

    -- v_pblcion           sys_refcursor;
    v_id_cnddto fi_g_candidatos.id_cnddto%TYPE;

  BEGIN
    o_cdgo_rspsta := 0;

    --Determinamos el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    /*
      se obtiene el programa y subprograma del lote
    */
    v_id_dclrcion_vgncia_frmlrio := NULL;

    BEGIN
      SELECT a.id_prgrma,
             a.id_sbprgrma,
             a.id_impsto,
             a.indcdor_fsclzcion_tpo
        INTO v_id_prgrma,
             v_id_sbprgrma,
             v_id_impsto,
             v_indcdor_fsclzcion_tpo
        FROM fi_g_fiscalizacion_lote a
       WHERE id_fsclzcion_lte = p_id_fsclzcion_lte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener el programa y subprograma del lote';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    -- Se obtiene el a?o limite para la declaracion segun el impuesto
    BEGIN
      SELECT a.vlor
        INTO v_anios
        FROM df_i_definiciones_impuesto a
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND a.id_impsto = v_id_impsto
         AND a.cdgo_dfncn_impsto = 'ANI';

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se encontro parametrizado los a?os limetes de declaracion en definiciones del tributo con codigo ANI';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 3;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener la definicion de los a?os limetes de declaracion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

    /*
    --Se recorre las vigencias del candidato
    --Se construye el json para el registro de sujeto impuesto
                     o_mnsje_rspsta := 'Se construye el json para el registro de sujeto impuesto';
                     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                    declare
                        v_cdgo_idntfccion_tpo   varchar2(1);
                        v_vgncia   json_object_t := new json_object_t();

                    begin
                        v_vgncia.put('id_prdo', p_cdgo_clnte);
                        v_vgncia.put('vgncia', 2022);
                        v_vgncia.put('id_impsto', 700001);
                        v_vgncia.put('id_impsto_sbmpsto', 8);

                        v_json := v_vgncia.to_clob;
                        INSERT INTO MUERTO (V_001,C_001, T_001)VALUES('V_json creado:',v_json, sysdate); commit;
                        o_mnsje_rspsta := 'Se construyo json para el registro de sujeto impuesto';
                     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                    exception
                        when others then
                            o_cdgo_rspsta := 4;
                            o_mnsje_rspsta := 'Problema al construir el JSON para registrar el sujeto impuesto ' ||' , '||sqlerrm  ;
                            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up,  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                            return;
    end;
    */ /*Se valida para el tipo de fiscalizacion DC si el sujeto a fiscalizar es valido...*/
    BEGIN
      FOR cnddto_vgncia IN (SELECT id_prdo,
                                   vgncia,
                                   id_impsto,
                                   id_impsto_sbmpsto
                              FROM json_table(p_json,
                                              '$[*]'
                                              columns(id_prdo varchar2 PATH
                                                      '$.ID_PRDO',
                                                      vgncia varchar2 PATH
                                                      '$.VGNCIA',
                                                      id_impsto varchar2 PATH
                                                      '$.ID_IMPSTO',
                                                      id_impsto_sbmpsto
                                                      varchar2 PATH
                                                      '$.ID_IMPSTO_SBMPSTO'))) LOOP
        IF (v_indcdor_fsclzcion_tpo = 'DC' /*PREGUNTAR POR EL TIPO DE PROGRAMA*/
           ) THEN
          BEGIN
            SELECT a.id_dclrcion_vgncia_frmlrio
              INTO v_id_dclrcion_vgncia_frmlrio
              FROM v_fi_g_pblcion_omsos_cncdos a
             WHERE a.id_impsto = cnddto_vgncia.id_impsto
               AND a.id_impsto_sbmpsto = cnddto_vgncia.id_impsto_sbmpsto
               AND a.id_prdo = cnddto_vgncia.id_prdo
               AND a.vgncia = cnddto_vgncia.vgncia
               AND a.id_sjto_impsto = p_id_sjto_impsto;

          EXCEPTION
            WHEN no_data_found THEN
              o_cdgo_rspsta := 4;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'La vigencia y periodo seleccionadas ya se encuentra en fiscal' || '-' ||
                                p_id_sjto_impsto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

            WHEN others THEN
              o_cdgo_rspsta := 5;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'Error al consultar la vigencia y periodo ' || '-' ||
                                p_id_sjto_impsto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || '-' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

          BEGIN
            SELECT a.id_fsclzcion_lte
              INTO v_id_fsclzcion_lte
              FROM fi_g_candidatos a
              JOIN fi_g_candidatos_vigencia b
                ON a.id_cnddto = b.id_cnddto
             WHERE a.id_sjto_impsto = p_id_sjto_impsto
               AND a.id_impsto = cnddto_vgncia.id_impsto
               AND a.id_prgrma = v_id_prgrma
               AND a.cdgo_cnddto_estdo = 'ACT'
               AND b.vgncia = cnddto_vgncia.vgncia
               AND b.id_prdo = cnddto_vgncia.id_prdo;

            IF v_id_fsclzcion_lte != p_id_fsclzcion_lte THEN
              o_cdgo_rspsta := 6;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'Las vigencias y periodos seleccionadas ya se encuentran procesadas en otro lote. ' || '-' ||
                                v_id_fsclzcion_lte;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);

              RETURN;

              ROLLBACK;

            END IF;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 6;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'Erros al validar si existe el candidato registrado en otro lote. ' || '-' ||
                                p_id_fsclzcion_lte;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);

          END;

        END IF;

        BEGIN
          SELECT a.id_cnddto
            INTO v_id_cnddto
            FROM fi_g_candidatos a
           WHERE a.id_sjto_impsto = p_id_sjto_impsto
             AND a.id_impsto = cnddto_vgncia.id_impsto
             AND a.id_prgrma = v_id_prgrma
             AND a.id_fsclzcion_lte = p_id_fsclzcion_lte;

          --  o_cdgo_rspsta := 6;
          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'El contribuyente seleccionado ya se encuentra en el lote ' || '-' ||
                            p_id_fsclzcion_lte;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

        EXCEPTION
          WHEN no_data_found THEN
            --Se inserta los candidatos
            BEGIN
              INSERT INTO fi_g_candidatos
                (id_impsto,
                 id_impsto_sbmpsto,
                 id_sjto_impsto,
                 id_fsclzcion_lte,
                 cdgo_cnddto_estdo,
                 indcdor_asgndo,
                 id_prgrma,
                 id_sbprgrma,
                 cdgo_clnte)
              VALUES
                (cnddto_vgncia.id_impsto,
                 cnddto_vgncia.id_impsto_sbmpsto,
                 p_id_sjto_impsto,
                 p_id_fsclzcion_lte,
                 'ACT',
                 'N',
                 v_id_prgrma,
                 v_id_sbprgrma,
                 p_cdgo_clnte)
              RETURNING id_cnddto INTO v_id_cnddto;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 7;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  'No se pudo guardar el candidato con identificacion ' || '-' ||
                                  p_id_sjto_impsto;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

                ROLLBACK;

                RETURN;

            END;

        END;

        BEGIN
          SELECT a.id_cnddto_vgncia
            INTO v_id_cnddto_vgncia
            FROM fi_g_candidatos_vigencia a
           WHERE a.id_cnddto = v_id_cnddto
             AND a.vgncia = cnddto_vgncia.vgncia
             AND a.id_prdo = cnddto_vgncia.id_prdo -- and   a.id_dclrcion_vgncia_frmlrio = v_id_dclrcion_vgncia_frmlrio

             AND a.indcdor_fsclzcion_tpo = 'DC' --and agregar el tipo de fiscalizacion liquidado o declarado
          ;

          o_cdgo_rspsta := 8;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'La vigencia y periodo seleccionada ya se encuentran procesadas. ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || '-' || sqlerrm,
                                6);

          RETURN;

          ROLLBACK;

        EXCEPTION
          WHEN no_data_found THEN
            --Se inserta las vigencia periodo de los candidatos
            BEGIN
              INSERT INTO fi_g_candidatos_vigencia
                (id_cnddto,
                 vgncia,
                 id_prdo,
                 id_dclrcion_vgncia_frmlrio,
                 indcdor_fsclzcion_tpo,
                 fcha_expdcion,
                 nmro_rnta)
              VALUES
                (v_id_cnddto,
                 cnddto_vgncia.vgncia,
                 cnddto_vgncia.id_prdo,
                 v_id_dclrcion_vgncia_frmlrio,
                 v_indcdor_fsclzcion_tpo,
                 TO_DATE(p_fcha_expdcion, 'DD/MM/YYYY'),
                 p_nmro_rnta);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 4;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  'No se pudo registrar las vigencia periodo del candidato con identificacion ' || '-' ||
                                  p_id_sjto_impsto || '-' || sqlerrm;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      'pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva',
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

                ROLLBACK;

                RETURN;

            END;

        END;

      END LOOP;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo procesar el registro de la poblacion  ' || '-' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        RETURN;

    END;

    o_mnsje_rspsta := NULL;

    o_cdgo_rspsta := 0;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Saliendo con Exito:' || systimestamp,
                          6);

  END prc_rg_seleccion_puntual;

  FUNCTION fnc_co_tabla_est_mpal(p_id_sjto_impsto   IN number,
                                 p_id_instncia_fljo IN number,
                                 p_cdgo_clnte       IN number) RETURN CLOB AS
    v_tabla CLOB;

    v_identificacion varchar2(25);

    v_contratista varchar2(300);

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_id_impsto_acto number;

    v_fcha_expdcion date;

    v_numero_contrato varchar2(30);

    v_objeto varchar2(500);

    v_valor_contrato varchar2(100);

    v_fcha_pago date;

    v_estampilla_1 varchar2(100);

    v_estampilla_2 varchar2(100);

    v_total_lqddo varchar2(100);

    --
  BEGIN
    BEGIN
      SELECT a.idntfccion_sjto  AS identificacion,
             b.nmbre_rzon_scial AS contratista
        INTO v_identificacion, v_contratista
        FROM v_si_i_sujetos_impuesto a
        JOIN si_i_personas b
          ON b.id_sjto_impsto = a.id_sjto_impsto
       WHERE b.id_sjto_impsto = p_id_sjto_impsto;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    BEGIN
      SELECT b.id_impsto,
             b.id_impsto_sbmpsto,
             d.id_acto_tpo,
             trunc(c.fcha_expdcion),
             e.nmro_cntrto,
             e.objeto,
             d.bse,
             trunc(e.fcha_pago)
        INTO v_id_impsto,
             v_id_impsto_sbmpsto,
             v_id_impsto_acto,
             v_fcha_expdcion,
             v_numero_contrato,
             v_objeto,
             v_valor_contrato,
             v_fcha_pago
        FROM fi_g_fiscalizacion_expdnte a
        JOIN fi_g_candidatos b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_candidatos_vigencia c
          ON b.id_cnddto = c.id_cnddto
        JOIN fi_g_fiscalizacion_sancion d
          ON a.id_fsclzcion_expdnte = d.id_fsclzcion_expdnte
        JOIN fi_g_fscalizacion_renta e
          ON d.id_fsclzcn_rnta = e.id_fsclzcn_rnta
       WHERE a.id_instncia_fljo = p_id_instncia_fljo
         AND rownum = 1;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    SELECT estamp1, estamp2
      INTO v_estampilla_1, v_estampilla_2
      FROM (SELECT a.dscrpcion_cncpto dscrpcion_cncpto,
                   nvl(a.vlor_lqddo, 0) vlor_lqddo
              FROM table(pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte              => p_cdgo_clnte,
                                                                      p_id_impsto               => v_id_impsto,
                                                                      p_id_impsto_sbmpsto       => v_id_impsto_sbmpsto,
                                                                      p_id_impsto_acto          => v_id_impsto_acto,
                                                                      p_id_sjto_impsto          => p_id_sjto_impsto,
                                                                      p_json_cncptos            => NULL,
                                                                      p_vlor_bse                => v_valor_contrato,
                                                                      p_indcdor_usa_extrnjro    => 'N',
                                                                      p_indcdor_usa_mxto        => 'N',
                                                                      p_fcha_expdcion           => to_date(v_fcha_expdcion),
                                                                      p_fcha_vncmnto            => to_date(v_fcha_pago),
                                                                      p_indcdor_lqdccion_adcnal => 'N',
                                                                      p_id_rnta_antrior         => 'N',
                                                                      p_indcdor_cntrto_gslna    => 'N' -- Nuevo HMZ - 30/12/2021
                                                                      --, p_vlor_cntrto_ese                => to_number(null, '999G999G999G999G999G999G990D99')
                                                                      )) a
             WHERE abs(a.vlor_lqddo) > 0)
    pivot(sum(vlor_lqddo)
       FOR dscrpcion_cncpto IN('PRO-UNIVERSIDAD DE SUCRE TERCER MILENIO' AS
                               estamp1,
                               'PRO-HOSPITAL UNIVERSITARIO DE SINCELEJO' AS
                               estamp2));

    v_total_lqddo := v_estampilla_1 + v_estampilla_2;

    v_tabla := '<table align="center" border="2" style="border-collapse:collapse">
              <tr>
                <th style="width:4%"><b>No.</b></th>
                <th style="width:10%"><b>NUMERO CONTRATO</b></th>
                <th style="width:8%"><b>IDENTIFICACION</b></th>
                                <th style="width:16%"><b>OBJETO</b></th>
                                <th style="width:10%"><b>CONTRATISTA</b></th>
                                <th style="width:12%"><b>VALOR DEL CONTRATO $</b></th>
                                <th style="width:8%"><b>PUBLICA SECOP</b></th>
                                <th style="width:10%"><b>EST. UNIVERSIDAD DE SUCRE (1,5%) $</b></th>
                                <th style="width:10%"><b>EST. PRO-HOSPITAL UNIV. DE SINCELEJO (1,0%) $</b></th>
                <th style="width:12%"><b>TOTAL VALOR PROPUESTO A LIQUIDAR</b></th>
              </tr>
                            <tr>
                                <td style="width:4%">' || 1 ||
               '</td>
                                <td style="width:10%">' ||
               v_numero_contrato ||
               '</td>
                                <td style="width:8%">' ||
               v_identificacion ||
               '</td>
                                <td style="width:16%">' ||
               v_objeto ||
               '</td>
                                <td style="width:10%">' ||
               v_contratista ||
               '</td>
                                <td style="width:12%">' ||
               to_char(v_valor_contrato, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:8%">' || '-' ||
               '</td>
                                <td style="width:10%">' ||
               to_char(v_estampilla_1, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:10%">' ||
               to_char(v_estampilla_2, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:12%">' ||
               to_char(v_total_lqddo, 'FM9G999G999G999G999G999G999') ||
               '</td>
                            </tr>
                            <tr>
                                <td colspan="7"><b>TOTAL.</b></td>
                                <td style="width:10%">' ||
               to_char(v_estampilla_1, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:10%">' ||
               to_char(v_estampilla_2, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:12%">' ||
               to_char(v_total_lqddo, 'FM9G999G999G999G999G999G999') ||
               '</td>
                            </tr>
          </table>';

    RETURN v_tabla;

  END fnc_co_tabla_est_mpal;

  FUNCTION fnc_co_tabla_est_dptal(p_id_sjto_impsto   IN number,
                                  p_id_instncia_fljo IN number,
                                  p_cdgo_clnte       IN number) RETURN CLOB AS
    v_tabla CLOB;

    v_identificacion varchar2(25);

    v_contratista varchar2(300);

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_id_impsto_acto number;

    v_fcha_expdcion date;

    v_numero_contrato varchar2(30);

    v_objeto varchar2(500);

    v_valor_contrato varchar2(100);

    v_fcha_pago date;

    v_estampilla_1 varchar2(100);

    v_estampilla_2 varchar2(100);

    v_estampilla_3 varchar2(100);

    v_estampilla_4 varchar2(100);

    v_estampilla_5 varchar2(100);

    v_estampilla_6 varchar2(100);

    v_estampilla_7 varchar2(100);

    v_total_lqddo varchar2(100);

  BEGIN
    BEGIN
      SELECT a.idntfccion_sjto  AS identificacion,
             b.nmbre_rzon_scial AS contratista
        INTO v_identificacion, v_contratista
        FROM v_si_i_sujetos_impuesto a
        JOIN si_i_personas b
          ON b.id_sjto_impsto = a.id_sjto_impsto
       WHERE b.id_sjto_impsto = p_id_sjto_impsto;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    BEGIN
      SELECT b.id_impsto,
             b.id_impsto_sbmpsto,
             d.id_acto_tpo,
             trunc(c.fcha_expdcion),
             e.nmro_cntrto,
             e.objeto,
             d.bse,
             trunc(e.fcha_pago)
        INTO v_id_impsto,
             v_id_impsto_sbmpsto,
             v_id_impsto_acto,
             v_fcha_expdcion,
             v_numero_contrato,
             v_objeto,
             v_valor_contrato,
             v_fcha_pago
        FROM fi_g_fiscalizacion_expdnte a
        JOIN fi_g_candidatos b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_candidatos_vigencia c
          ON b.id_cnddto = c.id_cnddto
        JOIN fi_g_fiscalizacion_sancion d
          ON a.id_fsclzcion_expdnte = d.id_fsclzcion_expdnte
        JOIN fi_g_fscalizacion_renta e
          ON d.id_fsclzcn_rnta = e.id_fsclzcn_rnta
       WHERE a.id_instncia_fljo = p_id_instncia_fljo
         AND rownum = 1;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    SELECT estamp1, estamp2, estamp3, estamp4, estamp5, estamp6, estamp7
      INTO v_estampilla_1,
           v_estampilla_2,
           v_estampilla_3,
           v_estampilla_4,
           v_estampilla_5,
           v_estampilla_6,
           v_estampilla_7
      FROM (SELECT a.dscrpcion_cncpto dscrpcion_cncpto,
                   nvl(a.vlor_lqddo, 0) vlor_lqddo
              FROM table(pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte              => p_cdgo_clnte,
                                                                      p_id_impsto               => v_id_impsto,
                                                                      p_id_impsto_sbmpsto       => v_id_impsto_sbmpsto,
                                                                      p_id_impsto_acto          => v_id_impsto_acto,
                                                                      p_id_sjto_impsto          => p_id_sjto_impsto,
                                                                      p_json_cncptos            => NULL,
                                                                      p_vlor_bse                => v_valor_contrato,
                                                                      p_indcdor_usa_extrnjro    => 'N',
                                                                      p_indcdor_usa_mxto        => 'N',
                                                                      p_fcha_expdcion           => to_date(v_fcha_expdcion),
                                                                      p_fcha_vncmnto            => to_date(v_fcha_pago),
                                                                      p_indcdor_lqdccion_adcnal => 'N',
                                                                      p_id_rnta_antrior         => 'N',
                                                                      p_indcdor_cntrto_gslna    => 'N' -- Nuevo HMZ - 30/12/2021
                                                                      --, p_vlor_cntrto_ese                => to_number(null, '999G999G999G999G999G999G990D99')
                                                                      )) a
             WHERE abs(a.vlor_lqddo) > 0)
    pivot(sum(vlor_lqddo)
       FOR dscrpcion_cncpto IN('PRO-UNIVERSIDAD DE SUCRE TERCER MILENIO' AS
                               estamp1,
                               'PRO-HOSPITAL UNIVERSITARIO DE SINCELEJO' AS
                               estamp2,
                               'BIENESTAR DEL ADULTO MAYOR' AS estamp3,
                               'PRO-CULTURA' AS estamp4,
                               'PRO-ELECTRIFICACION RURAL' AS estamp5,
                               'PRO-DESARROLLO DEPARTAMENTAL' AS estamp6,
                               'TASA PRO-DEPORTE Y RECREACION DEPARTAMENTAL' AS
                               estamp7));

    v_total_lqddo := (v_estampilla_1 + v_estampilla_2 + v_estampilla_3 +
                     v_estampilla_4 + v_estampilla_5 + v_estampilla_6 +
                     v_estampilla_7);

    v_tabla := '<table align="center" border="2" style="border-collapse:collapse">
                            <tr>
                <th style="width:4%"><b>No.</b></th>
                <th style="width:10%"><b>Contrato</b></th>
                                <th style="width:12%"><b>Objeto</bthtd>
                                <th style="width:10%"><b>Valor</b></td>
                                <th style="width:7%"><b>Publicado en SECOP</b></td>
                                <th style="width:7%"><b>Universidad de Sucre 1,5%</b></td>
                                <th style="width:7%"><b>Pro-Hospital 1,0%</b></td>
                <th style="width:7%"><b>Adulto Mayor 3,0%</b></td>
                <th style="width:7%"><b>Pro-Cultura 2,0%</b></td>
                <th style="width:7%"><b>Pro-Electrificadora 0,5%</b></td>
                <th style="width:7%"><b>Pro-Desarrollo 1,5%</b></td>
                                <th style="width:7%"><b>Tasa Pro-Deporte 1,5%</b></td>
                <th style="width:8%"><b>Deuda presunta</b></td>
                            </tr>
                            <tr>
                                <td style="width:4%">' || 1 ||
               '</td>
                                <td style="width:10%">' ||
               v_numero_contrato ||
               '</td>
                                <td style="width:12%">' ||
               v_objeto ||
               '</td>
                                <td style="width:10%">' ||
               to_char(v_valor_contrato, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' || '-' ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_1, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_2, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_3, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_4, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_5, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_6, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_7, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:8%">' ||
               to_char(v_total_lqddo, 'FM9G999G999G999G999G999G999') ||
               '</td>
                            </tr>
                            <tr>
                                <td colspan="5"><b>TOTAL.</b></td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_1, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_2, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_3, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_4, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_5, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_6, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:7%">' ||
               to_char(v_estampilla_7, 'FM9G999G999G999G999G999G999') ||
               '</td>
                                <td style="width:8%">' ||
               to_char(v_total_lqddo, 'FM9G999G999G999G999G999G999') ||
               '</td>
                            </tr>
          </table>';

    RETURN v_tabla;

  END fnc_co_tabla_est_dptal;

  FUNCTION fnc_vl_vencimiento_acto(p_cdgo_clnte IN number, --   p_fecha_inicial       in timestamp,
                                   p_id_acto    IN number) RETURN timestamp AS
    v_undad_drcion varchar2(10);

    v_dia_tpo varchar2(10);

    v_dscrpcion varchar2(300);

    v_mnsje_rspsta varchar2(500);

    v_fcha_incial timestamp;

    v_fcha_fnal timestamp;

    v_drcion number;

    v_id_acto number;

    v_id_acto_tpo number;

  BEGIN
    --Se obtiene la fecha de notificacion del acto
    IF p_id_acto IS NULL THEN
      RETURN pkg_wf_funciones.fnc_wf_error(p_value   => FALSE,
                                           p_mensaje => 'p_id_acto: ' ||
                                                        p_id_acto);

    END IF;

    BEGIN
      SELECT fcha_ntfccion, id_acto_tpo
        INTO v_fcha_incial, v_id_acto_tpo
        FROM gn_g_actos a
       WHERE a.id_acto = p_id_acto;

    EXCEPTION
      WHEN no_data_found THEN
        RETURN pkg_wf_funciones.fnc_wf_error(p_value   => FALSE,
                                             p_mensaje => 'Genere el acto.'); --|| v_dscrpcion);

      WHEN others THEN
        RETURN pkg_wf_funciones.fnc_wf_error(p_value   => FALSE,
                                             p_mensaje => 'Problema al obtener el tipo y fecha de generacion del acto.');

    END;

    IF v_fcha_incial IS NULL THEN
      v_fcha_incial := to_date(sysdate, 'DD/MM/YYYY');

    END IF;

    BEGIN
      --Se obtiene termino del acto

      SELECT a.undad_drcion, a.drcion, a.dia_tpo
        INTO v_undad_drcion, v_drcion, v_dia_tpo
        FROM gn_d_actos_tipo_tarea a --join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo

       WHERE a.id_acto_tpo = v_id_acto_tpo --and b.cdgo_acto_tpo in ()
      ;

    EXCEPTION
      WHEN no_data_found THEN
        RETURN pkg_wf_funciones.fnc_wf_error(p_value   => FALSE,
                                             p_mensaje => 'No se encontro parametrizado el acto ' ||
                                                          p_id_acto); --v_id_acto_tpo );

      WHEN too_many_rows THEN
        RETURN pkg_wf_funciones.fnc_wf_error(p_value   => FALSE,
                                             p_mensaje => 'Se encontro mas de un registro parametrizado el acto ' ||
                                                          p_id_acto ||
                                                          ' en la etapa del flujo en la que se encuentra');

      WHEN others THEN
        RETURN pkg_wf_funciones.fnc_wf_error(p_value   => FALSE,
                                             p_mensaje => 'Otra Exception');

    END;

    BEGIN
      v_fcha_fnal := pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => p_cdgo_clnte,
                                                           p_fecha_inicial => v_fcha_incial,
                                                           p_undad_drcion  => v_undad_drcion,
                                                           p_drcion        => v_drcion,
                                                           p_dia_tpo       => v_dia_tpo);

      IF v_fcha_fnal IS NOT NULL THEN
        IF trunc(systimestamp) <= trunc(v_fcha_fnal) THEN
          RETURN v_fcha_fnal;

        END IF;

      END IF;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    RETURN v_fcha_incial;

  END fnc_vl_vencimiento_acto;

  FUNCTION fnc_co_tbla_declaracion(p_id_cnddto IN number) RETURN CLOB AS
    v_tabla CLOB;

    v_prdo number;

    v_dscrpcion_prdo varchar2(100);

  BEGIN
    --v_tabla := v_tabla || '<tbody></table>';
    --v_tabla := '<table align="center" border="1" style="border-collapse:collapse"><thead>';

    FOR vigencias IN (SELECT a.vgncia,
                             a.id_prdo,
                             a.id_dclrcion,
                             b.id_impsto,
                             b.id_impsto_sbmpsto,
                             c.nmro_cnsctvo,
                             to_char(c.fcha_prsntcion, 'DD/MM/YYYY') AS fcha_prsntcion
                        FROM fi_g_candidatos_vigencia a
                        JOIN fi_g_candidatos b
                          ON b.id_cnddto = a.id_cnddto
                        LEFT JOIN gi_g_declaraciones c
                          ON c.id_dclrcion = a.id_dclrcion
                       WHERE a.id_cnddto = p_id_cnddto
                       ORDER BY a.vgncia, a.id_prdo) LOOP
      SELECT p.dscrpcion, p.prdo
        INTO v_dscrpcion_prdo, v_prdo
        FROM df_i_periodos p
       WHERE p.id_prdo = vigencias.id_prdo
         AND p.id_impsto = vigencias.id_impsto
         AND p.id_impsto_sbmpsto = vigencias.id_impsto_sbmpsto;

      --v_tabla := v_tabla || '</div>
      v_tabla := v_tabla || '
                  <table align="center" border="1" style="width:100%; border-collapse:collapse"><thead>
                    <tr>
            <th colspan="3" style="text-align: center; border:1px solid black">
              Vigencia ' || vigencias.vgncia || '(' ||
                 v_prdo || '-' || v_dscrpcion_prdo || ')' || '
            </th>
                  </tr>
                   <tr>
            <th colspan="3" style="text-align: center; border:1px solid black">
              Modificar Mediante Este Requerimiento Especial, Su Liquidacion Privada No.' ||
                 vigencias.nmro_cnsctvo || ' De ' ||
                 vigencias.fcha_prsntcion || '
            </th>
                  </tr>
                  <tr>
<th style="width:70%; text-align: center; border:1px solid black">Descripcion Item </th>
 <th style="width:15%; text-align: center; border:1px solid black">Liquidacion Privada</th>
 <th style="width:15%; text-align: center; border:1px solid black">Liquidacion Propuesta </th>

  </tr> </thead> <tbody>';

      BEGIN
        FOR datos IN (SELECT b.dscrpcion,
                             to_char(a.vlor_dsplay,
                                     'FM$999G999G999G999G999G999G990') AS vlor_dsplay
                        FROM json_table(pkg_gi_declaraciones.fnc_co_atributos_seleccion(p_id_dclrcion          => vigencias.id_dclrcion,
                                                                                        p_cdgo_extrccion_objto => 'ITM'),
                                        '$[*]'
                                        columns(id_frmlrio_rgion_atrbto
                                                number PATH
                                                '$.id_frmlrio_rgion_atrbto',
                                                vlor_dsplay varchar2(1000) PATH
                                                '$.vlor_dsplay')) a
                       INNER JOIN gi_d_frmlrios_rgion_atrbto b
                          ON b.id_frmlrio_rgion_atrbto =
                             a.id_frmlrio_rgion_atrbto
                       INNER JOIN gi_d_formularios_region c
                          ON c.id_frmlrio_rgion = b.id_frmlrio_rgion) LOOP
          v_tabla := v_tabla ||
                     '<tr>
                         <td style="text-align: left; border:1px solid black">' ||
                     datos.dscrpcion || '</td>' ||
                     '<td style="text-align: center; border:1px solid black">' ||
                     datos.vlor_dsplay || '</td>' ||
                     '<td style="text-align: center; border:1px solid black">' || '' ||
                     '</td>
           </tr>';

        END LOOP;

      END;

      v_tabla := v_tabla || '</tbody></table><br>';

    END LOOP;

    --v_tabla := v_tabla ||  '</tbody></table>';
    --v_tabla := v_tabla || '<div>';
    RETURN v_tabla;

  END fnc_co_tbla_declaracion;

  FUNCTION fnc_co_tbla_dclrcion_crrgda(p_id_cnddto IN number) RETURN CLOB AS
    v_tabla CLOB;

    v_prdo number;

    v_dscrpcion_prdo varchar2(100);

  BEGIN
    --v_tabla := v_tabla || '<tbody></table>';
    --v_tabla := '<table align="center" border="1" style="border-collapse:collapse"><thead>';

    FOR vigencias IN (SELECT a.vgncia,
                             a.id_prdo,
                             a.id_dclrcion AS dclrcion_incial,
                             b.id_impsto,
                             b.id_impsto_sbmpsto,
                             c.nmro_cnsctvo,
                             to_char(c.fcha_prsntcion, 'DD/MM/YYYY') AS fcha_prsntcion
                        FROM fi_g_candidatos_vigencia a
                        JOIN fi_g_candidatos b
                          ON b.id_cnddto = a.id_cnddto
                        LEFT JOIN gi_g_declaraciones c
                          ON c.id_dclrcion = a.id_dclrcion
                       WHERE a.id_cnddto = p_id_cnddto
                       ORDER BY a.vgncia, a.id_prdo) LOOP
      SELECT p.dscrpcion, p.prdo
        INTO v_dscrpcion_prdo, v_prdo
        FROM df_i_periodos p
       WHERE p.id_prdo = vigencias.id_prdo
         AND p.id_impsto = vigencias.id_impsto
         AND p.id_impsto_sbmpsto = vigencias.id_impsto_sbmpsto;

      --v_tabla := v_tabla || '</div>
      v_tabla := v_tabla || '
                  <table align="center" border="1" style="width:100%; border-collapse:collapse"><thead>
                    <tr>
            <th colspan="4" style="text-align: center; border:1px solid black">
              Vigencia ' || vigencias.vgncia || '(' ||
                 v_prdo || '-' || v_dscrpcion_prdo || ')' || '
            </th>
                  </tr>
                   <tr>
            <th colspan="4" style="text-align: center; border:1px solid black">
              Modificar Mediante Esta Liquidacion Oficial De Revision, Su Liquidacion Privada No.' ||
                 vigencias.nmro_cnsctvo || ' De ' ||
                 vigencias.fcha_prsntcion || '
            </th>
                  </tr>
                  <tr>
<th style="width:60%; text-align: center; border:1px solid black">Descripcion Item </th>
 <th style="width:13%; text-align: center; border:1px solid black">Liquidacion Privada</th>
 <th style="width:14%; text-align: center; border:1px solid black">Liquidacion De Revision </th>
 <th style="width:13%; text-align: center; border:1px solid black">Diferencia</th>
  </tr> </thead> <tbody>';

      BEGIN
        FOR datos IN (SELECT b.dscrpcion,
                             to_char(a.vlor_dsplay,
                                     'FM$999G999G999G999G999G999G990') AS vlor_dsplay
                        FROM json_table(pkg_gi_declaraciones.fnc_co_atributos_seleccion(p_id_dclrcion          => vigencias.dclrcion_incial,
                                                                                        p_cdgo_extrccion_objto => 'ITM'),
                                        '$[*]'
                                        columns(id_frmlrio_rgion_atrbto
                                                number PATH
                                                '$.id_frmlrio_rgion_atrbto',
                                                vlor_dsplay varchar2(1000) PATH
                                                '$.vlor_dsplay')) a
                       INNER JOIN gi_d_frmlrios_rgion_atrbto b
                          ON b.id_frmlrio_rgion_atrbto =
                             a.id_frmlrio_rgion_atrbto
                       INNER JOIN gi_d_formularios_region c
                          ON c.id_frmlrio_rgion = b.id_frmlrio_rgion) LOOP
          v_tabla := v_tabla ||
                     '<tr>
                         <td style="text-align: left; border:1px solid black">' ||
                     datos.dscrpcion || '</td>' ||
                     '<td style="text-align: center; border:1px solid black">' ||
                     datos.vlor_dsplay || '</td>' ||
                     '<td style="text-align: center; border:1px solid black">' || '' ||
                     '<td style="text-align: center; border:1px solid black">' || '' ||
                     '</td>
           </tr>';

        END LOOP;

      END;

      v_tabla := v_tabla || '</tbody></table><br>';

    END LOOP;

    --v_tabla := v_tabla ||  '</tbody></table>';
    --v_tabla := v_tabla || '<div>';
    RETURN v_tabla;

  END fnc_co_tbla_dclrcion_crrgda;

  FUNCTION fnc_gn_tabla_sancion(p_id_fsclzcion_expdnte number) RETURN CLOB AS
    v_select CLOB;

  BEGIN
    v_select := '<table width="75%" border="1px"  style="border-collapse: collapse; font-family: Arial;margin-left: auto; margin-right: auto;">';

    v_select := v_select ||
                '<caption style="font-size: xx-small; caption-side: bottom;"><strong>Detalle de la Sanción</strong></caption>';

    v_select := v_select || '<tr>
                             <th style="text-align:center;" colspan="1"><FONT SIZE=1>Descripción de la Sanción</font></th>
                             <th style="text-align:center;" colspan="1"><FONT SIZE=1>Base de Liquidación</font></th>
                             <th style="text-align:center;" colspan="1"><FONT SIZE=1>Tarifa</font></th>
                             <th style="text-align:center;" colspan="1"><FONT SIZE=1>Sanción Propuesta</font></th>

                            </tr>';

    FOR c_sncion IN (SELECT to_char(b.bse, 'FM$999G999G999G999G999G999G990') AS bse,
                            b.vlor_trfa || '%' AS vlor_trfa,
                            to_char(b.vlor_lqdcion_mnma,
                                    'FM$999G999G999G999G999G999G990') AS vlor_lqdcion_mnma
                       FROM fi_g_fiscalizacion_sancion b
                      WHERE b.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte) LOOP
      v_select := v_select || '<tr>';

      v_select := v_select ||
                  '<td style="text-align:center;"><FONT SIZE=1>' ||
                  'Por No enviar información o enviarla con errores' ||
                  '</font></td>';

      v_select := v_select ||
                  '<td style="text-align:center;"><FONT SIZE=1>' ||
                  c_sncion.bse || '</font></td>';

      v_select := v_select || '<td style="text-align:right;"><FONT SIZE=1>' ||
                  c_sncion.vlor_trfa || '</font></td>';

      v_select := v_select || '<td style="text-align:right;"><FONT SIZE=1>' ||
                  c_sncion.vlor_lqdcion_mnma || '</font></td>';

      v_select := v_select || '</tr>';

    END LOOP;

    v_select := v_select || '</table>';

    RETURN v_select;

  EXCEPTION
    WHEN others THEN
      pkg_sg_log.prc_rg_log(23001,
                            NULL,
                            'pkg_fi_fiscalizacion.fnc_gn_tabla_sancion',
                            6,
                            'Error: ' || sqlerrm,
                            6);

  END fnc_gn_tabla_sancion;

  /*
  * @Descripcion    : Previsualizar Actos
  * @Autor          : Jean Adies, Brayan Villegas
  * @Creacion       : 12/06/2024
  * @Modificacion   : 12/06/2024
  * @Nota           :
  */
  PROCEDURE prc_rg_acto_temp(p_cdgo_clnte                IN df_s_clientes.cdgo_clnte%TYPE,
                             p_id_usrio                  IN sg_g_usuarios.id_usrio%TYPE,
                             p_id_fsclzcion_expdnte_acto IN number,
                             p_acto_vlor_ttal            IN number DEFAULT 0,
                             p_id_cnddto                 IN number,
                             o_cdgo_rspsta               OUT number,
                             o_mnsje_rspsta              OUT varchar2) AS
    v_nl number;

    v_id_acto number;

    v_app_id number := v('APP_ID');

    v_page_id number := v('APP_PAGE_ID');

    v_id_fsclzcion_expdnte number;

    v_id_acto_tpo number;

    v_id_acto_rqrdo number;

    v_id_fncnrio number;

    v_id_rprte number;

    v_id_fljo_trea number;

    v_id_impsto number;

    v_id_sjto_impsto number;

    v_id_dclrcion number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_acto_temp';

    v_nmbre_cnslta varchar2(1000);

    v_nmbre_plntlla varchar2(1000);

    v_cdgo_frmto_plntlla varchar2(10);

    v_cdgo_frmto_tpo varchar2(10);

    v_ntfccion_atmtco varchar2(1);

    v_cdgo_acto_tpo varchar2(10);

    v_mnsje varchar2(1000);

    v_slct_sjto_impsto CLOB;

    v_slct_vgncias CLOB;

    v_slct_rspnsble CLOB;

    v_json_acto CLOB;

    v_xml CLOB;

    v_blob blob;

    v_id_instncia_fljo number;

    v_id_fncnrio_frma gn_g_actos.id_fncnrio_frma%TYPE;

    v_nmro_acto gn_g_actos.nmro_acto%TYPE;

    v_anio gn_g_actos.anio%TYPE;

    v_nmro_acto_dsplay gn_g_actos.nmro_acto_dsplay%TYPE;

    v_cdgo_acto_orgen varchar2(10) := 'FISCA';

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se valida si el acto ya fue generado
    BEGIN
      SELECT a.id_acto
        INTO v_id_acto
        FROM fi_g_fsclzcion_expdnte_acto a
       WHERE a.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto
         AND NOT a.id_acto IS NULL;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    IF v_id_acto IS NOT NULL THEN
      o_cdgo_rspsta := 10;

      o_mnsje_rspsta := o_cdgo_rspsta || ' - El acto ya fue generado ' ||
                        p_id_fsclzcion_expdnte_acto;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            6);

      ROLLBACK;

      RETURN;

    END IF;

    -- (inicio) Se llena la información requerida para la pre-visualización del acto.
    BEGIN
      SELECT c.id_impsto, d.id_fsclzcion_expdnte, d.id_instncia_fljo
        INTO v_id_impsto, v_id_fsclzcion_expdnte, v_id_instncia_fljo
        FROM fi_g_candidatos c
        JOIN fi_g_fiscalizacion_expdnte d
          ON c.id_cnddto = d.id_cnddto
       WHERE c.id_cnddto = p_id_cnddto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 20;

        o_mnsje_rspsta := 'No se puedo obtener el impuesto para generar el acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    BEGIN
      SELECT a.id_sjto_impsto
        INTO v_id_sjto_impsto
        FROM fi_g_candidatos a
       WHERE a.id_cnddto = p_id_cnddto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 30;

        o_mnsje_rspsta := 'No se puedo obtener el impuesto para generar el acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    BEGIN
      SELECT a.id_fsclzcion_expdnte,
             b.id_acto_tpo,
             b.id_acto_rqrdo,
             b.id_fncnrio,
             b.id_rprte,
             b.id_fljo_trea
        INTO v_id_fsclzcion_expdnte,
             v_id_acto_tpo,
             v_id_acto_rqrdo,
             v_id_fncnrio,
             v_id_rprte,
             v_id_fljo_trea
        FROM fi_g_fiscalizacion_expdnte a
        JOIN fi_g_fsclzcion_expdnte_acto b
          ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
       WHERE b.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 40;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener la informacion del acto a generar';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    BEGIN
      SELECT a.id_prgrma, a.id_sbprgrma
        INTO v_id_prgrma, v_id_sbprgrma
        FROM v_fi_g_fiscalizacion_expdnte a
        JOIN fi_g_fsclzcion_expdnte_acto b
          ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
       WHERE b.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 50;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo consultar el programa y sub-programa';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    BEGIN
      SELECT cdgo_acto_tpo
        INTO v_cdgo_acto_tpo
        FROM gn_d_actos_tipo
       WHERE id_acto_tpo = v_id_acto_tpo;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 60;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo obtener la informacion del acto a generar';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    /*PRC_RG_ACTO*/ -- Extraer año

    SELECT extract(YEAR FROM systimestamp) INTO v_anio FROM dual;

    -- Asignación de Consecutivo del acto
    BEGIN
      v_nmro_acto := pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte   => p_cdgo_clnte,
                                                             p_cdgo_cnsctvo => 'TMP');

      -- Construcción del Consecutivo del acto display
      v_nmro_acto_dsplay := v_anio || '-' || v_nmro_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 70;

        o_mnsje_rspsta := 'Error al generar el numero del acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        RETURN;

    END; -- Fin Asignación de Consecutivo del acto

    -- Se Consulta el funcionario que firmará el acto
    BEGIN
      SELECT id_fncnrio
        INTO v_id_fncnrio_frma
        FROM gn_d_actos_funcionario_frma
       WHERE id_acto_tpo = v_id_acto_tpo
         AND actvo = 'S'
         AND trunc(sysdate) BETWEEN fcha_incio AND fcha_fin
         AND p_acto_vlor_ttal BETWEEN rngo_dda_incio AND rngo_dda_fin;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 80;

        o_mnsje_rspsta := 'No se encontró funcionario parametrizado para firmar el acto por valor: ' ||
                          to_char(p_acto_vlor_ttal,
                                  'FM$999G999G999G999G999G999G990');

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        RETURN;

      WHEN others THEN
        o_cdgo_rspsta := 90;

        o_mnsje_rspsta := 'Error al consultar el funcionario para firmar el acto ' ||
                          SQLCODE || ' - -' || SQLERRM;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        RETURN;

    END; -- Fin Se Consulta el funcionario que firmará el acto

    BEGIN
      DELETE FROM gn_t_actos_temp
       WHERE id_orgen = p_id_fsclzcion_expdnte_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 100;

        o_mnsje_rspsta := 'Problemas al limpiar actos temporales';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

    END;

    --(Finaliza) llenado de información para la pre-visualización del acto
    v_xml := '<data>
                <id_fsclzcion_expdnte_acto>' ||
             p_id_fsclzcion_expdnte_acto || '</id_fsclzcion_expdnte_acto>
                <p_id_impsto>' || v_id_impsto ||
             '</p_id_impsto>
                <p_id_fsclzcion_expdnte>' ||
             v_id_fsclzcion_expdnte || '</p_id_fsclzcion_expdnte>
                <cdgo_srie>FIS-001</cdgo_srie>
                <id_sjto_impsto>' || v_id_sjto_impsto ||
             '</id_sjto_impsto>
                <id_acto>' || v_id_acto ||
             '</id_acto>
                <cdgo_clnte>' || p_cdgo_clnte ||
             '</cdgo_clnte>
                <id_instncia_fljo>' || v_id_instncia_fljo ||
             '</id_instncia_fljo>
                <id_cnddto>' || p_id_cnddto ||
             '</id_cnddto>
                <id_usrio>' || p_id_usrio ||
             '</id_usrio>
              </data>';

    -- Se registra el acto (Maestro)
    BEGIN
      INSERT INTO gn_t_actos_temp
        (cdgo_clnte,
         cdgo_acto_orgen,
         id_orgen,
         id_acto_tpo,
         nmro_acto,
         anio,
         nmro_acto_dsplay,
         fcha,
         id_usrio,
         id_fncnrio_frma,
         id_rprte,
         vlor)
      VALUES
        (p_cdgo_clnte,
         v_cdgo_acto_orgen,
         p_id_fsclzcion_expdnte_acto,
         v_id_acto_tpo,
         v_nmro_acto,
         v_anio,
         v_nmro_acto_dsplay,
         systimestamp,
         p_id_usrio,
         v_id_fncnrio_frma,
         v_id_rprte,
         p_acto_vlor_ttal)
      RETURNING id_actos_temp INTO v_id_acto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 110;

        o_mnsje_rspsta := 'Erro al registrar el Acto - Maestro';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        RETURN;

    END; -- Fin Se registra el acto (Maestro)

    /*PRC_RG_ACTO*/ --Se obtiene informacion del reporte
    BEGIN
      SELECT /*+ RESULT_CACHE */
       a.nmbre_cnslta,
       a.nmbre_plntlla,
       a.cdgo_frmto_plntlla,
       a.cdgo_frmto_tpo
        INTO v_nmbre_cnslta,
             v_nmbre_plntlla,
             v_cdgo_frmto_plntlla,
             v_cdgo_frmto_tpo
        FROM gn_d_reportes a
       WHERE a.id_rprte = v_id_rprte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 120;

        o_mnsje_rspsta := 'Problema al obtener informacion del reporte';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                              ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se setean valores de sesion
    BEGIN
      IF v('APP_SESSION') IS NULL THEN
        apex_session.create_session(p_app_id   => 66000,
                                    p_page_id  => 2,
                                    p_username => '1111111112');

      ELSE
        apex_session.attach(p_app_id     => 66000,
                            p_page_id    => 2,
                            p_session_id => v('APP_SESSION'));

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 130;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Error al setear los valores de la sesion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Seteamos en session los items necesarios para generar el archivo
    BEGIN
      apex_util.set_session_state('P2_XML', v_xml);

      apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);

      apex_util.set_session_state('P2_ID_RPRTE', v_id_rprte);

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 140;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Error al setear los valores de la sesion en los items';

        ROLLBACK;

        RETURN;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'v_nmbre_cnslta: ' || v_nmbre_cnslta,
                          6);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'v_nmbre_plntlla: ' || v_nmbre_plntlla,
                          6);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'v_cdgo_frmto_plntlla: ' || v_cdgo_frmto_plntlla,
                          6);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'v_cdgo_frmto_tpo: ' || v_cdgo_frmto_tpo,
                          6);

    --GENERAMOS EL DOCUMENTO
    BEGIN
      v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                             p_report_query_name  => v_nmbre_cnslta,
                                             p_report_layout_name => v_nmbre_plntlla,
                                             p_report_layout_type => v_cdgo_frmto_plntlla,
                                             p_document_format    => v_cdgo_frmto_tpo);

      IF v_blob IS NOT NULL THEN
        BEGIN
          UPDATE gn_t_actos_temp
             SET file_blob     = v_blob,
                 file_mimetype = 'application/pdf',
                 file_name     = v_nmro_acto_dsplay || '.pdf' --file_bfile = '/DATOS01/oracle/u04/directorios/PREVISUALIZAR_ACTOS_TEMP'||v_nmro_acto_dsplay||'.pdf'

           WHERE id_actos_temp = v_id_acto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 150;

            o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                              'Problemas al actualizar blob';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ',' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

      ELSE
        o_cdgo_rspsta := 160;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Problemas generando el blob del acto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

      END IF;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 170;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Problemas generando el documento ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    --Se setean valores de sesion
    BEGIN
      apex_session.attach(p_app_id     => v_app_id,
                          p_page_id    => v_page_id,
                          p_session_id => v('APP_SESSION'));

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 180;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Problemas al crear la sesion de la pagina de destino ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Saliendo',
                          6);

  END prc_rg_acto_temp;

  --Funcion que devuelve el numero de expedientes que tiene abiertos un sujeto impuesto Req0024757
  FUNCTION fnc_co_expediente_activo(p_id_sjto_impsto IN si_i_sujetos_impuesto.id_sjto_impsto%TYPE)
    RETURN varchar2 IS
    v_expdntes_actvo varchar2(1000);

  BEGIN
    SELECT listagg(nmro_expdnte, ', ')
      INTO v_expdntes_actvo
      FROM fi_g_fiscalizacion_expdnte a
      JOIN fi_g_candidatos b
        ON b.id_cnddto = a.id_cnddto
       AND b.id_sjto_impsto = p_id_sjto_impsto
     WHERE a.cdgo_expdnte_estdo = 'ABT'
       AND fcha_crre IS NULL;

    RETURN v_expdntes_actvo;

  EXCEPTION
    WHEN others THEN
      RETURN v_expdntes_actvo;

  END fnc_co_expediente_activo;

  /*
      Función para registrar los datos de la solicitud de analisis de un expediente,
      solicitada por una solicitud de PQR.
      @Luis Ariza.
      06/09/2023

  */
  PROCEDURE prc_rg_expediente_analisis(p_cdgo_clnte          IN df_s_clientes.cdgo_clnte%TYPE,
                                       p_id_usrio            IN sg_g_usuarios.id_usrio%TYPE,
                                       p_id_fncnrio          IN number,
                                       p_expediente          IN CLOB,
                                       p_id_slctud           IN number,
                                       p_obsrvcion           IN varchar2,
                                       P_ID_IMPSTO           IN number,
                                       P_ID_IMPSTO_sbmpsto   IN number,
                                       P_fcha_rgtro          IN DATE,
                                       p_instancia_fljo      IN number,
                                       p_instancia_fljo_pdre IN number,
                                       p_id_fljo_trea        IN number,
                                       p_id_fsclzdor         IN number,
                                       o_cdgo_rspsta         OUT number,
                                       o_mnsje_rspsta        OUT varchar2) AS
    v_nl number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_result number;

    v_id_sjto_impsto number;

    v_vgncia number;

    v_prdo number;

    v_nmbre varchar2(30);

    v_mnsje_log varchar2(4000);

    v_nmbre_prgrma varchar2(200);

    v_nmbre_sbprgrma varchar2(200);

    v_cdgo_fljo varchar2(5);

    v_nmbre_rzon_scial varchar2(300);

    v_nmro_expdnte varchar2(300);

    v_id_fsclzc_expdn_cndd_vgnc number;

    v_Id_Expdnte_Anlsis number;

    v_Id_Expdnte_Anlsis_dtll number;

    v_id_instncia_fljo number;

    v_nmro_rdcdo_dsplay varchar2(50);

    v_array_expediente json_array_t := NEW json_array_t(p_expediente);

    v_nmbre_up varchar2(100) := 'pkg_fi_fiscalizacion.prc_rg_expediente_analisis';

  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                        NULL,
                                        'pkg_fi_fiscalizacion.prc_rg_expediente_analisis');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          v_nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    --Se recorre las vigencias y actos a registrar.
    BEGIN
      FOR i IN 0 ..(v_array_expediente.get_size - 1) LOOP
        DECLARE
          v_json_expediente json_object_t := NEW
                                             json_object_t(v_array_expediente.get(i));

          json_candidato CLOB := v_json_expediente.to_clob;

          v_id_fsclzcion_expdnte varchar2(1000) := v_json_expediente.get_String('ID_FSCLZCION_EXPDNTE');

        BEGIN
          BEGIN
            --Se realiza el registro del expediente a analizar.

            SELECT a.Id_Expdnte_Anlsis,
                   a.id_instncia_fljo,
                   b.nmro_rdcdo_dsplay
              INTO v_Id_Expdnte_Anlsis,
                   v_id_instncia_fljo,
                   v_nmro_rdcdo_dsplay
              FROM fi_g_expedientes_analisis a
              JOIN v_pq_g_solicitudes b
                ON a.id_instncia_fljo = b.id_instncia_fljo_gnrdo
             WHERE a.id_fsclzcion_expdnte = 2644
               AND (a.cdgo_rspta IS NULL OR a.cdgo_rspta = 'REG');

            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'El expediente seleccionado ya cuenta con una solicitud de análisis abierta asociada al No. radicado  ' ||
                              v_nmro_rdcdo_dsplay;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

          EXCEPTION
            WHEN no_data_found THEN
              INSERT INTO fi_g_expedientes_analisis
                (Id_Instncia_Fljo,
                 Id_Instncia_Fljo_Pdre,
                 Id_Impsto,
                 Id_Impsto_Sbmpsto,
                 Obsrvcion,
                 Id_Slctud,
                 Fcha_Rgstro,
                 Id_Usrio_Rgstro,
                 cdgo_rspta,
                 ID_FSCLZCION_EXPDNTE)
              VALUES
                (p_instancia_fljo,
                 p_instancia_fljo_pdre,
                 P_ID_IMPSTO,
                 P_ID_IMPSTO_sbmpsto,
                 p_obsrvcion,
                 p_id_slctud,
                 sysdate,
                 p_id_usrio,
                 'REG',
                 v_id_fsclzcion_expdnte)
              RETURNING Id_Expdnte_Anlsis INTO v_Id_Expdnte_Anlsis;

            WHEN others THEN
              o_cdgo_rspsta := 1;

              o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                'No se pudo registrar el expediente analisis ' ||
                                ' , ' || sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              ROLLBACK;

              RETURN;

          END;

          --Se recorre las vigencias del acto seleccionado.
          BEGIN
            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'Antes del for  cnddto_vgncia' || ' , ' ||
                              sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            FOR cnddto_vgncia IN (SELECT id_acto_tpo,
                                         id_acto,
                                         id_cnddto_vgncia,
                                         id_prdo,
                                         id_sjto_impsto,
                                         id_trea,
                                         vgncia
                                    FROM json_table(json_candidato,
                                                    '$.VGNCIA[*]'
                                                    columns(id_acto_tpo
                                                            varchar2 PATH
                                                            '$.ID_ACTO_TPO',
                                                            id_acto varchar2 PATH
                                                            '$.ID_ACTO',
                                                            id_cnddto_vgncia
                                                            varchar2 PATH
                                                            '$.ID_CNDDTO_VGNCIA',
                                                            id_prdo varchar2 PATH
                                                            '$.ID_PRDO',
                                                            id_sjto_impsto
                                                            varchar2 PATH
                                                            '$.ID_SJTO_IMPSTO',
                                                            id_trea varchar2 PATH
                                                            '$.ID_TREA',
                                                            vgncia varchar2 PATH
                                                            '$.VGNCIA'))) LOOP
              --Se valida la información del expediente, programa, sub programa
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    v_nmbre_up,
                                    v_nl,
                                    'cnddto_vgncia.id_cnddto_vgncia ' ||
                                    cnddto_vgncia.id_cnddto_vgncia || ' , ' ||
                                    sqlerrm,
                                    6);

              BEGIN
                SELECT a.id_prgrma,
                       a.nmbre_prgrma,
                       a.id_sbprgrma,
                       a.nmbre_sbprgrma
                  INTO v_id_prgrma,
                       v_nmbre_prgrma,
                       v_id_sbprgrma,
                       v_nmbre_sbprgrma
                  FROM v_fi_g_candidatos a
                  JOIN fi_g_candidatos_vigencia b
                    ON a.id_cnddto = b.id_cnddto
                 WHERE b.id_cnddto_vgncia = cnddto_vgncia.id_cnddto_vgncia;

              EXCEPTION
                WHEN no_data_found THEN
                  o_cdgo_rspsta := 2;

                  o_mnsje_rspsta := 'Falta el programa y subprograma por el cual se esta fiscalizando el candidato';

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  ROLLBACK;

                  RETURN;

              END;

              o_mnsje_rspsta := 'Nombre razón social';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' , ' || sqlerrm,
                                    6);

              --Se obtiene el nombre de la persona o razón social
              BEGIN
                SELECT a.nmbre_rzon_scial
                  INTO v_nmbre_rzon_scial
                  FROM si_i_personas a
                 WHERE a.id_sjto_impsto = cnddto_vgncia.id_sjto_impsto;

              EXCEPTION
                WHEN others THEN
                  o_cdgo_rspsta := 3;

                  o_mnsje_rspsta := 'Problema al obtener el nombre de la persona o razón social';

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  ROLLBACK;

                  RETURN;

              END;

              --Se valida si el sujeto impuesto tiene un expediente para una vigencia periodo
              BEGIN
                SELECT a.id_sjto_impsto,
                       e.nmbre,
                       c.vgncia,
                       f.prdo,
                       b.nmro_expdnte,
                       d.id_fsclzc_expdn_cndd_vgnc
                  INTO v_id_sjto_impsto,
                       v_nmbre,
                       v_vgncia,
                       v_prdo,
                       v_nmro_expdnte,
                       v_id_fsclzc_expdn_cndd_vgnc
                  FROM fi_g_candidatos a
                  JOIN fi_g_candidatos_vigencia c
                    ON a.id_cnddto = c.id_cnddto
                  JOIN fi_g_fsclzc_expdn_cndd_vgnc d
                    ON c.id_cnddto_vgncia = d.id_cnddto_vgncia
                  JOIN fi_g_fiscalizacion_expdnte b
                    ON d.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
                  JOIN fi_d_expediente_estado e
                    ON b.cdgo_expdnte_estdo = e.cdgo_expdnte_estdo
                  JOIN df_i_periodos f
                    ON c.id_prdo = f.id_prdo
                 WHERE a.id_sjto_impsto = cnddto_vgncia.id_sjto_impsto
                   AND c.id_prdo = cnddto_vgncia.id_prdo
                   AND a.id_prgrma = v_id_prgrma
                   AND a.id_sbprgrma = v_id_sbprgrma
                   AND e.cdgo_expdnte_estdo IN ('ABT');

                BEGIN
                  INSERT INTO fi_g_expndnts_anlsis_dtlle
                    (Id_Expdnte_Anlsis,
                     nmro_expdnte,
                     Id_Sjto_Impsto,
                     ID_FSCLZC_EXPDN_CNDD_VGNC,
                     id_fljo_trea,
                     VGNCIA,
                     ID_PRDO,
                     Obsrvcion,
                     Id_Acto,
                     id_acto_tpo)
                  VALUES
                    (v_Id_Expdnte_Anlsis,
                     v_nmro_expdnte,
                     cnddto_vgncia.id_sjto_impsto,
                     v_id_fsclzc_expdn_cndd_vgnc,
                     p_id_fljo_trea,
                     cnddto_vgncia.vgncia,
                     cnddto_vgncia.id_prdo,
                     p_obsrvcion,
                     cnddto_vgncia.id_acto,
                     cnddto_vgncia.id_acto_tpo)
                  RETURNING Id_Expdnte_Anlsis_dtll INTO v_Id_Expdnte_Anlsis_dtll;

                EXCEPTION
                  WHEN others THEN
                    o_cdgo_rspsta := 4;

                    o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                      'No se pudo registrar el detalle del expediente analisis ' ||
                                      ' , ' || sqlerrm;

                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          NULL,
                                          v_nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta || ' , ' ||
                                          sqlerrm,
                                          6);

                    ROLLBACK;

                    RETURN;

                END;

                BEGIN
                  --Se actualiza el el campo indcdor_blqdo a S, para bloquear la vigencia seleccionada. Y se asocica el id solicitud.

                  UPDATE fi_g_fsclzc_expdn_cndd_vgnc a
                     SET indcdor_blqdo = 'S', id_slctud = p_id_slctud
                   WHERE a.id_fsclzcion_expdnte = v_id_fsclzcion_expdnte
                     AND a.id_cnddto_vgncia =
                         cnddto_vgncia.id_cnddto_vgncia;

                EXCEPTION
                  WHEN others THEN
                    o_cdgo_rspsta := 5;

                    o_mnsje_rspsta := 'Error al intentar actualizar el estado de bloqueo en . ';

                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                          NULL,
                                          v_nmbre_up,
                                          v_nl,
                                          o_mnsje_rspsta || ' , ' ||
                                          sqlerrm,
                                          6);

                    ROLLBACK;

                    RETURN;

                END;

              EXCEPTION
                WHEN no_data_found THEN
                  o_cdgo_rspsta := 6;

                  o_mnsje_rspsta := 'Problemas al registrar las vigencias del expediente a bloquear. ';

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  ROLLBACK;

                  RETURN;

                WHEN too_many_rows THEN
                  o_cdgo_rspsta := 7;

                  o_mnsje_rspsta := 'La razón social ' ||
                                    v_nmbre_rzon_scial ||
                                    ' tiene mas de un expediente para la vigencia ' ||
                                    v_vgncia || ' período ' || v_prdo ||
                                    ' del programa ' || v_nmbre_prgrma ||
                                    ' y subprograma ' || v_nmbre_sbprgrma;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  RETURN;

                WHEN others THEN
                  o_cdgo_rspsta := 8;

                  o_mnsje_rspsta := 'Problema al intentar actualizar la vigencia a bloquear.' ||
                                    ' , ' || sqlerrm;

                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        NULL,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ' , ' || sqlerrm,
                                        6);

                  RETURN;

              END;

              --Se valida el sujeto impuesto
              IF v_id_sjto_impsto IS NULL THEN
                o_cdgo_rspsta := 9;

                o_mnsje_rspsta := 'La razón social ' || v_nmbre_rzon_scial ||
                                  ' no tiene un expediente para la vigencia ' ||
                                  v_vgncia || ' período ' || v_prdo ||
                                  ' del programa ' || v_nmbre_prgrma ||
                                  ' y subprograma ' || v_nmbre_sbprgrma;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' , ' || sqlerrm,
                                      6);

                RETURN;

              END IF;

            END LOOP;

          END;

        END;

      END LOOP;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 10;

        o_mnsje_rspsta := 'Error al llamar la up prc_rg_expediente_analisis';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo:' || systimestamp,
                          6);

  END prc_rg_expediente_analisis;

  /*
      Función para generar el acto de la solicitud de analisis de un expediente,
      solicitada por una PQR. el cual generar un acto dependiento del estado
      de la solicitud APL:APLICADO O  RCH:Rechazado.
      @Luis Ariza.
      06/09/2023

  */
  PROCEDURE prc_rg_acto_analisis_expediente(p_cdgo_clnte        IN df_s_clientes.cdgo_clnte%TYPE,
                                            p_id_usrio          IN sg_g_usuarios.id_usrio%TYPE,
                                            p_id_expdnte_anlsis IN number,
                                            p_id_fljo_trea      IN number,
                                            p_cdgo_rspta        IN varchar2,
                                            p_acto_vlor_ttal    IN number DEFAULT 0,
                                            o_cdgo_rspsta       OUT number,
                                            o_mnsje_rspsta      OUT varchar2) AS
    v_error EXCEPTION;

    v_error2 varchar2(1000);

    r_fi_g_expedientes_analisis fi_g_expedientes_analisis%rowtype;

    v_nl number;

    v_id_acto number;

    v_app_id number := v('APP_ID');

    v_page_id number := v('APP_PAGE_ID');

    v_id_fsclzcion_expdnte number;

    v_id_acto_tpo number;

    v_id_acto_rqrdo number;

    v_id_fncnrio number;

    v_id_rprte number;

    v_id_fljo_trea number;

    v_id_impsto number;

    v_id_sjto_impsto number;

    v_id_dclrcion number;

    v_mnsje_log varchar2(4000);

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_acto_analisis_expediente';

    v_nmbre_cnslta varchar2(1000);

    v_nmbre_plntlla varchar2(1000);

    v_id_plntlla number;

    v_dcmnto CLOB;

    v_gn_d_reportes gn_d_reportes%rowtype;

    v_id_slctud number;

    v_id_mtvo number;

    v_dscrpcion_acto varchar2(100);

    v_ttal_sjto_impsto number;

    v_ttal_vgncias number;

    v_ttal_rspsnble number;

    v_id_instncia_fljo number;

    v_cdgo_frmto_plntlla varchar2(10);

    v_cdgo_frmto_tpo varchar2(10);

    v_ntfccion_atmtco varchar2(1);

    v_cdgo_acto_tpo varchar2(10);

    v_cdgo_cnsctvo varchar2(10);

    v_slct_sjto_impsto CLOB;

    v_slct_vgncias CLOB;

    v_slct_rspnsble CLOB;

    v_json_acto CLOB;

    v_xml CLOB;

    v_blob blob;

    v_user_name sg_g_usuarios.user_name%TYPE;

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    o_mnsje_rspsta := 'p_id_expdnte_anlsiss ' || p_id_expdnte_anlsis;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          o_mnsje_rspsta || ' , ' || sqlerrm,
                          6);

    BEGIN
      SELECT *
        INTO r_fi_g_expedientes_analisis
        FROM fi_g_expedientes_analisis a
       WHERE a.id_expdnte_anlsis = p_id_expdnte_anlsis;

    EXCEPTION
      WHEN no_data_found THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'No se encontró información del expediente análisis ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

      WHEN others THEN
        o_cdgo_rspsta := 1;

        o_mnsje_rspsta := 'Error al consultar la información del expediente análisis ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

    END;

    BEGIN
      --Se valida si el acto ya fue generado
      BEGIN
        SELECT a.id_acto, a.id_slctud
          INTO v_id_acto, v_id_slctud
          FROM fi_g_expedientes_analisis a
         WHERE a.id_expdnte_anlsis = p_id_expdnte_anlsis
           AND NOT a.id_acto IS NULL;

      EXCEPTION
        WHEN no_data_found THEN
          SELECT a.id_slctud
            INTO v_id_slctud
            FROM fi_g_expedientes_analisis a
           WHERE a.id_expdnte_anlsis = p_id_expdnte_anlsis;

        WHEN others THEN
          o_cdgo_rspsta := 1;

          o_mnsje_rspsta := 'Error al consultar si ya fue generado el acto ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

      END;

      IF v_id_acto IS NOT NULL THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := 'El acto ya fue generado ' || p_id_expdnte_anlsis;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);

        RETURN;

      END IF;

      --Se consulta el id_impsto y id expediente.
      BEGIN
        SELECT a.id_impsto, d.id_fsclzcion_expdnte, b.id_sjto_impsto
          INTO v_id_impsto, v_id_fsclzcion_expdnte, v_id_sjto_impsto
          FROM fi_g_expedientes_analisis a
          JOIN fi_g_fiscalizacion_expdnte d
            ON a.id_fsclzcion_expdnte = d.id_fsclzcion_expdnte
          JOIN fi_g_candidatos b
            ON d.id_cnddto = b.id_cnddto
         WHERE a.id_expdnte_anlsis = p_id_expdnte_anlsis;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 3;

          o_mnsje_rspsta := 'No se puedo obtener el impuesto para generar el acto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      v_xml := '<data>
                        <id_expdnte_anlsis>' ||
               p_id_expdnte_anlsis || '</id_expdnte_anlsis>
                        <p_id_impsto>' || v_id_impsto ||
               '</p_id_impsto>
                        <p_id_fsclzcion_expdnte>' ||
               v_id_fsclzcion_expdnte || '</p_id_fsclzcion_expdnte>
                        <cdgo_srie>FI</cdgo_srie>
                      </data>';

      --Se obtiene el sub_impuesto y sujeto_impuesto
      BEGIN
        SELECT 1
          INTO v_ttal_sjto_impsto
          FROM fi_g_expedientes_analisis a
          JOIN fi_g_expndnts_anlsis_dtlle b
            ON a.id_expdnte_anlsis = b.id_expdnte_anlsis
         WHERE a.id_expdnte_anlsis = p_id_expdnte_anlsis
         FETCH FIRST 1 ROWS ONLY;

        v_slct_sjto_impsto := 'select a.id_impsto_sbmpsto,
                                                      b.id_sjto_impsto
                                               from fi_g_expedientes_analisis a
                                               join fi_g_expndnts_anlsis_dtlle b on a.id_expdnte_anlsis = b.id_expdnte_anlsis
                                               where a.id_expdnte_anlsis = ' ||
                              p_id_expdnte_anlsis || '
                                               fetch first 1 rows only';

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 4;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo consultar el sujeto impuesto.';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 4;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo generar la consulta de los sujestos impuestos';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se obtienen las vigencias
      BEGIN
        SELECT count(*)
          INTO v_ttal_vgncias
          FROM fi_g_candidatos a
         INNER JOIN fi_g_candidatos_vigencia b
            ON a.id_cnddto = b.id_cnddto
          JOIN fi_g_fsclzc_expdn_cndd_vgnc d
            ON b.id_cnddto_vgncia = d.id_cnddto_vgncia
          LEFT JOIN v_gf_g_cartera_x_vigencia c
            ON b.vgncia = c.vgncia
           AND b.id_prdo = c.id_prdo
           AND a.id_sjto_impsto = c.id_sjto_impsto
          JOIN fi_g_expedientes_analisis e
            ON d.id_slctud = e.id_slctud
         WHERE e.id_expdnte_anlsis = p_id_expdnte_anlsis
         GROUP BY nvl(c.id_sjto_impsto, a.id_sjto_impsto),
                  b.vgncia,
                  b.id_prdo,
                  nvl(c.vlor_sldo_cptal, 0),
                  nvl(c.vlor_intres, 0)
         FETCH FIRST 1 ROWS ONLY;

        v_slct_vgncias := 'select  nvl(c.id_sjto_impsto, a.id_sjto_impsto) id_sjto_impsto,
                                           b.vgncia,
                                           b.id_prdo,
                                           nvl(c.vlor_sldo_cptal, 0)   vlor_cptal,
                                           nvl(c.vlor_intres, 0)       vlor_intres
                                   from  fi_g_candidatos                   a
                                   inner join fi_g_candidatos_vigencia     b on a.id_cnddto = b.id_cnddto
                                   join  fi_g_fsclzc_expdn_cndd_vgnc       d on b.id_cnddto_vgncia = d.id_cnddto_vgncia
                                   left  join v_gf_g_cartera_x_vigencia    c on b.vgncia    = c.vgncia and b.id_prdo = c.id_prdo
                                                                             and a.id_sjto_impsto = c.id_sjto_impsto
                                   join  fi_g_expedientes_analisis         e on d.id_slctud = e.id_slctud
                                   where e.id_expdnte_anlsis = ' ||
                          p_id_expdnte_anlsis || '
                                   group by nvl(c.id_sjto_impsto, a.id_sjto_impsto),
                                            b.vgncia,
                                            b.id_prdo,
                                            nvl(c.vlor_sldo_cptal, 0),
                                            nvl(c.vlor_intres, 0)';

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 5;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se encontraron vigencias disponible para el expediente.';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 5;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo generar la consulta de las vigencias';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se obtiene los responsables
      BEGIN
        SELECT 1
          INTO v_ttal_rspsnble
          FROM fi_g_expndnts_anlsis_dtlle a
          JOIN v_si_i_sujetos_responsable b
            ON a.id_sjto_impsto = b.id_sjto_impsto
         WHERE a.id_expdnte_anlsis = p_id_expdnte_anlsis
           AND b.prncpal_s_n = 'S'
           AND b.actvo = 'S'
         FETCH FIRST 1 ROWS ONLY;

        v_slct_rspnsble := 'select  b.idntfccion_rspnsble idntfccion,
                                                b.prmer_nmbre,
                                                b.sgndo_nmbre,
                                                b.prmer_aplldo,
                                                b.sgndo_aplldo,
                                                b.cdgo_idntfccion_tpo,
                                                b.drccion drccion_ntfccion,
                                                b.id_pais id_pais_ntfccion,
                                                b.id_mncpio id_mncpio_ntfccion,
                                                b.id_dprtmnto id_dprtmnto_ntfccion,
                                                null email,
                                                null tlfno
                                        from fi_g_expndnts_anlsis_dtlle             a
                                        join v_si_i_sujetos_responsable  b   on  a.id_sjto_impsto   =   b.id_sjto_impsto
                                        where a.id_expdnte_anlsis = ' ||
                           p_id_expdnte_anlsis || '
                                        and b.prncpal_s_n = ''S''
                                        and b.actvo = ''S''
                                        fetch first 1 rows only';

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se encontró responsable principal activo';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 6;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo generar la consulta de los responsables';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se definie codigo del acto tipo
      IF p_cdgo_rspta = 'A' THEN
        v_cdgo_acto_tpo := 'ANA';

      ELSIF p_cdgo_rspta = 'R' THEN
        v_cdgo_acto_tpo := 'ANR';

      ELSE
        o_cdgo_rspsta := 7;

        o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                          ' No se puede determinar el tipo de acto';

        RAISE v_error;

      END IF;

      --Se obtiene el id_acto_tpo del tipo de acto
      BEGIN
        SELECT id_acto_tpo
          INTO v_id_acto_tpo
          FROM gn_d_actos_tipo
         WHERE cdgo_clnte = p_cdgo_clnte
           AND cdgo_acto_tpo = v_cdgo_acto_tpo;

        o_mnsje_rspsta := 'v_id_acto_tpo ' || v_id_acto_tpo;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 8;

          o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                            'No se encontrado el tipo de acto, se debe parametrizar el tipo de acto. ' ||
                            sqlerrm;

          RAISE v_error;

        WHEN others THEN
          o_cdgo_rspsta := 9;

          o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                            ' Error al encontrar el tipo de acto: ' ||
                            sqlerrm;

          RAISE v_error;

      END; -- Fin 3 Consulta el id del tipo del acto

      --Se construye el json del acto
      BEGIN
        v_json_acto := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                             p_cdgo_acto_orgen     => 'FISAN',
                                                             p_id_orgen            => p_id_expdnte_anlsis,
                                                             p_id_undad_prdctra    => p_id_expdnte_anlsis,
                                                             p_id_acto_tpo         => v_id_acto_tpo,
                                                             p_acto_vlor_ttal      => 0,
                                                             p_cdgo_cnsctvo        => 'ANE',
                                                             p_id_acto_rqrdo_hjo   => NULL,
                                                             p_id_acto_rqrdo_pdre  => NULL,
                                                             p_fcha_incio_ntfccion => sysdate,
                                                             p_id_usrio            => p_id_usrio,
                                                             p_slct_sjto_impsto    => v_slct_sjto_impsto,
                                                             p_slct_vgncias        => v_slct_vgncias,
                                                             p_slct_rspnsble       => v_slct_rspnsble);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 10;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo generar el json para generar el acto ' ||
                            ' , ' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se genera el acto
      BEGIN
        pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => p_cdgo_clnte,
                                         p_json_acto    => v_json_acto,
                                         o_id_acto      => v_id_acto,
                                         o_cdgo_rspsta  => o_cdgo_rspsta,
                                         o_mnsje_rspsta => o_mnsje_rspsta);

        IF o_cdgo_rspsta > 0 THEN
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                                ' , ' || sqlerrm,
                                6);

          RETURN;

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 11;

          o_mnsje_rspsta := 'Error al llamar el procedimiento prc_rg_acto ' ||
                            ' , ' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                                ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      --Se actualiza el campo id_acto
      BEGIN
        UPDATE fi_g_expedientes_analisis
           SET id_acto = v_id_acto
         WHERE id_expdnte_anlsis = p_id_expdnte_anlsis;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 12;

          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el campo acto en la tabla fiscalización expediente acto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_cdgo_rspsta || '-' || o_mnsje_rspsta ||
                                ' , ' || sqlerrm,
                                6);

          RETURN;

      END;

      -- Se genera el html de la plantilla
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            nmbre_up,
                            v_nl,
                            ' v_id_acto_tpo: ' || v_id_acto_tpo,
                            6);

      BEGIN
        BEGIN
          SELECT a.id_plntlla
            INTO v_id_plntlla
            FROM gn_d_plantillas a
           WHERE id_acto_tpo = v_id_acto_tpo
             AND actvo = 'S';

        EXCEPTION
          WHEN no_data_found THEN
            SELECT a.dscrpcion
              INTO v_dscrpcion_acto
              FROM gn_d_actos_tipo a
             WHERE a.id_acto_tpo = v_id_acto_tpo;

            o_cdgo_rspsta := 13;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se encuentra parametrizada la plantilla para el acto ' ||
                              v_dscrpcion_acto;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

          WHEN others THEN
            o_cdgo_rspsta := 13;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'Erro al consultar la plantilla.';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RETURN;

        END;

        /*Enviado la identificación del expediente analisis en la estructura
        xml para generar el documento y el id plantilla consultado*/
        v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto('{"id_expdnte_anlsis":"' ||
                                                       p_id_expdnte_anlsis || '"}',
                                                       v_id_plntlla);

        --insert into gti_aux (col1, col2) values ('Plantilla del acto de analisis de expedientes', v_dcmnto);

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 14;

          o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                            ' Error al consultar la plantilla. ' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);

          RAISE v_error;

      END; -- Fin Se genera el html de la plantilla

      IF v_dcmnto IS NOT NULL THEN
        -- Actualizacion del acto en la tabla analisis expediente
        BEGIN
          UPDATE fi_g_expedientes_analisis
             SET dcmnto = v_dcmnto
           WHERE id_expdnte_anlsis = p_id_expdnte_anlsis;

          o_mnsje_rspsta := ' Actualizo fi_g_expedientes_analisis  ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 15;

            o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                              ' Error al actualizar el acto en novedades persona. Error:' ||
                              sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RAISE v_error;

        END; -- Fin Actualizacion del acto en la tabla novedades persona

        -- Generacion del Reporte
        -- Consultamos los datos del reporte
        BEGIN
          SELECT b.*
            INTO v_gn_d_reportes
            FROM gn_d_plantillas a
            JOIN gn_d_reportes b
              ON a.id_rprte = b.id_rprte
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.id_plntlla = v_id_plntlla;

          o_mnsje_rspsta := 'Reporte: ' || v_gn_d_reportes.nmbre_cnslta || ', ' ||
                            v_gn_d_reportes.nmbre_plntlla || ', ' ||
                            v_gn_d_reportes.cdgo_frmto_plntlla || ', ' ||
                            v_gn_d_reportes.cdgo_frmto_tpo || ',' ||
                            v_gn_d_reportes.id_rprte;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

        EXCEPTION
          WHEN no_data_found THEN
            o_cdgo_rspsta := 16;

            o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                              ' Problemas al consultar reporte id_rprte: ' ||
                              v_gn_d_reportes.id_rprte;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RAISE v_error;

          WHEN others THEN
            o_cdgo_rspsta := 17;

            o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                              ' Problemas al consultar reporte, ' ||
                              o_cdgo_rspsta || ' - ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RAISE v_error;

        END; -- Fin Consultamos los datos del reporte

        --Creación la sesión para envíar los datos a la aplicación 66000 pagina 37 para obtener el documento
        apex_session.attach(p_app_id     => 66000,
                            p_page_id    => 37,
                            p_session_id => v('APP_SESSION'));

        apex_util.set_session_state('P37_JSON',
                                    '{"id_expdnte_anlsis":"' ||
                                    p_id_expdnte_anlsis || '"}');

        apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);

        apex_util.set_session_state('P37_ID_RPRTE',
                                    v_gn_d_reportes.id_rprte);

        BEGIN
          v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                                 p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,
                                                 p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,
                                                 p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,
                                                 p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 18;

            o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                              ' Error al generar el documento: ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' , ' || sqlerrm,
                                  6);

            RAISE v_error;

        END;

        IF v_blob IS NOT NULL THEN
          --Se procede a actualizar el acto
          BEGIN
            pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                             p_id_acto         => v_id_acto,
                                             p_ntfccion_atmtca => 'N');

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 20;

              o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                                'Problemas al ejecutar proceso que actualiza el acto';

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ',' || sqlerrm,
                                    6);

              RETURN;

          END;

          o_mnsje_rspsta := 'v_id_acto => ' || v_id_acto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);

          -- Bifurcacion
          apex_session.attach(p_app_id     => v_app_id,
                              p_page_id    => v_page_id,
                              p_session_id => v('APP_SESSION'));

        ELSE
          o_cdgo_rspsta := 21;

          o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                            'Problemas generando el blob del acto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);

          RETURN;

        END IF;

      ELSE
        o_cdgo_rspsta := 22;

        o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                          ' No se genero el acto: ' || o_mnsje_rspsta ||
                          sqlerrm;

        RAISE v_error;

      END IF;

      -- Valida creación del acto
      IF o_cdgo_rspsta = 0 AND v_id_acto > 0 THEN
        -- Adicionamos las propiedades a PQR
        o_mnsje_rspsta := 'p_id_expdnte_anlsis ' || p_id_expdnte_anlsis;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        IF v_id_slctud IS NOT NULL THEN
          o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                            'Iniciando propiedades de pqr';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);

          BEGIN
            SELECT a.id_instncia_fljo, b.id_mtvo
              INTO v_id_instncia_fljo, v_id_mtvo
              FROM fi_g_expedientes_analisis a
              JOIN pq_g_solicitudes_motivo b
                ON a.id_slctud = b.id_slctud
             WHERE a.id_expdnte_anlsis = p_id_expdnte_anlsis;

            o_mnsje_rspsta := 'v_id_instncia_fljo => ' ||
                              v_id_instncia_fljo || '- v_id_mtvo => ' ||
                              v_id_mtvo || '- v_id_acto => ' || v_id_acto ||
                              '- p_cdgo_rspta => ' || p_cdgo_rspta;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ',' || sqlerrm,
                                  6);

            pkg_pl_workflow_1_0.prc_rg_propiedad_evento(p_id_instncia_fljo => v_id_instncia_fljo,
                                                        p_cdgo_prpdad      => 'MTV',
                                                        p_vlor             => v_id_mtvo);

            pkg_pl_workflow_1_0.prc_rg_propiedad_evento(p_id_instncia_fljo => v_id_instncia_fljo,
                                                        p_cdgo_prpdad      => 'ACT',
                                                        p_vlor             => v_id_acto);

            pkg_pl_workflow_1_0.prc_rg_propiedad_evento(p_id_instncia_fljo => v_id_instncia_fljo,
                                                        p_cdgo_prpdad      => 'USR',
                                                        p_vlor             => p_id_usrio);

            pkg_pl_workflow_1_0.prc_rg_propiedad_evento(p_id_instncia_fljo => v_id_instncia_fljo,
                                                        p_cdgo_prpdad      => 'RSP',
                                                        p_vlor             => p_cdgo_rspta);

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 12;

              o_mnsje_rspsta := 'Error al cerrar propiedades PQR ' ||
                                sqlerrm;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);

              ROLLBACK;

              RETURN;

          END; -- Fin Adicionamos las propiedades a PQR

        END IF;

        o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                          'Finalizo propiedades de pqr';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ',' || sqlerrm,
                              6);

        -- Se finaliza el flujo de analisis de expediente
        BEGIN
          pkg_pl_workflow_1_0.prc_rg_finalizar_instancia(p_id_instncia_fljo => r_fi_g_expedientes_analisis.id_instncia_fljo,
                                                         p_id_fljo_trea     => p_id_fljo_trea,
                                                         p_id_usrio         => p_id_usrio,
                                                         o_error            => v_error2,
                                                         o_msg              => o_mnsje_rspsta);

          IF v_error2 = 'N' THEN
            o_cdgo_rspsta := 15;

            o_mnsje_rspsta := 'Error al cerrar el flujo. ' ||
                              o_mnsje_rspsta;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_si_novedades_persona.prc_rc_novedad_persona',
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);

            ROLLBACK;

            RETURN;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 14;

            o_mnsje_rspsta := 'Error al cerrar el flujo' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  'pkg_si_novedades_persona.prc_rc_novedad_persona',
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);

            ROLLBACK;

            RETURN;

        END; -- Fin Se finaliza el flujo de la novedad

        BEGIN
          IF p_cdgo_rspta = 'A' THEN
            UPDATE fi_g_fsclzc_expdn_cndd_vgnc a
               SET a.estdo = 'P'
             WHERE a.id_fsclzcion_expdnte =
                   r_fi_g_expedientes_analisis.id_fsclzcion_expdnte;

          ELSIF p_cdgo_rspta = 'R' THEN
            NULL;

          ELSE
            o_cdgo_rspsta := 7;

            o_mnsje_rspsta := 'N°: ' || o_cdgo_rspsta ||
                              ' No se puede determinar el tipo de acto';

            RAISE v_error;

          END IF;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := 'No se pudo actualizar el estado del expediente';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

            RETURN;

        END;

      END IF;

    END;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Saliendo ' || systimestamp,
                          6);

  END prc_rg_acto_analisis_expediente;

  PROCEDURE prc_rg_sancion_nei(p_cdgo_clnte           IN number,
                               p_id_fsclzcion_expdnte IN number,
                               p_id_cnddto            IN number,
                               p_idntfccion_sjto      IN number,
                               p_id_sjto_impsto       IN number,
                               p_id_prgrma            IN number,
                               p_id_sbprgrma          IN number,
                               p_id_instncia_fljo     IN number,
                               p_cdgo_acto_tpo        IN varchar2,
                               o_cdgo_rspsta          OUT number,
                               o_mnsje_rspsta         OUT varchar2) AS
    v_nl number;

    nmbre_up varchar2(200) := 'pkg_fi_fiscalizacion.prc_rg_sancion_nei';

    v_id_fsclzcion_expdnte number;

    v_id_impsto_acto number;

    v_id_acto_tpo number;

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_vgncia number;

    v_prdo number;

    v_id_prdo number;

    v_cdgo_prdcdad varchar2(5);

    v_base number;

    v_id_sjto_tpo number;

    v_sql CLOB;

    v_actos sys_refcursor; --recibe los conceptos a los cuales se registran las sanciones

    TYPE v_rgstro IS record(
      id_impsto                  number,
      id_impsto_sbmpsto          number,
      id_sjto_impsto             number,
      id_cnddto_vgncia           number,
      vgncia                     number,
      id_dclrcion_vgncia_frmlrio number,
      prdo                       number,
      id_prdo                    number,
      id_cncpto                  number,
      id_impsto_acto_cncpto      number,
      dscrpcion                  varchar2(1000),
      orden                      number,
      base                       number);

    TYPE v_tbla IS TABLE OF v_rgstro;

    v_tbla_dnmca v_tbla;

    --Se consulta si el candidato tiene sancion por no declarar
  BEGIN
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    BEGIN
      SELECT id_impsto, id_impsto_sbmpsto
        INTO v_id_impsto, v_id_impsto_sbmpsto
        FROM fi_g_candidatos
       WHERE id_cnddto = p_id_cnddto;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 2;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo consultar el impuesto subimpuesto';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' - ' || sqlerrm,
                              6);

        RETURN;

    END;

    BEGIN
      UPDATE fi_g_fiscalizacion_sancion
         SET actvo = 'N'
       WHERE id_fsclzcion_expdnte = p_id_fsclzcion_expdnte;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 7;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          ' No se pudo desactivar la sanción del pliego de cargos';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' - ' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

    BEGIN
      SELECT a.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM fi_g_fiscalizacion_sancion a
        JOIN df_i_impuestos_acto_concepto b
          ON b.id_impsto_acto_cncpto = a.id_impsto_acto_cncpto
        JOIN df_i_impuestos_acto c
          ON b.id_impsto_acto = c.id_impsto_acto
         AND c.cdgo_impsto_acto = p_cdgo_acto_tpo
         AND c.id_impsto = v_id_impsto
         AND c.id_impsto_sbmpsto = v_id_impsto_sbmpsto
       WHERE a.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte
         AND rownum = 1
         AND a.actvo = 'S';

    EXCEPTION
      WHEN no_data_found THEN
        --se validad si existe el impuesto acto PCN
        BEGIN
          SELECT b.id_impsto_acto, a.id_acto_tpo
            INTO v_id_impsto_acto, v_id_acto_tpo
            FROM gn_d_actos_tipo a
            JOIN df_i_impuestos_acto b
              ON a.cdgo_acto_tpo = b.cdgo_impsto_acto
            JOIN fi_g_candidatos c
              ON c.id_cnddto = p_id_cnddto
             AND b.id_impsto_sbmpsto = c.id_impsto_sbmpsto
           WHERE a.cdgo_clnte = p_cdgo_clnte
             AND a.cdgo_acto_tpo = p_cdgo_acto_tpo
             AND b.id_impsto_sbmpsto = v_id_impsto_sbmpsto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := o_cdgo_rspsta ||
                              ' - No se encontro el impuesto acto';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' - ' || sqlerrm,
                                  6);

            ROLLBACK;

            RETURN;

        END;

        --se extrae la informacion relacionada al tipo de impuesto y el tipo de declaracion.
        BEGIN
          v_sql := 'select a.id_impsto,
                                        a.id_impsto_sbmpsto ,
                                        a.id_sjto_impsto,
                                        b.id_cnddto_vgncia,
                                        b.vgncia,
                                        b.id_dclrcion_vgncia_frmlrio,
                                        d.prdo,
                                        b.id_prdo,
                                        c.id_cncpto,
                                        c.id_impsto_acto_cncpto,
                                        e.dscrpcion ,
                                        c.orden ,
                                        0 base
                                from fi_g_candidatos           a
                                join fi_g_candidatos_vigencia       b   on  a.id_cnddto =   b.id_cnddto
                                join fi_g_fsclzc_expdn_cndd_vgnc    f   on  b.id_cnddto_vgncia  = f.id_cnddto_vgncia
                                join df_i_impuestos_acto_concepto   c   on  b.vgncia    =   c.vgncia
                                                                        and b.id_prdo   =   c.id_prdo
                                join df_i_periodos                  d   on  b.id_prdo   =   d.id_prdo
                                join df_i_conceptos                 e   on  c.id_cncpto =   e.id_cncpto
                                where c.id_impsto_acto = ' ||
                   v_id_impsto_acto || '
                                  and a.id_cnddto = ' ||
                   p_id_cnddto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 2;

            o_mnsje_rspsta := o_cdgo_rspsta ||
                              ' - No se pudo consultar los conceptos a liquidar sancion';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || '-' || sqlerrm,
                                  6);

        END;

        --se consulta cada acto sancion del candidato
        OPEN v_actos FOR v_sql;

        LOOP
          FETCH v_actos bulk COLLECT
            INTO v_tbla_dnmca LIMIT 5000;

          EXIT WHEN v_tbla_dnmca.count = 0;

          FOR i IN 1 .. v_tbla_dnmca.count LOOP
            --Se consulta la vigencia, periodo y periodicidad del candidato
            --para buscar en la fuente de informacion externa
            BEGIN
              SELECT a.vgncia, d.id_prdo, d.prdo, d.cdgo_prdcdad
                INTO v_vgncia, v_id_prdo, v_prdo, v_cdgo_prdcdad
                FROM fi_g_candidatos_vigencia a
                JOIN fi_g_candidatos b
                  ON a.id_cnddto = b.id_cnddto
                JOIN fi_g_fiscalizacion_expdnte c
                  ON a.id_cnddto = c.id_cnddto
                 AND c.id_fsclzcion_expdnte = p_id_fsclzcion_expdnte
                JOIN df_i_periodos d
                  ON a.id_prdo = d.id_prdo
               WHERE a.id_cnddto_vgncia = v_tbla_dnmca(i).id_cnddto_vgncia;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 3;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  ' Problema al extraer la vigencia, periodo y periodicidad del candidato';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

                RETURN;

            END;

            --se consulta en fuente de informacion externa la base de la sacion
            BEGIN
              SELECT a.vlr_base
                INTO v_base
                FROM fi_g_fuentes_origen a
               WHERE a.idntfccion = p_idntfccion_sjto
                 AND a.vgncia = v_vgncia
                 AND a.prdo = v_prdo
                 AND a.cdgo_prdcdad = v_cdgo_prdcdad
                 AND a.cdgo_trbto_acto = p_cdgo_acto_tpo;

            EXCEPTION
              WHEN no_data_found THEN
                o_cdgo_rspsta := 3;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  ' No hay registro para la sanción base, por favor cargue la sanción.';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

                RETURN;

                CONTINUE;

              WHEN others THEN
                o_cdgo_rspsta := 4;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  ' Error al consultar el valor base sancion';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

                RETURN;

                CONTINUE;

            END;

            BEGIN
              SELECT a.id_sjto_tpo
                INTO v_id_sjto_tpo
                FROM si_i_personas a
               WHERE a.id_sjto_impsto = p_id_sjto_impsto;

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 6;

                o_mnsje_rspsta := o_cdgo_rspsta ||
                                  ' - No se encontro el sujeto tipo para el p_id_sjto_impsto' ||
                                  p_id_sjto_impsto;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || '-' || sqlerrm,
                                      6);

            END;

            BEGIN
              INSERT INTO fi_g_fiscalizacion_sancion
                (id_fsclzcion_expdnte,
                 id_acto_tpo,
                 id_cncpto,
                 vgncia,
                 prdo,
                 id_prdo,
                 id_impsto_acto_cncpto,
                 id_cnddto_vgncia,
                 bse,
                 orden)
              VALUES
                (p_id_fsclzcion_expdnte,
                 v_id_acto_tpo,
                 v_tbla_dnmca          (i).id_cncpto,
                 v_vgncia,
                 v_prdo,
                 v_id_prdo,
                 v_tbla_dnmca          (i).id_impsto_acto_cncpto,
                 v_tbla_dnmca          (i).id_cnddto_vgncia,
                 v_base,
                 v_tbla_dnmca          (i).orden);

            EXCEPTION
              WHEN others THEN
                o_cdgo_rspsta := 7;

                o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                  ' No se pudo registrar la informacion para la sancion';

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      NULL,
                                      nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ' - ' || sqlerrm,
                                      6);

                ROLLBACK;

                RETURN;

            END;

          END LOOP;

        END LOOP;

        CLOSE v_actos;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - Saliendo con exito - ' ||
                          systimestamp;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

      WHEN others THEN
        o_cdgo_rspsta := 8;

        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          ' Error al intentar registrar la sancion';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

        ROLLBACK;

        RETURN;

    END;

  END prc_rg_sancion_nei;

  PROCEDURE prc_ac_rg_actos_fiscalizacion(p_nmro_acto_dsplay IN varchar2,
                                          p_cdgo_clnte       IN number,
                                          p_id_acto_tpo      IN number,
                                          o_cdgo_rspsta      OUT number,
                                          o_mnsje_rspsta     OUT varchar2) AS
    v_nl number;

    v_nmbre_up varchar2(1000) := 'pkg_fi_fiscalizacion.prc_ac_rg_actos_fiscalizacion';

    v_gnra_acto varchar2(10);

    v_id_dtrmncion_lte number;

    v_gn_d_reportes gn_d_reportes%rowtype;

    v_blob blob;

    v_id_usrio_apex number;

    v_id_sjto_impsto number;

    v_id_rprte number;

    v_id_fsclzcion_expdnte number;

    v_id_impsto number;

    v_id_acto number;

    v_id_plntlla number;

    v_id_fsclzcion_expdnte_acto number;

    v_id_dcmnto number;

    v_id_instncia_fljo number;

    v_idntfccion_sjto varchar2(100);

    v_xml CLOB;

    v_json_envia json_object_t;

    v_dcmnto CLOB;

    l_blob_len number;

    v_nmbre_cnslta varchar2(1000);

    v_nmbre_plntlla varchar2(1000);

    v_cdgo_frmto_plntlla varchar2(100);

    v_cdgo_frmto_tpo varchar2(100);

    v_file_blob blob;

    v_file_bfile bfile;

  BEGIN
    BEGIN
      o_cdgo_rspsta := 0;

      o_mnsje_rspsta := 'Acto OK';

      v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                          NULL,
                                          'pkg_fi_fiscalizacion.prc_ac_rg_actos_fiscalizacion');

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ',' || sqlerrm,
                            6);

      BEGIN
        SELECT a.id_fsclzcion_expdnte,
               b.id_fsclzcion_expdnte_acto,
               c.id_impsto,
               c.id_sjto_impsto,
               b.id_acto,
               b.id_rprte,
               b.id_plntlla,
               d.id_dcmnto,
               a.id_instncia_fljo,
               f.idntfccion_sjto
          INTO v_id_fsclzcion_expdnte,
               v_id_fsclzcion_expdnte_acto,
               v_id_impsto,
               v_id_sjto_impsto,
               v_id_acto,
               v_id_rprte,
               v_id_plntlla,
               v_id_dcmnto,
               v_id_instncia_fljo,
               v_idntfccion_sjto
          FROM fi_g_fiscalizacion_expdnte a
          JOIN fi_g_fsclzcion_expdnte_acto b
            ON b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte
          JOIN fi_g_candidatos c
            ON c.id_cnddto = a.id_cnddto
          JOIN v_si_i_sujetos_impuesto f
            ON c.id_sjto_impsto = f.id_sjto_impsto
          JOIN gn_g_actos d
            ON d.id_acto = b.id_acto
         WHERE d.nmro_acto_dsplay = p_nmro_acto_dsplay
           AND b.id_acto_tpo = p_id_acto_tpo;

      EXCEPTION
        WHEN no_data_found THEN
          o_cdgo_rspsta := 10;

          o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||
                            ': No se encontró información del reporte';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          ROLLBACK;

          RETURN;

        WHEN others THEN
          o_cdgo_rspsta := 20;

          o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||
                            ': Error al consultar la información del reporte ' ||
                            sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          ROLLBACK;

          RETURN;

      END;

      BEGIN
        SELECT b.file_blob, b.file_bfile
          INTO v_file_blob, v_file_bfile
          FROM fi_g_fsclzcion_expdnte_acto a
          JOIN v_gn_g_actos b
            ON a.id_acto = b.id_acto
          LEFT JOIN gd_g_documentos c
            ON b.id_dcmnto = c.id_dcmnto
         WHERE id_fsclzcion_expdnte_acto = v_id_fsclzcion_expdnte_acto;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 20;

          o_mnsje_rspsta := 'Error al recuperar datos de blobs: ' ||
                            sqlerrm;

          RETURN;

      END;

      IF not ((v_file_blob IS NULL AND v_file_bfile IS NULL) OR
          (v_file_blob IS NOT NULL AND
          dbms_lob.getlength(v_file_blob) <= 5000) OR
          (v_file_bfile IS NOT NULL AND
          dbms_lob.getlength(v_file_bfile) <= 5000)) THEN
        o_cdgo_rspsta := 30;

        o_mnsje_rspsta := 'Error en proceso de generar acto: PDF valido.';

        RETURN;

      END IF;

      --Se obtiene informacion del reporte
      BEGIN
        SELECT a.nmbre_cnslta,
               a.nmbre_plntlla,
               a.cdgo_frmto_plntlla,
               a.cdgo_frmto_tpo
          INTO v_nmbre_cnslta,
               v_nmbre_plntlla,
               v_cdgo_frmto_plntlla,
               v_cdgo_frmto_tpo
          FROM gn_d_reportes a
         WHERE a.id_rprte = v_id_rprte;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 40;

          o_mnsje_rspsta := 'Problema al obtener informacion del reporte';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          ROLLBACK;

          RETURN;

      END;

      v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => '[{"ID_SJTO_IMPSTO": ' ||
                                                                     v_id_sjto_impsto || ',
                                                                 "ID_INSTNCIA_FLJO": ' ||
                                                                     v_id_instncia_fljo || ',
                                                                 "IDNTFCCION": ' ||
                                                                     v_idntfccion_sjto || ',
                                                                 "ID_ACTO_TPO": ' ||
                                                                     p_id_acto_tpo || '}]',
                                                     p_id_plntlla => v_id_plntlla);

      v_xml := '<data>
                <id_fsclzcion_expdnte_acto>' ||
               v_id_fsclzcion_expdnte_acto || '</id_fsclzcion_expdnte_acto>
                <p_id_impsto>' || v_id_impsto ||
               '</p_id_impsto>
                <p_id_fsclzcion_expdnte>' ||
               v_id_fsclzcion_expdnte || '</p_id_fsclzcion_expdnte>
                <cdgo_srie>FI</cdgo_srie>
                <id_sjto_impsto>' || v_id_sjto_impsto ||
               '</id_sjto_impsto>
                <id_acto>' || v_id_acto ||
               '</id_acto>
                <cdgo_clnte>' || p_cdgo_clnte ||
               '</cdgo_clnte>
             </data>';

      BEGIN
        IF v('APP_SESSION') IS NULL THEN
          apex_session.create_session(p_app_id   => 66000,
                                      p_page_id  => 2,
                                      p_username => '1111111111');

        ELSE
          apex_session.attach(p_app_id     => 66000,
                              p_page_id    => 2,
                              p_session_id => v('APP_SESSION'));

        END IF;

      EXCEPTION
        WHEN others THEN
          o_cdgo_rspsta := 30;

          o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                            'Error al setear los valores de la sesión';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);

          ROLLBACK;

          RETURN;

      END;

      apex_util.set_session_state('P2_XML', v_xml);

      apex_util.set_session_state('P2_ID_RPRTE', v_id_rprte);

      apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);

      --  apex_util.set_session_state('F_FRMTO_MNDA', 'FM$999G999G999G999G999G999G990');
      v_json_envia := json_object_t();

      v_json_envia.put('ID_SJTO_IMPSTO', v_id_sjto_impsto);

      v_json_envia.put('ID_INSTNCIA_FLJO', v_id_instncia_fljo);

      v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                             p_report_query_name  => v_nmbre_cnslta,
                                             p_report_layout_name => v_nmbre_plntlla,
                                             p_report_layout_type => v_cdgo_frmto_plntlla,
                                             p_document_format    => v_cdgo_frmto_tpo);

      IF v_blob IS NOT NULL AND dbms_lob.getlength(v_blob) > 5000 THEN
        --se valida si el id_documento existe en la tabla gd_g_documentos
        BEGIN
          SELECT id_dcmnto
            INTO v_id_dcmnto
            FROM gd_g_documentos
           WHERE id_dcmnto = v_id_dcmnto;

        EXCEPTION
          WHEN others THEN
            UPDATE gn_g_actos
               SET id_dcmnto = NULL, indcdor_ntfccion = 'N'
             WHERE id_acto = v_id_acto
               AND id_acto_tpo = p_id_acto_tpo;

            COMMIT;

        END;

        BEGIN
          pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                           p_id_acto         => v_id_acto,
                                           p_ntfccion_atmtca => 'N');

        EXCEPTION
          WHEN others THEN
            ROLLBACK;

            o_cdgo_rspsta := 60;

            o_mnsje_rspsta := 'Error al actualizar el blob: ' || sqlerrm;

            RETURN;

        END;

      ELSE
        ROLLBACK;

        o_cdgo_rspsta := 70;

        o_mnsje_rspsta := 'Blob mal generado, longitud: ' ||
                          dbms_lob.getlength(v_blob);

        RETURN;

      END IF; -- FIn Actualizar el blob en la tabla de acto

    END;

    COMMIT;

  EXCEPTION
    WHEN others THEN
      o_cdgo_rspsta := 99;

      o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||
                        ': Error en el procedimiento ' || sqlerrm;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            NULL,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

      ROLLBACK;

      RETURN;

  END prc_ac_rg_actos_fiscalizacion;

  FUNCTION fnc_co_tabla_estmplls_dtll(p_id_sjto_impsto   IN number,
                                      p_id_instncia_fljo IN number,
                                      p_cdgo_clnte       IN number)
    RETURN CLOB AS
    v_tabla CLOB;

    v_id_impsto number;

    v_id_impsto_sbmpsto number;

    v_id_impsto_acto number;

    v_fcha_expdcion date;

    v_numero_contrato varchar2(30);

    v_objeto varchar2(500);

    v_valor_contrato varchar2(100);

    v_fcha_pago date;

    o_mnsje_rspsta varchar2(1000);

    nmbre_up varchar2(100) := 'pkg_fi_fiscalizacion.fnc_co_tabla_estmplls_dtll';

    v_nl number;

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, nmbre_up);

    BEGIN
      SELECT b.id_impsto,
             b.id_impsto_sbmpsto,
             d.id_acto_tpo,
             trunc(c.fcha_expdcion) AS fcha_expdcion,
             e.nmro_cntrto,
             e.objeto,
             d.bse,
             trunc(e.fcha_pago) AS fcha_pago
        INTO v_id_impsto,
             v_id_impsto_sbmpsto,
             v_id_impsto_acto,
             v_fcha_expdcion,
             v_numero_contrato,
             v_objeto,
             v_valor_contrato,
             v_fcha_pago
        FROM fi_g_fiscalizacion_expdnte a
        JOIN fi_g_candidatos b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_candidatos_vigencia c
          ON b.id_cnddto = c.id_cnddto
        JOIN fi_g_fiscalizacion_sancion d
          ON a.id_fsclzcion_expdnte = d.id_fsclzcion_expdnte
        JOIN fi_g_fscalizacion_renta e
          ON d.id_fsclzcn_rnta = e.id_fsclzcn_rnta
       WHERE a.id_instncia_fljo = p_id_instncia_fljo
         AND rownum = 1;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    v_tabla := '<table align="center" border="1px"  style="border-collapse: collapse; border-color: black !important;">
                            <tr><th style="padding: 10px !important;">Contrato No.</th>';

    BEGIN
      FOR c_estmplls_nmbre IN (SELECT a.dscrpcion_cncpto AS estampilla
                                 FROM table(pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte              => p_cdgo_clnte,
                                                                                         p_id_impsto               => v_id_impsto,
                                                                                         p_id_impsto_sbmpsto       => v_id_impsto_sbmpsto,
                                                                                         p_id_impsto_acto          => v_id_impsto_acto,
                                                                                         p_id_sjto_impsto          => p_id_sjto_impsto,
                                                                                         p_json_cncptos            => NULL,
                                                                                         p_vlor_bse                => v_valor_contrato,
                                                                                         p_indcdor_usa_extrnjro    => 'N',
                                                                                         p_indcdor_usa_mxto        => 'N',
                                                                                         p_fcha_expdcion           => to_date(v_fcha_expdcion),
                                                                                         p_fcha_vncmnto            => to_date(v_fcha_pago),
                                                                                         p_indcdor_lqdccion_adcnal => 'N',
                                                                                         p_id_rnta_antrior         => 'N',
                                                                                         p_indcdor_cntrto_gslna    => 'N')) a) LOOP
        v_tabla := v_tabla || '<th style="padding: 10px !important;">' ||
                   c_estmplls_nmbre.estampilla || '</th>';

      END LOOP;

    EXCEPTION
      WHEN no_data_found THEN
        NULL;

      WHEN others THEN
        o_mnsje_rspsta := 'No existe liquidación de Renta';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    v_tabla := v_tabla || '</tr>';

    v_tabla := v_tabla || '<tr><td style="text-align:center;">' ||
               v_numero_contrato || '</td>';

    BEGIN
      FOR c_estmplls_vlor IN (SELECT a.vlor_lqddo AS valor_estampilla
                                FROM table(pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte              => p_cdgo_clnte,
                                                                                        p_id_impsto               => v_id_impsto,
                                                                                        p_id_impsto_sbmpsto       => v_id_impsto_sbmpsto,
                                                                                        p_id_impsto_acto          => v_id_impsto_acto,
                                                                                        p_id_sjto_impsto          => p_id_sjto_impsto,
                                                                                        p_json_cncptos            => NULL,
                                                                                        p_vlor_bse                => v_valor_contrato,
                                                                                        p_indcdor_usa_extrnjro    => 'N',
                                                                                        p_indcdor_usa_mxto        => 'N',
                                                                                        p_fcha_expdcion           => to_date(v_fcha_expdcion),
                                                                                        p_fcha_vncmnto            => to_date(v_fcha_pago),
                                                                                        p_indcdor_lqdccion_adcnal => 'N',
                                                                                        p_id_rnta_antrior         => 'N',
                                                                                        p_indcdor_cntrto_gslna    => 'N')) a) LOOP
        v_tabla := v_tabla || '<td style="text-align:center;">' || '$' ||
                   to_char(c_estmplls_vlor.valor_estampilla,
                           'FM9G999G999G999G999G999G999') || '</td>';

      END LOOP;

    EXCEPTION
      WHEN no_data_found THEN
        NULL;

      WHEN others THEN
        o_mnsje_rspsta := 'No existe liquidación de Renta';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || '-' || sqlerrm,
                              6);

    END;

    v_tabla := v_tabla || '</tr></table>';

    RETURN v_tabla;

  END fnc_co_tabla_estmplls_dtll;

  PROCEDURE prc_rg_seleccion_cnddts_archvo(p_cdgo_clnte    IN number,
                                           p_id_prcso_crga IN number,
                                           p_id_lte        IN number,
                                           o_cdgo_rspsta   OUT number,
                                           o_mnsje_rspsta  OUT varchar2) AS
    e_no_encuentra_lote EXCEPTION;

    e_no_archivo_excel EXCEPTION;

    v_et_g_procesos_carga et_g_procesos_carga%rowtype;

    v_cdgo_prcso varchar2(3);

    v_id_sjto_impsto number;

    v_id_impsto number;

    v_id_prgrma number;

    v_id_sbprgrma number;

    v_id_prdo number;

    v_id_cnddto number;

    v_id_cnddto_vgncia number;

    v_nl number;

    v_nmbre_up varchar2(100) := 'pkg_fi_fiscalizacion.prc_rg_seleccion_cnddts_archvo';

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          v_nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          6);

    o_mnsje_rspsta := 'p_id_prcso_crga: ' || p_id_prcso_crga ||
                      ', p_id_lte: ' || p_id_lte;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Si no se especifica un lote
    IF p_id_lte IS NULL THEN
      RAISE e_no_encuentra_lote;

    END IF;

    -- ****************** INICIO ETL ***************************************************
    BEGIN
      SELECT a.*
        INTO v_et_g_procesos_carga
        FROM et_g_procesos_carga a
       WHERE id_prcso_crga = p_id_prcso_crga;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 5;

        o_mnsje_rspsta := 'Error al consultar informacion de carga en ETL';

        RETURN;

    END;

    o_mnsje_rspsta := 'file_name: ' || v_et_g_procesos_carga.file_name;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    -- Cargar archivo al directorio
    pk_etl.prc_carga_archivo_directorio(p_file_blob => v_et_g_procesos_carga.file_blob,
                                        p_file_name => v_et_g_procesos_carga.file_name);

    -- Ejecutar proceso de ETL para cargar a tabla intermedia
    pk_etl.prc_carga_intermedia_from_dir(p_cdgo_clnte    => p_cdgo_clnte,
                                         p_id_prcso_crga => p_id_prcso_crga);

    -- Cargar datos a Gestion
    pk_etl.prc_carga_gestion(p_cdgo_clnte    => p_cdgo_clnte,
                             p_id_prcso_crga => p_id_prcso_crga);

    -- ****************** FIN ETL ******************************************************
    -- Validar si el ID_CRGA pertenece al modulo cautelar o al modulo de cobros
    -- GCB o MCA?
    BEGIN
      SELECT cdgo_prcso
        INTO v_cdgo_prcso
        FROM v_gn_g_candidatos_carga
       WHERE id_prcso_crga = p_id_prcso_crga
         AND id_lte_prcso = p_id_lte
         AND rownum <= 1;

    EXCEPTION
      WHEN others THEN
        o_cdgo_rspsta := 10;

        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' - Error al validar el proceso que realiza la carga.';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        RETURN;

    END;

    o_mnsje_rspsta := 'v_cdgo_prcso: ' || v_cdgo_prcso;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    IF v_cdgo_prcso = 'FIS' THEN
      --  Si el proceso es del modulo de FISCALIZACION (FIS)
      BEGIN
        -- 3. Se eliminan los sujetos (que no han sido procesados) en el lote que
        -- no se encuentren en la información cargada del archivo.

        UPDATE fi_g_candidatos a
           SET a.actvo = 'N'
         WHERE a.id_fsclzcion_lte = p_id_lte
           AND a.indcdor_asgndo = 'N'
           AND a.actvo = 'S'
           AND NOT exists (SELECT 1
                  FROM v_gn_g_candidatos_carga c
                  JOIN si_c_sujetos d
                    ON d.idntfccion = c.idntfccion
                  JOIN si_i_sujetos_impuesto e
                    ON d.id_sjto = e.id_sjto
                 WHERE e.id_sjto_impsto = a.id_sjto_impsto
                   AND c.id_prcso_crga = p_id_prcso_crga
                   AND c.id_lte_prcso = p_id_lte
                   AND c.cdgo_prcso = v_cdgo_prcso);

      EXCEPTION
        WHEN others THEN
          ROLLBACK;

          o_cdgo_rspsta := 25;

          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '-Error al intentar eliminar los candidatos que no estan en el archivo cargado.' ||
                            sqlerrm;

          RETURN;

      END;

      -- Incluir sujetos del archivo que no estan en el lote
      FOR c_sjtos_archvo IN (SELECT e.id_sjto_impsto
                               FROM v_gn_g_candidatos_carga c
                               JOIN si_c_sujetos d
                                 ON d.idntfccion = c.idntfccion
                               JOIN si_i_sujetos_impuesto e
                                 ON d.id_sjto = e.id_sjto
                              WHERE c.id_prcso_crga = p_id_prcso_crga
                                AND c.id_lte_prcso = p_id_lte
                                AND c.cdgo_prcso = v_cdgo_prcso
                                AND exists
                              (SELECT 1

                                       FROM fi_g_candidatos j
                                      WHERE j.id_sjto_impsto =
                                            e.id_sjto_impsto
                                        AND j.id_fsclzcion_lte =
                                            c.id_lte_prcso
                                        AND j.actvo = 'N'
                                        AND j.indcdor_asgndo = 'N')) LOOP
        o_mnsje_rspsta := 'id_sjto_impsto: ' ||
                          c_sjtos_archvo.id_sjto_impsto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              6,
                              o_mnsje_rspsta,
                              6);

        -- Los que esten inactivos pero vinieron en el archivo se vuelven a activar

        UPDATE fi_g_candidatos a
           SET a.actvo = 'S'
         WHERE a.id_fsclzcion_lte = p_id_lte
           AND a.id_sjto_impsto = c_sjtos_archvo.id_sjto_impsto
           AND a.indcdor_asgndo = 'N'
           AND a.actvo = 'N';

      END LOOP;

      -- INSERTAR en el Lote ... los Nuevos Sujeto que vinieron en el Excel y No estaban en el Lote
      FOR c_sjtos_archvo IN (SELECT c.idntfccion,
                                    c.vgncia_dsde,
                                    c.vgncia_hsta,
                                    d.id_sjto,
                                    c.id_impsto,
                                    c.id_impsto_sbmpsto,
                                    c.periodo,
                                    c.cdgo_prdcdad,
                                    c.cdgo_prgrma,
                                    c.cdgo_subprgrma,
                                    c.cdgo_trbto_acto,
                                    c.fcha_expdcion,
                                    c.nmro_rnta
                               FROM v_gn_g_candidatos_carga c
                               JOIN si_c_sujetos d
                                 ON d.idntfccion = c.idntfccion
                              WHERE c.id_prcso_crga = p_id_prcso_crga
                                AND c.id_lte_prcso = p_id_lte
                                AND c.cdgo_prcso = v_cdgo_prcso
                                AND NOT exists
                              (SELECT 1
                                       FROM fi_g_candidatos a
                                       JOIN si_i_sujetos_impuesto b
                                         ON a.id_sjto_impsto =
                                            b.id_sjto_impsto
                                        AND b.id_sjto = d.id_sjto
                                      WHERE a.id_fsclzcion_lte = p_id_lte)) LOOP
        -- *************************************
        -- incluimos Sujetos
        -- *************************************
        -- <Identificar Sujeto Impuesto>
        BEGIN
          SELECT a.id_prgrma, a.id_sbprgrma --,b.cdgo_prgrma
          --,c.cdgo_sbprgrma
            INTO v_id_prgrma, v_id_sbprgrma --,v_cdgo_prgrma
          --,v_cdgo_sbprgrma
            FROM fi_g_fiscalizacion_lote a --join fi_d_programas b   on a.id_prgrma = b.id_prgrma
          -- join fi_d_subprogramas  c   on  a.id_sbprgrma = c.id_sbprgrma

           WHERE id_fsclzcion_lte = p_id_lte;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 1;

            o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                              'No se pudo obtener el programa y subprograma del lote';

            CONTINUE;

        END;

        o_mnsje_rspsta := 'v_id_prgrma: ' || v_id_prgrma ||
                          ', v_id_sbprgrma: ' || v_id_sbprgrma;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              6,
                              o_mnsje_rspsta,
                              6);

        o_mnsje_rspsta := 'id_impsto: ' || c_sjtos_archvo.id_impsto ||
                          ', id_sjto: ' || c_sjtos_archvo.id_sjto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              6,
                              o_mnsje_rspsta,
                              6);

        BEGIN
          SELECT a.id_sjto_impsto
            INTO v_id_sjto_impsto
            FROM si_i_sujetos_impuesto a
           WHERE a.id_impsto = c_sjtos_archvo.id_impsto
             AND a.id_sjto = c_sjtos_archvo.id_sjto;

        EXCEPTION
          WHEN others THEN
            o_cdgo_rspsta := 35;

            o_mnsje_rspsta := 'No se pudo identificar el sujeto impuesto asociado al ID SUJETO #' ||
                              c_sjtos_archvo.id_sjto;

            CONTINUE;

        END;

        o_mnsje_rspsta := 'v_id_sjto_impsto: ' || v_id_sjto_impsto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              6,
                              o_mnsje_rspsta,
                              6);

        -- FIN <Identificar Sujeto Impuesto>
        o_mnsje_rspsta := 'periodo: ' || c_sjtos_archvo.periodo ||
                          ', cdgo_prdcdad: ' || c_sjtos_archvo.cdgo_prdcdad ||
                          ', vgncia_dsde: ' || c_sjtos_archvo.vgncia_dsde ||
                          ', vgncia_hsta: ' || c_sjtos_archvo.vgncia_hsta ||
                          ', id_impsto: ' || c_sjtos_archvo.id_impsto ||
                          ', id_impsto_sbmpsto: ' ||
                          c_sjtos_archvo.id_impsto_sbmpsto;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              6,
                              o_mnsje_rspsta,
                              6);

        -- consultar el id periodo y vigencias a fiscalizar
        IF (c_sjtos_archvo.periodo IS NOT NULL AND
           c_sjtos_archvo.cdgo_prdcdad IS NOT NULL) THEN
          BEGIN
            SELECT id_prdo
              INTO v_id_prdo
              FROM df_i_periodos
             WHERE prdo = c_sjtos_archvo.periodo
               AND cdgo_prdcdad = c_sjtos_archvo.cdgo_prdcdad
               AND vgncia = c_sjtos_archvo.vgncia_dsde
               AND id_impsto = c_sjtos_archvo.id_impsto
               AND id_impsto_sbmpsto = c_sjtos_archvo.id_impsto_sbmpsto;

          EXCEPTION
            WHEN others THEN
              o_cdgo_rspsta := 40;

              o_mnsje_rspsta := 'Error al consultar el id periodo';

              CONTINUE;

          END;

          o_mnsje_rspsta := 'v_id_prdo: ' || v_id_prdo;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                NULL,
                                v_nmbre_up,
                                6,
                                o_mnsje_rspsta,
                                6);

        END IF;

        o_mnsje_rspsta := 'cdgo_prgrma: ' || c_sjtos_archvo.cdgo_prgrma ||
                          ' ó cdgo_subprgrma: ' ||
                          c_sjtos_archvo.cdgo_subprgrma;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              6,
                              o_mnsje_rspsta,
                              6);

        --Se validad que el sujeto tenga declaraciones pendientes
        CASE
          WHEN c_sjtos_archvo.cdgo_prgrma = 'O' THEN
            FOR c_canddto IN (SELECT vgncia,
                                     id_prdo,
                                     id_dclrcion_vgncia_frmlrio,
                                     id_dclrcion
                                FROM v_fi_g_pblcion_omsos_cncdos
                               WHERE id_sjto_impsto = v_id_sjto_impsto
                                 AND vgncia BETWEEN
                                     c_sjtos_archvo.vgncia_dsde AND
                                     nvl(c_sjtos_archvo.vgncia_hsta,
                                         c_sjtos_archvo.vgncia_dsde)
                                 AND id_prdo = nvl(id_prdo, v_id_prdo)
                                 AND cdgo_prdcdad =
                                     nvl(cdgo_prdcdad,
                                         c_sjtos_archvo.cdgo_prdcdad)) LOOP
              -- FIN <Validar cartera>
              -- SI tiene declaraciones
              -- 1. Incluir sujeto
              BEGIN
                SELECT a.id_cnddto
                  INTO v_id_cnddto
                  FROM fi_g_candidatos a
                 WHERE a.id_sjto_impsto = v_id_sjto_impsto
                   AND a.id_impsto = c_sjtos_archvo.id_impsto
                   AND a.id_prgrma = v_id_prgrma
                   AND a.id_fsclzcion_lte = p_id_lte;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos
                      (id_impsto,
                       id_impsto_sbmpsto,
                       id_sjto_impsto,
                       id_fsclzcion_lte,
                       cdgo_cnddto_estdo,
                       indcdor_asgndo,
                       id_prgrma,
                       id_sbprgrma,
                       cdgo_clnte)
                    VALUES
                      (c_sjtos_archvo.id_impsto,
                       c_sjtos_archvo.id_impsto_sbmpsto,
                       v_id_sjto_impsto,
                       p_id_lte,
                       'ACT',
                       'N',
                       v_id_prgrma,
                       v_id_sbprgrma,
                       p_cdgo_clnte)
                    RETURNING id_cnddto INTO v_id_cnddto;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 3;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo guardar el candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              -- 2. Incluir las vigencias
              BEGIN
                SELECT a.id_cnddto_vgncia
                  INTO v_id_cnddto_vgncia
                  FROM fi_g_candidatos_vigencia a
                 WHERE a.id_cnddto = v_id_cnddto
                   AND a.vgncia = c_canddto.vgncia
                   AND a.id_prdo = c_canddto.id_prdo
                   AND a.id_dclrcion_vgncia_frmlrio =
                       c_canddto.id_dclrcion_vgncia_frmlrio;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta las vigencia periodo de los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos_vigencia
                      (id_cnddto,
                       vgncia,
                       id_prdo,
                       id_dclrcion_vgncia_frmlrio)
                    VALUES
                      (v_id_cnddto,
                       c_canddto.vgncia,
                       c_canddto.id_prdo,
                       c_canddto.id_dclrcion_vgncia_frmlrio);

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 4;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo registrar las vigencia periodo del candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion || '-' ||
                                        sqlerrm;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              COMMIT;

            END LOOP;

          WHEN c_sjtos_archvo.cdgo_prgrma = 'I' THEN
            FOR c_canddto IN (SELECT vgncia,
                                     id_prdo,
                                     id_dclrcion_vgncia_frmlrio,
                                     id_dclrcion
                                FROM v_fi_g_pblcion_inxctos
                               WHERE id_sjto_impsto = v_id_sjto_impsto
                                 AND vgncia BETWEEN
                                     c_sjtos_archvo.vgncia_dsde AND
                                     nvl(c_sjtos_archvo.vgncia_hsta,
                                         c_sjtos_archvo.vgncia_dsde)
                                 AND id_prdo = nvl(id_prdo, v_id_prdo)
                                 AND cdgo_prdcdad =
                                     nvl(cdgo_prdcdad,
                                         c_sjtos_archvo.cdgo_prdcdad)) LOOP
              -- FIN <Validar cartera>
              -- SI tiene declaraciones
              -- 1. Incluir sujeto
              BEGIN
                SELECT a.id_cnddto
                  INTO v_id_cnddto
                  FROM fi_g_candidatos a
                 WHERE a.id_sjto_impsto = v_id_sjto_impsto
                   AND a.id_impsto = c_sjtos_archvo.id_impsto
                   AND a.id_prgrma = v_id_prgrma
                   AND a.id_fsclzcion_lte = p_id_lte;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos
                      (id_impsto,
                       id_impsto_sbmpsto,
                       id_sjto_impsto,
                       id_fsclzcion_lte,
                       cdgo_cnddto_estdo,
                       indcdor_asgndo,
                       id_prgrma,
                       id_sbprgrma,
                       cdgo_clnte)
                    VALUES
                      (c_sjtos_archvo.id_impsto,
                       c_sjtos_archvo.id_impsto_sbmpsto,
                       v_id_sjto_impsto,
                       p_id_lte,
                       'ACT',
                       'N',
                       v_id_prgrma,
                       v_id_sbprgrma,
                       p_cdgo_clnte)
                    RETURNING id_cnddto INTO v_id_cnddto;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 3;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo guardar el candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              -- 2. Incluir las vigencias
              BEGIN
                SELECT a.id_cnddto_vgncia
                  INTO v_id_cnddto_vgncia
                  FROM fi_g_candidatos_vigencia a
                 WHERE a.id_cnddto = v_id_cnddto
                   AND a.vgncia = c_canddto.vgncia
                   AND a.id_prdo = c_canddto.id_prdo
                   AND a.id_dclrcion_vgncia_frmlrio =
                       c_canddto.id_dclrcion_vgncia_frmlrio;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta las vigencia periodo de los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos_vigencia
                      (id_cnddto,
                       vgncia,
                       id_prdo,
                       id_dclrcion_vgncia_frmlrio,
                       id_dclrcion)
                    VALUES
                      (v_id_cnddto,
                       c_canddto.vgncia,
                       c_canddto.id_prdo,
                       c_canddto.id_dclrcion_vgncia_frmlrio,
                       c_canddto.id_dclrcion);

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 4;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo registrar las vigencia periodo del candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion || '-' ||
                                        sqlerrm;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              COMMIT;

            END LOOP;

          WHEN c_sjtos_archvo.cdgo_subprgrma = 'SML' THEN
            FOR c_canddto IN (SELECT vgncia,
                                     id_prdo,
                                     id_dclrcion_vgncia_frmlrio,
                                     id_dclrcion
                                FROM v_fi_g_pbl_sncn_sncn_mal_lqdda
                               WHERE id_sjto_impsto = v_id_sjto_impsto
                                 AND vgncia BETWEEN
                                     c_sjtos_archvo.vgncia_dsde AND
                                     nvl(c_sjtos_archvo.vgncia_hsta,
                                         c_sjtos_archvo.vgncia_dsde)
                                 AND id_prdo = nvl(id_prdo, v_id_prdo)
                                 AND cdgo_prdcdad =
                                     nvl(cdgo_prdcdad,
                                         c_sjtos_archvo.cdgo_prdcdad)) LOOP
              -- FIN <Validar cartera>
              -- SI tiene declaraciones
              -- 1. Incluir sujeto
              BEGIN
                SELECT a.id_cnddto
                  INTO v_id_cnddto
                  FROM fi_g_candidatos a
                 WHERE a.id_sjto_impsto = v_id_sjto_impsto
                   AND a.id_impsto = c_sjtos_archvo.id_impsto
                   AND a.id_prgrma = v_id_prgrma
                   AND a.id_fsclzcion_lte = p_id_lte;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos
                      (id_impsto,
                       id_impsto_sbmpsto,
                       id_sjto_impsto,
                       id_fsclzcion_lte,
                       cdgo_cnddto_estdo,
                       indcdor_asgndo,
                       id_prgrma,
                       id_sbprgrma,
                       cdgo_clnte)
                    VALUES
                      (c_sjtos_archvo.id_impsto,
                       c_sjtos_archvo.id_impsto_sbmpsto,
                       v_id_sjto_impsto,
                       p_id_lte,
                       'ACT',
                       'N',
                       v_id_prgrma,
                       v_id_sbprgrma,
                       p_cdgo_clnte)
                    RETURNING id_cnddto INTO v_id_cnddto;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 3;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo guardar el candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              -- 2. Incluir las vigencias
              BEGIN
                SELECT a.id_cnddto_vgncia
                  INTO v_id_cnddto_vgncia
                  FROM fi_g_candidatos_vigencia a
                 WHERE a.id_cnddto = v_id_cnddto
                   AND a.vgncia = c_canddto.vgncia
                   AND a.id_prdo = c_canddto.id_prdo
                   AND a.id_dclrcion_vgncia_frmlrio =
                       c_canddto.id_dclrcion_vgncia_frmlrio;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta las vigencia periodo de los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos_vigencia
                      (id_cnddto,
                       vgncia,
                       id_prdo,
                       id_dclrcion_vgncia_frmlrio,
                       id_dclrcion)
                    VALUES
                      (v_id_cnddto,
                       c_canddto.vgncia,
                       c_canddto.id_prdo,
                       c_canddto.id_dclrcion_vgncia_frmlrio,
                       c_canddto.id_dclrcion);

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 4;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo registrar las vigencia periodo del candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion || '-' ||
                                        sqlerrm;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              COMMIT;

            END LOOP;

          WHEN c_sjtos_archvo.cdgo_subprgrma = 'EXT' THEN
            FOR c_canddto IN (SELECT vgncia,
                                     id_prdo,
                                     id_dclrcion_vgncia_frmlrio,
                                     id_dclrcion
                                FROM v_fi_g_pblcion_sncntr_extmprn
                               WHERE id_sjto_impsto = v_id_sjto_impsto
                                 AND vgncia BETWEEN
                                     c_sjtos_archvo.vgncia_dsde AND
                                     nvl(c_sjtos_archvo.vgncia_hsta,
                                         c_sjtos_archvo.vgncia_dsde)
                                 AND id_prdo = nvl(id_prdo, v_id_prdo)
                                 AND cdgo_prdcdad =
                                     nvl(cdgo_prdcdad,
                                         c_sjtos_archvo.cdgo_prdcdad)) LOOP
              -- FIN <Validar cartera>
              -- SI tiene declaraciones
              -- 1. Incluir sujeto
              BEGIN
                SELECT a.id_cnddto
                  INTO v_id_cnddto
                  FROM fi_g_candidatos a
                 WHERE a.id_sjto_impsto = v_id_sjto_impsto
                   AND a.id_impsto = c_sjtos_archvo.id_impsto
                   AND a.id_prgrma = v_id_prgrma
                   AND a.id_fsclzcion_lte = p_id_lte;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos
                      (id_impsto,
                       id_impsto_sbmpsto,
                       id_sjto_impsto,
                       id_fsclzcion_lte,
                       cdgo_cnddto_estdo,
                       indcdor_asgndo,
                       id_prgrma,
                       id_sbprgrma,
                       cdgo_clnte)
                    VALUES
                      (c_sjtos_archvo.id_impsto,
                       c_sjtos_archvo.id_impsto_sbmpsto,
                       v_id_sjto_impsto,
                       p_id_lte,
                       'ACT',
                       'N',
                       v_id_prgrma,
                       v_id_sbprgrma,
                       p_cdgo_clnte)
                    RETURNING id_cnddto INTO v_id_cnddto;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 3;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo guardar el candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              -- 2. Incluir las vigencias
              BEGIN
                SELECT a.id_cnddto_vgncia
                  INTO v_id_cnddto_vgncia
                  FROM fi_g_candidatos_vigencia a
                 WHERE a.id_cnddto = v_id_cnddto
                   AND a.vgncia = c_canddto.vgncia
                   AND a.id_prdo = c_canddto.id_prdo
                   AND a.id_dclrcion_vgncia_frmlrio =
                       c_canddto.id_dclrcion_vgncia_frmlrio;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta las vigencia periodo de los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos_vigencia
                      (id_cnddto,
                       vgncia,
                       id_prdo,
                       id_dclrcion_vgncia_frmlrio,
                       id_dclrcion)
                    VALUES
                      (v_id_cnddto,
                       c_canddto.vgncia,
                       c_canddto.id_prdo,
                       c_canddto.id_dclrcion_vgncia_frmlrio,
                       c_canddto.id_dclrcion);

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 4;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo registrar las vigencia periodo del candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion || '-' ||
                                        sqlerrm;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              COMMIT;

            END LOOP;

          WHEN c_sjtos_archvo.cdgo_subprgrma = 'NEI' THEN
            FOR c_canddto IN (SELECT vgncia,
                                     id_prdo,
                                     id_dclrcion_vgncia_frmlrio --,id_dclrcion
                                FROM v_fi_g_pbl_sncn_no_enviar_info
                               WHERE id_sjto_impsto = v_id_sjto_impsto
                                 AND id_impsto = c_sjtos_archvo.id_impsto
                                 AND id_impsto_sbmpsto =
                                     c_sjtos_archvo.id_impsto_sbmpsto
                                 AND vgncia BETWEEN
                                     c_sjtos_archvo.vgncia_dsde AND
                                     nvl(c_sjtos_archvo.vgncia_hsta,
                                         c_sjtos_archvo.vgncia_dsde)
                                 AND cdgo_prdcdad =
                                     nvl(c_sjtos_archvo.cdgo_prdcdad,
                                         cdgo_prdcdad)
                                 AND id_prdo = nvl(id_prdo, v_id_prdo)) LOOP
              -- FIN <Validar cartera>
              -- SI tiene declaraciones
              -- 1. Incluir sujeto
              BEGIN
                SELECT a.id_cnddto
                  INTO v_id_cnddto
                  FROM fi_g_candidatos a
                 WHERE a.id_sjto_impsto = v_id_sjto_impsto
                   AND a.id_impsto = c_sjtos_archvo.id_impsto
                   AND a.id_prgrma = v_id_prgrma
                   AND a.id_fsclzcion_lte = p_id_lte;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos
                      (id_impsto,
                       id_impsto_sbmpsto,
                       id_sjto_impsto,
                       id_fsclzcion_lte,
                       cdgo_cnddto_estdo,
                       indcdor_asgndo,
                       id_prgrma,
                       id_sbprgrma,
                       cdgo_clnte)
                    VALUES
                      (c_sjtos_archvo.id_impsto,
                       c_sjtos_archvo.id_impsto_sbmpsto,
                       v_id_sjto_impsto,
                       p_id_lte,
                       'ACT',
                       'N',
                       v_id_prgrma,
                       v_id_sbprgrma,
                       p_cdgo_clnte)
                    RETURNING id_cnddto INTO v_id_cnddto;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 3;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo guardar el candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              -- 2. Incluir las vigencias
              BEGIN
                SELECT a.id_cnddto_vgncia
                  INTO v_id_cnddto_vgncia
                  FROM fi_g_candidatos_vigencia a
                 WHERE a.id_cnddto = v_id_cnddto
                   AND a.vgncia = c_canddto.vgncia
                   AND a.id_prdo = c_canddto.id_prdo
                   AND a.id_dclrcion_vgncia_frmlrio =
                       c_canddto.id_dclrcion_vgncia_frmlrio;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta las vigencia periodo de los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos_vigencia
                      (id_cnddto,
                       vgncia,
                       id_prdo,
                       id_dclrcion_vgncia_frmlrio --,id_dclrcion
                       )
                    VALUES
                      (v_id_cnddto,
                       c_canddto.vgncia,
                       c_canddto.id_prdo,
                       c_canddto.id_dclrcion_vgncia_frmlrio --,c_canddto.id_dclrcion
                       );

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 4;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo registrar las vigencia periodo del candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion || '-' ||
                                        sqlerrm;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              COMMIT;

            END LOOP;

          WHEN c_sjtos_archvo.cdgo_prgrma = 'OLQ' THEN
            o_mnsje_rspsta := 'cdgo_trbto_acto: ' ||
                              c_sjtos_archvo.cdgo_trbto_acto ||
                              ', fcha_expdcion: ' ||
                              c_sjtos_archvo.fcha_expdcion ||
                              ', nmro_rnta: ' || c_sjtos_archvo.nmro_rnta;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  NULL,
                                  v_nmbre_up,
                                  6,
                                  o_mnsje_rspsta,
                                  6);

            FOR c_canddto IN (SELECT vgncia,
                                     id_prdo,
                                     nmro_rnta,
                                     to_char(fcha_rgstro, 'DD/MM/YY') AS fcha_expdcion
                                FROM v_fi_g_pblcion_omsos_lqddos
                               WHERE id_sjto_impsto = v_id_sjto_impsto /*  and vgncia between c_sjtos_archvo.vgncia_dsde
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   and nvl(c_sjtos_archvo.vgncia_hsta, c_sjtos_archvo.vgncia_dsde)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    and id_prdo = nvl(id_prdo, v_id_prdo)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    and cdgo_prdcdad = nvl(cdgo_prdcdad, c_sjtos_archvo.cdgo_prdcdad)*/
                                 AND cdgo_impsto_acto =
                                     nvl(cdgo_impsto_acto,
                                         c_sjtos_archvo.cdgo_trbto_acto) --and to_char (fcha_rgstro, 'DD/MM/YY') = nvl(to_char (c_sjtos_archvo.fcha_expdcion, 'DD/MM/YY'), to_char (fcha_rgstro, 'DD/MM/YY'))
                                 AND nmro_rnta =
                                     nvl(nmro_rnta, c_sjtos_archvo.nmro_rnta)) LOOP
              -- FIN <Validar cartera>
              -- 1. Incluir sujeto
              o_mnsje_rspsta := 'vgncia: ' || c_canddto.vgncia ||
                                ', id_prdo: ' || c_canddto.id_prdo;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    v_nmbre_up,
                                    6,
                                    o_mnsje_rspsta,
                                    6);

              BEGIN
                SELECT a.id_cnddto
                  INTO v_id_cnddto
                  FROM fi_g_candidatos a
                 WHERE a.id_sjto_impsto = v_id_sjto_impsto
                   AND a.id_impsto = c_sjtos_archvo.id_impsto
                   AND a.id_prgrma = v_id_prgrma
                   AND a.id_fsclzcion_lte = p_id_lte;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos
                      (id_impsto,
                       id_impsto_sbmpsto,
                       id_sjto_impsto,
                       id_fsclzcion_lte,
                       cdgo_cnddto_estdo,
                       indcdor_asgndo,
                       id_prgrma,
                       id_sbprgrma,
                       cdgo_clnte)
                    VALUES
                      (c_sjtos_archvo.id_impsto,
                       c_sjtos_archvo.id_impsto_sbmpsto,
                       v_id_sjto_impsto,
                       p_id_lte,
                       'ACT',
                       'N',
                       v_id_prgrma,
                       v_id_sbprgrma,
                       p_cdgo_clnte)
                    RETURNING id_cnddto INTO v_id_cnddto;

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 3;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo guardar el candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              o_mnsje_rspsta := 'v_id_cnddto: ' || v_id_cnddto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    v_nmbre_up,
                                    6,
                                    o_mnsje_rspsta,
                                    6);

              -- 2. Incluir las vigencias
              BEGIN
                SELECT a.id_cnddto_vgncia
                  INTO v_id_cnddto_vgncia
                  FROM fi_g_candidatos_vigencia a
                 WHERE a.id_cnddto = v_id_cnddto
                   AND a.vgncia = c_canddto.vgncia
                   AND a.id_prdo = c_canddto.id_prdo; --and   a.id_dclrcion_vgncia_frmlrio = c_canddto.id_dclrcion_vgncia_frmlrio;

              EXCEPTION
                WHEN no_data_found THEN
                  --Se inserta las vigencia periodo de los candidatos
                  BEGIN
                    INSERT INTO fi_g_candidatos_vigencia
                      (id_cnddto,
                       vgncia,
                       id_prdo,
                       indcdor_fsclzcion_tpo,
                       fcha_expdcion,
                       nmro_rnta)
                    VALUES
                      (v_id_cnddto,
                       c_canddto.vgncia,
                       c_canddto.id_prdo,
                       'LQ',
                       c_canddto.fcha_expdcion,
                       c_canddto.nmro_rnta);

                  EXCEPTION
                    WHEN others THEN
                      o_cdgo_rspsta := 4;

                      o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                                        'No se pudo registrar las vigencia periodo del candidato con identificación ' || '-' ||
                                        c_sjtos_archvo.idntfccion || '-' ||
                                        sqlerrm;

                      ROLLBACK;

                      CONTINUE;

                  END;

              END;

              o_mnsje_rspsta := 'v_id_cnddto_vgncia: ' ||
                                v_id_cnddto_vgncia;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    NULL,
                                    v_nmbre_up,
                                    6,
                                    o_mnsje_rspsta,
                                    6);

              COMMIT;

            END LOOP;

          ELSE
            NULL;

        END CASE;

      END LOOP;

    END IF;

    COMMIT;

  EXCEPTION
    WHEN e_no_encuentra_lote THEN
      o_cdgo_rspsta := 97;

      o_mnsje_rspsta := 'No se ha especificado un lote válido.';

    WHEN e_no_archivo_excel THEN
      o_cdgo_rspsta := 98;

      o_mnsje_rspsta := 'El archivo cargado no es un archivo EXCEL.';

    WHEN others THEN
      o_cdgo_rspsta := 99;

      o_mnsje_rspsta := 'No se pudo procesar la seleccion de candidatos por medio del cargue de archivo.';

  END prc_rg_seleccion_cnddts_archvo;

  FUNCTION fnc_vl_existe_inexacto(p_cdgo_clnte                 IN number,
                                  p_id_sjto_impsto             IN number,
                                  p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_id_fsclzcion_expdnte number;

  BEGIN
    BEGIN
      SELECT c.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM v_fi_g_candidatos a
        JOIN fi_g_candidatos_vigencia b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzc_expdn_cndd_vgnc d
          ON b.id_cnddto_vgncia = d.id_cnddto_vgncia
        JOIN fi_g_fiscalizacion_expdnte c
          ON a.id_cnddto = c.id_cnddto
       WHERE a.id_sjto_impsto = p_id_sjto_impsto
         AND b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND c.cdgo_expdnte_estdo = 'ABT'
         AND a.cdgo_prgrma = 'I'
         AND exists
       (SELECT 1
                FROM fi_g_fsclzcion_expdnte_acto d
                JOIN gn_d_actos_tipo e
                  ON d.id_acto_tpo = e.id_acto_tpo
                JOIN gn_g_actos f
                  ON d.id_acto = f.id_acto
               WHERE d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
                 AND e.cdgo_acto_tpo = 'ADA' -- and not f.fcha_ntfccion is null
              );

      RETURN 'S';

    EXCEPTION
      WHEN no_data_found THEN
        RETURN 'N';

    END;

  END fnc_vl_existe_inexacto;

  FUNCTION fnc_vl_firmeza_dclracion(p_cdgo_clnte                 IN number,
                                    p_id_dclrcion_vgncia_frmlrio IN number,
                                    p_idntfccion_sjto            IN varchar2)
    RETURN varchar2 AS
    v_fcha_lmte date;

    v_error EXCEPTION;

    v_fcha_prsntcion date;

    v_fcha_lmte_vlda date;

    v_id_dclrcion number;

    v_fcha_frmza date;

    v_id_impsto number;

    v_nmro_annos_frmza number;

    v_estdo varchar2(1);

    v_id_acto_tpo number;

    v_rqrmnto_espcial number;

    v_id_sjto_impsto number;

    v_nl number;

    v_nmbre_up varchar2(100) := 'fnc_vl_firmeza_dclracion';

    v_fcha_ntfccion_acto date;

  BEGIN
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, NULL, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          NULL,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    BEGIN
      SELECT a.id_dclrcion
        INTO v_id_dclrcion
        FROM v_gi_g_declaraciones a
       WHERE a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND a.idntfccion_sjto = p_idntfccion_sjto;

    EXCEPTION
      WHEN no_data_found THEN
        v_estdo := 'N';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              'Id declaración no encontrado. ' || sqlerrm,
                              6);

      WHEN others THEN
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              'Id declaración no encontrado. ' || sqlerrm,
                              6);

    END;

    BEGIN
      v_fcha_lmte := pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                                    p_idntfccion                 => p_idntfccion_sjto);

    EXCEPTION
      WHEN others THEN
        v_estdo := 'N';

    END;

    BEGIN
      SELECT a.fcha_prsntcion, a.id_impsto, a.id_sjto_impsto
        INTO v_fcha_prsntcion, v_id_impsto, v_id_sjto_impsto
        FROM v_gi_g_declaraciones a
       WHERE a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND a.idntfccion_sjto = p_idntfccion_sjto;

    EXCEPTION
      WHEN others THEN
        v_estdo := 'N';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              'Problema consultando los datos adicionales de la declaración. ' ||
                              sqlerrm,
                              6);

    END;

    --Primera validacion
    IF (v_fcha_prsntcion >= v_fcha_lmte) THEN
      v_fcha_lmte_vlda := v_fcha_prsntcion;

    ELSE
      v_fcha_lmte_vlda := v_fcha_lmte;

    END IF;

    BEGIN
      SELECT vlor * 12
        INTO v_nmro_annos_frmza
        FROM df_i_definiciones_impuesto
       WHERE cdgo_dfncn_impsto = 'FDL'
         AND id_impsto = v_id_impsto;

    EXCEPTION
      WHEN no_data_found THEN
        v_estdo := 'N';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              'No se encontró el parámetro FDL en df_i_definiciones_impuesto. ' ||
                              sqlerrm,
                              6);

    END;

    v_fcha_frmza := add_months(v_fcha_lmte_vlda, v_nmro_annos_frmza);

    /* if (trunc(v_fcha_frmza) <= trunc(sysdate)) then
      v_estdo := 'S';
    else
      v_estdo := 'N';
    end if;*/
    BEGIN
      SELECT a.id_acto_tpo
        INTO v_id_acto_tpo
        FROM gn_d_actos_tipo a
       WHERE a.cdgo_clnte = p_cdgo_clnte
         AND a.cdgo_acto_tpo = 'RE';

    EXCEPTION
      WHEN too_many_rows THEN
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              'Se encontró mas de un acto parametrizado ' ||
                              sqlerrm,
                              6);

        RAISE;

      WHEN others THEN
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              NULL,
                              v_nmbre_up,
                              v_nl,
                              'Error al consultar el id_acto_tpo ' ||
                              sqlerrm,
                              6);

        RAISE;

    END;

    BEGIN
      SELECT c.fcha_ntfccion
        INTO v_fcha_ntfccion_acto
        FROM v_fi_g_fiscalizacion_expdnte a
        JOIN fi_g_fsclzcion_expdnte_acto b
          ON a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte
        JOIN v_gn_g_actos c
          ON b.id_acto = c.id_acto
       WHERE a.id_sjto_impsto = v_id_sjto_impsto
         AND a.cdgo_expdnte_estdo = 'ABT'
         AND b.id_acto_tpo = v_id_acto_tpo
         AND c.indcdor_ntfcdo = 'S';

    EXCEPTION
      WHEN no_data_found THEN
        v_estdo := 'N';

    END;

    IF (trunc(v_fcha_ntfccion_acto) > trunc(v_fcha_frmza)) THEN
      v_estdo := 'S';

    elsif (v_fcha_ntfccion_acto IS NULL AND
          (trunc(v_fcha_frmza) <= trunc(sysdate))) THEN
      v_estdo := 'S';

    ELSE
      v_estdo := 'N';

    END IF;

    RETURN v_estdo;

  END fnc_vl_firmeza_dclracion;

  FUNCTION fnc_vl_existe_omiso(p_cdgo_clnte                 IN number,
                               p_id_sjto_impsto             IN number,
                               p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_id_fsclzcion_expdnte number;

  BEGIN
    BEGIN
      SELECT c.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM v_fi_g_candidatos a
        JOIN fi_g_candidatos_vigencia b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzc_expdn_cndd_vgnc d
          ON b.id_cnddto_vgncia = d.id_cnddto_vgncia
        JOIN fi_g_fiscalizacion_expdnte c
          ON a.id_cnddto = c.id_cnddto
       WHERE a.id_sjto_impsto = p_id_sjto_impsto
         AND b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND c.cdgo_expdnte_estdo = 'ABT'
         AND a.cdgo_prgrma = 'O'
         AND exists
       (SELECT 1
                FROM fi_g_fsclzcion_expdnte_acto d
                JOIN gn_d_actos_tipo e
                  ON d.id_acto_tpo = e.id_acto_tpo
                JOIN gn_g_actos f
                  ON d.id_acto = f.id_acto
               WHERE d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
                 AND e.cdgo_acto_tpo = 'LODA'
                 AND NOT f.fcha_ntfccion IS NULL);

      RETURN 'S';

    EXCEPTION
      WHEN no_data_found THEN
        RETURN 'N';

      WHEN others THEN
        RETURN 'N';

    END;

  END fnc_vl_existe_omiso;

  FUNCTION fnc_vl_expdnte_fisca(p_cdgo_clnte                 IN number,
                                p_id_sjto_impsto             IN number,
                                p_id_dclrcion_vgncia_frmlrio IN number)
    RETURN varchar2 AS
    v_id_fsclzcion_expdnte number;

    v_id_acto number;

  BEGIN
    BEGIN
      SELECT d.id_fsclzcion_expdnte
        INTO v_id_fsclzcion_expdnte
        FROM v_fi_g_candidatos a
        JOIN fi_g_candidatos_vigencia b
          ON a.id_cnddto = b.id_cnddto
        JOIN fi_g_fsclzc_expdn_cndd_vgnc c
          ON b.id_cnddto_vgncia = c.id_cnddto_vgncia
        JOIN fi_g_fiscalizacion_expdnte d
          ON c.id_fsclzcion_expdnte = d.id_fsclzcion_expdnte
       WHERE a.id_sjto_impsto = p_id_sjto_impsto
         AND b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         AND d.cdgo_expdnte_estdo = 'ABT'
         AND a.cdgo_prgrma = 'O' /*and exists (select 1
                                                                                                                                                                                                                                                                                                       from fi_g_fsclzcion_expdnte_acto e
                                                                                                                                                                                                                                                                                                       join gn_d_actos_tipo             f on e.id_acto_tpo = f.id_acto_tpo
                                                                                                                                                                                                                                                                                                       join gn_g_actos                  g on e.id_acto = g.id_acto
                                                                                                                                                                                                                                                                                                      where e.id_fsclzcion_expdnte  = d.id_fsclzcion_expdnte
                                                                                                                                                                                                                                                                                                        and f.cdgo_acto_tpo         = 'LODA'
                                                                                                                                                                                                                                                                                                        and not g.fcha_ntfccion is null)*/
      ;

    EXCEPTION
      WHEN no_data_found THEN
        v_id_fsclzcion_expdnte := NULL;

    END;

    /*if v_id_fsclzcion_expdnte is not null then
        begin
         select g.id_acto
           into v_id_acto
           from fi_g_fsclzcion_expdnte_acto e
           join gn_d_actos_tipo             f on e.id_acto_tpo = f.id_acto_tpo
           join gn_g_actos                  g on e.id_acto = g.id_acto
          where e.id_fsclzcion_expdnte  = v_id_fsclzcion_expdnte
            and f.cdgo_acto_tpo         = 'LODA'
            and not g.fcha_ntfccion is null
            ;
        exception
          when no_data_found then
            v_id_acto := null;
        end;
    end if;*/
    IF v_id_fsclzcion_expdnte IS NOT NULL /*and v_id_acto is not null then
                                                                                                                                                                                                                return 'S';
                                                                                                                                                                                                            elsif v_id_fsclzcion_expdnte is not null and v_id_acto is null*/
     THEN
      RETURN 'S';

    ELSE
      RETURN 'N';

    END IF;

  END fnc_vl_expdnte_fisca;

  FUNCTION fnc_co_tabla2(p_id_sjto_impsto   IN number,
                         p_id_instncia_fljo IN number /*p_id_acto_tpo                   in number*/)
    RETURN CLOB AS
    v_tabla CLOB;

    v_idntfccion_sjto_frmtda number;

    v_nmbre_rzon_scial varchar2(300);

    v_drccion varchar2(300);

    v_nmbre_mncpio varchar2(300);

    v_nmbre_dprtmnto varchar2(300);

    v_expediente fi_g_fiscalizacion_expdnte.nmro_expdnte%TYPE;

    v_vgncia varchar2(100);

    v_impsto df_c_impuestos.nmbre_impsto%TYPE;

    v_nmbre_prgrma fi_d_programas.nmbre_prgrma%TYPE;

    v_nmbre_sbprgrma fi_d_subprogramas.nmbre_sbprgrma%TYPE;

    v_email si_i_sujetos_impuesto.email%TYPE;

    v_fcha_aprtra timestamp;

  BEGIN
    BEGIN
      SELECT a.idntfccion_sjto_frmtda,
             b.nmbre_rzon_scial,
             a.drccion_ntfccion,
             a.nmbre_mncpio,
             a.nmbre_dprtmnto,
             a.nmbre_impsto,
             a.email
        INTO v_idntfccion_sjto_frmtda,
             v_nmbre_rzon_scial,
             v_drccion,
             v_nmbre_mncpio,
             v_nmbre_dprtmnto,
             v_impsto,
             v_email
        FROM v_si_i_sujetos_impuesto a
        JOIN si_i_personas b
          ON a.id_sjto_impsto = b.id_sjto_impsto
       WHERE a.id_sjto_impsto = p_id_sjto_impsto;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    --Numero del expediente
    BEGIN
      SELECT a.nmro_expdnte, b.nmbre_prgrma, b.nmbre_sbprgrma
        INTO v_expediente, v_nmbre_prgrma, v_nmbre_sbprgrma
        FROM fi_g_fiscalizacion_expdnte a
        JOIN v_fi_g_candidatos b
          ON b.id_cnddto = a.id_cnddto
       WHERE a.id_instncia_fljo = p_id_instncia_fljo;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    BEGIN
      SELECT replace(listagg(a.vgncia_prdo, ','), '(ANUAL)', '') AS vigencia_periodo
        INTO v_vgncia
        FROM (SELECT a.vgncia || '(' || listagg(a.dscrpcion, ',') within group(ORDER BY a.vgncia, a.prdo) || ')' AS vgncia_prdo
                FROM v_fi_g_candidatos_vigencia a
                JOIN fi_g_fsclzc_expdn_cndd_vgnc c
                  ON a.id_cnddto_vgncia = c.id_cnddto_vgncia
                JOIN fi_g_fiscalizacion_expdnte b
                  ON a.id_cnddto = b.id_cnddto
               WHERE b.id_instncia_fljo = p_id_instncia_fljo
               GROUP BY a.vgncia, b.fcha_aprtra) a;

    EXCEPTION
      WHEN others THEN
        NULL;

    END;

    --v_dv := pkg_gi_declaraciones_funciones.fnc_ca_digito_verificacion(v_idntfccion_sjto_frmtda);
    v_tabla := '<table align="center" width="100%" border="1" style="border-collapse:collapse">
                <tbody>

                  <tr>
                    <td width="40%" align="left">
                      NOMBRE O RAZON SOCIAL:
                    </td>
                    <td width="60%" align="left">
                      ' || v_nmbre_rzon_scial || '
                    </td>
                  </tr>
                  <tr>
                    <td width="40%" align="left">
                      IDENTIFICACION:
                    </td>
                    <td width="60%" align="left">
                      ' || v_idntfccion_sjto_frmtda || '
                    </td>
                  </tr>
                  <tr>
                    <td width="40%" align="left">
                      DIRECCION NOTIFICACION:
                    </td>
                    <td width="60%" align="left">
                      ' || v_drccion || '
                    </td>
                  </tr>
                  <tr>
                    <td width="40%" align="left">
                      CIUDAD:
                    </td>
                    <td width="60%" align="left">
                      ' || v_nmbre_mncpio || ' - ' ||
               v_nmbre_dprtmnto || '
                    </td>
                  </tr>
                  <tr>
                    <td width="40%" align="left">
                      CORREO ELECTRONICO:
                    </td>
                    <td width="60%" align="left">
                      ' || v_email || '
                    </td>
                  </tr>
                  <tr>
                    <td width="40%" align="left">
                      PERIODO(S) GRAVABLE (S):
                    </td>
                    <td width="60%" align="left">
                      ' || v_vgncia || '
                    </td>
                  </tr>
                </tbody>
              </table>';

    RETURN v_tabla;

  END fnc_co_tabla2;

END pkg_fi_fiscalizacion;
/

