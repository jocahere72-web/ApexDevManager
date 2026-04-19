prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('\00CDtem de Tarea')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('\00CDtem de Tarea')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_protection_level=>'C'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241025234050'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32908461355309815)
,p_plug_name=>'Item'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72903782990094472)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33030637992809922)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72904753757094472)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33031007978809924)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33030637992809922)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33032642353809927)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(33030637992809922)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Está seguro de eliminar el registro seleccionado?'',''BTN_ELIMINAR'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P31_ID_TREA_ITEM'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33033015963809928)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(33030637992809922)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P31_ID_TREA_ITEM'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33033441063809955)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(33030637992809922)
,p_button_name=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P31_ID_TREA_ITEM'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(32909672413309827)
,p_branch_name=>'Go To Page 25'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP,25::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_ELIMINAR,BTN_GUARDAR,BTN_INSERTAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32908675685309817)
,p_name=>'P31_ITEM_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(32908461355309815)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00CDtem')
,p_source=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r',
'from(',
'    select item_name d, item_name r',
'    from apex_application_page_items a',
'    inner join sg_g_aplicaciones b on a.application_id = b.nmro_aplccion',
'    inner join wf_d_tareas c on b.id_aplccion = c.id_aplccion and',
'                                a.page_id = c.nmro_pgna and',
'                                c.id_trea = :P31_ID_TREA',
'    union',
'    select a.item_name d, item_name r',
'    from apex_application_items a',
'    inner join sg_g_aplicaciones b on a.application_id = b.nmro_aplccion',
'    inner join wf_d_tareas c on b.id_aplccion = c.id_aplccion and',
'                                c.id_trea = :P31_ID_TREA)',
'order by 1 desc'))
,p_lov_cascade_parent_items=>'P31_ID_TREA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33026451143809896)
,p_name=>'P31_ID_TREA_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32908461355309815)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_TREA_ITEM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33026882170809912)
,p_name=>'P31_ID_TREA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(32908461355309815)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tarea'
,p_source=>'ID_TREA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_trea d, a.id_trea r ',
'from wf_d_tareas        a',
'join wf_d_flujos_tarea  b on a.id_trea = b.id_trea',
'join wf_d_flujos        c on b.id_fljo = c.id_fljo',
'where c.cdgo_clnte = :F_CDGO_CLNTE',
'and c.cdgo_fljo in (''RCS'', ''RAC'')',
'order by 1;'))
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33027285721809920)
,p_name=>'P31_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(32908461355309815)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>150
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33027656041809920)
,p_name=>'P31_TPO_ORGN'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(32908461355309815)
,p_use_cache_before_default=>'NO'
,p_item_default=>'E'
,p_prompt=>'Tipo de Origen'
,p_source=>'TPO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC2:Est\00E1tico;E,\00CDtem de P\00E1gina;I,SQL;S,Funci\00F3n;F')
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33028022677809920)
,p_name=>'P31_ORGEN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(32908461355309815)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Origen'
,p_source=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33028434562809921)
,p_name=>'P31_ACTVO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(32908461355309815)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(32909413644309825)
,p_validation_name=>'Valida Consulta SQL'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-->Validamos la consultaa',
'declare',
'    v_sql    clob;',
'begin',
'    v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P31_ORGEN;',
'    execute immediate v_sql ;',
'exception when others then',
'   return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');  ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P31_TPO_ORGN'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(33028022677809920)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(32909732031309828)
,p_validation_name=>'Valida Item'
,p_validation_sequence=>20
,p_validation=>'P31_ITEM_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# se encuentra vaci\00F3, por favor verifique.')
,p_validation_condition=>'P31_TPO_ORGN'
,p_validation_condition2=>'I'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(32908675685309817)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(32909811887309829)
,p_validation_name=>'Valida Origen'
,p_validation_sequence=>30
,p_validation=>'P31_ORGEN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# se encuentra vaci\00F3, por favor verifique.')
,p_validation_condition=>'P31_TPO_ORGN'
,p_validation_condition2=>'I'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(33028022677809920)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33031174078809924)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33031007978809924)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33031907351809926)
,p_event_id=>wwv_flow_api.id(33031174078809924)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32908778901309818)
,p_name=>'Al cambiar tipo de origen'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P31_TPO_ORGN'
,p_condition_element=>'P31_TPO_ORGN'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'I'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32908857808309819)
,p_event_id=>wwv_flow_api.id(32908778901309818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P31_ITEM_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32909145386309822)
,p_event_id=>wwv_flow_api.id(32908778901309818)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P31_ITEM_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32908950784309820)
,p_event_id=>wwv_flow_api.id(32908778901309818)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P31_ITEM_NAME,P31_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32909277641309823)
,p_event_id=>wwv_flow_api.id(32908778901309818)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P31_ORGEN,P31_ITEM_NAME'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32909074164309821)
,p_event_id=>wwv_flow_api.id(32908778901309818)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P31_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32909370603309824)
,p_event_id=>wwv_flow_api.id(32908778901309818)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P31_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32909553852309826)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesamiento DML'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    case :REQUEST',
'        when ''BTN_ELIMINAR'' then',
'            delete from gj_d_tareas_item',
'            where id_trea_item = :P31_ID_TREA_ITEM;',
'        when ''BTN_GUARDAR'' then',
'            update gj_d_tareas_item',
'            set ID_TREA = :P31_ID_TREA,',
'                DSCRPCION = :P31_DSCRPCION,',
'                TPO_ORGN = :P31_TPO_ORGN,',
'                ORGEN = case when :P31_TPO_ORGN != ''I'' then :P31_ORGEN else :P31_ITEM_NAME end,',
'                ACTVO = :P31_ACTVO',
'            where id_trea_item = :P31_ID_TREA_ITEM;',
'        when ''BTN_INSERTAR'' then',
'            insert into gj_d_tareas_item(',
'                id_trea,',
'                dscrpcion,',
'                tpo_orgn,',
'                orgen,',
'                actvo',
'            )values(',
'                :P31_ID_TREA,',
'                :P31_DSCRPCION,',
'                :P31_TPO_ORGN,',
'                case when :P31_TPO_ORGN != ''I'' then :P31_ORGEN else :P31_ITEM_NAME end,',
'                :P31_ACTVO',
'            ) returning id_trea_item into :P31_ID_TREA_ITEM;    ',
'    else',
'        null;',
'    end case;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_ELIMINAR,BTN_GUARDAR,BTN_INSERTAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32908505363309816)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>unistr('Recuperaci\00F3n Autom\00E1tica de Filas')
,p_attribute_02=>'GJ_D_TAREAS_ITEM'
,p_attribute_03=>'P31_ID_TREA_ITEM'
,p_attribute_04=>'ID_TREA_ITEM'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P31_ID_TREA_ITEM'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
