prompt --application/pages/page_00079
begin
wwv_flow_api.create_page(
 p_id=>79
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Crear Predio en Valorizaci\00F3n por Referencia Catastral')
,p_step_title=>unistr('Crear Predio en Valorizaci\00F3n por Referencia Catastral')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20240605170639'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312834397400111318)
,p_plug_name=>'Impuestos de la Referencia Catastral'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312549705325637352)
,p_plug_name=>'Referencia Catastral'
,p_parent_plug_id=>wwv_flow_api.id(312834397400111318)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_IMPSTO,',
'NMBRE_IMPSTO NOMBRE_IMPUESTO, ',
'ID_SJTO_IMPSTO SUJETO_IMPUESTO, ',
'ID_SJTO, CDGO_CLNTE,',
'NMBRE_CLNTE NOMBRE_CLIENTE, ',
'NMRO_IDNTFCCION NUMERO_IDENTIFICACION, ',
'IDNTFCCION_SJTO INDENTIFICACION_SUJETO,',
'IDNTFCCION_SJTO_FRMTDA,',
'MTRCLA_INMBLRIA MATRICULA_INMOBILIARIA,',
'NMBRE_MNCPIO MUNICIPIO',
'--NMBRE_DPRTMNTO DEPTO,',
'--FCHA_INGRSO FECHA_INGRESO',
'from v_si_i_sujetos_impuesto',
'where IDNTFCCION_SJTO = :P79_RFRNCIA_CTSTRAL ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(312549889696637354)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(312550001104637355)
,p_name=>'NOMBRE_IMPUESTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_IMPUESTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(312550025027637356)
,p_name=>'SUJETO_IMPUESTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUJETO_IMPUESTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sujeto Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(312550208375637357)
,p_name=>'ID_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(312550235891637358)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(312550385464637359)
,p_name=>'NOMBRE_CLIENTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_CLIENTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(312550445928637360)
,p_name=>'NUMERO_IDENTIFICACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUMERO_IDENTIFICACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(312550569380637361)
,p_name=>'INDENTIFICACION_SUJETO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDENTIFICACION_SUJETO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Indentificacion Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(312550652817637362)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Identificacion Formateada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(312550802825637363)
,p_name=>'MATRICULA_INMOBILIARIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MATRICULA_INMOBILIARIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula Inmobiliaria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(312550852132637364)
,p_name=>'MUNICIPIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MUNICIPIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Municipio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(312549736818637353)
,p_internal_uid=>312549736818637353
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(312821937147049125)
,p_interactive_grid_id=>wwv_flow_api.id(312549736818637353)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(312822034504049129)
,p_report_id=>wwv_flow_api.id(312821937147049125)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312822477919049143)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(312549889696637354)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312822957825049149)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(312550001104637355)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312823463067049152)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(312550025027637356)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312824002084049154)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(312550208375637357)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312824506180049156)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(312550235891637358)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312824997819049164)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(312550385464637359)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312825486087049166)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(312550445928637360)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312825923101049168)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(312550569380637361)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312826511977049170)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(312550652817637362)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312826995560049172)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(312550802825637363)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312827434531049174)
,p_view_id=>wwv_flow_api.id(312822034504049129)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(312550852132637364)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312834636746111321)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
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
 p_id=>wwv_flow_api.id(355294318544045007)
,p_plug_name=>'Consultar Referencia Catastral'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(468678704676329507)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
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
'  Funcionalidad que permite',
'  Inscripcion y actualizacion de predios a valorizacion por medio de referencia catastral.<br/><br/>',
unistr('  Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156465622604921362)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(312834636746111321)
,p_button_name=>'BTN_PRCSR_RFRNCIA_CREAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'<b>Crear'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-file-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156466084826921364)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(312834636746111321)
,p_button_name=>'BTN_PRCSAR_RFRNCIA_ACT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<b>Actualizar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-file-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156376261283190014)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(312834636746111321)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156466747960921366)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(355294318544045007)
,p_button_name=>'BTN_CNSLTAR_RFRNCIA_CTSTRAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>5
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(156467169015921367)
,p_name=>'P79_RFRNCIA_CTSTRAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(355294318544045007)
,p_prompt=>'Referencia Catastral'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156467816681921384)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Creaci\00F3n Puntual Valorizaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta          NUMBER;',
'   v_mnsje_rspsta         VARCHAR2(4000);',
'   v_id_sjto_impsto_val   v_si_i_sujetos_impuesto.id_sjto_impsto%type; ',
'begin',
'',
'    begin',
'        select i.id_sjto_impsto',
'        into   v_id_sjto_impsto_val',
'        from   v_si_i_sujetos_impuesto i',
'        join   df_c_impuestos          b on i.id_impsto = b.id_impsto and cdgo_impsto = ''VAL'' ',
'        where  i.idntfccion_sjto = :P79_RFRNCIA_CTSTRAL ;',
'',
unistr('        apex_application.g_print_success_message := ''<span style="color:white">La referencia catastral ya tiene sujeto de valorizaci\00F3n</span>'';'),
'',
'    exception',
'        when no_data_found then',
'            null; -- deja v_id_sjto_impsto_val como null',
'    end;',
'    ',
'    insert into muerto (v_001) values (''v_id_sjto_impsto_val => '' || v_id_sjto_impsto_val); commit;',
'    ',
'    if v_id_sjto_impsto_val is null then',
'    ',
'        PKG_GI_PREDIO_VALORIZACION.PRC_CREA_PRDIO_VAL_PUNTUAL ( p_cdgo_clnte      => :F_CDGO_CLNTE,',
'                                                                p_id_usuario      => :F_ID_USRIO,',
'                                                                P_RFRNCIA_CTSTRAL => :P79_RFRNCIA_CTSTRAL,',
'                                                                o_cdgo_rspsta     => v_cdgo_rspsta,',
'                                                                o_mnsje_rspsta    => v_mnsje_rspsta                                                 ',
'                                                               );',
'          apex_application.g_print_success_message := ''<span style="color:white"> Impuesto valorizacion registrado exitosamente</span>'';                                                     ',
'',
'        if v_cdgo_rspsta > 0 then   ',
'            rollback;',
'            raise_application_error(-20001, v_mnsje_rspsta);                                                ',
'        end if;',
'        ',
'    end if;',
'    ',
'exception',
'    when others then',
'        rollback;',
unistr('        raise_application_error(-20001, ''No se pudo registrar la referencia para Valorizaci\00F3n ''|| sqlerrm);'),
'            ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156465622604921362)
,p_process_when=>'P79_RFRNCIA_CTSTRAL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156468254327921386)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizacion Puntual de Valorizacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta  NUMBER;',
'   v_mnsje_rspsta VARCHAR2(4000);',
'  --  P_RFRNCIA_CTSTRAL varchar2(100);',
'begin',
'  --  P_RFRNCIA_CTSTRAL:=null;',
'    PKG_GI_PREDIO_VALORIZACION.PRC_ACTLZA_PRDIOS_VAL (  p_cdgo_clnte      => :F_CDGO_CLNTE ,',
'                                                        p_id_usuario      => :F_ID_USRIO,',
'                                                        P_RFRNCIA_CTSTRAL => :P79_RFRNCIA_CTSTRAL,',
'                                                        o_cdgo_rspsta     => v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta    => v_mnsje_rspsta                                          ',
'                                                      );',
'        apex_application.g_print_success_message := ''<span style="color:white"> Actualizacion exitosa</span>'';                                               ',
'                                                       ',
'    if v_cdgo_rspsta > 0 then   ',
'        rollback;',
'        raise_application_error(-20001, v_mnsje_rspsta);                                                ',
'    end if;',
'    ',
'exception',
'    when others then',
'        rollback;',
'        raise_application_error(-20001, ''No se pudo realizar actualizacion de valorizacion de predios ''|| sqlerrm);',
'            ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156466084826921364)
,p_process_when=>'P79_RFRNCIA_CTSTRAL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
