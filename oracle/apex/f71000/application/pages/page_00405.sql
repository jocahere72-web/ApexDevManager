prompt --application/pages/page_00405
begin
wwv_flow_api.create_page(
 p_id=>405
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Generar Paz y Salvo Masivo'
,p_step_title=>'Generar Paz y Salvo Masivo'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20240607093255'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156842202840926740)
,p_plug_name=>'Cargue de Archivo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156842374119926741)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br><br>',
'Funcionalidad que permite generar Paz y Salvos Masivamente.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156843026104926748)
,p_plug_name=>'Datos Resultado'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select n001 IMPUESTO, n003 SUB_IMPUESTO, C001 IDENTIFICACION,  C005 ESTADO ',
'from gn_g_temporal',
'where ID_SSION = :APP_SESSION  AND C005 = ''Paz y Salvo.''',
';*/',
'',
' SELECT C001 IDNTFCCION_SJTO, n001 id_impsto, N002 ID_SB_IMPSTO, C005 ESTADO',
'            FROM gn_g_temporal ',
'            WHERE ID_SSION = :APP_SESSION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(156921884402138508)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'IDENTIFICACION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(156921952386138509)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'IMPUESTO'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(156922036193138510)
,p_name=>'ID_SB_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SB_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SUB_IMPUESTO'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(156922693646138516)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'ESTADO'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(156843169031926749)
,p_internal_uid=>156843169031926749
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(156926912490150764)
,p_interactive_grid_id=>wwv_flow_api.id(156843169031926749)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(156927038272150768)
,p_report_id=>wwv_flow_api.id(156926912490150764)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(156985609596981917)
,p_view_id=>wwv_flow_api.id(156927038272150768)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(156921884402138508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(156986138685981934)
,p_view_id=>wwv_flow_api.id(156927038272150768)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(156921952386138509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(156986696625981937)
,p_view_id=>wwv_flow_api.id(156927038272150768)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(156922036193138510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157482885860692204)
,p_view_id=>wwv_flow_api.id(156927038272150768)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(156922693646138516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156922745603138517)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156922819636138518)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(156922745603138517)
,p_button_name=>'BTN_GNRA_MSVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'<b>Generar Paz y Salvos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:406:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from gn_g_temporal ',
'where id_ssion = :APP_SESSION;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156842550781926743)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(156842202840926740)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(156842450277926742)
,p_name=>'P405_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(156842202840926740)
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'.xlsx'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(156842821562926746)
,p_name=>'P405_MENSJE_RSPSTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(156842202840926740)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(156842983295926747)
,p_validation_name=>'Validar que exista un archivo seleccionado'
,p_validation_sequence=>10
,p_validation=>'P405_ARCHIVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por Favor Seleccionar un archivo.'
,p_when_button_pressed=>wwv_flow_api.id(156842550781926743)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(156924493816138534)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P405_ARCHIVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(156924557737138535)
,p_event_id=>wwv_flow_api.id(156924493816138534)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''ARCHVO_PAZ_SLVO_MSVOS''); ',
'APEX_UTIL.SET_SESSION_STATE(''P405_ARCHIVO'',:P405_ARCHIVO);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156921769271138507)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Cargar Archivo Excel'
,p_attribute_01=>'P405_ARCHIVO'
,p_attribute_02=>'ARCHVO_PAZ_SLVO_MSVOS'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'Y'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156842550781926743)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156921440001138504)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_idntfccion_sjto      v_si_i_sujetos_impuesto.idntfccion_sjto%TYPE;',
'    v_id_impsto            v_si_i_sujetos_impuesto.id_impsto%TYPE;',
'    v_id_sb_impsto         DF_I_IMPUESTOS_SUBIMPUESTO.ID_IMPSTO_SBMPSTO%TYPE;',
'    v_estdo                apex_collections.c005%TYPE;',
'    v_ttal_sjto_impsto     NUMBER;',
'    v_cntdad_rgstros_crgdos NUMBER;',
'    v_suma                 NUMBER;',
'    v_cdgo_sjto_tpo        VARCHAR2(1);',
'    v_vgncia_matricula     NUMBER;',
'    v_cont                 NUMBER := 0;',
'    v_cont_vgncia          NUMBER := 0;',
'    v_id_sjto_impsto       v_si_i_sujetos_impuesto.id_sjto_impsto%TYPE;',
'    v_cdgo_rspsta          NUMBER := 0;',
'    v_mnsje_rspsta         VARCHAR2(4000);',
'    vgncia_inicia          NUMBER := NULL;',
'    v_estdo_sjto           NUMBER;',
'BEGIN',
unistr('    -- Inicializaci\00F3n del estado de respuesta'),
'    v_cdgo_rspsta := 0;',
unistr('    v_mnsje_rspsta := ''Inicio del proceso de generaci\00F3n de Paz y Salvo masivo.'';'),
'',
unistr('    -- Eliminamos registros anteriores de la sesi\00F3n'),
'    BEGIN',
'        DELETE FROM gn_g_temporal WHERE N004 = :F_ID_USRIO and c005 in (''Paz y Salvo'', ''Con deuda.'', ''ZIP_Paz_y_Salvo'');',
'        COMMIT;',
'    EXCEPTION',
'        WHEN OTHERS THEN',
'            v_cdgo_rspsta := 5;',
'            v_mnsje_rspsta := ''Error al eliminar registros temporales: '' || SQLERRM;',
'            ROLLBACK;',
'            RAISE_APPLICATION_ERROR(-20001, v_mnsje_rspsta);',
'    END;',
'',
unistr('    -- Procesar la colecci\00F3n'),
'    FOR c_sjetos IN (',
'        SELECT seq_id, C001 AS IDNTFCCION_SJTO, C002 AS ID_IMPSTO, C003 AS ID_SB_IMPSTO',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''ARCHVO_PAZ_SLVO_MSVOS''',
'    ) LOOP',
unistr('        -- Procesar la identificaci\00F3n del sujeto impuesto'),
'        BEGIN',
'            -- Consulta de impuestos',
'            BEGIN',
'                SELECT JK.cdgo_sjto_tpo, JK.ID_SJTO_IMPSTO',
'                INTO v_cdgo_sjto_tpo, v_id_sjto_impsto',
'                FROM v_si_i_sujetos_impuesto JK',
'                INNER JOIN DF_I_IMPUESTOS_SUBIMPUESTO D ON D.ID_IMPSTO = JK.ID_IMPSTO',
'                WHERE JK.cdgo_clnte = :F_CDGO_CLNTE',
'                AND JK.IDNTFCCION_SJTO = c_sjetos.IDNTFCCION_SJTO',
'                AND JK.ID_IMPSTO = c_sjetos.ID_IMPSTO',
'                AND D.ID_IMPSTO_SBMPSTO = c_sjetos.ID_SB_IMPSTO',
'                AND JK.ID_SJTO_ESTDO = 1;',
'            EXCEPTION',
'                WHEN NO_DATA_FOUND THEN',
'                    v_cdgo_rspsta := 2;',
unistr('                    v_mnsje_rspsta := ''No se encontr\00F3 informaci\00F3n del sujeto impuesto para la identificaci\00F3n '' || c_sjetos.IDNTFCCION_SJTO;'),
'                    CONTINUE;',
'                WHEN OTHERS THEN',
'                    v_cdgo_rspsta := 6;',
'                    v_mnsje_rspsta := ''Error en la consulta de impuestos: '' || SQLERRM;',
'                    CONTINUE;',
'            END;',
'',
'            -- Llamada al procedimiento financiero',
'            BEGIN',
'                pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(',
'                    p_cdgo_clnte => :F_CDGO_CLNTE,',
'                    p_id_sjto_impsto => v_id_sjto_impsto',
'                );',
'                COMMIT;',
'            EXCEPTION',
'                WHEN OTHERS THEN',
'                    v_cdgo_rspsta := 7;',
unistr('                    v_mnsje_rspsta := ''Error en la consolidaci\00F3n de conceptos: '' || SQLERRM;'),
'                    ROLLBACK;',
'                    CONTINUE;',
'            END;',
'',
'            IF v_cdgo_sjto_tpo = ''V'' THEN',
unistr('                -- Consulta la vigencia de matr\00EDcula del veh\00EDculo'),
'                BEGIN',
'                    SELECT TO_NUMBER(TO_CHAR(vi.fcha_mtrcla, ''yyyy'')) AS fecha_matricula',
'                    INTO v_vgncia_matricula',
'                    FROM si_i_vehiculos vi',
'                    WHERE vi.id_sjto_impsto = v_id_sjto_impsto;',
'                EXCEPTION',
'                    WHEN NO_DATA_FOUND THEN',
'                        v_vgncia_matricula := NULL;',
'                    WHEN OTHERS THEN',
'                        v_cdgo_rspsta := 8;',
unistr('                        v_mnsje_rspsta := ''Error en la consulta de la vigencia de matr\00EDcula: '' || SQLERRM;'),
'                        CONTINUE;',
'                END;',
'',
'                -- Parametro inicial de vigencia de vehiculo ',
'                BEGIN',
'                    vgncia_inicia := pkg_gn_generalidades.fnc_cl_defniciones_cliente(',
'                        p_cdgo_clnte => :F_CDGO_CLNTE,',
'                        p_cdgo_dfncion_clnte_ctgria => ''GFN'',',
'                        p_cdgo_dfncion_clnte => ''VMC''',
'                    );',
'                EXCEPTION',
'                    WHEN OTHERS THEN',
'                        v_cdgo_rspsta := 10;',
unistr('                        v_mnsje_rspsta := ''Error al obtener la vigencia inicial del veh\00EDculo: '' || SQLERRM;'),
'                        CONTINUE;',
'                END;',
'',
'                IF v_vgncia_matricula > vgncia_inicia THEN',
'                    vgncia_inicia := v_vgncia_matricula;',
'                END IF;',
'',
'                BEGIN',
'                    SELECT COUNT(*)',
'                    INTO v_cont',
'                    FROM gi_g_liquidaciones a',
'                    WHERE a.cdgo_clnte = :F_CDGO_CLNTE',
'                    AND a.id_impsto = c_sjetos.ID_IMPSTO',
'                    AND a.id_impsto_sbmpsto = c_sjetos.ID_SB_IMPSTO',
'                    AND a.id_sjto_impsto = v_id_sjto_impsto',
'                    AND a.vgncia BETWEEN vgncia_inicia AND TO_NUMBER(TO_CHAR(SYSDATE, ''yyyy''))',
'                    AND EXISTS (',
'                        SELECT 1',
'                        FROM v_gf_g_cartera_x_vigencia x',
'                        WHERE a.id_sjto_impsto = x.id_sjto_impsto',
'                        AND a.id_lqdcion = x.id_orgen',
'                        AND x.vgncia = a.vgncia',
'                        AND x.cdgo_mvnt_fncro_estdo <> ''AN''',
'                        AND vlor_sldo_cptal + vlor_intres = 0',
'                    )',
'                    AND a.cdgo_lqdcion_estdo = ''L'';',
'',
'                    v_cont_vgncia := TO_NUMBER(TO_CHAR(SYSDATE, ''yyyy'')) - vgncia_inicia + 1;',
'                EXCEPTION',
'                    WHEN OTHERS THEN',
'                        v_cdgo_rspsta := 12;',
'                        v_mnsje_rspsta := ''Error en la consulta de liquidaciones: '' || SQLERRM;',
'                        CONTINUE;',
'                END;',
'',
'                IF v_cont = v_cont_vgncia THEN',
'                    v_suma := 0;',
'                    v_estdo := ''Paz y Salvo.'';',
'                ELSE',
'                    v_suma := 1;',
'                    v_estdo := ''Con deuda.'';',
'                END IF;',
'            ELSE',
'                -- Consultamos suma de todas las vigencias',
'                BEGIN',
'                    SELECT NVL(SUM(NVL(vlor_intres, 0) + NVL(vlor_sldo_cptal, 0)), 0)',
'                    INTO v_suma',
'                    FROM v_gf_g_cartera_x_vigencia',
'                    WHERE id_sjto_impsto = v_id_sjto_impsto',
'                    AND cdgo_clnte = :F_CDGO_CLNTE',
'                    AND id_impsto = c_sjetos.ID_IMPSTO',
'                    AND id_impsto_sbmpsto = c_sjetos.ID_SB_IMPSTO',
'                    AND cdgo_mvnt_fncro_estdo <> ''AN'';',
'                EXCEPTION',
'                    WHEN OTHERS THEN',
'                        v_cdgo_rspsta := 14;',
'                        v_mnsje_rspsta := ''Error en la consulta de cartera por vigencia: '' || SQLERRM;',
'                        CONTINUE;',
'                END;',
'',
'                IF (v_suma > 0) THEN',
'                    v_estdo := ''Con deuda.'';',
'                ELSIF (v_suma = 0) THEN',
'                    v_estdo := ''Paz y Salvo'';',
'                END IF;',
'            END IF;',
'',
'            -- Insertar en la tabla temporal',
'            BEGIN',
'                INSERT INTO gn_g_temporal (N001, N002, C001, C005, C006, N004,  id_ssion)',
'                VALUES (c_sjetos.ID_IMPSTO, c_sjetos.ID_SB_IMPSTO, c_sjetos.IDNTFCCION_SJTO, v_estdo, v_id_sjto_impsto, :F_ID_USRIO, :APP_SESSION);',
'                COMMIT;',
'            EXCEPTION',
'                WHEN OTHERS THEN',
'                    v_cdgo_rspsta := 16;',
'                    v_mnsje_rspsta := ''Error al insertar en la tabla temporal: '' || SQLERRM;',
'                    ROLLBACK;',
'                    CONTINUE;',
'            END;',
'        END;',
'    END LOOP;',
'',
unistr('    -- Determinar cu\00E1ntos registros se procesaron'),
'  /*  BEGIN',
'        SELECT COUNT(1)',
'        INTO v_cntdad_rgstros_crgdos',
'        FROM gn_g_temporal',
'        WHERE id_ssion = :APP_SESSION;',
'        :P405_MENSJE_RSPSTA := ''Registros Cargados: '' || v_cntdad_rgstros_crgdos;',
'    EXCEPTION',
'        WHEN OTHERS THEN',
'            v_cdgo_rspsta := 18;',
'            v_mnsje_rspsta := ''Error al contar los registros cargados: '' || SQLERRM;',
'    END;*/',
'',
'    IF v_cdgo_rspsta > 0 THEN',
'        ROLLBACK;',
'        RAISE_APPLICATION_ERROR(-20001, v_mnsje_rspsta);',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        v_cdgo_rspsta := 50;',
'        v_mnsje_rspsta := ''Error general: '' || SQLERRM;',
'        RAISE_APPLICATION_ERROR(-20001, v_mnsje_rspsta);',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156842550781926743)
);
end;
/
