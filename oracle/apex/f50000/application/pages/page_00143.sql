prompt --application/pages/page_00143
begin
wwv_flow_api.create_page(
 p_id=>143
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Metadatos'
,p_page_mode=>'MODAL'
,p_step_title=>'Metadatos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'80%'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191205175854'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18055215526348501)
,p_plug_name=>'Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18227917048830627)
,p_plug_name=>'Grupo de botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18227748783830625)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18227917048830627)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P143_ID_IMPSTO_SBMPSTO_MTDTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18056201029348511)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(18227917048830627)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P143_ID_IMPSTO_SBMPSTO_MTDTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18056354740348512)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(18227917048830627)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,140:P140_TRBTO,P140_SBTRBTO:&P143_ID_IMPSTO.,&P143_ID_IMPSTO_SBMPSTO.'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37350675026202831)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(18227917048830627)
,p_button_name=>'DELETE'
,p_button_static_id=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de eliminar el registro?'',''DELETE'');'
,p_button_condition=>'P143_ID_IMPSTO_SBMPSTO_MTDTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18227892605830626)
,p_branch_name=>unistr('Ir a P\00E1gina 140')
,p_branch_action=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,143::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18055343250348502)
,p_name=>'P143_NMBRE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre'
,p_source=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>100
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el nombre del metadato.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18055411986348503)
,p_name=>'P143_TPO_DTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de dato'
,p_source=>'TPO_DTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Car\00E1cter;C,Num\00E9rico;N,Fecha;D')
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de dato'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18055524738348504)
,p_name=>'P143_TPO_OBJTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>'Tipo de objeto'
,p_source=>'TPO_OBJTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Texto;T,Lista de Selecci\00F3n;S,\00C1rea de Texto;A')
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de objeto'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18055607288348505)
,p_name=>'P143_TPO_ORGEN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de origen'
,p_source=>'TPO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Est\00E1tico;E,Consulta SQL;S')
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de origen'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18055754746348506)
,p_name=>'P143_INDCDOR_RQRDO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFRequerido?')
,p_source=>'INDCDOR_RQRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604177042068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para indicar que el metadato es requerido.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18055802409348507)
,p_name=>'P143_ACTVO'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604177042068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar el metadato y "No" para desactivarlo.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18055931449348508)
,p_name=>'P143_ORDEN'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de orden en que ser\00E1n mostrados los metadatos.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18056076803348509)
,p_name=>'P143_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto as d,',
'        a.id_impsto as r',
'from df_c_impuestos a ',
'where a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18056108866348510)
,p_name=>'P143_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P143_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P143_ID_IMPSTO'
,p_ajax_items_to_submit=>'P143_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub tributo'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18056445581348513)
,p_name=>'P143_ID_IMPSTO_SBMPSTO_MTDTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_IMPSTO_SBMPSTO_MTDTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18056630794348515)
,p_name=>'P143_CDGO_CLNTE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36812973749463046)
,p_name=>'P143_SQL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta SQL'
,p_placeholder=>'Ingrese la consulta SQL'
,p_source=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>50
,p_cMaxlength=>32767
,p_cHeight=>3
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-left-md'
,p_help_text=>'Ingrese la consulta SQL'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40422429623601429)
,p_name=>'P143_TRBTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_source=>'P143_TRBTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'variables utilizadas para el boton cancelar, para que devuelva a la busqueda que se encontraba seleccionada.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40422575478601430)
,p_name=>'P143_SBTRBTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(18055215526348501)
,p_source=>'P143_SBTRBTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'variables utilizadas para el boton cancelar, para que devuelva a la busqueda que se encontraba seleccionada.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(37348058094202805)
,p_validation_name=>'Valida SQL'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob; ',
'begin',
'    v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select 1, 2 from ''|| :P143_SQL;',
'    execute immediate v_sql ;    ',
'exception when others then',
'   DBMS_OUTPUT.PUT_LINE(regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]*: '',''''));   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'P143_TPO_ORGEN'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(36812973749463046)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(37348197816202806)
,p_validation_name=>'Valida Cantidad Columnas SQL'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    type c_cursor_type is ref cursor;',
'    c_cursor              c_cursor_type;',
'    v_to_cursor_number    number; ',
'    v_desc_table          dbms_sql.desc_tab;',
'    v_column_count        number;',
'    ',
'begin',
'    open c_cursor for :P143_SQL;',
'    v_to_cursor_number := dbms_sql.to_cursor_number(c_cursor);  ',
'    dbms_sql.describe_columns(v_to_cursor_number, v_column_count, v_desc_table);',
'    return v_column_count = 2;',
'    ',
'exception',
'    when others then',
'       return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('\00A1El n\00FAmero de columnas de la consulta debe ser igual a 2!')
,p_always_execute=>'Y'
,p_validation_condition=>'P143_TPO_ORGEN'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(36812973749463046)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(38291928030203837)
,p_validation_name=>'Valida Tipo Origen'
,p_validation_sequence=>30
,p_validation=>'P143_TPO_ORGEN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione el tipo de origen de la lista de selecci\00F3n!')
,p_always_execute=>'Y'
,p_validation_condition=>'P143_TPO_OBJTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(18055607288348505)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(40653793726356937)
,p_validation_name=>'Valida Nombre'
,p_validation_sequence=>40
,p_validation=>'trim(:P143_NMBRE) is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('El nombre debe tener alg\00FAn valor 5'),
''))
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(18055343250348502)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36812031518463037)
,p_name=>unistr('Mostrar Lista Selecci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_TPO_OBJTO'
,p_condition_element=>'P143_TPO_OBJTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36812114801463038)
,p_event_id=>wwv_flow_api.id(36812031518463037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TPO_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40422702498601432)
,p_event_id=>wwv_flow_api.id(36812031518463037)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TPO_ORGEN,P143_SQL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37347872193202803)
,p_event_id=>wwv_flow_api.id(36812031518463037)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36812439894463041)
,p_name=>'Mostrar Texto'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_TPO_OBJTO'
,p_condition_element=>'P143_TPO_OBJTO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36812554618463042)
,p_event_id=>wwv_flow_api.id(36812439894463041)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TPO_ORGEN,P143_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40422839599601433)
,p_event_id=>wwv_flow_api.id(36812439894463041)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TPO_ORGEN,P143_SQL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36812644792463043)
,p_name=>unistr('Lista Est\00E1tica')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_TPO_ORGEN'
,p_condition_element=>'P143_TPO_ORGEN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37347609726202801)
,p_event_id=>wwv_flow_api.id(36812644792463043)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40422988381601434)
,p_event_id=>wwv_flow_api.id(36812644792463043)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SQL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36813049885463047)
,p_name=>unistr('Lista Din\00E1mica')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_TPO_ORGEN'
,p_condition_element=>'P143_TPO_ORGEN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36813141352463048)
,p_event_id=>wwv_flow_api.id(36813049885463047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45125235686054309)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'eliminar valores estaticos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete ',
'  from df_i_impsts_sbmpst_mtdt_vlr ',
' where id_impsto_sbmpsto_mtdta = :P143_ID_IMPSTO_SBMPSTO_MTDTA;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'nvl(:P143_TPO_ORGEN, ''S'') != ''E'' or :REQUEST = ''DELETE'''
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18056539671348514)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Automatic Row Processing'
,p_attribute_02=>'DF_I_IMPSTOS_SBMPSTO_MTDTA'
,p_attribute_03=>'P143_ID_IMPSTO_SBMPSTO_MTDTA'
,p_attribute_04=>'ID_IMPSTO_SBMPSTO_MTDTA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('\00A1Proceso realizado exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18227609893830624)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch'
,p_attribute_02=>'DF_I_IMPSTOS_SBMPSTO_MTDTA'
,p_attribute_03=>'P143_ID_IMPSTO_SBMPSTO_MTDTA'
,p_attribute_04=>'ID_IMPSTO_SBMPSTO_MTDTA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
