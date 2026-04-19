prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Lote'
,p_page_mode=>'MODAL'
,p_step_title=>'Lote'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#btn{',
'  border-radius: 5px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'33%'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101164901'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39509695939497383)
,p_plug_name=>'Pantalla Basada en NT_G_LOTE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30318497486578280)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39510374335497384)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30319425954578280)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39510787172497384)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(39510374335497384)
,p_button_name=>'CANCEL'
,p_button_static_id=>'btn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39510232698497384)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(39510374335497384)
,p_button_name=>'DELETE'
,p_button_static_id=>'btn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(30392085768578313)
,p_button_image_alt=>'Suprimir'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P14_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39510118647497384)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(39510374335497384)
,p_button_name=>'SAVE'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39510071169497384)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(39510374335497384)
,p_button_name=>'CREATE'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39513169764497387)
,p_name=>'P14_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rowid'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(30391508947578312)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39513553390497401)
,p_name=>'P14_ID_LTE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Lte'
,p_source=>'ID_LTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(30391853713578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39513934320497403)
,p_name=>'P14_CDGO_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39514305191497404)
,p_name=>'P14_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n del Lote')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>5
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#:margin-left-sm:margin-right-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39514783485497404)
,p_name=>'P14_FCHA_GNRCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'FCHA_GNRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39515954424497405)
,p_name=>'P14_ID_FNCNRIO_GNRCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_ID_FNCNRIO.'
,p_source=>'ID_FNCNRIO_GNRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39516359125497406)
,p_name=>'P14_NMRO_RGSTROS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source=>'NMRO_RGSTROS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40298334452113608)
,p_name=>'P14_ID_MDIO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_prompt=>unistr('Medio de Notificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_MEDIOS_NO_MASIVO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select CDGO_MDIO||'' - ''||DSCRPCION d, ID_MDIO r',
'From nt_d_medio',
'where indcdor_msvo = ''S''',
'order by 2'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#:margin-left-sm:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40298509598113610)
,p_name=>'P14_ID_ENTDAD_CLNTE_MDIO'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Entidad'
,p_source=>'ID_ENTDAD_CLNTE_MDIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_entdad d, id_entdad_clnte_mdio r',
'from v_nt_d_ntfccion_mdio_entdd',
'where cdgo_clnte    = :F_CDGO_CLNTE and',
'      id_mdio       = :P14_ID_MDIO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P14_ID_MDIO'
,p_ajax_items_to_submit=>'P14_ID_ENTDAD_CLNTE_MDIO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#:margin-left-sm:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52872502632352201)
,p_name=>'P14_ID_ACTO_TPO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(39509695939497383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Acto'
,p_source=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ACTO_TIPOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_tpo||'' - ''||dscrpcion d , id_acto_tpo r ',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      indcdor_ntfccion = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-left-sm:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52876309436352239)
,p_validation_name=>'Valida si tipo de acto es vacio'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_mdio varchar2(3);',
'begin',
'    select cdgo_mdio',
'    into v_cdgo_mdio',
'    from nt_d_medio',
'    where id_mdio = :P14_ID_MDIO;',
'    if(v_cdgo_mdio = ''EDT'' and :P14_ID_ACTO_TPO is null)then',
'        return ''Campo Tipo de Acto Vacio.'';',
'    end if;',
'    return null;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(52872502632352201)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39510812338497384)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39510787172497384)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39511662299497385)
,p_event_id=>wwv_flow_api.id(39510812338497384)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39521732018497409)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from NT_G_LOTE'
,p_attribute_02=>'NT_G_LOTE'
,p_attribute_03=>'P14_ROWID'
,p_attribute_04=>'ROWID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39522157000497410)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of NT_G_LOTE'
,p_attribute_02=>'NT_G_LOTE'
,p_attribute_03=>'P14_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39522526870497410)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(39510232698497384)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39522964737497410)
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
