prompt --application/pages/page_00053
begin
wwv_flow_api.create_page(
 p_id=>53
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Reglas de Acumulaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Reglas de Acumulaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'',
'    var region = apex.region("validaciones");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        if (records.length < 1 ) {',
'            return;',
'        }',
'        //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "VLDO").v === ''S''',
'        });',
'        ',
'        var json = records.map(function(m){',
'                       return {',
'                           id_prcsos_jrdco : model.getValue(m, "ID_PRCSOS_JRDCO") ',
'                       }',
'                   });',
'',
'        console.log(records);',
'        ',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'        apex.region("validaciones").widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    } ',
'',
'}'))
,p_javascript_code_onload=>'$(''#validaciones_tab'').toggleClass(''disabled'')'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#validaciones_ig_report_settings {',
'    display:none !important;',
'}',
'',
'.disabled {',
'    pointer-events: none !important;',
'    opacity: 0.6 !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_dialog_attributes=>'id:''pruebadialog'''
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20200116163300'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94478052209746215)
,p_plug_name=>'Reglas'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94478235816746217)
,p_plug_name=>'Reglas de negocio'
,p_region_name=>'reglas_negocio'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rgla_ngcio_clnte_fncion',
'     , id_rgla_ngcio_clnte',
'     , a.id_fncion',
'     , b.dscrpcion',
'     , indcdor_cmple_vldccion',
'  from gn_d_rglas_ngcio_clnte_fnc a',
'  join gn_d_funciones b on b.id_fncion = a.id_fncion',
' where id_rgla_ngcio_clnte = :P53_RGLA_NGCIO',
'   and actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94478433575746219)
,p_name=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(94478535528746220)
,p_name=>'ID_RGLA_NGCIO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(94478662961746221)
,p_name=>'ID_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(94478783503746222)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(94478846996746223)
,p_name=>'INDCDOR_CMPLE_VLDCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CMPLE_VLDCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta esperada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(94478341201746218)
,p_internal_uid=>94478341201746218
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(95374287912383380)
,p_interactive_grid_id=>wwv_flow_api.id(94478341201746218)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95374374688383380)
,p_report_id=>wwv_flow_api.id(95374287912383380)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95374800902383383)
,p_view_id=>wwv_flow_api.id(95374374688383380)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(94478433575746219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95375327365383386)
,p_view_id=>wwv_flow_api.id(95374374688383380)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(94478535528746220)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95375844351383388)
,p_view_id=>wwv_flow_api.id(95374374688383380)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(94478662961746221)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95376328100383389)
,p_view_id=>wwv_flow_api.id(95374374688383380)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(94478783503746222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>524
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95376813108383391)
,p_view_id=>wwv_flow_api.id(95374374688383380)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(94478846996746223)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94479549014746230)
,p_plug_name=>'Tabulador'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94479698426746231)
,p_plug_name=>'Validaciones'
,p_region_name=>'validaciones'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_prcsos_jrdco',
'        , a.nmro_prcso_jrdco ',
'        , a.fcha',
'        , a.idntfccion',
'        , trim(a.drccion) drccion',
'        , b.c001',
'        , nvl(b.c002, ''N'') vldo',
'        , nvl(b.c003, ''N'') pdre',
'     from v_cb_g_procesos_jrdco_dcmnto a',
'     join (select id_prcso from json_table( to_char(:P51_JSON), ''$[*]''',
'                                            columns ( id_prcso number path ''$.procesos'' ) ',
'                                          )  ',
'          ) c',
'       on c.id_prcso  = a.id_prcsos_jrdco',
'left join apex_collections b',
'       on n001 = a.id_prcsos_jrdco',
'      and collection_name = ''PROCESOS''',
'    where a.actvo        = ''S'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95654353418644901)
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
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95654430138644902)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(95654533014644903)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy'
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
 p_id=>wwv_flow_api.id(95654611939644904)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(95654727799644905)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(95654825496644906)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95656287706644920)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95656399757644921)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95656825302644926)
,p_name=>'VLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFEs acumulable?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95657644751644934)
,p_name=>'PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(94479766254746232)
,p_internal_uid=>94479766254746232
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
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' config.initialSelection = false;',
' return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(95423760976601026)
,p_interactive_grid_id=>wwv_flow_api.id(94479766254746232)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95423874309601026)
,p_report_id=>wwv_flow_api.id(95423760976601026)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95660362465645149)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(95654353418644901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95660894072645152)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(95654430138644902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95661327637645154)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(95654533014644903)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95661836299645155)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(95654611939644904)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95662337241645157)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(95654727799644905)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95662851217645158)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(95654825496644906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>405
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95794819957925392)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(95656287706644920)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95998193864072398)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(95656825302644926)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96285284260528158)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(95657644751644934)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(195197000000)
,p_view_id=>wwv_flow_api.id(95423874309601026)
,p_execution_seq=>5
,p_name=>'Procesos acumulables'
,p_background_color=>'#3BAA2C'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(95656825302644926)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Si'
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94479300276746228)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(94478235816746217)
,p_button_name=>'BTN_VLDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Validar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P53_RGLA_NGCIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94479902734746234)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(94479698426746231)
,p_button_name=>'BTN_PRCSAR'
,p_button_static_id=>'BTN_PRCSAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94478925510746224)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(94478052209746215)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(97126609266064003)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_XML,P2_ID_RPRTE:<data><id_prcso_jrdco_acmldo>&P53_ID_PRCSO_JRDCO_ACMLDO.</id_prcso_jrdco_acmldo><funcion>pkg_gn_generalidades.prc_ac_acto(p_file_blob =>Â¡v_blob! p_id_acto =>&P53_ID_ACTO.!p_ntfccion_atmtca=>''S'')</funcion></data>,&P53_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94479902734746234)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(97127271371064009)
,p_branch_name=>'Go To Page 51'
,p_branch_action=>'f?p=&APP_ID.:51:&SESSION.:REPORT:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94479902734746234)
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94478122828746216)
,p_name=>'P53_RGLA_NGCIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94478052209746215)
,p_prompt=>'Regla Negocio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rgla ',
'     , id_rgla_ngcio_clnte --,dscrp_rgla_ngcio_clnte',
'  from v_gn_d_reglas_negocio_cliente',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_prcso = 21'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
unistr('Muestra las reglas de negocio para aplicar en la acumulaci\00F3n de procesos jur\00EDdicos.'),
'</p>',
'<b>Nota:</b> Las reglas solo se aplicaran al momento de nivelar los procesos acumulados.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95657530631644933)
,p_name=>'P53_JSON_ACUM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(94478052209746215)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97126454040064001)
,p_name=>'P53_RPRTE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94478052209746215)
,p_prompt=>'Plantilla de Reporte'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte',
'     , id_rprte ',
'  from gn_d_reportes ',
' where cdgo_rprte_grpo = ''ACM'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la plantilla de reporte con la que desea hacer la validaci\00F3n para la acumulaci\00F3n de procesos')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97126554854064002)
,p_name=>'P53_ID_PRCSO_JRDCO_ACMLDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(94478052209746215)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97126713236064004)
,p_name=>'P53_ID_ACTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(94478052209746215)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97126836673064005)
,p_name=>'P53_XML'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(94478052209746215)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95657789412644935)
,p_validation_name=>'Validar json no sea nulo '
,p_validation_sequence=>10
,p_validation=>':P53_JSON_ACUM is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe seleccionar procesos acumular'
,p_when_button_pressed=>wwv_flow_api.id(94479902734746234)
,p_associated_item=>wwv_flow_api.id(95657530631644933)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95657871380644936)
,p_validation_name=>'validar que este seleccionado el padre'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'p_pdre number;',
'',
'begin',
'    select id_prcso',
'      into p_pdre',
'      from (select id_prcso',
'                 , pdre ',
'              from json_table( :P53_JSON_ACUM , ''$[*]''',
'                               columns ( id_prcso number path ''$.procesos'',',
'                                         pdre     varchar2 path ''$.pdre'' ) ',
'                             )',
'           ) s ',
'     where pdre = ''S'';',
'     ',
'    return p_pdre is not null;',
'    ',
'exception',
'    when others then',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe seleccionar el registro padre'
,p_when_button_pressed=>wwv_flow_api.id(94479902734746234)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94480108858746236)
,p_name=>unistr('al hacer clic en el bot\00F3n validar')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94479300276746228)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94480214195746237)
,p_event_id=>wwv_flow_api.id(94480108858746236)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.page.validate()) {',
'    apex.server.process ("validar_procesos").then(function (resp) {',
'        var tab =  $(''#validaciones_tab'');',
'        apex.message.clearErrors();',
'        if (resp.type === ''OK''){',
'            apex.region("validaciones").refresh();',
'            tab.hasClass(''disabled'') ? $(''#validaciones_tab'').removeClass(''disabled'') : '''';',
'            $(''#validaciones_tab a[href="#validaciones"]'').trigger(''click'');   ',
'            apex.message.showPageSuccess(resp.msg);',
'        } else { ',
'            tab.hasClass(''disabled'') ? '''' : $(''#validaciones_tab'').addClass(''disabled'') ;',
'            apex.message.showErrors([',
'                {',
'                    type:       "error",',
'                    location:   [ "page"],',
'                    message:    resp.msg,',
'                    unsafe:     false',
'                }',
'            ]);',
'        }',
'    })',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95656683955644924)
,p_name=>'al seleccionar un registro de la grilla'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(94479698426746231)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95656744353644925)
,p_event_id=>wwv_flow_api.id(95656683955644924)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var records = this.data.selectedRecords,',
'    model = this.data.model;',
'',
'var validos = records.filter(function (f) {',
'    return model.getValue(f, "VLDO").v === ''S''',
'});',
'',
'var json = validos.map(function(m){',
'               return {',
'                   procesos : model.getValue(m, "ID_PRCSOS_JRDCO"),',
'                   pdre     : model.getValue(m, "PDRE") ',
'               }',
'           });',
'',
'$s(''P53_JSON_ACUM'', json.length > 1 ? JSON.stringify(json) : '''');',
'apex.region("validaciones").widget().interactiveGrid("setSelectedRecords", validos);',
'validos.length > 1 ? apex.item(''BTN_PRCSAR'').show() : apex.item(''BTN_PRCSAR'').hide();',
'',
'return;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97127621455064013)
,p_name=>unistr('al hacer clic en el bot\00F3n procesar')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94479902734746234)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97127786729064014)
,p_event_id=>wwv_flow_api.id(97127621455064013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.setItem(''close'', 1);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97127805785064015)
,p_event_id=>wwv_flow_api.id(97127621455064013)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_PRCSAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97127982661064016)
,p_name=>'al cargar la pagina'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_display_when_cond=>'DELETE_COLLECTION'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97128029116064017)
,p_event_id=>wwv_flow_api.id(97127982661064016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.removeItem(''close'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95657099131644928)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Acumulaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_proceso_juridico.prc_rg_procesos_acumulados( p_cdgo_clnte            => :F_CDGO_CLNTE',
'                                                  , p_json                  => :P53_JSON_ACUM',
'                                                  , p_id_usrio              => :F_ID_USRIO',
'                                                  , p_id_fljo_grpo          => :P51_ID_FLJO_GRPO',
'                                                  , p_id_rgla_ngcio_clnte   => :P53_RGLA_NGCIO',
'                                                  , o_id_prcso_jrdco_acmldo => :P53_ID_PRCSO_JRDCO_ACMLDO',
'                                                  , o_id_acto               => :P53_ID_ACTO);',
'',
':P53_XML := ''<data><id_prcso_jrdco_acmldo>''|| :P53_ID_PRCSO_JRDCO_ACMLDO || ',
unistr('            ''</id_prcso_jrdco_acmldo><fncion>pkg_gn_generalidades.prc_ac_acto(p_file_blob =>\00A1v_blob! p_id_acto =>''|| :P53_ID_ACTO ||'),
'            ''!p_ntfccion_atmtca=>''''S'''')</fncion></data>'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94479902734746234)
,p_process_success_message=>'Procesos acumulados exitosamente!!'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95657135331644929)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar modal'
,p_attribute_01=>'P53_ID_ACTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94479902734746234)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95656577590644923)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'borrar coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'if apex_collection.collection_exists ( p_collection_name => ''PROCESOS'') then ',
'    apex_collection.delete_collection ( p_collection_name =>  ''PROCESOS'' );',
'end if;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_COLLECTION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94480083852746235)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validar_procesos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'    pkg_cb_proceso_juridico.prc_vl_procesos_acumulables(p_json => :P51_JSON);',
'   ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''msg'' , ''Validaciones correctas'');',
'    apex_json.close_all;',
'    ',
'exception',
'    when others then ',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'' , ''Ocurrio un error validando los procesos'');',
'        apex_json.close_all;',
'end;',
'',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
