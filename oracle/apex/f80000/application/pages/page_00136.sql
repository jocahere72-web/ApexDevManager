prompt --application/pages/page_00136
begin
wwv_flow_api.create_page(
 p_id=>136
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Configuraci\00F3n Modulo Persuasivo')
,p_step_title=>unistr('Configuraci\00F3n Modulo Persuasivo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.tooltip {',
'    position: relative;',
'    display: inline-block;',
'    border-bottom: 1px dotted black;',
'}',
'',
'.tooltip .tooltiptext {',
'    visibility: hidden;',
'    width: 120px;',
'    background-color: Gray;',
'    color: white;',
'    text-align: center;',
'    border-radius: 6px;',
'    padding: 5px 0;',
'',
'    /* Position the tooltip */',
'   position: static;',
'    z-index: 1;',
'}',
'',
'.tooltip:hover .tooltiptext {',
'    visibility: visible;',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220523151602'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279393262480162063)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
unistr('	Funcionalidad que permite parametrizar los param\00E9tros de configuraci\00F3n del modulo persuasivo.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279617363229867873)
,p_plug_name=>unistr('Configuraci\00F3n Modulo Persuasivo')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRCSO_PRSSVO_CNFGRCION',
'     , CDGO_CLNTE',
'     , CDGO_CNFGRCION',
'     , DSCRPCION',
'     , TPO_DTO',
'     , VLOR        ',
'from cb_d_process_prssvo_cnfgrcn'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279393019168162060)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279393099359162061)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279618599136867879)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279619187772867888)
,p_name=>'ID_PRCSO_PRSSVO_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_PRSSVO_CNFGRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279619707408867913)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279620326559867913)
,p_name=>'CDGO_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNFGRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(279620870009867914)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279621503357867914)
,p_name=>'TPO_DTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Dato'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:Texto;T,Num\00E9rico;N,Fecha;F')
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279622041499867914)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(279617850254867874)
,p_internal_uid=>279617850254867874
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(279618273475867879)
,p_interactive_grid_id=>wwv_flow_api.id(279617850254867874)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(279618335829867879)
,p_report_id=>wwv_flow_api.id(279618273475867879)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279618999477867879)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(279618599136867879)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279619449486867913)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(279619187772867888)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279620086358867913)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(279619707408867913)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279620719968867914)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(279620326559867913)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279621322358867914)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(279620870009867914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>674.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279621870188867914)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(279621503357867914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279622449557867914)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(279622041499867914)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279626615897927122)
,p_view_id=>wwv_flow_api.id(279618335829867879)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(279393019168162060)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(140059427732399372)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(279617363229867873)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Configuraci\00F3n Modulo Persuasivo - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al Ejecutar Proceso.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Proceso Ejecutado Exitosamente.'
);
end;
/
