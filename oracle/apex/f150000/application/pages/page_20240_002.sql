prompt --application/pages/page_20240_002
begin
wwv_flow_api.create_page(
 p_id=>2024023
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Solicitudes Asociados Sujetos Tributos'
,p_step_title=>'Solicitudes Asociados Sujetos Tributos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20241211080314'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58215503470709494)
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
 p_id=>wwv_flow_api.id(58216162993709500)
,p_plug_name=>unistr('Solicitudes de Autorizaci\00F3n Sujeto Asociado')
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
 p_id=>wwv_flow_api.id(2806818640216135)
,p_plug_name=>'Informacion_Sujeto'
,p_region_name=>'sujeto'
,p_parent_plug_id=>wwv_flow_api.id(58216162993709500)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto, a.nmbre_impsto, a.dscrpcion_sjto_estdo, a.email, a.id_sjto_impsto, a.id_impsto ',
'from v_si_i_sujetos_impuesto a',
'inner join df_c_impuestos c on c.id_impsto = a.id_impsto ',
'where id_sjto = :P2024023_ID_SJTO',
'and id_sjto_estdo = 1 and c.actvo = ''S''',
'and not exists (select 1 from si_i_sujetos_asociados b where b.id_sjto_impsto = a.id_sjto_impsto and b.id_usrio = :F_ID_USRIO and b.actvo in (''S''));',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto, a.nmbre_impsto, a.dscrpcion_sjto_estdo, a.email, a.id_sjto_impsto, a.id_impsto ',
'from v_si_i_sujetos_impuesto a',
'where id_sjto = :P2024023_ID_SJTO',
'and id_sjto_estdo = 1',
'and not exists (select 1 from si_i_sujetos_asociados b where b.id_sjto_impsto = a.id_sjto_impsto and b.id_usrio = :F_ID_USRIO and b.actvo = ''S'');'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2807042842216137)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Identificacion'
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
 p_id=>wwv_flow_api.id(2807148756216138)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre Impuesto'
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
 p_id=>wwv_flow_api.id(2807226584216139)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(2807368281216140)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(4084262586479129)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4084317098479130)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4084545567479132)
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
 p_id=>wwv_flow_api.id(4344821159577408)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(2806937286216136)
,p_internal_uid=>2806937286216136
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
 p_id=>wwv_flow_api.id(3937574725492075)
,p_interactive_grid_id=>wwv_flow_api.id(2806937286216136)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(3937641458492076)
,p_report_id=>wwv_flow_api.id(3937574725492075)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3938134770492080)
,p_view_id=>wwv_flow_api.id(3937641458492076)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(2807042842216137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3938608987492084)
,p_view_id=>wwv_flow_api.id(3937641458492076)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(2807148756216138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3939156769492086)
,p_view_id=>wwv_flow_api.id(3937641458492076)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(2807226584216139)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3939643048492088)
,p_view_id=>wwv_flow_api.id(3937641458492076)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(2807368281216140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4159994869446355)
,p_view_id=>wwv_flow_api.id(3937641458492076)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4084262586479129)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4264512861731795)
,p_view_id=>wwv_flow_api.id(3937641458492076)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(4084545567479132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4420971486972557)
,p_view_id=>wwv_flow_api.id(3937641458492076)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(4344821159577408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3930084969315398)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(58216162993709500)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2807493211216141)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(58216162993709500)
,p_button_name=>'BTN_RGSTRAR_SLCTUD'
,p_button_static_id=>'registrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'<b>Registrar Solicitud</b>'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto, a.nmbre_impsto, a.dscrpcion_sjto_estdo, a.email, a.id_sjto_impsto, a.id_impsto ',
'from v_si_i_sujetos_impuesto a',
'where id_sjto = :P2024023_ID_SJTO',
'and id_sjto_estdo = 1',
'and not exists (select 1 from si_i_sujetos_asociados b where b.id_sjto_impsto = a.id_sjto_impsto and b.id_usrio = :F_ID_USRIO and b.actvo = ''S'');'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-user-arrow-up'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3926579467315394)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(58215503470709494)
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
 p_id=>wwv_flow_api.id(3962453787344510)
,p_branch_name=>'Ir a la pagina  2024024'
,p_branch_action=>'f?p=&APP_ID.:2024024:&SESSION.::&DEBUG.:RP,2024024:P2024024_ID_SLCTUD_ASCDO:&P2024023_ID_SLCTUD_ASCDO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2807493211216141)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2806703818216134)
,p_name=>'P2024023_NMBRE_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(58215503470709494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3926929794315394)
,p_name=>'P2024023_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58215503470709494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3928502693315397)
,p_name=>'P2024023_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(58215503470709494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3930434797315398)
,p_name=>'P2024023_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58216162993709500)
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
 p_id=>wwv_flow_api.id(3961827377344504)
,p_name=>'P2024023_NMRO_CNSCTVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(58215503470709494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3962240602344508)
,p_name=>'P2024023_ID_SLCTUD_ASCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(58215503470709494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4084101118479128)
,p_name=>'P2024023_ID_SJTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(58215503470709494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4345182777577411)
,p_name=>'P2024023_CDNA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(58216162993709500)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4345349938577413)
,p_name=>'P2024023_EMAIL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(58216162993709500)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct email email, email em',
'from v_si_i_sujetos_impuesto',
'where id_sjto = :P2024023_ID_SJTO',
'and id_sjto_estdo = 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto, a.nmbre_impsto, a.dscrpcion_sjto_estdo, a.email, a.id_sjto_impsto, a.id_impsto ',
'from v_si_i_sujetos_impuesto a',
'where id_sjto = :P2024023_ID_SJTO',
'and id_sjto_estdo = 1',
'and not exists (select 1 from si_i_sujetos_asociados b where b.id_sjto_impsto = a.id_sjto_impsto and b.id_usrio = :F_ID_USRIO and b.actvo = ''S'');',
''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3963561041344521)
,p_validation_name=>unistr('Numero de identificaci\00F3n no nulo')
,p_validation_sequence=>10
,p_validation=>':P2024023_IDNTFCCION is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Digite un numero de identificacion'
,p_when_button_pressed=>wwv_flow_api.id(3930084969315398)
,p_associated_item=>wwv_flow_api.id(3930434797315398)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4345457504577414)
,p_validation_name=>'Email no nulo'
,p_validation_sequence=>20
,p_validation=>':P2024023_EMAIL is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Seleccione un email'
,p_when_button_pressed=>wwv_flow_api.id(2807493211216141)
,p_associated_item=>wwv_flow_api.id(4345349938577413)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4344973586577409)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(2806818640216135)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4345088705577410)
,p_event_id=>wwv_flow_api.id(4344973586577409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("sujeto");',
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
'            var value = model.getValue(record, "ID_SJTO_IMPSTO");',
'            concatenatedValues.push(value);',
'        });',
'',
'        // Concatenar los valores con ":" como separador',
'        var resultString = concatenatedValues.join(":");',
'',
'        apex.item("P2024023_CDNA").setValue(resultString);',
'',
unistr('        // Habilitar el bot\00F3n "procesar"'),
unistr('        $("#registrar").prop("disabled", false);  // Habilitar el bot\00F3n'),
'',
'    } else {',
'        // Si no hay registros seleccionados, puedes limpiar el item',
'        apex.item("P2024023_CDNA").setValue("");',
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
 p_id=>wwv_flow_api.id(2807654490216143)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    ',
'begin',
'                                            ',
'    pkg_gi_asociado.prc_gn_envio_asociado   (p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                              p_cdna              => :P2024023_CDNA,',
'                                              p_id_sjto           => :P2024023_ID_SJTO,',
'                                              p_id_usrio          => :F_ID_USRIO,',
'                                              p_email             => :P2024023_EMAIL,',
'                                              p_id_slctud_ascdo   => :P2024023_ID_SLCTUD_ASCDO,',
'                                              o_cdgo_rspsta       =>  v_cdgo_rspsta,',
'                                              o_mnsje_rspsta      =>  v_mnsje_rspsta);                                   ',
'                                            ',
'                                            ',
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
,p_process_when_button_id=>wwv_flow_api.id(2807493211216141)
,p_process_success_message=>'Proceso Ejecutado'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3963180012344517)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Informaci\00F3n Sujeto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*begin   ',
'    select a.id_sjto_impsto',
'      into :P2024023_ID_SJTO_IMPSTO',
'      from v_si_i_sujetos_impuesto     a',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'          and id_impsto = :P2024023_ID_IMPSTO',
'          and idntfccion_sjto = :P2024023_IDNTFCCION',
'          and id_sjto_estdo = 1;',
'     ',
'exception     ',
'        when no_data_found then ',
unistr('                apex_application.g_print_success_message := ''<span>No fue posible validar la identificaci\00F3n ''||:P2024023_IDNTFCCION||''</span>'';  '),
'                :P2024023_ID_SJTO_IMPSTO := null;',
'                :P2024023_ID_SLCTUD_ASCDO := null;',
'end;     */',
'',
'begin   ',
'    select a.id_sjto',
'      into :P2024023_ID_SJTO',
'      from v_si_c_sujetos  a',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'          and idntfccion_sjto = :P2024023_IDNTFCCION;',
'        --  and id_sjto_estdo = 1;',
'     ',
'exception     ',
'        when no_data_found then ',
unistr('                apex_application.g_print_success_message := ''<span>No fue posible validar la identificaci\00F3n ''||:P2024023_IDNTFCCION||''</span>'';  '),
'                :P2024023_ID_SJTO := null;',
'                :P2024023_ID_SLCTUD_ASCDO := null;',
'end; ',
'',
'',
'',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3930084969315398)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4084482129479131)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(2806818640216135)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Informaci\00F3n Sujeto Impuesto - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
