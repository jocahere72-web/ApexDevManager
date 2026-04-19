prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>unistr('Par\00E1metro de Preferencia')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Par\00E1metro de Preferencia')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.adicionar_btton{',
'    padding-top: 30px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_upd_yyyymmddhh24miss=>'20191106102103'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4727106423202905)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71603687943187948)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4727897463202912)
,p_plug_name=>unistr('Par\00E1metro de Preferencia')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71602665844187947)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4729601930202930)
,p_plug_name=>'Valores'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id,',
'       c001 display,',
'       c002 retorno',
'from apex_collections',
'where collection_name = ''MA_VLRES_ESTATICO'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4941025142812310)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4941146321812311)
,p_name=>'DISPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor de Visualizacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4941261183812312)
,p_name=>'RETORNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RETORNO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor de Retorno'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4941331529812313)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4941457540812314)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4940961746812309)
,p_internal_uid=>4940961746812309
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
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(4973294474971631)
,p_interactive_grid_id=>wwv_flow_api.id(4940961746812309)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4973362711971631)
,p_report_id=>wwv_flow_api.id(4973294474971631)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4973816379971632)
,p_view_id=>wwv_flow_api.id(4973362711971631)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4941025142812310)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4974389433971633)
,p_view_id=>wwv_flow_api.id(4973362711971631)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4941146321812311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4974856013971635)
,p_view_id=>wwv_flow_api.id(4973362711971631)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4941261183812312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4979375398978393)
,p_view_id=>wwv_flow_api.id(4973362711971631)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(4941331529812313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4728398193202917)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4727106423202905)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(71676231379187991)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4728012767202914)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4727106423202905)
,p_button_name=>'BTN_CREAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P7_ID_ENVIO_MDIO_CNFGRCION_PF'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4728130329202915)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4727106423202905)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P7_ID_ENVIO_MDIO_CNFGRCION_PF'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4728295015202916)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(4727106423202905)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(71676231379187991)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P7_ID_ENVIO_MDIO_CNFGRCION_PF'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4653862475726747)
,p_name=>'P7_ID_ENVIO_MDIO_CNFGRCION_PF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ENVIO_MDIO_CNFGRCION_PF'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4653960493726748)
,p_name=>'P7_ID_ENVIO_MDIO_CNFGRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ENVIO_MDIO_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4654052123726749)
,p_name=>'P7_NMBRE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre'
,p_source=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4654148675726750)
,p_name=>'P7_PRMTRO_TPO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de Par\00E1metro')
,p_source=>'PRMTRO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Campo de Texto;TXT,Lista de Selecci\00F3n;LOV')
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4726779764202901)
,p_name=>'P7_ORGEN_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Origen'
,p_source=>'ORGEN_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Consulta SQL;S,Contenido Est\00E1tico;E')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4726855514202902)
,p_name=>'P7_ORGEN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Origen'
,p_source=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4726933277202903)
,p_name=>'P7_ACTVO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5647201245637236)
,p_name=>'P7_ORDEN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5647355745637237)
,p_name=>'P7_INDCDOR_RQRDO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>'Requerido'
,p_source=>'INDCDOR_RQRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8721688723834923)
,p_name=>'P7_PRMTRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4727897463202912)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Par\00E1metro')
,p_source=>'PRMTRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5805245349215022)
,p_validation_name=>'Valida tipo de Origen'
,p_validation_sequence=>10
,p_validation=>'P7_ORGEN_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio, por favor verifique!'
,p_validation_condition=>'P7_PRMTRO_TPO'
,p_validation_condition2=>'LOV'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(4726779764202901)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5805533153215025)
,p_validation_name=>'Valida SQL'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P7_ORGEN;',
'    execute immediate v_sql ;    ',
'exception when others then',
'   return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');  ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P7_ORGEN_TPO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(4726855514202902)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5805605859215026)
,p_validation_name=>'Valida numero de columnas'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   type c_cursor_type is ref cursor;',
'   c_cursor           c_cursor_type;',
'   v_to_cursor_number number;',
'   v_desc_table       dbms_sql.desc_tab;',
'   v_column_count     number;',
'   ',
'begin',
'   open c_cursor for :P7_ORGEN; --using p_xml ;',
'   v_to_cursor_number := dbms_sql.to_cursor_number(c_cursor);  ',
'   dbms_sql.describe_columns(v_to_cursor_number, v_column_count, v_desc_table);',
'   return v_column_count = 2;',
'exception',
'   when others then',
'      return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'La consulta excede el numero de columnas permitidas (2)'
,p_validation_condition=>'P7_ORGEN_TPO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(4726855514202902)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4941673448812316)
,p_name=>'Al cambiar tipo de parametro = TXT'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_PRMTRO_TPO'
,p_condition_element=>'P7_PRMTRO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'TXT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4942107049812321)
,p_event_id=>wwv_flow_api.id(4941673448812316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN,P7_ORGEN_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4941754630812317)
,p_event_id=>wwv_flow_api.id(4941673448812316)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN,P7_ORGEN_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4941848656812318)
,p_event_id=>wwv_flow_api.id(4941673448812316)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013221818193914)
,p_event_id=>wwv_flow_api.id(4941673448812316)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin',
'    /*Validamos si existe la coleccion*/',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    /*Borramos la coleccion*/',
'    if(v_existe_coleccion)then',
'        apex_collection.delete_collection(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013376860193915)
,p_event_id=>wwv_flow_api.id(4941673448812316)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4943551782812335)
,p_name=>'Al cambiar tipo de parametro = LOV'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_PRMTRO_TPO'
,p_condition_element=>'P7_PRMTRO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'LOV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4944148538812341)
,p_event_id=>wwv_flow_api.id(4943551782812335)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN,P7_ORGEN_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4944312729812343)
,p_event_id=>wwv_flow_api.id(4943551782812335)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013454964193916)
,p_event_id=>wwv_flow_api.id(4943551782812335)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin',
'    /*Validamos si existe la coleccion*/',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    /*Borramos la coleccion*/',
'    if(v_existe_coleccion)then',
'        apex_collection.delete_collection(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013502952193917)
,p_event_id=>wwv_flow_api.id(4943551782812335)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4944467135812344)
,p_name=>'Al cambiar tipo de origen = S'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_ORGEN_TPO'
,p_condition_element=>'P7_ORGEN_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4944524813812345)
,p_event_id=>wwv_flow_api.id(4944467135812344)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4944676810812346)
,p_event_id=>wwv_flow_api.id(4944467135812344)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4945059895812350)
,p_event_id=>wwv_flow_api.id(4944467135812344)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013614156193918)
,p_event_id=>wwv_flow_api.id(4944467135812344)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin',
'    /*Validamos si existe la coleccion*/',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    /*Borramos la coleccion*/',
'    if(v_existe_coleccion)then',
'        apex_collection.delete_collection(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013788853193919)
,p_event_id=>wwv_flow_api.id(4944467135812344)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4944739387812347)
,p_name=>'Al cambiar tipo de origen = E'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_ORGEN_TPO'
,p_condition_element=>'P7_ORGEN_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4944844061812348)
,p_event_id=>wwv_flow_api.id(4944739387812347)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4944935316812349)
,p_event_id=>wwv_flow_api.id(4944739387812347)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5011919809193901)
,p_event_id=>wwv_flow_api.id(4944739387812347)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5014083995193922)
,p_event_id=>wwv_flow_api.id(4944739387812347)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin',
'    /*Validamos si existe la coleccion*/',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    /*Borramos la coleccion*/',
'    if(v_existe_coleccion)then',
'        apex_collection.delete_collection(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5014150999193923)
,p_event_id=>wwv_flow_api.id(4944739387812347)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5012010054193902)
,p_name=>'Al cambiar tipo de origen != E,S'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_ORGEN_TPO'
,p_condition_element=>'P7_ORGEN_TPO'
,p_triggering_condition_type=>'NOT_IN_LIST'
,p_triggering_expression=>'E,S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5012246631193904)
,p_event_id=>wwv_flow_api.id(5012010054193902)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5012543877193907)
,p_event_id=>wwv_flow_api.id(5012010054193902)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5012485658193906)
,p_event_id=>wwv_flow_api.id(5012010054193902)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013868747193920)
,p_event_id=>wwv_flow_api.id(5012010054193902)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin',
'    /*Validamos si existe la coleccion*/',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    /*Borramos la coleccion*/',
'    if(v_existe_coleccion)then',
'        apex_collection.delete_collection(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5013999825193921)
,p_event_id=>wwv_flow_api.id(5012010054193902)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4729601930202930)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5012842849193910)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4729601930202930)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Guardar Origen Contenido Estatico'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin',
'    /*Validamos si existe la coleccion*/',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    if(not v_existe_coleccion)then',
'        apex_collection.create_or_truncate_collection(',
'            p_collection_name => ''MA_VLRES_ESTATICO''',
'        );',
'    end if;',
'    ',
'    if(:P7_PRMTRO_TPO = ''LOV'' and :P7_ORGEN_TPO = ''E'')then',
'       case :APEX$ROW_STATUS',
'       when ''C'' then',
'           apex_collection.add_member (',
'               p_collection_name   => ''MA_VLRES_ESTATICO'',',
'               p_c001              => :DISPLAY,',
'               p_c002              => :RETORNO',
'           );',
'       when ''U'' then',
'           apex_collection.update_member (',
'               p_collection_name => ''MA_VLRES_ESTATICO'',',
'               p_seq => :SEQ_ID,',
'               p_c001 => :DISPLAY,',
'               p_c002 => :RETORNO',
'           );',
'       when ''D'' then',
'           apex_collection.delete_member(',
'               p_collection_name => ''MA_VLRES_ESTATICO'',',
'               p_seq => :SEQ_ID',
'           );',
'       end case;',
'    end if;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_GUARDAR,BTN_CREAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5012996858193911)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Preferencia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_envio_mdio_cnfgrcion_pf number;',
'    v_count number := 0;',
'    v_existe_coleccion boolean;',
'begin',
'    ',
'    /*Recorremos la coleccion*/',
'    if(:P7_PRMTRO_TPO = ''LOV'' and :P7_ORGEN_TPO = ''E'')then',
'        :P7_ORGEN := null;',
'        for c_valores in (select seq_id,',
'                                 c001,',
'                                 c002',
'                          from apex_collections',
'                          where collection_name = ''MA_VLRES_ESTATICO'') loop',
'            v_count := v_count + 1;',
'            :P7_ORGEN := :P7_ORGEN||case when v_count > 1 then '','' else '''' end||c_valores.c001||'';''||c_valores.c002;',
'        end loop;',
'    end if;',
'    if(:REQUEST = ''BTN_CREAR'')then',
'       /*Obtenemos el id de la secuencia*/',
'       v_id_envio_mdio_cnfgrcion_pf := sq_ma_d_envios_mdio_cnfgrcn_pf.nextval;',
'       begin',
'           insert into ma_d_envios_mdio_cnfgrcn_pf(',
'               id_envio_mdio_cnfgrcion_pf,',
'               id_envio_mdio_cnfgrcion,',
'               nmbre,',
'               prmtro,',
'               prmtro_tpo,',
'               orgen_tpo,',
'               orgen,',
'               orden,',
'               indcdor_rqrdo,',
'               actvo',
'           )values(',
'               v_id_envio_mdio_cnfgrcion_pf,',
'               :P7_ID_ENVIO_MDIO_CNFGRCION,',
'               :P7_NMBRE,',
'               :P7_PRMTRO,',
'               :P7_PRMTRO_TPO,',
'               :P7_ORGEN_TPO,',
'               :P7_ORGEN,',
'               :P7_ORDEN,',
'               :P7_INDCDOR_RQRDO,',
'               :P7_ACTVO',
'           );',
'       exception',
'           when others then',
'               rollback;',
'               raise_application_error(-20001, ''Problemas la registrar preferencia, ''||sqlerrm);',
'       end;',
'    elsif(:REQUEST = ''BTN_GUARDAR'')then',
'        begin',
'            update ma_d_envios_mdio_cnfgrcn_pf',
'            set nmbre = :P7_NMBRE,',
'                prmtro =:P7_PRMTRO,',
'                prmtro_tpo = :P7_PRMTRO_TPO,',
'                orgen_tpo = :P7_ORGEN_TPO,',
'                orgen = :P7_ORGEN,',
'                orden = :P7_ORDEN,',
'                indcdor_rqrdo= :P7_INDCDOR_RQRDO,',
'                actvo = :P7_ACTVO',
'            where id_envio_mdio_cnfgrcion_pf = :P7_ID_ENVIO_MDIO_CNFGRCION_PF;',
'        exception',
'            when others then',
'               rollback;',
'               raise_application_error(-20001, ''Problemas la actualizar preferencia, ''||sqlerrm);',
'        end;',
'    elsif(:REQUEST = ''BTN_ELIMINAR'')then',
'        begin',
'            delete from ma_d_envios_mdio_cnfgrcn_pf',
'            where id_envio_mdio_cnfgrcion_pf = :P7_ID_ENVIO_MDIO_CNFGRCION_PF;',
'        exception',
'            when others then',
'                rollback;',
'                raise_application_error(-20001, ''Problemas la actualizar preferencia, ''||sqlerrm);',
'        end;',
'    end if;',
'    ',
'    commit;',
'    /*Validamos si existe la coleccion*/',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    /*Borramos la coleccion*/',
'    if(v_existe_coleccion)then',
'        apex_collection.delete_collection(p_collection_name => ''MA_VLRES_ESTATICO'');',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Cambios realizados exitosamente!'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5012647873193908)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Recuadro de Dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_CANCELAR,BTN_ELIMINAR,BTN_GUARDAR,BTN_CREAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4727916530202913)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Recuperacion Automatica de Filas'
,p_attribute_02=>'MA_D_ENVIOS_MDIO_CNFGRCN_PF'
,p_attribute_03=>'P7_ID_ENVIO_MDIO_CNFGRCION_PF'
,p_attribute_04=>'ID_ENVIO_MDIO_CNFGRCION_PF'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P7_ID_ENVIO_MDIO_CNFGRCION_PF'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5012716541193909)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Valores'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'    if(:P7_PRMTRO_TPO = ''LOV'' and :P7_ORGEN_TPO = ''E'')then',
'        /*Creamos la coleccion*/',
'        apex_collection.create_or_truncate_collection(',
'            p_collection_name => ''MA_VLRES_ESTATICO''',
'        );',
'        /*Recorremos las guias y guardamos en la temporal*/',
'        for c_valores in(select  regexp_substr( cdna , ''[^;]+'' ) as display,',
'                               regexp_substr( cdna , ''[^;]+'' , 1 , 2 ) as retorno',
'                       from table ( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna => :P7_ORGEN, p_crcter_dlmtdor => '','' ))) loop',
'            /*Adicionamos el registro en la coleccion*/',
'            apex_collection.add_member (',
'                p_collection_name   => ''MA_VLRES_ESTATICO'',',
'                p_c001              => c_valores.display,',
'                p_c002              => c_valores.retorno',
'            );',
'        end loop;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P7_ID_ENVIO_MDIO_CNFGRCION_PF'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
