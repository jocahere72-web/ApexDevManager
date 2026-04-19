prompt --application/pages/page_00080
begin
wwv_flow_api.create_page(
 p_id=>80
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Cargue Valorizaci\00F3n de Predios Por Referencia Catastral')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Cargue Valorizaci\00F3n de Predios Por Referencia Catastral')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20240530123817'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156376306073190015)
,p_plug_name=>'Cargue Referencia Catastral'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156377513001190027)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(156376306073190015)
,p_button_name=>'BTN_PRCSAR_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'<b>Procesar Archivo'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(156376489554190016)
,p_name=>'P80_ARCHVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(156376306073190015)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Se debe seleccionar el Archivo que contiene el listado de las referencias catastrales'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'.txt'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(156626363114633804)
,p_name=>'P80_MENSJE_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(156376306073190015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(156376953649190021)
,p_validation_name=>'Validar que exista un archivo seleccionado'
,p_validation_sequence=>10
,p_validation=>'P80_ARCHVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por Favor Seleccionar un archivo.'
,p_associated_item=>wwv_flow_api.id(156376489554190016)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156377654035190028)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_blob_data         BLOB;',
'    v_blob_len          NUMBER;',
'    v_position          NUMBER;',
'    v_raw_chunk         RAW(10000);',
'    v_char              CHAR(1);',
'    c_chunk_len         NUMBER := 1;',
'    v_line              VARCHAR2(32767) := NULL;',
'    v_nmro_lnea         NUMBER;',
'    v_data_array        wwv_flow_global.vc_arr2;',
'',
'    v_idntfccion_sjto   v_si_i_sujetos_impuesto.idntfccion_sjto%TYPE;  ',
'    v_indcdor_existe    VARCHAR2(2);',
'    v_seq_id            apex_collections.seq_id%TYPE;',
'    v_estdo             apex_collections.c005%TYPE;',
'    v_ttal_sjto_impsto  NUMBER;',
'    v_cdgo_rspsta       NUMBER;',
'    v_mnsje_rspsta      VARCHAR2(4000);',
'    ',
'    v_cntdad_rgstros_crgdos NUMBER;',
'BEGIN',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''idntfccion_sjto''); ',
'',
'    -- leer archivo cargado ',
'    SELECT blob_content ',
'    INTO v_blob_data',
'    FROM apex_application_temp_files  ',
'    WHERE name = :P80_ARCHVO;   ',
'',
'    v_blob_len := dbms_lob.getlength(v_blob_data);',
'    v_position := 1;',
'    v_nmro_lnea := 0;',
'    v_estdo := ''VLD'';',
'',
'    DELETE FROM gn_g_temporal WHERE id_ssion = :APP_SESSION;',
'    COMMIT;',
'        ',
'    IF APEX_COLLECTION.COLLECTION_EXISTS(''idntfccion_sjto'') THEN',
'        WHILE v_position <= v_blob_len LOOP',
'            v_raw_chunk := dbms_lob.substr(v_blob_data, c_chunk_len, v_position);',
'            v_char := CHR(HEX_TO_DECIMAL(RAWTOHEX(v_raw_chunk)));',
'            v_position := v_position + c_chunk_len;',
'',
'            IF v_char != CHR(10) AND v_char != CHR(13) THEN',
'                v_line := v_line || v_char;',
'            ELSE',
'                v_line := TRIM(v_line);',
'                ',
'                IF v_line IS NOT NULL THEN',
'                    v_idntfccion_sjto := v_line;',
'                    ',
'                    -- Validar la referencia catastral ingresada no tenga valorizacion',
'                    BEGIN',
'                        SELECT idntfccion_sjto ',
'                        INTO v_idntfccion_sjto ',
'                        FROM v_si_i_sujetos_impuesto v',
'                        WHERE  CDGO_SJTO_ESTDO = ''A'' ',
'                          AND ID_IMPSTO = 230011',
'                          AND IDNTFCCION_SJTO = v_idntfccion_sjto',
'                          AND NOT EXISTS (',
'                              SELECT 1 ',
'                              FROM v_si_i_sujetos_impuesto s ',
'                              WHERE s.ID_IMPSTO = 2300115 ',
'                                AND s.ID_SJTO = v.ID_SJTO',
'                          );',
'',
'                        v_indcdor_existe := ''SI'';',
'                        v_estdo := ''VLD'';',
'                    EXCEPTION ',
'                        WHEN NO_DATA_FOUND THEN ',
'                            v_indcdor_existe := ''NO'';',
'                            v_estdo := ''NVD'';',
'                    END;',
'',
'                    v_nmro_lnea := v_nmro_lnea + 1;',
'                    ',
'                    INSERT INTO gn_g_temporal (n002, c001, c002, c005, id_ssion)',
'                    VALUES (v_nmro_lnea, v_idntfccion_sjto, v_indcdor_existe, v_estdo, :APP_SESSION);',
'',
'                END IF;',
'',
'                v_line := NULL;',
'            END IF;',
'        END LOOP;',
'',
unistr('        -- Procesar la \00FAltima l\00EDnea si no termina en un salto de l\00EDnea'),
'        v_line := TRIM(v_line);',
'        IF v_line IS NOT NULL THEN',
'            v_idntfccion_sjto := v_line;',
'',
'            BEGIN',
'                SELECT idntfccion_sjto ',
'                INTO v_idntfccion_sjto ',
'                FROM v_si_i_sujetos_impuesto v',
'                WHERE  CDGO_SJTO_ESTDO = ''A'' ',
'                  AND ID_IMPSTO = 230011',
'                  AND IDNTFCCION_SJTO = v_idntfccion_sjto',
'                  AND NOT EXISTS (',
'                      SELECT 1 ',
'                      FROM v_si_i_sujetos_impuesto s ',
'                      WHERE s.ID_IMPSTO = 2300115 ',
'                        AND s.ID_SJTO = v.ID_SJTO',
'                  );',
'',
'                v_indcdor_existe := ''SI'';',
'                v_estdo := ''VLD'';',
'            EXCEPTION ',
'                WHEN NO_DATA_FOUND THEN ',
'                    v_indcdor_existe := ''NO'';',
'                    v_estdo := ''NVD'';',
'            END;',
'',
'            v_nmro_lnea := v_nmro_lnea + 1;',
'                    ',
'            INSERT INTO gn_g_temporal (n002, c001, c002, c005, id_ssion)',
'            VALUES (v_nmro_lnea, v_idntfccion_sjto, v_indcdor_existe, v_estdo, :APP_SESSION);',
'        END IF;',
'',
'        BEGIN',
'            PKG_GI_PREDIO_VALORIZACION.PRC_CREA_PRDIO_VAL_ARCHIVO (',
'                p_cdgo_clnte      => :F_CDGO_CLNTE,',
'                p_id_usuario      => :F_ID_USRIO,',
'                p_id_session      => :APP_SESSION,',
'                o_cdgo_rspsta     => v_cdgo_rspsta,',
'                o_mnsje_rspsta    => v_mnsje_rspsta                                                 ',
'            );',
'            ',
'            ',
'            -- Determinar cuantos registros se procesaron                                                ',
'            SELECT count(1)  ',
'            INTO v_cntdad_rgstros_crgdos    ',
'            FROM gn_g_temporal ',
'            WHERE ID_SSION = :APP_SESSION AND C005 = ''VLD'';     ',
'',
'            :P80_MENSJE_RSPSTA := ''Referencias Cargadas Exitosamente: '' || v_cntdad_rgstros_crgdos;',
'            ',
'            IF v_cdgo_rspsta > 0 THEN   ',
'                ROLLBACK;',
'                RAISE_APPLICATION_ERROR(-20001, v_mnsje_rspsta);                                                ',
'            END IF;',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                ROLLBACK;',
unistr('                RAISE_APPLICATION_ERROR(-20001, ''No se pudo registrar la referencia para Valorizaci\00F3n '' || SQLERRM);'),
'        END;',
'    END IF;',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156377513001190027)
,p_process_success_message=>'&P80_MENSJE_RSPSTA.'
);
end;
/
