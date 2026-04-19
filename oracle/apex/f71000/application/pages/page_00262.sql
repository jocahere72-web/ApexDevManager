prompt --application/pages/page_00262
begin
wwv_flow_api.create_page(
 p_id=>262
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n Solicitudes T\00EDtulos Judiciales')
,p_step_title=>unistr('Gesti\00F3n Solicitudes T\00EDtulos Judiciales')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''BTN_SLCTUD_DVLCION'').hide(); ',
'apex.item(''BTN_CNFRMCION_DVLCION'').hide();'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20231104092100'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14423155648448001)
,p_plug_name=>unistr('T\00EDtulos judiciales asociados a solicitudes')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_jdcial',
'       ,a.dscrpcion_ttlo_estdo',
'       ,a.cdgo_ttlo_jdcial_estdo',
'       ,a.nmbre_dmnddo',
'       ,a.id_instncia_fljo',
'       ,a.fcha_slctud',
'       ,a.idntfccion_dmnddo',
'       ,a.id_ttlo_jdcial',
'       ,a.id_ttlo_jdcial_slctud',
'       ,a.indcdor_slctud_cnfrmcion',
'  from v_gf_g_ttlos_jdcl_slctd_dtll a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and (a.cdgo_ttlo_jdcial_slctud_tpo = :P262_CDGO_TTLO_JDCIAL_SLCTUD_TPO)',
'   and (a.nmro_ttlo_jdcial = trim(:P262_NMRO_TTLO_JDCIAL) or :P262_NMRO_TTLO_JDCIAL is null)',
'  and (a.idntfccion_dmnddo = trim(:P262_IDNTFCCION_DMNDDO) or :P262_IDNTFCCION_DMNDDO is null)',
'  and ((a.fcha_cnsttcion between :P262_FCHA_INCIO and :P262_FCHA_FNAL)',
'       or (a.fcha_cnsttcion >= :P262_FCHA_INCIO and :P262_FCHA_FNAL is null) ',
'       or (a.fcha_cnsttcion <= :P262_FCHA_FNAL and :P262_FCHA_INCIO  is null)',
'       or(:P262_FCHA_INCIO is null and :P262_FCHA_FNAL is null ))',
'  and ((a.fcha_slctud between :P262_FCHA_SLCTUD_INCIO and :P262_FCHA_SLCTUD_FNAL)',
'       or (a.fcha_slctud >= :P262_FCHA_SLCTUD_INCIO and :P262_FCHA_SLCTUD_FNAL is null) ',
'       or (a.fcha_slctud <= :P262_FCHA_SLCTUD_FNAL and :P262_FCHA_SLCTUD_INCIO  is null)',
'       or(:P262_FCHA_SLCTUD_INCIO is null and :P262_FCHA_SLCTUD_FNAL is null));'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14423396518448003)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('N\00B0 T\00EDtulo <br> Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14423572883448005)
,p_name=>'DSCRPCION_TTLO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TTLO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Estado T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14423755518448007)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14424032515448010)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14424363697448013)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(14424445224448014)
,p_name=>'ID_TTLO_JDCIAL_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(14424583943448015)
,p_name=>'INDCDOR_SLCTUD_CNFRMCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_SLCTUD_CNFRMCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Confirmaci\00F3n Devoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14424714494448017)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14424945431448019)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(14425075730448020)
,p_name=>'FCHA_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_SLCTUD'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha <br> Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(16698297036551302)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Instncia Fljo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(14423266334448002)
,p_internal_uid=>14423266334448002
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
 p_id=>wwv_flow_api.id(14430785779529934)
,p_interactive_grid_id=>wwv_flow_api.id(14423266334448002)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(14430888070529936)
,p_report_id=>wwv_flow_api.id(14430785779529934)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14431389527529941)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(14423396518448003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14432316593529947)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(14423572883448005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14433391163529950)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(14423755518448007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14434893915529954)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(14424032515448010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14436370903529958)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(14424363697448013)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14436862840529960)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(14424445224448014)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14450780011570379)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(14424583943448015)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14465602647591863)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(14424945431448019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14466156384591865)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(14425075730448020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16706083822554662)
,p_view_id=>wwv_flow_api.id(14430888070529936)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(16698297036551302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32764578005998503)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('<b>1.</b> Visualizar los t\00EDtulos Judiciales seg\00FAn el tipo de solicitud en que se encuentre.<br><br>'),
unistr('<b>2.</b> Detallar las solicitudes pendientes de la generaci\00F3n de acto.<br><br>'),
unistr('<b>3.</b> Confirmar las solicitudes del proceso de t\00EDtulos judiciales.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33157636699443170)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(406790707874090586)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(14418881179388329)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(406790707874090586)
,p_button_name=>'BTN_CNFRMCION_DVLCION'
,p_button_static_id=>'BTN_CNFRMCION_DVLCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Confirmar Devoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14425656862448026)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(406790707874090586)
,p_button_name=>'BTN_SLCTUD_DVLCION'
,p_button_static_id=>'BTN_SLCTUD_DVLCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Solicitud Devoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14400476414237928)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33157636699443170)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14425454471448024)
,p_branch_name=>unistr('Ir a P\00E1gina 253')
,p_branch_action=>'f?p=&APP_ID.:253:&SESSION.::&DEBUG.:RP,253:P253_CDGO_TTLO_JDCIAL_ESTDO,P253_JSON_PAGINA,P253_PAGINA,P253_CDGO_TTLO_JDCIAL_SLCTUD_TPO:SDT,P262_JSON_SLCTUD,&APP_PAGE_ID.,&P262_CDGO_TTLO_JDCIAL_SLCTUD_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(14425656862448026)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14523773815933902)
,p_branch_name=>unistr('Ir a P\00E1gina 253')
,p_branch_action=>'f?p=&APP_ID.:253:&SESSION.::&DEBUG.:RP:P253_CDGO_TTLO_JDCIAL_ESTDO,P253_JSON_PAGINA,P253_PAGINA:CDT,P262_JSON_SLCTUD,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(14418881179388329)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14394452437209202)
,p_name=>'P262_CDGO_TTLO_JDCIAL_SLCTUD_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33157636699443170)
,p_prompt=>'<b>Tipo de Solicitud</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TITULOS_SOLICITUD_TIPOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d',
'       , cdgo_ttlo_jdcial_slctud_tpo r',
'  from gf_d_ttlos_jdcial_slctud_tp',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14401553351238092)
,p_name=>'P262_NMRO_TTLO_JDCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(33157636699443170)
,p_prompt=>unistr('<b>N\00B0 T\00EDtulo</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14401904297238092)
,p_name=>'P262_IDNTFCCION_DMNDDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(33157636699443170)
,p_prompt=>unistr('<b>Identificaci\00F3n Demandado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14402774300238092)
,p_name=>'P262_FCHA_SLCTUD_INCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(33157636699443170)
,p_prompt=>'<b>Fecha Desde - Solicitud</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14403170815238092)
,p_name=>'P262_FCHA_SLCTUD_FNAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(33157636699443170)
,p_prompt=>'<b>Fecha Hasta - Solicitud</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14414247893367342)
,p_name=>'P262_FCHA_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(33157636699443170)
,p_prompt=>unistr('<b>Fecha Desde - Constituci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14414593002369168)
,p_name=>'P262_FCHA_FNAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(33157636699443170)
,p_prompt=>unistr('<b>Fecha Hasta - Constituci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14425368492448023)
,p_name=>'P262_JSON_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14423155648448001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14425536654448025)
,p_validation_name=>unistr('Validar Selecci\00F3n de solicitudes')
,p_validation_sequence=>10
,p_validation=>'P262_JSON_SLCTUD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione las Solicitudes Correspondientes!')
,p_when_button_pressed=>wwv_flow_api.id(14418881179388329)
,p_associated_item=>wwv_flow_api.id(14425368492448023)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14425149238448021)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(14423155648448001)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14425274125448022)
,p_event_id=>wwv_flow_api.id(14425149238448021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (this.data.selectedRecords.length > 0 ){',
'    const unique = (value, index, self) => {',
'      return self.indexOf(value) === index',
'    }',
'    ',
'    var model = this.data.model;',
'    var r = ''000'';',
'    var records = this.data.selectedRecords;',
'    var json = records.map(function (record) { return {"ID_TTLO_JDCIAL_SLCTUD": model.getValue(record, "ID_TTLO_JDCIAL_SLCTUD")}});',
'    var rs  = records.map(function (record) { return model.getValue(record, "CDGO_TTLO_JDCIAL_ESTDO")});',
'    var dc  = records.map(function (record) { return model.getValue(record, "IDNTFCCION_DMNDDO")});',
'    ',
'    const uniqueDC = dc.filter(unique); ',
'    r = rs.reduce(function(x, y){',
'        return x === y && x === ''ASL'' ? x : ''000'';',
'    });',
'    $s(''P262_JSON_SLCTUD'', JSON.stringify(json));',
'   // $s(''P253_JSON'', JSON.stringify(json));',
'    ',
'    if ( r === ''000'' || r !== ''ASL'' ){ ',
'        apex.item(''BTN_SLCTUD_DVLCION'').hide();      ',
'    } else {        ',
'        apex.item(''BTN_SLCTUD_DVLCION'').show();   ',
'    }',
'    s = rs.reduce(function(x, y){',
'        return x === y && x === ''SDT'' ? x : ''000'';',
'    });',
'    if ( s === ''000'' || s !== ''SDT'' || uniqueDC.length !== 1){ ',
'        apex.item(''BTN_CNFRMCION_DVLCION'').hide();      ',
'    } else {',
'        apex.item(''BTN_CNFRMCION_DVLCION'').show();   ',
'    }',
'}else{',
'    apex.item(''BTN_SLCTUD_DVLCION'').hide();  ',
'    apex.item(''BTN_CNFRMCION_DVLCION'').hide();  ',
'    $s(''P262_JSON_SLCTUD'', null);',
'}'))
,p_stop_execution_on_error=>'Y'
);
end;
/
