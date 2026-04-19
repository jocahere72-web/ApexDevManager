prompt --application/pages/page_00143
begin
wwv_flow_api.create_page(
 p_id=>143
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Adicion de Actos a lote de impresion'
,p_page_mode=>'MODAL'
,p_step_title=>'Adicion de Actos a lote de impresion'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const fnValidarSeleccion = function (){',
'    var region = apex.region("Actos");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        json = records.map(function (record) {',
'            return { ',
'                     "ID_PRCSOS_JRDCO": model.getValue(record, "ID_PRCSOS_JRDCO").trim(),',
'                     "ID_PRCSOS_JRDCO_DCMNTO": model.getValue(record, "ID_PRCSOS_JRDCO_DCMNTO").trim()',
'                   };',
'        });',
'               ',
'        window.localStorage.setItem(''ActosLoteImpresion'', json.length > 0 ? JSON.stringify(json) : '''');',
'    }',
'}',
'',
'const fnAdicionarActosLoteImpresion = function(){',
'    ',
'    var json_actos = window.localStorage.getItem(''ActosLoteImpresion'');',
'    ',
'    var popup = apex.widget.waitPopup();',
'    ',
'    apex.server.process(',
'            "Adicionar_Actos_Lote_Impresion",',
'            {    ',
'                 f01: json_actos,',
'                pageItems: ''P143_ID_PRCSO_JRDCO_DCMNTO_LTE''',
'            },',
'            {',
'                //dataType: ''text'',',
'                success: function( pData ){',
'',
'                    popup.remove();',
'',
'                    if (pData.o_cdgo_rspsta != 0){ ',
'                        apex.message.clearErrors();',
'                        apex.message.alert(  pData.o_mnsje_rspsta );',
'',
'                    }else{',
'                        apex.message.showPageSuccess("Se han adicionado actos al lote!");',
'                        var region = apex.region( "Actos" );',
'                        region.refresh();',
'',
'                        //refrescarSujetos();',
'                    }',
'                }',
'            }',
'        );',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20211004134019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146967878822737135)
,p_plug_name=>'Actos'
,p_region_name=>'Actos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id_prcsos_jrdco,',
'       nmro_prcso_jrdco,',
'       id_prcsos_jrdco_dcmnto,',
'       nmro_acto,',
'       fcha_acto,',
'       vlor_ttal_dda,',
'       idntfccion',
'FROM v_cb_g_procesos_jrdco_dcmnto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_lte_imprsion is null',
'and id_acto_tpo = :P143_ID_ACTO_TPO',
'--and (trunc(fcha_acto) >= to_date(:P143_FCHA_DSDE,''dd/mm/yyyy'') or :P143_FCHA_DSDE is null)',
'--and (trunc(fcha_acto) <= to_date(:P143_FCHA_HSTA,''dd/mm/yyyy'') or :P143_FCHA_HSTA is null)',
'and id_acto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(146968018501737137)
,p_name=>'ID_PRCSOS_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(146968120974737138)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Proceso')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(146968256260737139)
,p_name=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(146968354259737140)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(146968436204737141)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(146968514979737142)
,p_name=>'VLOR_TTAL_DDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Adeudado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(146968634691737143)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(146969362659737150)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(147018446478824401)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(146967992372737136)
,p_internal_uid=>146967992372737136
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(147009673504785136)
,p_interactive_grid_id=>wwv_flow_api.id(146967992372737136)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(147009742601785136)
,p_report_id=>wwv_flow_api.id(147009673504785136)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6053371003241)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(146969362659737150)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(147010270690785138)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(146968018501737137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(147010788683785140)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(146968120974737138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(147011215312785142)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(146968256260737139)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(147011778711785147)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(146968354259737140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(147012253083785149)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(146968436204737141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(147012729257785151)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(146968514979737142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(147013220491785154)
,p_view_id=>wwv_flow_api.id(147009742601785136)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(146968634691737143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147020143226824418)
,p_plug_name=>unistr('Par\00E1metros de consulta')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147021233434824429)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(147020143226824418)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar Actos'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147018655581824403)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(147020143226824418)
,p_button_name=>'BTN_ADCNAR_ACTOS_SLCCNDOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Adiconar Actos seleccionados'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146968713075737144)
,p_name=>'P143_ID_ACTO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146967878822737135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146968845600737145)
,p_name=>'P143_ID_PRCSO_JRDCO_DCMNTO_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146967878822737135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147020271546824419)
,p_name=>'P143_FCHA_DSDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147020143226824418)
,p_prompt=>'Fecha desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147020349923824420)
,p_name=>'P143_FCHA_HSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(147020143226824418)
,p_prompt=>'Fecha hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(146968935912737146)
,p_computation_sequence=>10
,p_computation_item=>'P143_ID_ACTO_TPO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto_tpo',
'from cb_g_prcsos_jrdco_dcmnt_lte',
'where id_prcso_jrdco_dcmnto_lte = :P143_ID_PRCSO_JRDCO_DCMNTO_LTE'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(147018796657824404)
,p_name=>'Al cambiar seleccion en Actos'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(146967878822737135)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(147018842671824405)
,p_event_id=>wwv_flow_api.id(147018796657824404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnValidarSeleccion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(147019051272824407)
,p_name=>'Al dar Click en BTN_ADCNAR_ACTOS_SLCCNDOS'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(147018655581824403)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(147019140321824408)
,p_event_id=>wwv_flow_api.id(147019051272824407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnAdicionarActosLoteImpresion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(147021318294824430)
,p_name=>'New'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(147021233434824429)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(147021447182824431)
,p_event_id=>wwv_flow_api.id(147021318294824430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(146967878822737135)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(147018511053824402)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(146967878822737135)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Actos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(147018958637824406)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adicionar_Actos_Lote_Impresion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta    varchar2(1000);',
'    v_json_actos     clob;',
'begin',
'',
'    for i IN 1..APEX_APPLICATION.G_F01.count loop ',
'        v_json_actos := v_json_actos||APEX_APPLICATION.G_F01(i);',
'    end loop;',
'    ',
'    pkg_cb_proceso_juridico.prc_rg_actos_lote_impresion(p_id_lte_imprsion => :P143_ID_PRCSO_JRDCO_DCMNTO_LTE,',
'                                                        p_json_actos      => v_json_actos,',
'                                                        o_cdgo_rspsta     => o_cdgo_rspsta,',
'                                                        o_mnsje_rspsta    => o_mnsje_rspsta);',
'                                                        ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
