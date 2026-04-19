prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Cambio de Estado de Entidades'
,p_page_mode=>'MODAL'
,p_step_title=>'Cambio de Estado de Entidades'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'',
'    var region = apex.region("entidades");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ENTDDES": model.getValue(record, "ID_ENTDDES").trim(),',
'                     "OFCIO_X_PRPTRIO": model.getValue(record, "OFCIO_X_PRPTRIO").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P55_JSON_ENTIDADES'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("BTN_INCLUIR_ENTIDADES").show();',
'        }else {',
'            apex.item("BTN_INCLUIR_ENTIDADES").hide();',
'        }',
'       ',
'    }',
'    ',
'    var region_r = apex.region("responsables");',
'    if (region_r) {',
'',
'        var view_r = region_r.widget().interactiveGrid("getViews", "grid");',
'        var model_r = view_r.model;',
'        var records_r = view_r.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json_r = records_r.map(function (record_r) {',
'            return { "ID_EMBRGOS_RSPNSBLE": model_r.getValue(record_r, "ID_EMBRGOS_RSPNSBLE").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P55_JSON_RSPNSBLES'', json_r.length > 0 ? JSON.stringify(json_r) : '''');',
'        ',
'    }',
'       ',
'    return;',
'    ',
'    //apex.item("btn_Procesar_Embargo").hide();',
'    //apex.item("btn_agregar_entidades_a_investigacion").hide();',
'',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200127200649'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190937701435562845)
,p_plug_name=>'Entidades x Tipo de Embargo'
,p_region_name=>'entidades'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_clnte,a.id_entddes,a.dscrpcion,a.ofcio_x_prptrio',
'  from mc_d_entidades a',
' where a.actvo = ''S''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and exists (select 1',
'                 from mc_g_embargos_cartera b, mc_g_solicitudes_y_oficios c',
'                where b.id_embrgos_crtra = c.id_embrgos_crtra',
'                  and c.id_entddes = a.id_entddes',
'                  and b.id_embrgos_crtra = :P55_ID_EMBRGOS_CRTRA',
'                  and c.id_embrgos_rslcion is null);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190937844979562847)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190937982916562848)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190938019694562849)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Entidad'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190938425058562853)
,p_name=>'OFCIO_X_PRPTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OFCIO_X_PRPTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190938685190562855)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190938802581562856)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(190937772355562846)
,p_internal_uid=>190937772355562846
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(192279790422306608)
,p_interactive_grid_id=>wwv_flow_api.id(190937772355562846)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(192279853454306609)
,p_report_id=>wwv_flow_api.id(192279790422306608)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192280327482306612)
,p_view_id=>wwv_flow_api.id(192279853454306609)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(190937844979562847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192280872657306616)
,p_view_id=>wwv_flow_api.id(192279853454306609)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(190937982916562848)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192281383872306618)
,p_view_id=>wwv_flow_api.id(192279853454306609)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(190938019694562849)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>437
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192283338644306624)
,p_view_id=>wwv_flow_api.id(192279853454306609)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(190938425058562853)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192283857292306626)
,p_view_id=>wwv_flow_api.id(192279853454306609)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(190938685190562855)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190939135811562860)
,p_plug_name=>'Responsables'
,p_region_name=>'responsables'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.ID_EMBRGOS_RSPNSBLE,',
'       a.ID_EMBRGOS_CRTRA,',
'       a.idntfccion,',
'       b.dscrpcion_idntfccion_tpo,',
'       b.NMTCNCO_IDNTFCCION_TPO,',
'       a.prmer_nmbre || '' '' || a.sgndo_nmbre || '' '' || a.prmer_aplldo  || '' '' || a.sgndo_aplldo nombre,',
'       a.prncpal_s_n       ',
'  from MC_G_EMBARGOS_RESPONSABLE a',
'  join df_s_identificaciones_tipo b',
'    on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
' where a.id_embrgos_crtra = :P55_ID_EMBRGOS_CRTRA',
'   and :P55_OFCIO_X_PRPTRIO = ''S'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190939683973562865)
,p_name=>'ID_EMBRGOS_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190939757387562866)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190939829001562867)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(190939907511562868)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190940102138562869)
,p_name=>'NOMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190940128196562870)
,p_name=>'PRNCPAL_S_N'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRNCPAL_S_N'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192288992413398521)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192289084391398522)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192289411545398526)
,p_name=>'NMTCNCO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMTCNCO_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(190939602766562864)
,p_internal_uid=>190939602766562864
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'Para incluir estas entidades no es necesario seleccionar responsables'
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(192307868135422662)
,p_interactive_grid_id=>wwv_flow_api.id(190939602766562864)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(192307967484422662)
,p_report_id=>wwv_flow_api.id(192307868135422662)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192308410379422666)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(190939683973562865)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192309004817422669)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(190939757387562866)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192309430156422671)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(190939829001562867)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192309995598422676)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(190939907511562868)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192310434603422678)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(190940102138562869)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192310976193422679)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(190940128196562870)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192311447100422680)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(192288992413398521)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192378236922698981)
,p_view_id=>wwv_flow_api.id(192307967484422662)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(192289411545398526)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190939231032562861)
,p_plug_name=>'datos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192289771825398529)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286378904214244867)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b><i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>:</i></b> ',
'<i>',
'Funcionalidad que permite cambiar el estado de las solicitudes de investigacion de entidades a una cartera a embargar escogida. se deben escoger las entidades y los responsables para hacer el cambio de estado de acuerdo a la seleccion hecha. Si no se'
||' selecciona ningun responsable se hara el cambio a las entidades de todos.</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96962460732129432)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(192289771825398529)
,p_button_name=>'BTN_CAMBIAR_ESTADO'
,p_button_static_id=>'BTN_INCLUIR_ENTIDADES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cambiar Estado'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96973202982129455)
,p_name=>'P55_ID_EMBRGOS_CRTRA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190939231032562861)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96973671027129457)
,p_name=>'P55_ID_TIPO_EMBARGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190939231032562861)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96974052734129457)
,p_name=>'P55_OFCIO_X_PRPTRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(190939231032562861)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96974416560129459)
,p_name=>'P55_CARTERA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(190939231032562861)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="left:-155px;"'
,p_colspan=>9
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408286777919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96974836091129459)
,p_name=>'P55_JSON_ENTIDADES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(190939231032562861)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96975242933129459)
,p_name=>'P55_JSON_RSPNSBLES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(190939231032562861)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96981485841168001)
,p_name=>'P55_ESTADO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(190939231032562861)
,p_prompt=>'Estado a Cambiar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Activo;S,Inactivo;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'style="left:-220px;"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(96976591866129473)
,p_computation_sequence=>10
,p_computation_item=>'P55_CARTERA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Cartera: ''||cdgo_crtra||'' *Sujeto: ''||idntfccion AS CARTERA',
'from v_mc_g_embargos_cartera',
'where id_embrgos_crtra = :P55_ID_EMBRGOS_CRTRA;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(96975788048129472)
,p_computation_sequence=>20
,p_computation_item=>'P55_OFCIO_X_PRPTRIO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_ofcio_x_prptrio varchar2(1);',
'    ',
'begin',
'',
'    v_ofcio_x_prptrio := ''N'';',
'    ',
'  for ofcio_x_prptrio in (  select distinct a.ofcio_x_prptrio as valor',
'                              from v_mc_d_entidades a',
'                             where a.id_tpos_mdda_ctlar = (select b.id_tpos_mdda_ctlar',
'                                                       from mc_g_embargos_cartera b',
'                                                      where b.id_embrgos_crtra = :P55_ID_EMBRGOS_CRTRA)) loop',
'                                                      ',
'     if ofcio_x_prptrio.valor = ''S'' then',
'         v_ofcio_x_prptrio := ''S'';',
'     end if;',
'     ',
'  end loop;',
'  ',
'  return v_ofcio_x_prptrio;',
'',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(96976165607129473)
,p_computation_sequence=>30
,p_computation_item=>'P55_ID_TIPO_EMBARGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpos_mdda_ctlar',
'from mc_g_embargos_cartera ',
'where id_embrgos_crtra = :P55_ID_EMBRGOS_CRTRA',
'',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96977603808129474)
,p_name=>'Al seleccionar entidad'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(190937701435562845)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96978115599129474)
,p_event_id=>wwv_flow_api.id(96977603808129474)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96978556618129475)
,p_name=>'Al seleccionar responsable'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(190939135811562860)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96979054459129475)
,p_event_id=>wwv_flow_api.id(96978556618129475)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96967631578129448)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(190937701435562845)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Entidades x Tipo de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96972577085129455)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(190939135811562860)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Responsables: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96976828690129473)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Incluir entidades a cartera a embargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_medidas_cautelares.prc_ac_estado_entidades_inv ( p_id_embrgos_crtra 	=> :P55_ID_EMBRGOS_CRTRA,',
'														p_activo 			=> :P55_ESTADO,',
'														p_json_entidades 	=> :P55_JSON_ENTIDADES,',
'														p_json_rspnsbles 	=> :P55_JSON_RSPNSBLES);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(96962460732129432)
,p_process_success_message=>'Entidades generadas correctamente!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96977246209129473)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(96962460732129432)
);
end;
/
