prompt --application/pages/page_20240_005
begin
wwv_flow_api.create_page(
 p_id=>2024026
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Solicitudes de Permisos de Autorizaci\00F3n')
,p_step_title=>unistr('Solicitudes de Permisos de Autorizaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20250715194402'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62731992569602059)
,p_plug_name=>'Encabezado '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62732652092602065)
,p_plug_name=>unistr('Solicitudes Gesti\00F3n de Permisos Sujeto Asociado')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4574640997094114)
,p_plug_name=>unistr('Informaci\00F3n de Sujetos Asociados')
,p_region_name=>'deshabilitar'
,p_parent_plug_id=>wwv_flow_api.id(62732652092602065)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.idntfccion,b.nmbre_trcro, c.nmbre_impsto, a.id_sjto_impsto,',
'case',
'when a.actvo = ''S'' then ''Si''',
'when a.actvo = ''N'' then ''No''',
'else a.actvo',
'end',
'Activo,',
'a.id_sjto_ascdo',
'from si_i_sujetos_asociados a',
'join v_sg_g_usuarios b on b.id_usrio = a.id_usrio',
'join df_c_impuestos c on c.id_impsto = a.id_impsto',
'where a.actvo = ''S''',
'and a.id_sjto_impsto in (select d.id_sjto_impsto from v_si_i_sujetos_impuesto d where d.id_sjto = :P2024026_ID_SJTO  and d.id_sjto_estdo = 1)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.idntfccion,b.nmbre_trcro, c.nmbre_impsto, a.id_sjto_impsto',
'from si_i_sujetos_asociados a',
'join v_sg_g_usuarios b on b.id_usrio = a.id_usrio',
'join df_c_impuestos c on c.id_impsto = a.id_impsto',
'where a.actvo = ''S''',
'and a.id_sjto_impsto in (select d.id_sjto_impsto from v_si_i_sujetos_impuesto d where d.id_sjto = :P2024026_ID_SJTO  and d.id_sjto_estdo = 1)',
'and a.id_usrio = :F_ID_USRIO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4574853099094116)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(4574949104094117)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(4575005232094118)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(4575367793094121)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4576447184094132)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Activo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(4577023253094138)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(4647677171964313)
,p_name=>'ID_SJTO_ASCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_ASCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4574776835094115)
,p_internal_uid=>4574776835094115
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(4612557634456732)
,p_interactive_grid_id=>wwv_flow_api.id(4574776835094115)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4612616629456732)
,p_report_id=>wwv_flow_api.id(4612557634456732)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4613174715456733)
,p_view_id=>wwv_flow_api.id(4612616629456732)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4574853099094116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4613607677456735)
,p_view_id=>wwv_flow_api.id(4612616629456732)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4574949104094117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4614183621456736)
,p_view_id=>wwv_flow_api.id(4612616629456732)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4575005232094118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4627562153495297)
,p_view_id=>wwv_flow_api.id(4612616629456732)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(4576447184094132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4632445779549826)
,p_view_id=>wwv_flow_api.id(4612616629456732)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(4577023253094138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4678582027722235)
,p_view_id=>wwv_flow_api.id(4612616629456732)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(4647677171964313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4525080859892611)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(62732652092602065)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>9
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4524624926892611)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(62732652092602065)
,p_button_name=>'BTN_RGSTRAR_SLCTUD'
,p_button_static_id=>'registrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'<b>Enviar Solicitud</b>'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto, a.nmbre_impsto, a.dscrpcion_sjto_estdo, a.email, a.id_sjto_impsto, a.id_impsto ',
'from v_si_i_sujetos_impuesto a',
'where id_sjto = :P2024026_ID_SJTO',
'and id_sjto_estdo = 1',
'and exists (select 1 from si_i_sujetos_asociados b where b.id_sjto_impsto = a.id_sjto_impsto and b.id_usrio = :F_ID_USRIO and b.actvo = ''S'');'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-user-arrow-up'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4521536853892607)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(62731992569602059)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4529130189892635)
,p_branch_name=>'Ir a la pagina  2024024'
,p_branch_action=>'f?p=&APP_ID.:2024024:&SESSION.::&DEBUG.:RP,2024024:P2024024_ID_SLCTUD_PRMSOS:&P2024026_ID_SLCTUD_PRMSOS.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4524624926892611)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4521994209892608)
,p_name=>'P2024026_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(62731992569602059)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4522341269892609)
,p_name=>'P2024026_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(62731992569602059)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4522784562892610)
,p_name=>'P2024026_NMBRE_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(62731992569602059)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4523165429892610)
,p_name=>'P2024026_NMRO_CNSCTVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(62731992569602059)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4523509870892610)
,p_name=>'P2024026_ID_SLCTUD_PRMSOS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(62731992569602059)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4523941805892610)
,p_name=>'P2024026_ID_SJTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(62731992569602059)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4525430956892611)
,p_name=>'P2024026_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(62732652092602065)
,p_prompt=>'CC - NIT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4525819915892612)
,p_name=>'P2024026_EMAIL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(62732652092602065)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct email email, email em',
'from v_si_i_sujetos_impuesto',
'where id_sjto = :P2024026_ID_SJTO',
'and id_sjto_estdo = 1;'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto, a.nmbre_impsto, a.dscrpcion_sjto_estdo, a.email, a.id_sjto_impsto',
'from v_si_i_sujetos_impuesto a',
'where id_sjto = :P2024026_ID_SJTO',
'and id_sjto_estdo = 1',
'and exists (select 1 from si_i_sujetos_asociados b where b.id_sjto_impsto = a.id_sjto_impsto and b.id_usrio = :F_ID_USRIO);',
''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4526202240892612)
,p_name=>'P2024026_CDNA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(62732652092602065)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4573466642094102)
,p_name=>'P2024026_CDGO_GSTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(62732652092602065)
,p_prompt=>unistr('Gesti\00F3n de la Solicitud')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Deshabilitar;D'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4526738291892628)
,p_validation_name=>unistr('Numero de identificaci\00F3n no nulo')
,p_validation_sequence=>10
,p_validation=>':P2024026_IDNTFCCION is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Digite un numero de identificacion'
,p_when_button_pressed=>wwv_flow_api.id(4525080859892611)
,p_associated_item=>wwv_flow_api.id(4525430956892611)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4527072616892629)
,p_validation_name=>'Email no nulo'
,p_validation_sequence=>20
,p_validation=>':P2024026_EMAIL is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Seleccione un email'
,p_when_button_pressed=>wwv_flow_api.id(4524624926892611)
,p_associated_item=>wwv_flow_api.id(4525819915892612)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4573589391094103)
,p_validation_name=>unistr('C\00F3digo de Gestionad de Permisos no nulo')
,p_validation_sequence=>30
,p_validation=>':P2024026_CDGO_GSTION is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Por favor seleccione la gesti\00F3n a solicitar')
,p_when_button_pressed=>wwv_flow_api.id(4525080859892611)
,p_associated_item=>wwv_flow_api.id(4573466642094102)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4576596150094133)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4574640997094114)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4576649031094134)
,p_event_id=>wwv_flow_api.id(4576596150094133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("deshabilitar");',
'',
'if (region) {',
'    var view = region.widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    // Si hay registros seleccionados',
'    if (records.length > 0) {',
'        // Crear una variable para almacenar la cadena concatenada',
'        var concatenatedValues = [];',
'',
'        records.forEach(function(record) {',
'            var value = model.getValue(record, "ID_SJTO_ASCDO");',
'            concatenatedValues.push(value);',
'        });',
'',
'        // Concatenar los valores con "," como separador',
'        var resultString = concatenatedValues.join(",");',
'',
'        apex.item("P2024026_CDNA").setValue(resultString);',
'',
unistr('        // Habilitar el bot\00F3n "procesar"'),
unistr('        $("#registrar").prop("disabled", false);  // Habilitar el bot\00F3n'),
'',
'    } else {',
'        // Si no hay registros seleccionados, puedes limpiar el item',
'        apex.item("P2024026_CDNA").setValue("");',
'',
'        console.log("No se seleccionaron registros.");',
'',
unistr('        // Deshabilitar el bot\00F3n "procesar"'),
unistr('        $("#registrar").prop("disabled", true);  // Deshabilitar el bot\00F3n'),
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4527390969892629)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    ',
'begin                                                                                                                     ',
'      ',
'        pkg_gi_asociado.prc_gn_envio_permisos (p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                              p_id_sjto               => :P2024026_ID_SJTO,',
'                                              p_cdna                  => :P2024026_CDNA,   ',
'                                              p_id_usrio              => :F_ID_USRIO,',
'                                              p_email                 => :P2024026_EMAIL,',
'                                              p_cdgo_gstion           => :P2024026_CDGO_GSTION,  ',
'                                              p_id_slctud_prmsos      => :P2024026_ID_SLCTUD_PRMSOS,',
'                                              o_cdgo_rspsta           => v_cdgo_rspsta,',
'                                              o_mnsje_rspsta          => v_mnsje_rspsta',
'                                          ); ',
'      ',
'',
unistr('    -- Verificaci\00F3n del c\00F3digo de respuesta'),
'    if v_cdgo_rspsta != 0 then',
unistr('        raise_application_error(-20001, ''Error: '' || v_mnsje_rspsta || '' (C\00F3digo: '' || v_cdgo_rspsta || '')'');'),
'',
'    end if;',
'    ',
'    ',
'exception',
'    when others then',
'        raise_application_error(-20002, ''Error en el procesamiento: '' || sqlerrm);',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4524624926892611)
,p_process_success_message=>'Proceso Ejecutado'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4527715217892630)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Informaci\00F3n Sujeto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*begin   ',
'    select a.id_sjto_impsto',
'      into :P2024026_ID_SJTO_IMPSTO',
'      from v_si_i_sujetos_impuesto     a',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'          and id_impsto = :P2024026_ID_IMPSTO',
'          and idntfccion_sjto = :P2024026_IDNTFCCION',
'          and id_sjto_estdo = 1;',
'     ',
'exception     ',
'        when no_data_found then ',
unistr('                apex_application.g_print_success_message := ''<span>No fue posible validar la identificaci\00F3n ''||:P2024026_IDNTFCCION||''</span>'';  '),
'                :P2024026_ID_SJTO_IMPSTO := null;',
'                :P2024026_ID_SLCTUD_ASCDO := null;',
'end;     */',
'',
'begin   ',
'    select a.id_sjto',
'      into :P2024026_ID_SJTO',
'      from v_si_c_sujetos  a',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'          and idntfccion_sjto = :P2024026_IDNTFCCION;',
'        --  and id_sjto_estdo = 1;',
'     ',
'exception     ',
'        when no_data_found then ',
unistr('                apex_application.g_print_success_message := ''<span>No fue posible validar la identificaci\00F3n ''||:P2024026_IDNTFCCION||''</span>'';  '),
'                :P2024026_ID_SJTO := null;',
'                :P2024026_ID_SLCTUD_ASCDO := null;',
'end; ',
'',
'',
'',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4525080859892611)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4575487759094122)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4574640997094114)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Informaci\00F3n de Sujetos Asociados - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
