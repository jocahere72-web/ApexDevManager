prompt --application/pages/page_00056
begin
wwv_flow_api.create_page(
 p_id=>56
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Responsables Investigaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Responsables Investigaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
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
'        $s(''P56_JSON_ENTIDADES'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("CREATE").show();',
'        }else {',
'            apex.item("CREATE").hide();',
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
'function deselecionar_datos_grid() {',
'    ',
'    var region = apex.region("entidades");',
'    if (region) {',
'        ',
'        apex.region("entidades").widget().interactiveGrid("setSelectedRecords", []);',
'        ',
'    }',
'       ',
'    return;',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
'',
'deselecionar_datos_grid();'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200128094526'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95133859973750453)
,p_plug_name=>unistr('Responsables Investigaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95134518731750455)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17336422472919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95329924922269128)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P56_MOSTRAR_TAB'
,p_plug_display_when_cond2=>'S'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192762227920659339)
,p_plug_name=>'Entidades Nuevo Propietario'
,p_region_name=>'entidades'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_clnte,a.id_entddes,a.dscrpcion,a.ofcio_x_prptrio',
'  from mc_d_entidades a',
' where a.actvo = ''S''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and exists (select 1',
'                 from mc_g_embargos_cartera b, mc_g_solicitudes_y_oficios c',
'                where b.id_embrgos_crtra = c.id_embrgos_crtra',
'                  and c.id_entddes = a.id_entddes',
'                  and b.id_embrgos_crtra = :P56_ID_EMBRGOS_CRTRA);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P56_MOSTRAR_TAB'
,p_plug_display_when_cond2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192763361313659344)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192763873191659344)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Acciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192765121781659346)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(192765719593659347)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
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
 p_id=>wwv_flow_api.id(192766286511659347)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192766916599659348)
,p_name=>'OFCIO_X_PRPTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OFCIO_X_PRPTRIO'
,p_data_type=>'VARCHAR2'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(192762705211659341)
,p_internal_uid=>192762705211659341
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(192763076660659342)
,p_interactive_grid_id=>wwv_flow_api.id(192762705211659341)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(192763208395659342)
,p_report_id=>wwv_flow_api.id(192763076660659342)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192764318009659345)
,p_view_id=>wwv_flow_api.id(192763208395659342)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(192763873191659344)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192765488380659347)
,p_view_id=>wwv_flow_api.id(192763208395659342)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(192765121781659346)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192766054458659347)
,p_view_id=>wwv_flow_api.id(192763208395659342)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(192765719593659347)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192766688296659347)
,p_view_id=>wwv_flow_api.id(192763208395659342)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(192766286511659347)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>458
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192767258451659348)
,p_view_id=>wwv_flow_api.id(192763208395659342)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(192766916599659348)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(381569280020380061)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b><i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>:</i></b> ',
'Funcionalidad que permite agregar un nuevo responsable a la investigacion, ademas permite escoger las entidades que seran objeto de investigacion para el nuevo responsable. se deben escoger las entidades para que pueda agregarse el nuevo responsable.'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95134991089750455)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95134518731750455)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95134479618750455)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95134518731750455)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95134320589750455)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(95134518731750455)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P56_ID_EMBRGOS_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95134293413750455)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95134518731750455)
,p_button_name=>'CREATE'
,p_button_static_id=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P56_ID_EMBRGOS_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93975678726433422)
,p_name=>'P56_ID_EMBRGOS_RSPNSBLE_DEVUELTO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95137308402750460)
,p_name=>'P56_ID_EMBRGOS_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Embrgos Rspnsble'
,p_source=>'ID_EMBRGOS_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95137738739750483)
,p_name=>'P56_ID_EMBRGOS_CRTRA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95138126431750486)
,p_name=>'P56_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_source=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tipo de Identificaci\00F3n del Responsable asociado.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95138586212750486)
,p_name=>'P56_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identificaci\00F3n del Responsable asociado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95138948420750487)
,p_name=>'P56_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Nombre'
,p_source=>'PRMER_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Primer nombre del Responsable asociado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95139353989750487)
,p_name=>'P56_SGNDO_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Nombre'
,p_source=>'SGNDO_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Segundo nombre del Responsable asociado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95139715210750487)
,p_name=>'P56_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Apellido'
,p_source=>'PRMER_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Primer apellido del Responsable asociado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95140174215750487)
,p_name=>'P56_SGNDO_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Apellido'
,p_source=>'SGNDO_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Segundo apellido del Responsable asociado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95140502129750488)
,p_name=>'P56_ID_PAIS_NTFCCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pa\00EDs Notificaci\00F3n')
,p_source=>'ID_PAIS_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Pa\00EDs de notificaci\00F3n del Responsable asociado.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95140932330750488)
,p_name=>'P56_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_source=>'ID_DPRTMNTO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    nmbre_dprtmnto,',
'    id_dprtmnto',
'from',
'    df_s_departamentos',
'where',
'    id_pais =:p56_id_pais_ntfccion;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P56_ID_PAIS_NTFCCION'
,p_ajax_items_to_submit=>'P56_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Departamento del Responsable asociado.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95141343190750488)
,p_name=>'P56_ID_MNCPIO_NTFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr(' Municipio Notificaci\00F3n')
,p_source=>'ID_MNCPIO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    nmbre_mncpio,',
'    id_mncpio',
'from',
'    df_s_municipios',
'where',
'    id_dprtmnto =:P56_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P56_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Municipio del Responsable asociado.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95141780317750489)
,p_name=>'P56_DRCCION_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Direcci\00F3n de Notificaci\00F3n del Responsable asociado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95142136004750489)
,p_name=>'P56_EMAIL'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>320
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Correo electr\00F3nico o E-mail del Responsable asociado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95142516903750489)
,p_name=>'P56_TLFNO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'TLFNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Tel\00E9fono del Responsable asociado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95142952197750489)
,p_name=>'P56_CLLAR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Celular'
,p_source=>'CLLAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Numero celular o m\00F3vil del Responsable asociado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95143305591750490)
,p_name=>'P56_PRNCPAL_S_N'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Principal'
,p_source=>'PRNCPAL_S_N'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;S,No;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Estado que indica si es o no el responsable principal.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95143759664750490)
,p_name=>'P56_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_TPO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95144189728750490)
,p_name=>'P56_PRCNTJE_PRTCPCION'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_source=>'PRCNTJE_PRTCPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95330006697269129)
,p_name=>'P56_MOSTRAR_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95329924922269128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95330320533269132)
,p_name=>'P56_JSON_ENTIDADES'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95330478331269133)
,p_name=>'P56_ID_TPOS_EMBRGO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95331147409269140)
,p_name=>'P56_ACTIVO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(95133859973750453)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estado'
,p_source=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Activo;S,Inactivo;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Estado que indica si el responsable se encuentra activo o no para continuar con el proceso de medida cautelar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103142731279723821)
,p_name=>'P56_TPO_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(192762227920659339)
,p_prompt=>'Tipo de Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Puntual;P,Masiva;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de Plantilla masiva o puntual.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103142897520723822)
,p_name=>'P56_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(192762227920659339)
,p_prompt=>unistr('Plantilla Solicitudes de Investigaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P56_ID_TPOS_EMBRGO',
'where a.tpo_plntlla = :P56_TPO_PLNTLLA',
'and a.actvo = ''S''',
'and a.id_prcso = 26',
'and b.tpo_dcmnto = ''O''',
'and b.clse_dcmnto = ''P'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P56_TPO_PLNTLLA'
,p_ajax_items_to_submit=>'P56_ID_PLNTLLA'
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
 p_id=>wwv_flow_api.id(95330547732269134)
,p_computation_sequence=>10
,p_computation_item=>'P56_ID_TPOS_EMBRGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpos_mdda_ctlar',
'from mc_g_embargos_cartera ',
'where id_embrgos_crtra = :P56_ID_EMBRGOS_CRTRA'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95135076374750455)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95134991089750455)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95135820329750457)
,p_event_id=>wwv_flow_api.id(95135076374750455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95330664448269135)
,p_name=>'Al seleccionar entidad'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(192762227920659339)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95330704620269136)
,p_event_id=>wwv_flow_api.id(95330664448269135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95144945477750493)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MC_G_EMBARGOS_RESPONSABLE'
,p_attribute_02=>'MC_G_EMBARGOS_RESPONSABLE'
,p_attribute_03=>'P56_ID_EMBRGOS_RSPNSBLE'
,p_attribute_04=>'ID_EMBRGOS_RSPNSBLE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95145316101750494)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MC_G_EMBARGOS_RESPONSABLE'
,p_attribute_02=>'MC_G_EMBARGOS_RESPONSABLE'
,p_attribute_03=>'P56_ID_EMBRGOS_RSPNSBLE'
,p_attribute_04=>'ID_EMBRGOS_RSPNSBLE'
,p_attribute_09=>'P56_ID_EMBRGOS_RSPNSBLE_DEVUELTO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95330261473269131)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CRUD_responsables'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' pkg_cb_medidas_cautelares.prc_rg_embargos_responsable (p_cdgo_clnte            => :F_CDGO_CLNTE          ,',
'                                                        p_id_usuario            => :F_ID_USRIO         ,',
'                                                        p_id_embrgos_crtra      => :P56_ID_EMBRGOS_CRTRA    ,',
'                                                        p_id_tpos_embrgo        => :P56_ID_TPOS_EMBRGO      ,',
'                                                        p_id_embrgos_rspnsble	=> :P56_ID_EMBRGOS_RSPNSBLE	,',
'                                                        p_cdgo_idntfccion_tpo	=> :P56_CDGO_IDNTFCCION_TPO	,',
'                                                        p_idntfccion			=> :P56_IDNTFCCION			,',
'                                                        p_prmer_nmbre			=> :P56_PRMER_NMBRE			,',
'                                                        p_sgndo_nmbre			=> :P56_SGNDO_NMBRE			,',
'                                                        p_prmer_aplldo			=> :P56_PRMER_APLLDO		,',
'                                                        p_sgndo_aplldo			=> :P56_SGNDO_APLLDO		,',
'                                                        p_id_pais_ntfccion		=> :P56_ID_PAIS_NTFCCION	,',
'                                                        p_id_dprtmnto_ntfccion	=> :P56_ID_DPRTMNTO_NTFCCION,',
'                                                        p_id_mncpio_ntfccion	=> :P56_ID_MNCPIO_NTFCCION	,',
'                                                        p_drccion_ntfccion		=> :P56_DRCCION_NTFCCION	,',
'                                                        p_email					=> :P56_EMAIL				,',
'                                                        p_tlfno					=> :P56_TLFNO				,',
'                                                        p_cllar					=> :P56_CLLAR				,',
'                                                        p_prncpal_s_n			=> :P56_PRNCPAL_S_N			,										',
'                                                        p_cdgo_tpo_rspnsble		=> :P56_CDGO_TPO_RSPNSBLE	,',
'                                                        p_prcntje_prtcpcion		=> :P56_PRCNTJE_PRTCPCION	,',
'                                                        p_activo                => :P56_ACTIVO              ,',
'                                                        p_id_plntlla            => :P56_ID_PLNTLLA          ,',
'                                                        p_json_entidades 		=> :P56_JSON_ENTIDADES		,                                                       ',
'                                                        p_request           	=> :REQUEST          	);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95145795561750496)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95134479618750455)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95146128726750496)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
