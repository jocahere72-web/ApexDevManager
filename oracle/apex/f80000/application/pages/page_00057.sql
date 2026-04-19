prompt --application/pages/page_00057
begin
wwv_flow_api.create_page(
 p_id=>57
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Nueva Entidad a Investigaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Nueva Entidad a Investigaci\00F3n')
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
'        $s(''P57_JSON_ENTIDADES'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("BTN_INCLUIR_ENTIDADES").show();',
'        }else {',
'            apex.item("BTN_INCLUIR_ENTIDADES").hide();',
'        }',
'       ',
'    }',
'       ',
'    return;',
'    ',
'    //apex.item("btn_Procesar_Embargo").hide();',
'    //apex.item("btn_agregar_entidades_a_investigacion").hide();',
'',
'}',
'',
'function validar_sel_r() {',
'',
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
'        $s(''P57_JSON_RSPNSBLES'', json_r.length > 0 ? JSON.stringify(json_r) : '''');',
'        ',
'    }',
'       ',
'    return;',
'    ',
'    //apex.item("btn_Procesar_Embargo").hide();',
'    //apex.item("btn_agregar_entidades_a_investigacion").hide();',
'',
'}',
'    ',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200128100702'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93975996096433425)
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
'select a.id_entddes,a.cdgo_clnte,a.dscrpcion,a.drccion,a.id_tpos_mdda_ctlar as id_tpos_embrgo,a.dscrpcion_tpo_embrgo,a.ofcio_x_prptrio',
'from v_mc_d_entidades a',
'where a.id_tpos_mdda_ctlar = :P57_ID_TIPO_EMBARGO',
'and a.cdgo_clnte = :F_CDGO_CLNTE;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93976139640433427)
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
 p_id=>wwv_flow_api.id(93976277577433428)
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
 p_id=>wwv_flow_api.id(93976314355433429)
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
 p_id=>wwv_flow_api.id(93976457213433430)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93976595215433431)
,p_name=>'ID_TPOS_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(93976679840433432)
,p_name=>'DSCRPCION_TPO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TPO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93976719719433433)
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
 p_id=>wwv_flow_api.id(93976979851433435)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93977097242433436)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(93976067016433426)
,p_internal_uid=>93976067016433426
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
 p_id=>wwv_flow_api.id(95318085083177188)
,p_interactive_grid_id=>wwv_flow_api.id(93976067016433426)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95318148115177189)
,p_report_id=>wwv_flow_api.id(95318085083177188)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95318622143177192)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(93976139640433427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95319167318177196)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(93976277577433428)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95319678533177198)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(93976314355433429)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>437
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95320154966177199)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(93976457213433430)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95320666678177201)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(93976595215433431)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95321143387177203)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(93976679840433432)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95321633305177204)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(93976719719433433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95322151953177206)
,p_view_id=>wwv_flow_api.id(95318148115177189)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(93976979851433435)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93977430472433440)
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
' where a.id_embrgos_crtra = :P57_ID_EMBRGOS_CRTRA',
'   and :P57_OFCIO_X_PRPTRIO = ''S'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93977978634433445)
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
 p_id=>wwv_flow_api.id(93978052048433446)
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
 p_id=>wwv_flow_api.id(93978123662433447)
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
 p_id=>wwv_flow_api.id(93978202172433448)
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
 p_id=>wwv_flow_api.id(93978396799433449)
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
 p_id=>wwv_flow_api.id(93978422857433450)
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
 p_id=>wwv_flow_api.id(95327287074269101)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95327379052269102)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95327706206269106)
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
 p_id=>wwv_flow_api.id(93977897427433444)
,p_internal_uid=>93977897427433444
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
 p_id=>wwv_flow_api.id(95346162796293242)
,p_interactive_grid_id=>wwv_flow_api.id(93977897427433444)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95346262145293242)
,p_report_id=>wwv_flow_api.id(95346162796293242)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95346705040293246)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(93977978634433445)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95347299478293249)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(93978052048433446)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95347724817293251)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(93978123662433447)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95348290259293256)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(93978202172433448)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95348729264293258)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(93978396799433449)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95349270854293259)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(93978422857433450)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95349741761293260)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(95327287074269101)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95416531583569561)
,p_view_id=>wwv_flow_api.id(95346262145293242)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(95327706206269106)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93977525693433441)
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
 p_id=>wwv_flow_api.id(95328066486269109)
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
 p_id=>wwv_flow_api.id(189417198875115447)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b><i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>:</i></b> ',
'Funcionalidad que permite incluir solicitud de investigacion de entidades a una cartera a embargar escogida.'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95328136111269110)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95328066486269109)
,p_button_name=>'BTN_INCLUIR_ENTIDADES'
,p_button_static_id=>'BTN_INCLUIR_ENTIDADES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Incluir Entidades'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93976884771433434)
,p_name=>'P57_ID_TIPO_EMBARGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93977215905433438)
,p_name=>'P57_OFCIO_X_PRPTRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93977626876433442)
,p_name=>'P57_ID_EMBRGOS_CRTRA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95327872473269107)
,p_name=>'P57_CARTERA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="left:-155px;"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408286777919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95328754292269116)
,p_name=>'P57_JSON_ENTIDADES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95328843586269117)
,p_name=>'P57_JSON_RSPNSBLES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103142525974723819)
,p_name=>'P57_TPO_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_prompt=>'Tipo de Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Puntual;P,Masiva;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de Plantilla masiva o puntual.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103142615103723820)
,p_name=>'P57_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(93977525693433441)
,p_prompt=>unistr('Plantilla Solicitudes de Investigaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P57_ID_TIPO_EMBARGO',
'where a.tpo_plntlla = :P57_TPO_PLNTLLA',
'and a.actvo = ''S''',
'and a.id_prcso = 26',
'and b.tpo_dcmnto = ''O''',
'and b.clse_dcmnto = ''P'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P57_TPO_PLNTLLA'
,p_ajax_items_to_submit=>'P57_ID_PLNTLLA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Plantilla para generar los documentos de la investigaci\00F3n para cada entidad seleccionada.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(95327957952269108)
,p_computation_sequence=>10
,p_computation_item=>'P57_CARTERA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Cartera: ''||cdgo_crtra||'' *Sujeto: ''||idntfccion AS CARTERA',
'from v_mc_g_embargos_cartera',
'where id_embrgos_crtra = :P57_ID_EMBRGOS_CRTRA;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(93977362310433439)
,p_computation_sequence=>20
,p_computation_item=>'P57_OFCIO_X_PRPTRIO'
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
'                                                             from mc_g_embargos_cartera b',
'                                                            where b.id_embrgos_crtra = :P57_ID_EMBRGOS_CRTRA)) loop',
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
 p_id=>wwv_flow_api.id(93977721336433443)
,p_computation_sequence=>30
,p_computation_item=>'P57_ID_TIPO_EMBARGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpos_mdda_ctlar',
'from mc_g_embargos_cartera ',
'where id_embrgos_crtra = :P57_ID_EMBRGOS_CRTRA'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95328310777269112)
,p_name=>'Al seleccionar entidad'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(93975996096433425)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95328455461269113)
,p_event_id=>wwv_flow_api.id(95328310777269112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95328547382269114)
,p_name=>'Al seleccionar responsable'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(93977430472433440)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95328611313269115)
,p_event_id=>wwv_flow_api.id(95328547382269114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel_r();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93977105633433437)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(93975996096433425)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Entidades x Tipo de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95327480672269103)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(93977430472433440)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Responsables: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95328934174269118)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Incluir entidades a cartera a embargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_CB_MEDIDAS_CAUTELARES.prc_rg_entidades_investigacion (p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                          p_id_usuario     => :F_ID_USRIO,',
'                                                          p_id_embrgos_crtra => :P57_ID_EMBRGOS_CRTRA,',
'                                                          p_id_tpos_mdda_ctlar => :P57_ID_TIPO_EMBARGO,',
'                                                          p_id_plntlla => :P57_ID_PLNTLLA,',
'                                                          p_json_entidades => :P57_JSON_ENTIDADES,',
'                                                          p_json_rspnsbles => :P57_JSON_RSPNSBLES);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95328136111269110)
,p_process_success_message=>'Entidades generadas correctamente!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95329127356269120)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95328136111269110)
);
end;
/
