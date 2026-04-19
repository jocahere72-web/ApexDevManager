prompt --application/pages/page_00111
begin
wwv_flow_api.create_page(
 p_id=>111
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Consultas de Plantillas'
,p_page_mode=>'MODAL'
,p_step_title=>'Consultas de Plantillas'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'textarea{',
'    resize:none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(29518229835068493)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_protection_level=>'C'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220509114815'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40366657901725874)
,p_plug_name=>'Pantalla Basada en GN_D_PLANTILLAS_CONSULTA'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40367375409725876)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40367785651725876)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(40367375409725876)
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
 p_id=>wwv_flow_api.id(40367293448725876)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(40367375409725876)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de eliminar la Consulta?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P111_ID_PLNTLLA_CNSLTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40367195371725876)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(40367375409725876)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P111_ID_PLNTLLA_CNSLTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40367040211725876)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(40367375409725876)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P111_ID_PLNTLLA_CNSLTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40370122053725879)
,p_name=>'P111_ID_PLNTLLA_CNSLTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40366657901725874)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PLNTLLA_CNSLTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40370595353725897)
,p_name=>'P111_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40366657901725874)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Plantilla'
,p_source=>'ID_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.DSCRPCION,t.ID_PLNTLLA',
'from gn_d_plantillas t',
'where t.CDGO_CLNTE = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40370924157725899)
,p_name=>'P111_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(40366657901725874)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>500
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40371381678725899)
,p_name=>'P111_CNSLTA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(40366657901725874)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta'
,p_source=>'CNSLTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>7000
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Tener en cuenta la estructura del tipo de consulta eligido:<br>',
'<b>Estructura Basica de una consulta SQL</b><br>',
'select < column list > ',
'from < table name >',
'where < condition >',
'<br><br>',
'<b>Estructura basica de un procedimiento almacenado:</b><br>',
'    create or replace procedure <br>',
'< procedure_name ><br>',
'	(',
'	< parameter >in/out < datatype >',
'	..',
'	.',
'	)',
'[ is | as ]<br>',
'	< declaration_part ><br>',
'begin<br>',
'	< execution part ><br>',
'exception<br>',
'	< exception handling part ><br>',
'end<br>',
'        '))
,p_inline_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40371738014725899)
,p_name=>'P111_PRMTROS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(40366657901725874)
,p_use_cache_before_default=>'NO'
,p_source=>'PRMTROS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48930636541664802)
,p_name=>'P111_DSCRPCION_CRTA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40366657901725874)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre Consulta'
,p_source=>'DSCRPCION_CRTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93207195449332204)
,p_name=>'P111_TPO_CNSLTA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(40366657901725874)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Consulta'
,p_source=>'TPO_CNSLTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Consulta SQL;S,PL/SQL Procedimiento almacenado;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de consulta de la plantilla. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41207392561338002)
,p_validation_name=>unistr('validar que las columnas est\00E9n determinadas ')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    return not regexp_like(:P111_CNSLTA, ''select(\s)+\*'');',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe especificar las Columnas de la consulta'
,p_associated_item=>wwv_flow_api.id(40371381678725899)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41207240436338001)
,p_validation_name=>'validar sintaxis de la consulta'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'    v_return clob;',
'begin',
'',
'    if :P111_TPO_CNSLTA = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P111_CNSLTA;',
'        execute immediate v_sql ;',
'    elsif  :P111_TPO_CNSLTA = ''P'' then  ',
'        execute immediate :P111_CNSLTA using out v_return ;',
'    end if;',
'    ',
'exception when others then',
'   return ''Consulta/Procedimiento no Valido''; -- regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(40371381678725899)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(48930788146664803)
,p_validation_name=>'validar insert en consulta'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    existe_insert number(2):= 0;',
'begin',
'',
'    select instr(upper(:P111_CNSLTA),upper(''insert'')) ',
'    into existe_insert',
'    from dual;',
'',
'    if existe_insert > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('No puede haber una instrucci\00F3n Insert en la consulta.')
,p_associated_item=>wwv_flow_api.id(40371381678725899)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(48930886717664804)
,p_validation_name=>'validar update en consulta'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    existe_insert number(2):= 0;',
'begin',
'',
'    select instr(upper(:P111_CNSLTA),upper(''update'')) ',
'    into existe_insert',
'    from dual;',
'',
'    if existe_insert > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('No puede haber una instrucci\00F3n Update en la consulta.')
,p_associated_item=>wwv_flow_api.id(40371381678725899)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(48930992452664805)
,p_validation_name=>'validar delete en consulta'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    existe_insert number(2):= 0;',
'begin',
'',
'    select instr(upper(:P111_CNSLTA),upper(''delete'')) ',
'    into existe_insert',
'    from dual;',
'',
'    if existe_insert > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('No puede haber una instrucci\00F3n Delete en la consulta.')
,p_associated_item=>wwv_flow_api.id(40371381678725899)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40367873880725876)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40367785651725876)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40368651939725878)
,p_event_id=>wwv_flow_api.id(40367873880725876)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40372507470725901)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GN_D_PLANTILLAS_CONSULTA'
,p_attribute_02=>'GN_D_PLANTILLAS_CONSULTA'
,p_attribute_03=>'P111_ID_PLNTLLA_CNSLTA'
,p_attribute_04=>'ID_PLNTLLA_CNSLTA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40372970545725903)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GN_D_PLANTILLAS_CONSULTA'
,p_attribute_02=>'GN_D_PLANTILLAS_CONSULTA'
,p_attribute_03=>'P111_ID_PLNTLLA_CNSLTA'
,p_attribute_04=>'ID_PLNTLLA_CNSLTA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40373371035725903)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(40367293448725876)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40373718838725903)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
