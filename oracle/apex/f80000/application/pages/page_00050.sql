prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Incluir Documentos a Lote'
,p_step_title=>'Incluir Documentos a Lote'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("actos");',
'    if (region) {',
'        ',
'       var view = apex.region("actos").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'   ',
'       var json = records.map(function(record){',
'           return { "id_prcsos_jrdco_dcmnto" : model.getValue(record , "ID_PRCSOS_JRDCO_DCMNTO").trim()                    ',
'                  };',
'       });',
'       $(''#P50_JSON_ACTOS'').val(json.length > 0 ? JSON.stringify(json) : '''');',
'       if (json.length > 0 ) {',
'          ',
'          apex.item( "BTN_AGRGR_DCMNTO" ).show();',
'       }else{',
'           ',
'         apex.item( "BTN_AGRGR_DCMNTO" ).hide();',
'       } ',
'       return;',
'   }   ',
'   ',
'    apex.item( "BTN_AGRGR_DCMNTO" ).hide();',
'   ',
'}',
' '))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200302140331'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91057849742895608)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91057994684895609)
,p_plug_name=>unistr('Observaci\00F3n de Lote')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91058069192895610)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91266980384836375)
,p_plug_name=>'Actos'
,p_region_name=>'actos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_clnte,',
'       a.id_prcsos_jrdco,',
'       a.id_prcsos_jrdco_dcmnto,',
'       a.nmro_prcso_jrdco,       ',
'       a.id_acto,',
'       a.nmro_acto,       ',
'       to_char(a.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'       a.id_acto_tpo,',
'       a.dscrpcion_acto_tpo,',
'       a.idntfccion',
'  from v_cb_g_procesos_jrdco_dcmnto a, gn_g_actos b',
' where a.id_acto = b.id_acto',
' /*and b.indcdor_ntfccion = ''N''*/',
'   and a.id_acto is not null',
'   and not exists (select 1',
'                     from cb_g_procesos_jrdco_lte_dtlle b',
'                    where b.id_prcsdo = a.id_prcsos_jrdco_dcmnto',
'                      and b.id_prcso_jrdco_lte = :P50_ID_PRCSO_JRDCO_LTE)',
'   and (:P50_PRCSO_JRDCO_DSDE IS NULL OR a.nmro_prcso_jrdco >= :P50_PRCSO_JRDCO_DSDE)',
'   and (:P50_PRCSO_JRDCO_HSTA IS NULL OR a.nmro_prcso_jrdco <= :P50_PRCSO_JRDCO_HSTA)',
'   and (:P50_NMRO_DCMNTO_DSDE IS NULL OR a.nmro_acto >= :P50_NMRO_DCMNTO_DSDE)',
'   and (:P50_NMRO_DCMNTO_HSTA IS NULL OR a.nmro_acto <= :P50_NMRO_DCMNTO_HSTA)',
'   and (:P50_IDNTFCCION_SJTO  IS NULL OR a.idntfccion = :P50_IDNTFCCION_SJTO)',
'   and (:P50_FCHA_DCMNTO_DSDE IS NULL OR TRUNC(a.fcha_acto) >= TRUNC(TO_DATE(:P50_FCHA_DCMNTO_DSDE,''DD/MM/YYYY'')))',
'   and (:P50_FCHA_DCMNTO_HSTA IS NULL OR TRUNC(a.fcha_acto) <= TRUNC(TO_DATE(:P50_FCHA_DCMNTO_HSTA,''DD/MM/YYYY'')))',
'   and a.id_acto_tpo = (CASE ',
'                           WHEN :P50_ID_TPO_ACTO IS NOT NULL THEN :P50_ID_TPO_ACTO',
'                           ELSE :P50_TPO_ACTO',
'                      END);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91058778541895617)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91058851492895618)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91268750577836408)
,p_name=>'ID_PRCSOS_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91269999213836409)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Proceso Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91273590769836411)
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
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91274142501836421)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91281314095836425)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91282557395836426)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91283167263836426)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91284955342836427)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91285526512836427)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91286142836836427)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy'
,p_is_required=>false
,p_max_length=>10
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(91267483431836377)
,p_internal_uid=>91267483431836377
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(91267826299836380)
,p_interactive_grid_id=>wwv_flow_api.id(91267483431836377)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(91267956430836380)
,p_report_id=>wwv_flow_api.id(91267826299836380)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91269117446836409)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(91268750577836408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91270349833836410)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(91269999213836409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91273950704836412)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(91273590769836411)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91274514720836422)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(91274142501836421)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91281726314836425)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(91281314095836425)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91282990480836426)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(91282557395836426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91283509673836426)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(91283167263836426)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>356
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91285318811836427)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(91284955342836427)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>165
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91285940657836427)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(91285526512836427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91286578302836428)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(91286142836836427)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91297841090099447)
,p_view_id=>wwv_flow_api.id(91267956430836380)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(91058778541895617)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91487886044759429)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
unistr('<b><i></i></b>Esta funcionalidad permite adicionar actos a un lote de impresi\00F3n. En caso dado no se haya escogido lote este ser\00E1 creado y se adicionar\00E1n los actos a ese nuevo lote.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91059198479895621)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(91058069192895610)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RP,48:P48_ID_PRCSO_JRDCO_LTE:&P50_ID_PRCSO_JRDCO_LTE.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91059215152895622)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(91058069192895610)
,p_button_name=>'BTN_AGRGR_DCMNTO'
,p_button_static_id=>'BTN_AGRGR_DCMNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Incluir Documentos'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91059015872895620)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(91057849742895608)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91058191624895611)
,p_name=>'P50_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(91057994684895609)
,p_prompt=>'Lote'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P50_ID_PRCSO_JRDCO_LTE'
,p_display_when_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91058267075895612)
,p_name=>'P50_ID_PRCSO_JRDCO_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(91057994684895609)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91058315699895613)
,p_name=>'P50_OBSRVCION_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(91057994684895609)
,p_prompt=>unistr('Observaci\00F3n de Lote')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>1000
,p_cHeight=>1
,p_read_only_when=>'P50_ID_PRCSO_JRDCO_LTE'
,p_read_only_when_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente al lote ')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91058642693895616)
,p_name=>'P50_TPO_ACTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_acto_tpo',
'from gn_d_actos_tipo a',
'where exists (select 1',
'              from v_cb_g_procesos_jrdco_dcmnto b',
'              where b.id_acto_tpo = a.id_acto_tpo);'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P50_ID_TPO_ACTO'
,p_display_when_type=>'ITEM_IS_NULL_OR_ZERO'
,p_read_only_when=>'P50_ID_PRCSO_JRDCO_LTE'
,p_read_only_when_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tipo de Acto asociado a los Actos del proceso para realizar la b\00FAsqueda.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91059933750895629)
,p_name=>'P50_ID_TPO_ACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91060040252895630)
,p_name=>'P50_PRCSO_JRDCO_DSDE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>unistr('Proceso Jur\00EDdico Desde')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de proceso jur\00EDdico inicial para realizar la b\00FAsqueda.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91060125574895631)
,p_name=>'P50_PRCSO_JRDCO_HSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>unistr('Proceso Jur\00EDdico Hasta')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de proceso jur\00EDdico final para realizar la b\00FAsqueda.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91060255906895632)
,p_name=>'P50_FCHA_DCMNTO_DSDE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>'Fecha Acto Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Fecha de Acto inicial para realizar la b\00FAsqueda.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91060398607895633)
,p_name=>'P50_FCHA_DCMNTO_HSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>'Fecha Acto Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Fecha de Acto final para realizar la b\00FAsqueda.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91060411236895634)
,p_name=>'P50_NMRO_DCMNTO_DSDE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>unistr('N\00FAmero Acto Desde')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de acto inicial para realizar la b\00FAsqueda.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91060573271895635)
,p_name=>'P50_NMRO_DCMNTO_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>unistr('N\00FAmero Acto Hasta')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de Acto final para realizar la b\00FAsqueda.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91060643956895636)
,p_name=>'P50_IDNTFCCION_SJTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(91057849742895608)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identificaci\00F3n del sujeto de tributo para realizar la b\00FAsqueda.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91485135790759402)
,p_name=>'P50_JSON_ACTOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(91057994684895609)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91058471275895614)
,p_computation_sequence=>10
,p_computation_item=>'P50_OBSRVCION_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion_lte',
'  from cb_g_procesos_juridico_lote a',
' where a.cdgo_clnte = :F_CDGO_CLNTE ',
'   and a.id_prcso_jrdco_lte = :P50_ID_PRCSO_JRDCO_LTE',
'   and a.tpo_lte = ''LIM'''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91058570152895615)
,p_computation_sequence=>20
,p_computation_item=>'P50_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: ''||a.cnsctvo_lte||'' *Fecha: ''||to_char(a.fcha_lte,''dd/mm/yyyy'')||'' *Funcionario: ''||b.nmbre_trcro||'' *Tipo de Acto: ''||c.dscrpcion  as dscrpcion_Lte',
'  from cb_g_procesos_juridico_lote a, v_sg_g_usuarios b, gn_d_actos_tipo c',
' where a.id_fncnrio = b.id_fncnrio',
'   and c.id_acto_tpo = a.id_acto_tpo',
'   and a.cdgo_clnte = :F_CDGO_CLNTE ',
'   and a.id_prcso_jrdco_lte = :P50_ID_PRCSO_JRDCO_LTE',
'   and a.tpo_lte = ''LIM'';'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(91485085329759401)
,p_validation_name=>'Debe tener un tipo de acto escogido'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
' IF :P50_TPO_ACTO IS NOT NULL AND :P50_ID_TPO_ACTO IS NULL THEN',
'     RETURN TRUE;',
' ELSIF :P50_TPO_ACTO IS NULL AND :P50_ID_TPO_ACTO IS NOT NULL THEN',
'     RETURN TRUE;',
' ELSE',
'     RETURN FALSE;',
' END IF;',
'     ',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Es necesario escoger un tipo de acto.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91485297875759403)
,p_name=>'Al cargar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91485371599759404)
,p_event_id=>wwv_flow_api.id(91485297875759403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {  ',
'    var region = apex.region("actos");',
'    if (region) {',
'        apex.region("actos").widget().interactiveGrid("setSelectedRecords", []);',
'    }',
'    recorrer_grid();      ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91485451909759405)
,p_name=>'Al hacer clic en el grid de actos'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(91266980384836375)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91485575357759406)
,p_event_id=>wwv_flow_api.id(91485451909759405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91485693930759407)
,p_event_id=>wwv_flow_api.id(91485451909759405)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P50_JSON_ACTOS'', :P50_JSON_ACTOS);',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91485796076759408)
,p_name=>'Antes de enviar pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91485840930759409)
,p_event_id=>wwv_flow_api.id(91485796076759408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62814962228590302)
,p_name=>'Cambio de fehca'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_FCHA_DCMNTO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62815065428590303)
,p_event_id=>wwv_flow_api.id(62814962228590302)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P50_FCHA_DCMNTO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P50_FCHA_DCMNTO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91058933065895619)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(91266980384836375)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Incluir Documentos a Lote: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91485991341759410)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Documento-lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_prcso_jrdco_lte cb_g_procesos_juridico_lote.id_prcso_jrdco_lte%type;',
'begin',
'    pkg_cb_proceso_juridico.prc_rg_lote_impresion_pj (  p_cdgo_clnte                => :F_CDGO_CLNTE,   ',
'                                                        p_id_prcso_jrdco_lte        => :P50_ID_PRCSO_JRDCO_LTE,',
'                                                        p_obsrvcion_lte             => :P50_OBSRVCION_LTE,',
'                                                        p_id_acto_tpo               => (CASE WHEN :P50_ID_TPO_ACTO IS NOT NULL ',
'                                                                                             THEN :P50_ID_TPO_ACTO',
'                                                                                             ELSE :P50_TPO_ACTO',
'                                                                                        END),',
'                                                        p_id_usrio                  => :F_ID_USRIO,',
'                                                        p_json_actos                => :P50_JSON_ACTOS,',
'                                                        p_id_prcso_jrdco_lte_nvo    => v_id_prcso_jrdco_lte);',
'                                                        ',
'   :P50_ID_PRCSO_JRDCO_LTE := v_id_prcso_jrdco_lte;',
'                                        ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(91059215152895622)
);
null;
end;
/
