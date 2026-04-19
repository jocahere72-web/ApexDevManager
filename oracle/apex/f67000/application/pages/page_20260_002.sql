prompt --application/pages/page_20260_002
begin
wwv_flow_api.create_page(
 p_id=>2026002
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>unistr('Configuraci\00F3n Acci\00F3n - Evento')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Configuraci\00F3n Acci\00F3n - Evento')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_protection_level=>'C'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20260128085048'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35592177102436138)
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
 p_id=>wwv_flow_api.id(35927442061106027)
,p_plug_name=>'Pantalla Basada en DF_C_PROCESOS_ACCION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71602665844187947)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31346368816564088)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(35592177102436138)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31346734518564088)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(35592177102436138)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''BTN_ELIMINAR'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P2026002_ID_PRCSO_ACCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31347151990564087)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(35592177102436138)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P2026002_ID_PRCSO_ACCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31347523757564087)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(35592177102436138)
,p_button_name=>'BTN_CREAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P2026002_ID_PRCSO_ACCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16953834222030116)
,p_name=>'P2026002_ID_EVNTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Evento'
,p_source=>'ID_EVNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_evnto',
'from df_c_eventos',
'where actvo = ''S'''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16953976509030117)
,p_name=>'P2026002_ID_ACCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Acci\00F3n')
,p_source=>'ID_ACCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_accion',
'from df_c_acciones',
'where actvo = ''S'''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16954033914030118)
,p_name=>'P2026002_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        b.id_impsto r',
'  from   df_c_impuestos b  ',
'where  b.cdgo_clnte = :F_CDGO_CLNTE ',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16954176602030119)
,p_name=>'P2026002_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributos'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto,',
'        id_impsto_sbmpsto',
'   from df_i_impuestos_subimpuesto',
'   where id_impsto = :P2026002_ID_IMPSTO',
'order by 1'))
,p_lov_cascade_parent_items=>'P2026002_ID_IMPSTO'
,p_ajax_items_to_submit=>'P2026002_ID_IMPSTO,P2026002_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31348231361564086)
,p_name=>'P2026002_ID_PRCSO_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRCSO_ACCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31348610090564085)
,p_name=>'P2026002_CDGO_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31349041881564085)
,p_name=>'P2026002_CDGO_PRCSO_ACCION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo Proceso Acci\00F3n')
,p_source=>'CDGO_PRCSO_ACCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" '
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31349413198564085)
,p_name=>'P2026002_CDGO_PRCSO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proceso'
,p_source=>'CDGO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:RECAUDO;RE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31349889315564084)
,p_name=>'P2026002_UNDAD_PRGRMA'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Unidad de Programa'
,p_source=>'UNDAD_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name   d,  ',
'	   object_name r',
'from user_arguments ',
'where package_name = ''PKG_GN_ACCIONES_DINAMICAS''',
'and argument_name is not null',
'group by object_name,overload',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31350616601564084)
,p_name=>'P2026002_ACTVO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(35927442061106027)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31364307824564059)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_C_PROCESOS_ACCION'
,p_attribute_02=>'DF_C_PROCESOS_ACCION'
,p_attribute_03=>'P2026002_ID_PRCSO_ACCION'
,p_attribute_04=>'ID_PRCSO_ACCION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31364751055564059)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Procesamiento Automatico Procesos Accion'
,p_attribute_02=>'DF_C_PROCESOS_ACCION'
,p_attribute_03=>'P2026002_ID_PRCSO_ACCION'
,p_attribute_04=>'ID_PRCSO_ACCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_ELIMINAR,BTN_GUARDAR,BTN_CREAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31363983164564059)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_ELIMINAR,BTN_CANCELAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
