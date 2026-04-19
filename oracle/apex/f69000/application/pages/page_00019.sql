prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Registro de Novedad Masiva Predial'
,p_step_title=>'Registro de Novedad Masiva Predial'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101164953'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123858861181153613)
,p_plug_name=>'<b>Registro Procesados</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.id_nvdad_prdio_crgue',
'         , a.idntfccion',
'         , trim( b.drccion ) as drccion',
'         , a.cdgo_estrto',
'         , a.id_prdio_dstno',
'         , a.id_prdio_uso_slo',
'         , decode( a.indcdor_rlzdo , ''S'' , ''Si'' , ''No'' ) as indcdor_rlzdo',
'         , a.mnsje_rspsta',
'         , nvl(( select b.indcdor_usa_estrto from df_i_predios_destino b where b.id_prdio_dstno = a.id_prdio_dstno ) , ''N'' ) as indcdor_usa_estrto',
'         , a.nmero_lnea',
'      from si_g_novedades_prdio_crgue a',
' left join v_si_i_sujetos_impuesto b',
'        on a.id_sjto_impsto = b.id_sjto_impsto',
'     where id_prcso_crga    = :P19_ID_PRCSO_CRGA'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P19_ID_NVDAD_PRDIO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3578263412725410)
,p_name=>'INDCDOR_USA_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_USA_ESTRTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3825254283041501)
,p_name=>'NMERO_LNEA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMERO_LNEA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero de Linea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(123859043269153615)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123859186313153616)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123859220614153617)
,p_name=>'CDGO_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTRTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estrato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_estrto as v',
'       , cdgo_estrto as k ',
'    from df_s_estratos  ',
'   where cdgo_estrto not in ( ''00'' , ''99'' )',
'order by cdgo_estrto'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'not :P19_CDGO_ACTO_TPO in ( ''RCU'' )'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123859334494153618)
,p_name=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_DSTNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Destino'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmtcnco || '' - '' || dscrpcion as v',
'       , id_prdio_dstno as k',
'    from df_i_predios_destino',
'   where cdgo_clnte  = :F_CDGO_CLNTE',
'     and id_impsto   = :P19_ID_IMPSTO',
'     and nmtcnco <> ''99''',
'order by v'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'not :P19_CDGO_ACTO_TPO in ( ''RCE'' , ''RCU'' )'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123859426347153619)
,p_name=>'ID_PRDIO_USO_SLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_USO_SLO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Uso Suelo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(105709622329748016)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'not :P19_CDGO_ACTO_TPO in ( ''RCE'' , ''RCD'' )'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123859519452153620)
,p_name=>'INDCDOR_RLZDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RLZDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Indicador Realizado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123859645915153621)
,p_name=>'MNSJE_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MNSJE_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Mensaje Respuesta'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123860070492153625)
,p_name=>'ID_NVDAD_PRDIO_CRGUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDAD_PRDIO_CRGUE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(123858959713153614)
,p_internal_uid=>123858959713153614
,p_is_editable=>true
,p_edit_operations=>'u'
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(123870424274478105)
,p_interactive_grid_id=>wwv_flow_api.id(123858959713153614)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(123870587590478105)
,p_report_id=>wwv_flow_api.id(123870424274478105)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3593570789838786)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(3578263412725410)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3831346216041682)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(3825254283041501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123871035448478106)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(123859043269153615)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>190
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123871506623478107)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(123859186313153616)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123872052357478109)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(123859220614153617)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123872567056478111)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(123859334494153618)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123873002565478112)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(123859426347153619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123873585847478113)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(123859519452153620)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123874054077478115)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(123859645915153621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123886593439542935)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(123860070492153625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(83137000008)
,p_view_id=>wwv_flow_api.id(123870587590478105)
,p_execution_seq=>5
,p_name=>'Referencia con Inconsistencia'
,p_background_color=>'#FF7755'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(123859519452153620)
,p_condition_operator=>'NEQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Si'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124061775177975901)
,p_plug_name=>'<b>Cambio Masivo de Novedad de Predial</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--slimPadding:margin-top-sm'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P19_ID_NVDAD_PRDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(340919981461693359)
,p_plug_name=>unistr('<b>Datos B\00E1sicos de Novedades</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(360491788215712372)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P19_ID_NVDAD_PRDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(363967875580702474)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(459551242840683793)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite: <br/><br/>',
unistr('  <b>1.</b> El registro de novedad de cambio de caracter\00EDstica.<br/><br/>'),
'  <b>2.</b> Visualizar las vigencias por reliquidar.<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(123904405130675235)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(360491788215712372)
,p_button_name=>'Btn_Registrar_Novedad'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Novedad'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123850463002075633)
,p_name=>'P19_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tributo'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'350'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123850837320075635)
,p_name=>'P19_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'    , id_impsto_sbmpsto as r',
' from df_i_impuestos_subimpuesto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto  = :P19_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P19_ID_IMPSTO'
,p_ajax_items_to_submit=>'P19_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'350'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123851281012075635)
,p_name=>'P19_ID_ENTDAD_NVDAD'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_prompt=>'Entidad'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_entdad_nvdad',
'from df_i_entidades_novedad',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P19_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Entidad'
,p_lov_cascade_parent_items=>'P19_ID_IMPSTO'
,p_ajax_items_to_submit=>'P19_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123851674882075635)
,p_name=>'P19_ID_ACTO_TPO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_acto_tpo',
'from gn_d_actos_tipo',
'where cdgo_acto_tpo in (''RCD'',''RCE'',''RCU'')',
'and cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tipo Acto'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123852085730075635)
,p_name=>'P19_NMRO_ACTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_prompt=>unistr('N\00FAmero Acto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123852443820075635)
,p_name=>'P19_FCHA_INCIO_APLCCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_item_default=>'''01/01/'' || to_char( sysdate , ''YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha de Aplicaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123852897011075636)
,p_name=>'P19_CDGO_ACTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123854073952089530)
,p_name=>'P19_ID_PRCSO_CRGA'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select file_name || ''  |  '' || to_char( fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || nmbre_trcro as d',
'       , id_prcso_crga as r',
'    from v_et_g_procesos_carga a ',
'   where cdgo_clnte        = :F_CDGO_CLNTE',
'     and id_impsto         = :P19_ID_IMPSTO',
'     and id_impsto_sbmpsto = :P19_ID_IMPSTO_SBMPSTO',
'     and ( indcdor_prcsdo = ''N'' or :P19_ID_PRCSO_CRGA is not null )',
'     and id_prcso_crga  in (',
'                                  select id_prcso_crga ',
'                                    from si_g_novedades_prdio_crgue ',
'                                group by id_prcso_crga',
'                            )'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123857980255153604)
,p_name=>'P19_ID_NVDAD_PRDIO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123910919863788501)
,p_name=>'P19_FCHA_DCMNTO_SPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(340919981461693359)
,p_prompt=>'Fecha de Acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124061893345975902)
,p_name=>'P19_INDCDOR_MSVO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(124061775177975901)
,p_item_default=>'N'
,p_prompt=>'Indicador Cambio Masivo'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124062261174975906)
,p_name=>'P19_CDGO_ESTRTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(124061775177975901)
,p_prompt=>'Estrato Nuevo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_estrto as v',
'       , cdgo_estrto as k ',
'    from df_s_estratos  ',
'   where cdgo_estrto not in ( ''00'' , ''99'' )',
'order by cdgo_estrto'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_display_when=>'not :P19_CDGO_ACTO_TPO in ( ''RCU'' )'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124083834306252501)
,p_name=>'P19_ID_PRDIO_USO_SLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(124061775177975901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124083976113252502)
,p_name=>'P19_ID_PRDIO_DSTNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(124061775177975901)
,p_prompt=>'Nuevo Destino'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmtcnco || '' - '' || dscrpcion as v',
'       , id_prdio_dstno as k',
'    from df_i_predios_destino',
'   where cdgo_clnte  = :F_CDGO_CLNTE',
'     and id_impsto   = :P19_ID_IMPSTO',
'     and nmtcnco <> ''99''',
'order by v'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_display_when=>'not :P19_CDGO_ACTO_TPO in ( ''RCE'' , ''RCU'' )'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124137096256551107)
,p_name=>'P19_INDCDOR_USA_ESTRTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(124061775177975901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124061915472975903)
,p_name=>'Al Cambiar Indicador Masivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_INDCDOR_MSVO'
,p_condition_element=>'P19_INDCDOR_MSVO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124062063497975904)
,p_event_id=>wwv_flow_api.id(124061915472975903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_CDGO_ESTRTO,P19_ID_PRDIO_DSTNO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124062311340975907)
,p_event_id=>wwv_flow_api.id(124061915472975903)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_CDGO_ESTRTO,P19_ID_PRDIO_DSTNO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124062473757975908)
,p_event_id=>wwv_flow_api.id(124061915472975903)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_CDGO_ESTRTO,P19_ID_PRDIO_DSTNO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124062524776975909)
,p_name=>'Al Cambiar Estrato Global'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_CDGO_ESTRTO'
,p_condition_element=>'P19_CDGO_ESTRTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124062694569975910)
,p_event_id=>wwv_flow_api.id(124062524776975909)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update si_g_novedades_prdio_crgue',
'   set cdgo_estrto    = :P19_CDGO_ESTRTO',
' where id_prcso_crga  = :P19_ID_PRCSO_CRGA',
'   and indcdor_rlzdo  = ''S'';',
'   '))
,p_attribute_02=>'P19_CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124117490951409501)
,p_event_id=>wwv_flow_api.id(124062524776975909)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(123858861181153613)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124084063994252503)
,p_name=>'Al Cambiar Destino Global'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_ID_PRDIO_DSTNO'
,p_condition_element=>'P19_ID_PRDIO_DSTNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124084170408252504)
,p_event_id=>wwv_flow_api.id(124084063994252503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update si_g_novedades_prdio_crgue',
'   set id_prdio_dstno = :P19_ID_PRDIO_DSTNO',
'     , cdgo_estrto    = null',
' where id_prcso_crga  = :P19_ID_PRCSO_CRGA',
'   and indcdor_rlzdo  = ''S'';'))
,p_attribute_02=>'P19_ID_PRDIO_DSTNO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124137184733551108)
,p_event_id=>wwv_flow_api.id(124084063994252503)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select indcdor_usa_estrto',
'      into :P19_INDCDOR_USA_ESTRTO',
'      from df_i_predios_destino',
'     where id_prdio_dstno = :P19_ID_PRDIO_DSTNO;',
'exception',
'     when no_data_found then',
'          :P19_INDCDOR_USA_ESTRTO := ''N'';',
'end;'))
,p_attribute_02=>'P19_INDCDOR_USA_ESTRTO'
,p_attribute_03=>'P19_INDCDOR_USA_ESTRTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124136435639551101)
,p_event_id=>wwv_flow_api.id(124084063994252503)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(123858861181153613)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124117590026409502)
,p_name=>'Limpiar Campos'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124117692948409503)
,p_event_id=>wwv_flow_api.id(124117590026409502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_ID_PRDIO_DSTNO,P19_CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124137238682551109)
,p_name=>'Al Cambiar Indicador Destino Usa Estrato Global'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_INDCDOR_USA_ESTRTO'
,p_condition_element=>'P19_INDCDOR_USA_ESTRTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124137339542551110)
,p_event_id=>wwv_flow_api.id(124137238682551109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_CDGO_ESTRTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124137421087551111)
,p_event_id=>wwv_flow_api.id(124137238682551109)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_CDGO_ESTRTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124137529374551112)
,p_event_id=>wwv_flow_api.id(124137238682551109)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124155047927668102)
,p_name=>'Usa Estrato Global'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_INDCDOR_USA_ESTRTO'
,p_condition_element=>'P19_CDGO_ACTO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'RCE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124155183387668103)
,p_event_id=>wwv_flow_api.id(124155047927668102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19_CDGO_ESTRTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3577365683725401)
,p_name=>'Al Cambiar Destino Puntual'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(123858861181153613)
,p_triggering_element=>'ID_PRDIO_DSTNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3577614340725404)
,p_event_id=>wwv_flow_api.id(3577365683725401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDCDOR_USA_ESTRTO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_usa_estrto',
'  from df_i_predios_destino',
' where id_prdio_dstno = :ID_PRDIO_DSTNO'))
,p_attribute_07=>'ID_PRDIO_DSTNO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3578523157725413)
,p_name=>'Al Cambiar Indicador Destino Usa Estrato Puntual'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(123858861181153613)
,p_triggering_element=>'INDCDOR_USA_ESTRTO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'INDCDOR_USA_ESTRTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3578640639725414)
,p_event_id=>wwv_flow_api.id(3578523157725413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3578856079725416)
,p_event_id=>wwv_flow_api.id(3578523157725413)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3578748464725415)
,p_event_id=>wwv_flow_api.id(3578523157725413)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3578914193725417)
,p_name=>'Al Cambiar Indicador Realizado'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(123858861181153613)
,p_triggering_element=>'INDCDOR_RLZDO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'INDCDOR_RLZDO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'No'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3579092072725418)
,p_event_id=>wwv_flow_api.id(3578914193725417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CDGO_ESTRTO,ID_PRDIO_DSTNO,ID_PRDIO_USO_SLO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3579113416725419)
,p_event_id=>wwv_flow_api.id(3578914193725417)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CDGO_ESTRTO,ID_PRDIO_DSTNO,ID_PRDIO_USO_SLO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(123857714890153602)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualiza Caracteristica Predio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto       si_i_sujetos_impuesto.id_sjto_impsto%type;',
'    v_cdgo_estrto          df_s_estratos.cdgo_estrto%type;',
'    v_id_prdio_dstno       df_i_predios_destino.id_prdio_dstno%type; ',
'    v_indcdor_usa_estrto   df_i_predios_destino.indcdor_usa_estrto%type;',
'    v_id_prdio_uso_slo     df_c_predios_uso_suelo.id_prdio_uso_slo%type;',
'    v_exste_idntfccion     number;',
'begin',
'    ',
'    for crgue in (',
'                        select id_nvdad_prdio_crgue ',
'                             , idntfccion',
'                             , cdgo_estrto_crgue',
'                             , cdgo_uso_slo_crgue',
'                             , cdgo_dstno_crgue',
'                          from si_g_novedades_prdio_crgue',
'                         where id_prcso_crga = :P19_ID_PRCSO_CRGA',
'                 ) loop',
'        ',
'        --Verifica si Existe el Sujeto Impuesto',
'        begin                              ',
'            select id_sjto_impsto',
'              into v_id_sjto_impsto',
'              from v_si_i_sujetos_impuesto ',
'             where cdgo_clnte      = :F_CDGO_CLNTE',
'               and id_impsto       = :P19_ID_IMPSTO',
'               and idntfccion_sjto = crgue.idntfccion;',
'        exception',
'             when no_data_found then',
'                  update si_g_novedades_prdio_crgue',
'                     set mnsje_rspsta        = ''La referencia # '' ||  crgue.idntfccion || '', no existe en el sistema.''',
'                   where id_nvdad_prdio_crgue = crgue.id_nvdad_prdio_crgue;',
'                  continue;',
'        end;',
'        ',
unistr('        --Verifica si Existe la Identificaci\00F3n'),
'        select count(*)',
'          into v_exste_idntfccion',
'          from si_g_novedades_prdio_crgue',
'         where id_prcso_crga = :P19_ID_PRCSO_CRGA',
'           and idntfccion    = crgue.idntfccion',
'           and indcdor_rlzdo = ''S'';',
'        ',
'        if( v_exste_idntfccion > 0 ) then',
'            update si_g_novedades_prdio_crgue',
'               set mnsje_rspsta         = ''La referencia # '' ||  crgue.idntfccion || '', se encuentra duplicada.''',
'             where id_nvdad_prdio_crgue = crgue.id_nvdad_prdio_crgue;',
'            continue;',
'        end if;',
'        ',
'        if( :P19_CDGO_ACTO_TPO = ''RCE'' ) then',
'            ',
'            --Verifica si existe el estrato',
'            begin',
'                select cdgo_estrto',
'                  into v_cdgo_estrto',
'                  from df_s_estratos',
'                 where cdgo_estrto = crgue.cdgo_estrto_crgue; ',
'            exception',
'             when no_data_found then',
'                  update si_g_novedades_prdio_crgue',
'                     set mnsje_rspsta        = ''El estrato '' ||  nvl( crgue.cdgo_estrto_crgue , ''No registra'' ) || '', no existe en el sistema.''',
'                   where id_nvdad_prdio_crgue = crgue.id_nvdad_prdio_crgue;',
'                  continue;',
'            end;',
'            ',
'            v_id_prdio_dstno   := null;',
'            v_id_prdio_uso_slo := null;',
'            ',
'        elsif( :P19_CDGO_ACTO_TPO = ''RCD'' ) then',
'            ',
'            --Verifica si Existe el Destino',
'            begin',
'                select id_prdio_dstno',
'                     , indcdor_usa_estrto',
'                  into v_id_prdio_dstno',
'                     , v_indcdor_usa_estrto',
'                  from df_i_predios_destino',
'                 where cdgo_clnte = :F_CDGO_CLNTE',
'                   and id_impsto  = :P19_ID_IMPSTO',
'                   and nmtcnco    = crgue.cdgo_dstno_crgue;   ',
'            exception',
'             when no_data_found then',
'                  update si_g_novedades_prdio_crgue',
'                     set mnsje_rspsta        = ''El destino '' ||  nvl( crgue.cdgo_dstno_crgue , ''No registra'' ) || '', no existe en el sistema.''',
'                   where id_nvdad_prdio_crgue = crgue.id_nvdad_prdio_crgue;',
'                  continue;',
'            end;',
'            ',
'            --Indica que el destino Usa Estrato',
'            if( v_indcdor_usa_estrto = ''S'' ) then',
'                --Verifica si existe el estrato',
'                begin',
'                    select cdgo_estrto',
'                      into v_cdgo_estrto',
'                      from df_s_estratos',
'                     where cdgo_estrto = crgue.cdgo_estrto_crgue; ',
'                exception',
'                 when no_data_found then',
'                      update si_g_novedades_prdio_crgue',
'                         set mnsje_rspsta        = ''El destino '' || crgue.cdgo_dstno_crgue || '' usa estrato estrato - El estrato '' ||  nvl( crgue.cdgo_estrto_crgue , ''No registra'' ) || '', no existe en el sistema.''',
'                       where id_nvdad_prdio_crgue = crgue.id_nvdad_prdio_crgue;',
'                      continue;',
'                end;',
'            end if;',
'                      ',
'        elsif( :P19_CDGO_ACTO_TPO = ''RCU'' ) then',
'            ',
'            --Verifica si existe el uso',
'            begin',
'                select id_prdio_uso_slo ',
'                  into v_id_prdio_uso_slo',
'                  from df_c_predios_uso_suelo',
'                 where cdgo_clnte = :F_CDGO_CLNTE ',
'                  and cdgo_prdio_uso_slo = crgue.cdgo_uso_slo_crgue;  ',
'            exception',
'                 when no_data_found then',
'                      update si_g_novedades_prdio_crgue',
'                         set mnsje_rspsta         = ''El uso suelo '' ||  nvl( crgue.cdgo_uso_slo_crgue , ''No registra'' ) || '', no existe en el sistema.''',
'                       where id_nvdad_prdio_crgue = crgue.id_nvdad_prdio_crgue;',
'                      continue;',
'                end;',
'   ',
'        end if;',
'        ',
'        --Actualiza las caracterisca el Predio',
'        update si_g_novedades_prdio_crgue',
'           set id_prdio_dstno       = v_id_prdio_dstno',
'             , cdgo_estrto          = v_cdgo_estrto',
'             , id_prdio_uso_slo     = v_id_prdio_uso_slo',
'             , id_sjto_impsto       = v_id_sjto_impsto',
'             , indcdor_rlzdo        = ''S''',
'             , mnsje_rspsta         = ''Procesado''',
'         where id_nvdad_prdio_crgue = crgue.id_nvdad_prdio_crgue;',
'     ',
'    end loop;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from si_g_novedades_prdio_crgue',
' where id_prcso_crga = :P19_ID_PRCSO_CRGA',
'   and indcdor_rlzdo = ''S'''))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(123859959049153624)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(123858861181153613)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Crud Registro Procesados'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    case :APEX$ROW_STATUS',
'    when ''U'' then',
'        update si_g_novedades_prdio_crgue',
'           set id_prdio_dstno       = :id_prdio_dstno',
'             , cdgo_estrto          = :cdgo_estrto',
'             , id_prdio_uso_slo     = :id_prdio_uso_slo',
'         where id_nvdad_prdio_crgue = :ID_NVDAD_PRDIO_CRGUE;',
'    end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(123904405130675235)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(123898984626669101)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Novedad de Predial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	o_cdgo_rspsta  number;',
'	o_mnsje_rspsta varchar2(4000);',
'begin',
'   ',
'	apex_json.initialize_clob_output;',
'    apex_json.open_array;',
'    ',
'    for c_prdios in (',
'                        select a.cdgo_estrto',
'                             , a.id_prdio_dstno',
'                             , a.id_prdio_uso_slo',
'                             , a.id_sjto_impsto',
'                          from si_g_novedades_prdio_crgue a',
'                         where id_prcso_crga   = :P19_ID_PRCSO_CRGA',
'                           and a.indcdor_rlzdo = ''S''',
'    ',
'                    ) loop',
'        apex_json.open_object;',
'	    apex_json.write( ''id_sjto_impsto''  , c_prdios.id_sjto_impsto );',
'	    apex_json.write( ''cdgo_estrto_nvo'' , c_prdios.cdgo_estrto );  ',
'        apex_json.write( ''id_prdio_dstno_nvo''  , c_prdios.id_prdio_dstno ); ',
'        apex_json.write( ''id_prdio_uso_slo_nvo'' ,  c_prdios.id_prdio_uso_slo ); ',
'	    apex_json.close_object;        ',
'    end loop;',
'   ',
'	apex_json.close_all;',
'    	',
'	pkg_si_novedades_predio.prc_rg_novedad_predial( p_id_usrio              => :F_ID_USRIO',
'                                                  , p_cdgo_clnte            => :F_CDGO_CLNTE',
'                                                  , p_id_impsto	            => :P19_ID_IMPSTO',
'                                                  , p_id_impsto_sbmpsto	    => :P19_ID_IMPSTO_SBMPSTO',
'                                                  , p_id_entdad_nvdad	    => :P19_ID_ENTDAD_NVDAD',
'                                                  , p_id_acto_tpo           => :P19_ID_ACTO_TPO',
'                                                  , p_nmro_dcmto_sprte      => :P19_NMRO_ACTO',
'                                                  , p_fcha_dcmnto_sprte     => :P19_FCHA_DCMNTO_SPRTE',
'                                                  , p_fcha_incio_aplccion   => :P19_FCHA_INCIO_APLCCION',
'                                                  , p_obsrvcion			    => ''Novedad Masiva de Predial''',
'                                                  , p_id_instncia_fljo	 	=> :F_ID_INSTNCIA_FLJO',
'                                                  , p_id_prcso_crga         => :P19_ID_PRCSO_CRGA',
'                                                  , p_json                  => apex_json.get_clob_output',
'                                                  , o_cdgo_rspsta           => o_cdgo_rspsta',
'                                                  , o_mnsje_rspsta          => o_mnsje_rspsta',
'                                                  , o_id_nvdad_prdio        => :P19_ID_NVDAD_PRDIO );',
'    ',
'    apex_json.free_output; ',
'	',
'	if( o_cdgo_rspsta != 0 ) then',
'		raise_application_error( -20001 , o_mnsje_rspsta );',
'	end if;',
'end;  '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(123904405130675235)
,p_process_success_message=>unistr('Novedad de predial registrada con \00E9xito.')
);
end;
/
