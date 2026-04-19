prompt --application/pages/page_00120
begin
wwv_flow_api.create_page(
 p_id=>120
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Solicitud desembargo gestion'
,p_page_mode=>'MODAL'
,p_step_title=>'Solicitud desembargo gestion'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220201171205'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24648594538165351)
,p_plug_name=>'Crear Pantalla'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'MC_G_DESEMBARGOS_SOLICITUD'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24654508083165364)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17336422472919364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12497857262139934)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24654508083165364)
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
 p_id=>wwv_flow_api.id(12498261051139936)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(24654508083165364)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P120_ID_DSMBRGO_SLCTUD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12498631934139937)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(24654508083165364)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P120_ID_DSMBRGO_SLCTUD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12499004439139937)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(24654508083165364)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P120_ID_DSMBRGO_SLCTUD'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12502926801139943)
,p_branch_name=>unistr('Ir a P\00E1gina 74')
,p_branch_action=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12493119204139920)
,p_name=>'P120_ID_DSMBRGO_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Dsmbrgo Slctud'
,p_source=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12493549419139923)
,p_name=>'P120_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_default=>':F_CDGO_CLNTE '
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12493952662139923)
,p_name=>'P120_ESTADO_SLCTUD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_default=>'S'
,p_prompt=>'Estado de Solicitud'
,p_source=>'ESTADO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Solicitado;S,Rechazado;R,Aprobado;A'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12494304121139924)
,p_name=>'P120_ID_EMBRGOS_RSLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_source=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto||'' - ''||a.fcha_acto||'' - ''||a.dscrpcion_tipo_embargo||'' - ''||a.idntfccion||'' - ''||a.vgncias,a.id_embrgos_rslcion',
'from v_mc_g_embargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and exists (select 1',
'              from mc_g_embrgs_rslcion_rspnsbl b',
'              join mc_g_embargos_responsable c on c.id_embrgos_rspnsble = b.id_embrgos_rspnsble',
'             where b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'               and (:P120_IDNTFCCION_RSPNSBLE is null or trim(c.idntfccion) = trim(:P120_IDNTFCCION_RSPNSBLE)))'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when=>'P120_ID_EMBRGOS_RSLCION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12494787291139924)
,p_name=>'P120_ID_CSLES_DSMBRGO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_prompt=>'Causales de Desembargo'
,p_source=>'ID_CSLES_DSMBRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'  from mc_d_causales_desembargo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and (slctud_fncnrio = ''S'' or slctud_rspnsble = ''S'') '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12495112403139930)
,p_name=>'P120_TPO_SLCTUD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_default=>'FN'
,p_source=>'TPO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12495514728139930)
,p_name=>'P120_ID_FNCNRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id_fncnrio',
'  from v_sg_g_usuarios u',
' where u.id_usrio = :F_ID_USRIO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12495973712139931)
,p_name=>'P120_OBSRVCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_item_source_plug_id=>wwv_flow_api.id(24648594538165351)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12496369318139931)
,p_name=>'P120_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_use_cache_before_default=>'NO'
,p_source=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153910526155508903)
,p_name=>'P120_VLDA_PGNA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(24648594538165351)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12387257821040445)
,p_validation_name=>unistr('validar resoluci\00F3n al aprobar')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    if :P120_ESTADO_SLCTUD <> ''A'' and :P120_ID_EMBRGOS_RSLCION is null then',
'        return true;',
'    elsif :P120_ESTADO_SLCTUD = ''A'' and :P120_ID_EMBRGOS_RSLCION is not null then',
'        return true;',
'    elsif :P120_ESTADO_SLCTUD <> ''A'' and :P120_ID_EMBRGOS_RSLCION is not null then    ',
'        return true;',
'    elsif :P120_ESTADO_SLCTUD = ''A'' and :P120_ID_EMBRGOS_RSLCION is null then',
'        return false;',
'    end if;        ',
'        ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Debe asociar una resoluci\00F3n de embargo a la solicitud para poder aprobar la solicitud.')
,p_associated_item=>wwv_flow_api.id(12494304121139924)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12501916865139942)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(12497857262139934)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12502499284139942)
,p_event_id=>wwv_flow_api.id(12501916865139942)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153910788034508905)
,p_name=>'New'
,p_event_sequence=>20
,p_condition_element=>'P120_VLDA_PGNA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'120'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153910861424508906)
,p_event_id=>wwv_flow_api.id(153910788034508905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item( "P120_ID_CSLES_DSMBRGO" ).disable() ;'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12497129505139933)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(24648594538165351)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Crear Pantalla'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12501572182139939)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12496720605139931)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(24648594538165351)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Crear Pantalla'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
