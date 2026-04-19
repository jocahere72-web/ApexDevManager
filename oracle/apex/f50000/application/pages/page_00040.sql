prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Operaci\00F3n sobre la fecha')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Operaci\00F3n sobre la fecha')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29525011823068496)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139661365002107017)
,p_plug_name=>'Wizard Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_api.id(139660734488106995)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(29602689997068536)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139661456078107017)
,p_plug_name=>unistr('Operaci\00F3n sobre la fecha')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139661501056107017)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(139663815467107022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(139661501056107017)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(29604648415068538)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(139664145668107022)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(139661501056107017)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(139665845725107026)
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(139664145668107022)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139286789215139117)
,p_name=>'P40_LABORAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139661456078107017)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139663148025107021)
,p_name=>'P40_OPERACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139661456078107017)
,p_prompt=>'New'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Marcar como festivo'' opcion, 1 ',
'  from dual',
'union',
unistr('select decode(:P40_LABORAL,''N'',''Marcar como d\00EDa h\00E1bil'', ''S'',''Marcar como d\00EDa no h\00E1bil'') opcion, 2 '),
'  from dual',
';'))
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139663553478107022)
,p_name=>'P40_FECHA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139661456078107017)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(139664234090107022)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(139663815467107022)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(139665056872107025)
,p_event_id=>wwv_flow_api.id(139664234090107022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(139286830793139118)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_lboral',
'  into:P40_LABORAL',
'  from df_c_calendario_general',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and trunc(fcha) = to_date(:P40_FECHA,''dd/mm/yyyy'')',
'  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
