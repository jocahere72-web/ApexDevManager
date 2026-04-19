prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Propiedades Regi\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Declaraciones Propiedades Regi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'55%'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20191213154028'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(206711703813638604)
,p_plug_name=>unistr('Propiedades Regi\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13519126677694002)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(206711703813638604)
,p_button_name=>'BTN_VLDCNES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Ver Validaciones'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP,41:P41_ID_FRMLRIO,P41_ID_FRMLRIO_RGION:&P24_R_ID_FRMLRIO.,&P24_R_ID_RGION.'
,p_button_condition=>'P24_R_ID_RGION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13519447844694005)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(206711703813638604)
,p_button_name=>'BTN_CNDCNES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Ver Condiciones'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_FRMLRIO,P84_ID_FRMLRIO_RGION:&P24_R_ID_FRMLRIO.,&P24_R_ID_RGION.'
,p_button_condition=>'P24_R_ID_RGION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103527957668594603)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(206711703813638604)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P24_R_ID_RGION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103701930477605807)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(206711703813638604)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103528377653594605)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(206711703813638604)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition=>'P24_R_ID_RGION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103528785960594605)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(206711703813638604)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P24_R_ID_RGION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(103510673011476114)
,p_branch_name=>'Ir a la pagina 26'
,p_branch_action=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_NODO_SELECCIONADO:&P24_NODO_SELECCIONADO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11359448108106605)
,p_name=>'P24_R_NMRO_FLA_MIN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('M\00EDnimo Filas Diligenciadas')
,p_source=>'NMRO_FLA_MIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de filas m\00EDnimo que contendr\00E1 la cuadr\00EDcula interactiva.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11359922284106610)
,p_name=>'P24_R_NMRO_FLA_MAX'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('M\00E1ximo de Filas Adicionadas')
,p_source=>'NMRO_FLA_MAX'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de filas m\00E1ximo que contendr\00E1 la cuadr\00EDcula interactiva.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103510035750476108)
,p_name=>'P24_NODO_SELECCIONADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103529115452594610)
,p_name=>'P24_R_ID_RGION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103529537903594612)
,p_name=>'P24_R_ID_FRMLRIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario'
,p_source=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion,',
'            a.id_frmlrio',
'from        gi_d_formularios    a',
'where       a.cdgo_clnte    =   :F_CDGO_CLNTE',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el formulario para ingresar las propiedades de la regi\00F3n de declaraci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103529954710594613)
,p_name=>'P24_R_ID_RGION_PDRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Regi\00F3n Padre')
,p_source=>'ID_FRMLRIO_RGION_PDRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion,',
'            a.id_frmlrio_rgion',
'from        gi_d_formularios_region a',
'where       a.id_frmlrio    =   :P24_R_ID_FRMLRIO',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P24_R_ID_FRMLRIO'
,p_ajax_items_to_submit=>'P24_R_ID_RGION_PDRE'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la regi\00F3n padre a la que pertenece la nueva regi\00F3n. Opcional.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103530393992594613)
,p_name=>'P24_R_CDGO_RGION_TPO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de Regi\00F3n')
,p_source=>'CDGO_RGION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion,',
'            a.cdgo_rgion_tpo',
'from        gi_d_regiones_tipo      a',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de regi\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103530708012594613)
,p_name=>'P24_R_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>1000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la descripci\00F3n de las propiedades de la regi\00F3n.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103531193940594617)
,p_name=>'P24_R_INDCDOR_INCIA_NVA_FLA'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFNueva Fila?')
,p_source=>'INDCDOR_INCIA_NVA_FLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para que la propiedad de la regi\00F3n de declaraci\00F3n inicie en una fila nueva y "No" para que contin\00FAe en la misma fila.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103531572711594617)
,p_name=>'P24_R_NMRO_CLMNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero de Columna')
,p_source=>'NMRO_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'STATIC:12;12,',
'       11;11,',
'       10;10,',
'       09;9,',
'       08;8,',
'       07;7,',
'       06;6,',
'       05;5,',
'       04;4,',
'       03;3,',
'       02;2,',
'       01;1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el n\00FAmero de la columna en la que se posicionar\00E1 la propiedad de la declaraci\00F3n.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103531924671594617)
,p_name=>'P24_R_AMPLCION_CLMNA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Ampliaci\00F3n Columna')
,p_source=>'AMPLCION_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'STATIC:12;12,',
'       11;11,',
'       10;10,',
'       09;9,',
'       08;8,',
'       07;7,',
'       06;6,',
'       05;5,',
'       04;4,',
'       03;3,',
'       02;2,',
'       01;1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el n\00FAmero de la columna que ocupar\00E1 la propiedad de la declaraci\00F3n.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103532367182594618)
,p_name=>'P24_R_INDCDOR_EDTBLE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFEditable?')
,p_source=>'INDCDOR_EDTBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para que la propiedad sea editable por el usuario y "No" para que la propiedad No sea editable.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103532722045594618)
,p_name=>'P24_R_ORDEN'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el orden en el que se visualizar\00E1 la regi\00F3n dentro del formulario')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103533180283594618)
,p_name=>'P24_R_ACTVO'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(206711703813638604)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar la propiedad en la regi\00F3n y "No" para desactivarla.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(103510140965476109)
,p_computation_sequence=>10
,p_computation_item=>'P24_R_ID_RGION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'regexp_substr(:P24_NODO_SELECCIONADO, ''[0-9][0-9]*'')'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103702083489605808)
,p_name=>'Cancelar Ventana'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103701930477605807)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103702115299605809)
,p_event_id=>wwv_flow_api.id(103702083489605808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11359538302106606)
,p_name=>'Mostrar '
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_R_CDGO_RGION_TPO'
,p_condition_element=>'P24_R_CDGO_RGION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11359626069106607)
,p_event_id=>wwv_flow_api.id(11359538302106606)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_R_NMRO_FLA_MIN,P24_R_NMRO_FLA_MAX'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11359776568106608)
,p_event_id=>wwv_flow_api.id(11359538302106606)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_R_NMRO_FLA_MIN,P24_R_NMRO_FLA_MAX'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103510577617476113)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>unistr('Procesamiento Autom\00E1tico gi_d_regiones')
,p_attribute_02=>'GI_D_FORMULARIOS_REGION'
,p_attribute_03=>'P24_R_ID_RGION'
,p_attribute_04=>'ID_FRMLRIO_RGION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con \00C9xito')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103510257277476110)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from gi_d_regiones'
,p_attribute_02=>'GI_D_FORMULARIOS_REGION'
,p_attribute_03=>'P24_R_ID_RGION'
,p_attribute_04=>'ID_FRMLRIO_RGION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P24_R_ID_RGION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
