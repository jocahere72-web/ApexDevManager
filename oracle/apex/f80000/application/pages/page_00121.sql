prompt --application/pages/page_00121
begin
wwv_flow_api.create_page(
 p_id=>121
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Entidades de Solicitud de Desembargo - Gestion'
,p_page_mode=>'MODAL'
,p_step_title=>'Entidades de Solicitud de Desembargo - Gestion'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200326160026'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24991190741323626)
,p_plug_name=>'Crear Pantalla'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'MC_G_DSMBRGS_SLCTD_ENTDDS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24997093046323645)
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
 p_id=>wwv_flow_api.id(12588373250054237)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24997093046323645)
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
 p_id=>wwv_flow_api.id(12588707019054238)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(24997093046323645)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P121_ID_DSMBRGO_SLCTUD_ENTDDES'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12589136740054239)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(24997093046323645)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P121_ID_DSMBRGO_SLCTUD_ENTDDES'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12589585372054239)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(24997093046323645)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P121_ID_DSMBRGO_SLCTUD_ENTDDES'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12593900635054311)
,p_branch_name=>unistr('Ir a P\00E1gina 74')
,p_branch_action=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12584590067054195)
,p_name=>'P121_ID_DSMBRGO_SLCTUD_ENTDDES'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(24991190741323626)
,p_item_source_plug_id=>wwv_flow_api.id(24991190741323626)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Dsmbrgo Slctud Entddes'
,p_source=>'ID_DSMBRGO_SLCTUD_ENTDDES'
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
 p_id=>wwv_flow_api.id(12584972939054226)
,p_name=>'P121_ID_DSMBRGO_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(24991190741323626)
,p_item_source_plug_id=>wwv_flow_api.id(24991190741323626)
,p_source=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12585209670054226)
,p_name=>'P121_ID_EMBRGOS_RSLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(24991190741323626)
,p_item_source_plug_id=>wwv_flow_api.id(24991190741323626)
,p_source=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12585613588054226)
,p_name=>'P121_ID_SLCTD_OFCIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(24991190741323626)
,p_item_source_plug_id=>wwv_flow_api.id(24991190741323626)
,p_prompt=>'Oficio de Embargo'
,p_source=>'ID_SLCTD_OFCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto_ofcio||'' ''||trunc(a.fcha_ofcio) ||''-''||a.dscrpcion,a.id_slctd_ofcio',
'  from v_mc_g_solicitudes_y_oficios a',
' where a.id_embrgos_rslcion = :P121_ID_EMBRGOS_RSLCION',
'   and a.nmro_acto_ofcio is not null',
'   and (not exists (select 1',
'                     from mc_g_dsmbrgs_slctd_entdds b',
'                    where b.id_slctd_ofcio = a.id_slctd_ofcio',
'                      and b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                      and b.id_entddes = a.id_entddes)',
'     or exists(select 1',
'                     from mc_g_dsmbrgs_slctd_entdds c',
'                    where c.id_slctd_ofcio = a.id_slctd_ofcio',
'                      and c.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                      and c.id_entddes = a.id_entddes',
'                      and c.ID_DSMBRGO_SLCTUD_ENTDDEs = :P121_ID_DSMBRGO_SLCTUD_ENTDDES));'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P121_ID_EMBRGOS_RSLCION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Oficio de embargo asociado a la resoluci\00F3n de embargo seleccionada para la solicitud de desembargo.')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12586096782054227)
,p_name=>'P121_ID_ENTDDES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(24991190741323626)
,p_item_source_plug_id=>wwv_flow_api.id(24991190741323626)
,p_source=>'ID_ENTDDES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12586427925054227)
,p_name=>'P121_BLOB_SLCTUD'
,p_source_data_type=>'BLOB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(24991190741323626)
,p_item_source_plug_id=>wwv_flow_api.id(24991190741323626)
,p_prompt=>'Archivo de Evidencia de Solicitud'
,p_source=>'BLOB_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>'Archivo de evidencia del porque se esta solicitando el desembargo de este oficio en especifico.'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'MIME_TYPE_SLCTUD'
,p_attribute_03=>'FILENAME_SLCTUD'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12592501953054307)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(12588373250054237)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12593046886054310)
,p_event_id=>wwv_flow_api.id(12592501953054307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12591787290054306)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valor entidad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_entddes',
'  into :P121_ID_ENTDDES',
'  from mc_g_solicitudes_y_oficios a',
'  where a.id_slctd_ofcio = :P121_ID_SLCTD_OFCIO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12587615019054235)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(24991190741323626)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Crear Pantalla'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12592110698054307)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12587291867054229)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(24991190741323626)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Crear Pantalla'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
