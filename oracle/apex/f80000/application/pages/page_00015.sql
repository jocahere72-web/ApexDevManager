prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Selecci\00F3n del Flujo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Selecci\00F3n del Flujo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.getItem("jsonCobro");',
'console.log(JSON.parse(json));'))
,p_step_template=>wwv_flow_api.id(17323495682919353)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20211018165723'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44108520806046715)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88663146509226005)
,p_plug_name=>'tab'
,p_parent_plug_id=>wwv_flow_api.id(44108520806046715)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87068337413022925)
,p_plug_name=>'Plantillas'
,p_parent_plug_id=>wwv_flow_api.id(88663146509226005)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_plntlla,dscrpcion,cdgo_clnte',
'from gn_d_plantillas',
'where id_prcso = 10',
'and actvo = ''S''',
'and dfcto = ''S''',
'and cdgo_clnte = :f_cdgo_clnte',
'and tpo_plntlla = :P15_TIPO_PROCESO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87068553452022927)
,p_name=>'ID_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PLNTLLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(87068622882022928)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87068700305022929)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(87068839744022930)
,p_name=>'Ver Plantilla'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" > Ver Plantilla',
'<span class="fa fa-eye"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP,44:P44_ID_PLANTILLA:&ID_PLNTLLA.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(87068409511022926)
,p_internal_uid=>87068409511022926
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
 p_id=>wwv_flow_api.id(87285224972462678)
,p_interactive_grid_id=>wwv_flow_api.id(87068409511022926)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(87285304065462678)
,p_report_id=>wwv_flow_api.id(87285224972462678)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87285879089462682)
,p_view_id=>wwv_flow_api.id(87285304065462678)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(87068553452022927)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87286319876462685)
,p_view_id=>wwv_flow_api.id(87285304065462678)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(87068622882022928)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>438
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87286858665462687)
,p_view_id=>wwv_flow_api.id(87285304065462678)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(87068700305022929)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87287348743462688)
,p_view_id=>wwv_flow_api.id(87285304065462678)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(87068839744022930)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88663275679226006)
,p_plug_name=>unistr('Condiciones de regla de validaci\00F3n de procesamiento')
,p_parent_plug_id=>wwv_flow_api.id(88663146509226005)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rgla_ngcio_clnte_fncion,',
'        id_rgla_ngcio_clnte,',
'        a.id_fncion,',
'        b.dscrpcion,',
'        indcdor_cmple_vldccion',
' from gn_d_rglas_ngcio_clnte_fnc a',
' join gn_d_funciones b on b.id_fncion = a.id_fncion',
'where id_rgla_ngcio_clnte = :p15_id_rgla_ngcio_clnte',
'  and actvo = ''S'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88663492309226008)
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
 p_id=>wwv_flow_api.id(88663573316226009)
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
 p_id=>wwv_flow_api.id(88663649550226010)
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
 p_id=>wwv_flow_api.id(88663732263226011)
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
 p_id=>wwv_flow_api.id(88663860287226012)
,p_name=>'INDCDOR_CMPLE_VLDCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CMPLE_VLDCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Respuesta Esperada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Si;S,No;N'
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
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(88663363727226007)
,p_internal_uid=>88663363727226007
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
 p_id=>wwv_flow_api.id(88959004547714001)
,p_interactive_grid_id=>wwv_flow_api.id(88663363727226007)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(88959182369714002)
,p_report_id=>wwv_flow_api.id(88959004547714001)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88959671724714004)
,p_view_id=>wwv_flow_api.id(88959182369714002)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(88663492309226008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88960051663714007)
,p_view_id=>wwv_flow_api.id(88959182369714002)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(88663573316226009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88960561189714008)
,p_view_id=>wwv_flow_api.id(88959182369714002)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(88663649550226010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88961006370714009)
,p_view_id=>wwv_flow_api.id(88959182369714002)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(88663732263226011)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>447
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88961539150714011)
,p_view_id=>wwv_flow_api.id(88959182369714002)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(88663860287226012)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87069181107022933)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(44108520806046715)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top: 25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44108894352046718)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(44108520806046715)
,p_button_name=>'BTN_INCIAR_PRCSO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Proceso Jur\00EDdico')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P15_FLUJO is not null and :P15_TIPO_PROCESO is not null and :P15_ID_RGLA_NGCIO_CLNTE is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(89334202939874408)
,p_branch_name=>'Go To Page 8'
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_ID_PRCSO_SMU_LOTE,P8_ID_PRCSO_JRDCO_LTE_IP:&P15_ID_PRCSO_SMU_LOTE.,&P15_ID_PRCSO_JRDCO_LTE_IP.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(44108894352046718)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22605506613594220)
,p_name=>'P15_ID_PRCSO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44108667116046716)
,p_name=>'P15_FLUJO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_prompt=>'Flujo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_fljo,',
'       id_fljo',
'  from v_wf_d_flujos ',
' where id_prcso = 10',
'and cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44108713137046717)
,p_name=>'P15_JSON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46677149608078804)
,p_name=>'P15_ID_PRCSO_SMU_LOTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77852439493940506)
,p_name=>'P15_MSVO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87068229391022924)
,p_name=>'P15_TIPO_PROCESO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_prompt=>'Tipo de Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct  case ',
'        when a.tpo_plntlla = ''M'' then ''Masivo''',
'        when a.tpo_plntlla = ''P'' then ''Puntual'' end as tipo_plantilla, a.tpo_plntlla',
'from gn_d_plantillas a',
'where a.id_prcso = 10',
'and a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.dfcto = ''S'';'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88663959049226013)
,p_name=>'P15_ID_RGLA_NGCIO_CLNTE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_prompt=>unistr('Regla de Validaci\00F3n de Procesamiento')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrp_rgla_ngcio_clnte,id_rgla_ngcio_clnte --,dscrp_rgla_ngcio_clnte --nmbre_rgla',
'from v_gn_d_reglas_negocio_cliente',
'where cdgo_clnte = :f_cdgo_clnte',
'and id_prcso = 10'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89334341036874409)
,p_name=>'P15_ID_PRCSO_JRDCO_LTE_IP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89334435929874410)
,p_name=>'P15_MNSJE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(44108520806046715)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109766944259218202)
,p_name=>'al hacer click en el boton iniciar '
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(44108894352046718)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109767050322218203)
,p_event_id=>wwv_flow_api.id(109766944259218202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.getItem("jsonCobro");',
'let $waitPopup;',
'console.log(JSON.parse(json).length);',
'try {',
'    JSON.parse(json);',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de iniciar el proceso juridico de cobro?'', (ok) => {'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("IniciarProcesoJuridico", {',
'                    f01: json,',
'                    pageItems: "#P15_FLUJO,#P15_MSVO,#P15_TIPO_PROCESO,#P15_ID_RGLA_NGCIO_CLNTE,#P15_ID_PRCSO_JRDCO_LTE_IP"',
'                }).then((resp) => {',
'                    $waitPopup.remove();',
'                    if (resp.type === ''OK'') {',
'                        apex.message.showPageSuccess(resp.msg);',
'                        window.location.href = resp.url;',
'                    }else {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([',
'                            {',
'                                type: "error",',
'                                location: ["page"],',
'                                message: resp.msg,',
'                                unsafe: false',
'                            }',
'                        ]);',
'                    }',
'                });',
'            }',
'        }',
'    })',
'',
'} catch (e) {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page"],',
'            message: "No se encontraron datos seleccionados",',
'            unsafe: false',
'        }]);',
'} finally {',
'    if ($waitPopup)',
'        $waitPopup.remove();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44109383690046723)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del JSON'
,p_process_sql_clob=>':P15_JSON := V(''P8_JSON'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44109023352046720)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar Proceso Juridico'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_json  clob := :P15_JSON;',
'',
'begin',
'    ',
'    pkg_cb_proceso_juridico.prc_rg_proceso_juridico( p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                     p_id_usuario   => :F_ID_USRIO,',
'                                                     p_cdgo_fljo    => :P15_FLUJO,',
'                                                     p_json_sujetos => v_json,',
'                                                     p_msvo         => :P15_MSVO,',
'                                                     p_tpo_plntlla  => :P15_TIPO_PROCESO,',
'                                                     p_id_rgla_ngcio_clnte => :P15_ID_RGLA_NGCIO_CLNTE,',
'                                                     p_id_prcso_jrdco_lte_ip => :P15_ID_PRCSO_JRDCO_LTE_IP);                                                     ',
'    ',
'  :P15_MNSJE := case when :P15_ID_PRCSO_JRDCO_LTE_IP is null then',
'                          ''Proceso(s) Iniciado(s) Correctamente!!''',
'                     else ',
'                          ''Algunos registros no fueron procesados'' ',
'                     end; ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44108894352046718)
,p_process_success_message=>'&P15_MNSJE.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44109796405046727)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_01=>'P15_ID_PRCSO_SMU_LOTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44108894352046718)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Proceso Iniciado Correctamente!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69751019450315201)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Proceso workflow'
,p_process_sql_clob=>'pkg_pl_workflow_1_0.prc_vl_tareas_ejecuta_up();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109766836282218201)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarProcesoJuridico'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_prcso_jrdco_lte_ip    number;',
'    v_json_object              clob;',
'begin',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'      ',
'      select json_object(',
'          ''P15_FLUJO'' value :P15_FLUJO,',
'          ''P15_MSVO'' value :P15_MSVO,',
'          ''P15_TIPO_PROCESO'' value :P15_TIPO_PROCESO,',
'          ''P15_ID_RGLA_NGCIO_CLNTE'' value :P15_ID_RGLA_NGCIO_CLNTE',
'      )',
'      into v_json_object',
'      from dual;',
'      ',
'      --insert into muerto(v_001, c_001, t_001) values (''val_parametros_inicio_cobro'', v_json_object, systimestamp); commit;',
'      --insert into muerto(v_001, c_001, t_001) values (''val_parametros_inicio_cobro'', v_json, systimestamp); commit;',
'      ',
'      ',
'    pkg_cb_proceso_juridico.prc_rg_proceso_juridico( p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                     p_id_usuario   => :F_ID_USRIO,',
'                                                     p_cdgo_fljo    => :P15_FLUJO,',
'                                                     p_json_sujetos => v_json,',
'                                                     p_msvo         => :P15_MSVO,',
'                                                     p_tpo_plntlla  => :P15_TIPO_PROCESO,',
'                                                     p_id_rgla_ngcio_clnte => :P15_ID_RGLA_NGCIO_CLNTE,',
'                                                     p_id_prcso_jrdco_lte_ip => v_id_prcso_jrdco_lte_ip);                                                    ',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':8:''|| v(''APP_SESSION'')||''::NO::P8_ID_PRCSO_SMU_LOTE,P8_ID_PRCSO_JRDCO_LTE_IP:''',
'                                   || v(''P15_ID_PRCSO_SMU_LOTE'') ||'','' || v_id_prcso_jrdco_lte_ip',
'                                  , p_checksum_type => ''SESSION'');',
'    ',
'    --insert into muerto(v_001, c_001, t_001) values (''val_parametros_inicio_cobro'', v_id_prcso_jrdco_lte_ip, systimestamp); commit;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''url'', v_url);    ',
'    apex_json.write(''msg'',  case when v_id_prcso_jrdco_lte_ip is null ',
'                                 then ''Proceso(s) Iniciado(s) Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
'                            end );',
'    apex_json.close_object;',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'',  ''Error en Callback IniciarProcesoJuridico pagina 15:80000. ''||sqlerrm);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
