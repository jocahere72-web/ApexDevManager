prompt --application/pages/page_00136
begin
wwv_flow_api.create_page(
 p_id=>136
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Editar Variable Plantilla '
,p_page_mode=>'MODAL'
,p_step_title=>'Editar Variable de Plantilla '
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20191106103735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103853040686605134)
,p_plug_name=>'actualizar variables de plantillas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109631377360512709)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109631234107512708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(109631377360512709)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109507287696903910)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(109631377360512709)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar la variable ?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P136_CDGO_PLNTLLA_VRIABLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109507131303903909)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(109631377360512709)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P136_CDGO_PLNTLLA_VRIABLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109506659265903904)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(109631377360512709)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P136_CDGO_PLNTLLA_VRIABLE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103853175976605135)
,p_name=>'P136_CDGO_PLNTLLA_VRIABLE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103853040686605134)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo Variable de Plantilla')
,p_source=>'CDGO_PLNTLLA_VRBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''letraNumero'');"onkeyup="campoMayuscula(this)"'
,p_grid_label_column_span=>3
,p_read_only_when=>'P136_CDGO_PLNTLLA_VRIABLE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103853218952605136)
,p_name=>'P136_NMBRE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103853040686605134)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre'
,p_source=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103853453727605138)
,p_name=>'P136_EXPRESION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103853040686605134)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Expresi\00F3n')
,p_source=>'FNCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109506465258903902)
,p_name=>'P136_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103853040686605134)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1000
,p_cHeight=>5
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109506911723903907)
,p_name=>'P136_TPO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103853040686605134)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo'
,p_source=>'TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Funci\00F3n;F,Expresi\00F3n;E')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109507070984903908)
,p_name=>'P136_FNCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103853040686605134)
,p_prompt=>unistr('Funci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select p.object_name|| ''.''||p.procedure_name || '' version '' || a.overload d ',
'       , a.package_name|| ''.''||a.object_name || ''('' || listagg(decode( a.argument_name,null,'''', '':'' )|| a.argument_name ,'' , '') within group (order by a.sequence) || '')''  b ',
'    from user_procedures p',
'    join user_arguments a',
'      on p.subprogram_id = a.subprogram_id',
'     and p.object_id     = a.object_id',
'   where p.procedure_name is not null',
'     and a.package_name like ''PKG_%''',
'     and p.procedure_name like ''FNC_%''',
'     and a.data_type not in  (''CLOB'',''PL/SQL RECORD'')',
'group by a.object_name,',
'         a.overload,',
'         a.package_name,',
'         p.object_name,',
'         p.procedure_name ',
'  having listagg(a.in_out, '':'')  in (''OUT:IN'', ''IN:OUT'');'))
,p_lov_display_null=>'YES'
,p_cSize=>60
,p_cMaxlength=>1000
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33037475539836102)
,p_validation_name=>'validar Expresion'
,p_validation_sequence=>40
,p_validation=>'not (:P136_TPO = ''E'' and :P136_EXPRESION is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Debe ingresar un valor en el campo Expresi\00F3n.')
,p_associated_item=>wwv_flow_api.id(103853453727605138)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33037577157836103)
,p_validation_name=>unistr('validar funci\00F3n')
,p_validation_sequence=>50
,p_validation=>'not (:P136_TPO = ''F'' and :P136_FNCION is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Debe ingresar un valor en el campo Funci\00F3n.')
,p_associated_item=>wwv_flow_api.id(109507070984903908)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(109632022391512716)
,p_validation_name=>'validation_expresion'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_return varchar2(100);',
'   v_sql    varchar2(4000);',
'begin',
'   v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P136_EXPRESION ||'' from dual'';',
'   execute immediate v_sql using 1 ;    ',
'exception ',
'   when others then',
unistr('        return ''Expresi\00F3n/Funci\00F3n no valida'';'),
'        --return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');  ',
'        --DBMS_OUTPUT.put_line(sqlerrm);',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103853708216605141)
,p_name=>'Change_option'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_TPO'
,p_condition_element=>'P136_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103853843870605142)
,p_event_id=>wwv_flow_api.id(103853708216605141)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_FNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103854085540605144)
,p_event_id=>wwv_flow_api.id(103853708216605141)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_EXPRESION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109630811836512704)
,p_event_id=>wwv_flow_api.id(103853708216605141)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_EXPRESION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109630988010512705)
,p_event_id=>wwv_flow_api.id(103853708216605141)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_FNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32972008724488701)
,p_event_id=>wwv_flow_api.id(103853708216605141)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s(''P136_EXPRESION'', $(''#P136_FNCION_HIDDENVALUE'').val());'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109631011483512706)
,p_name=>'change_function'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_FNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109631184883512707)
,p_event_id=>wwv_flow_api.id(109631011483512706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s(''P136_EXPRESION'', $(''#P136_FNCION_HIDDENVALUE'').val());'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109631445765512710)
,p_name=>'cancel dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(109631234107512708)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109631502251512711)
,p_event_id=>wwv_flow_api.id(109631445765512710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109506813825903906)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GN_D_PLANTILLAS_VARIABLE'
,p_attribute_02=>'GN_D_PLANTILLAS_VARIABLE'
,p_attribute_03=>'P136_CDGO_PLNTLLA_VRIABLE'
,p_attribute_04=>'CDGO_PLNTLLA_VRBLE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109631657275512712)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset pages'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(109507287696903910)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109631726986512713)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close_dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109506397073903901)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch'
,p_attribute_02=>'GN_D_PLANTILLAS_VARIABLE'
,p_attribute_03=>'P136_CDGO_PLNTLLA_VRIABLE'
,p_attribute_04=>'CDGO_PLNTLLA_VRBLE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109507359032903911)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos de funcion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select fncion',
'  into :P136_FNCION',
'  from gn_d_plantillas_variable where cdgo_plntlla_vrble = :P136_CDGO_PLNTLLA_VRIABLE;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select fncion',
'  from gn_d_plantillas_variable ',
' where cdgo_plntlla_vrble = :P136_CDGO_PLNTLLA_VRIABLE'))
,p_process_when_type=>'EXISTS'
);
end;
/
