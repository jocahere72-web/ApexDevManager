prompt --application/pages/page_00247
begin
wwv_flow_api.create_page(
 p_id=>247
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Formulario Propiedades Homologaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Formulario Propiedades Homologaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241203175406'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(157009228518429281)
,p_plug_name=>unistr('Propiedades Declaraci\00F3n Homologaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147967056961038919)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(157009228518429281)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:246:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147967469909038924)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(157009228518429281)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P247_ID_DCLRCION_HMLGCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(147970747353038961)
,p_branch_name=>'Go To Page 246'
,p_branch_action=>'f?p=&APP_ID.:246:&SESSION.:GuardarDetalle:&DEBUG.:246:P246_ID_DCLRCION_HMLGCION:&P247_ID_DCLRCION_HMLGCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(147967469909038924)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147967843105038926)
,p_name=>'P247_ID_DCLRCION_HMLGCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(157009228518429281)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147968213972038943)
,p_name=>'P247_ID_DCLRCN_VGNCIA_FRM_ORGN'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(157009228518429281)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario Origen'
,p_source=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_frmlrio ||'' - ''||a.dscrpcion as d, ',
'       a.id_frmlrio as r',
'  from gi_d_formularios a ',
' order by 1 '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147968635862038944)
,p_name=>'P247_ID_DCLRCN_VGNCIA_FRM_DSTN'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(157009228518429281)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario Destino'
,p_source=>'ID_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.alias    as,',
'       a.id      as r',
'from apex_190100.wwv_flow_steps a',
'where --a.flow_id = 150000 and ',
'upper(a.alias) like ''%DL_FRM%''',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147969039434038944)
,p_name=>'P247_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(157009228518429281)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147969443026038945)
,p_name=>'P247_INDCDOR_ACTVO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(157009228518429281)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'INDCDOR_ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(147969850361038959)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(147967056961038919)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(147970262864038960)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Guardar Datos en GI_D_FORMULARIO_HMLGCION'
,p_attribute_02=>'GI_D_FORMULARIO_HMLGCION'
,p_attribute_03=>'P247_ID_DCLRCION_HMLGCION'
,p_attribute_04=>'ID_FRMLRIO_HMLGCION'
,p_attribute_09=>'P247_ID_DCLRCION_HMLGCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'No se pudo crear el registro.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(147967469909038924)
,p_process_success_message=>'Registro creado Exitosamente.'
);
end;
/
