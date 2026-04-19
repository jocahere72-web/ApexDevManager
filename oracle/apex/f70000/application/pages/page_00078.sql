prompt --application/pages/page_00078
begin
wwv_flow_api.create_page(
 p_id=>78
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Propiedades Fecha de Presentaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Fecha de Presentaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function definirItemRequerido (nombreItem) {',
'    let item = $("#" + nombreItem);',
'    item.prop("required",true);',
'    item.closest(".t-Form-fieldContainer").addClass("is-required");',
'}',
'',
'function definirItemNoRequerido (nombreItem) {',
'    let item = $("#" + nombreItem);',
'    item.prop("required",false);',
'    item.closest(".t-Form-fieldContainer").removeClass("is-required");',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210715094317'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18678908920427114)
,p_plug_name=>'Propiedades'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18679824002427123)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(18678908920427114)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P78_ID_DCLRCION_FCHA_PRSNTCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18680031852427125)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18678908920427114)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18679733136427122)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(18678908920427114)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P78_ID_DCLRCION_FCHA_PRSNTCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18679969971427124)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(18678908920427114)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P78_ID_DCLRCION_FCHA_PRSNTCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18679028643427115)
,p_name=>'P78_ID_DCLRCION_FCHA_PRSNTCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCLRCION_FCHA_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Muestra el tipo de declaraci\00F3n ')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18679120839427116)
,p_name=>'P78_ID_DCLRCION_TPO_VGNCIA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo'
,p_source=>'ID_DCLRCION_TPO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.vgncia || '' - '' || b.prdo || '' - '' || b.dscrpcion,',
'            a.id_dclrcion_tpo_vgncia',
'from        gi_d_dclrcnes_tpos_vgncias  a',
'inner join  df_i_periodos               b   on  b.id_prdo   =   a.id_prdo',
'where       a.id_dclrcion_tpo_vgncia    =   :P78_ID_DCLRCION_TPO_VGNCIA;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18679202307427117)
,p_name=>'P78_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingresela descripci\00F3n correspondiente al tipo de declaraci\00F3n seleccionada.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18679431339427119)
,p_name=>'P78_FCHA_FNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la fecha l\00EDmite de presentaci\00F3n de declaraci\00F3n. formato dd/mm/YYYY.')
,p_attribute_02=>'&P78_FCHA_INCIAL.'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18679580120427120)
,p_name=>'P78_VLOR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor'
,p_source=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Campo que permite adicionar una caracterizaci\00F3n a la presentaci\00F3n de la declaraci\00F3n.'),
'Ejemplo:',
'<ol>',
unistr('    <li>\00DAltimo d\00EDgito de identificaci\00F3n</li>'),
'</ol>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18679689818427121)
,p_name=>'P78_ACTVO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar el tipo de declaraci\00F3n y "No" para desactivarlo.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18681499540427139)
,p_name=>'P78_ID_DCLRCN_TPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_prompt=>unistr('Tipo de Declaraci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcn_tpo',
'from    gi_d_declaraciones_tipo a',
'where   a.id_dclrcn_tpo =   :P78_ID_DCLRCN_TPO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50785343065565902)
,p_name=>'P78_ID_SJTO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Sujeto'
,p_source=>'ID_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_sjto_tpo,',
'            a.id_sjto_tpo',
'from        df_i_sujetos_tipo           a',
'inner join  gi_d_declaraciones_tipo     b   on  b.id_impsto     =   a.id_impsto',
'inner join  gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcn_tpo =   b.id_dclrcn_tpo',
'where       c.id_dclrcion_tpo_vgncia    =   :P78_ID_DCLRCION_TPO_VGNCIA;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P78_ID_DCLRCION_TPO_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76579372969946911)
,p_name=>'P78_CDGO_TPO_FCHA_PRSNTCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(18678908920427114)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Limite Presentaci\00F3n')
,p_source=>'CDGO_TPO_FCHA_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_tpo_fcha_prsntcion',
'from    gi_d_dclrcns_tps_fch_prstcn a',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18681367594427138)
,p_validation_name=>unistr('Validar fecha de presentaci\00F3n')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gi_d_dclrcnes_tpos_vgncias  a',
'inner join  gi_d_dclrcnes_fcha_prsntcn  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'where       a.id_dclrcion_tpo_vgncia    =   :P78_ID_DCLRCION_TPO_VGNCIA',
'and         1                           =   case when (:P78_FCHA_INCIAL is null and b.fcha_incial is null) or',
'                                                      (:P78_FCHA_INCIAL is not null and :P78_FCHA_INCIAL = b.fcha_incial) then 1',
'                                            else 0',
'                                            end',
'and         b.fcha_fnal                 =   :P78_FCHA_FNAL',
'and         b.vlor                      =   :P78_VLOR',
'and         b.id_dclrcion_fcha_prsntcion<>   nvl(:P78_ID_DCLRCION_FCHA_PRSNTCION, 0);'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Ya existen fechas de presentaci\00F3n con las caracter\00EDsticas dadas.')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18680159835427126)
,p_name=>'Cerrar Ventana'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(18680031852427125)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18680277564427127)
,p_event_id=>wwv_flow_api.id(18680159835427126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76579971833946917)
,p_name=>unistr('Gesti\00F3n Calendario Tributario')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P78_CDGO_TPO_FCHA_PRSNTCION'
,p_condition_element=>'P78_CDGO_TPO_FCHA_PRSNTCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76580028387946918)
,p_event_id=>wwv_flow_api.id(76579971833946917)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P78_FCHA_FNAL,P78_ID_SJTO_TPO,P78_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76581508806946933)
,p_event_id=>wwv_flow_api.id(76579971833946917)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'definirItemNoRequerido("P78_FCHA_FNAL");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76580756373946925)
,p_event_id=>wwv_flow_api.id(76579971833946917)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P78_FCHA_FNAL,P78_ID_SJTO_TPO,P78_VLOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76581410262946932)
,p_event_id=>wwv_flow_api.id(76579971833946917)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'definirItemRequerido("P78_FCHA_FNAL");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76580161168946919)
,p_event_id=>wwv_flow_api.id(76579971833946917)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P78_FCHA_FNAL,P78_ID_SJTO_TPO,P78_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76581069422946928)
,p_name=>unistr('Gesti\00F3n Tipo D\00EDa')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P78_CDGO_UNDAD_TMPO'
,p_condition_element=>'P78_CDGO_UNDAD_TMPO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'DI'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76581102651946929)
,p_event_id=>wwv_flow_api.id(76581069422946928)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P78_DIA_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76581924113946937)
,p_event_id=>wwv_flow_api.id(76581069422946928)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'definirItemRequerido("P78_DIA_TPO");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76581325390946931)
,p_event_id=>wwv_flow_api.id(76581069422946928)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P78_DIA_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76581220351946930)
,p_event_id=>wwv_flow_api.id(76581069422946928)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P78_DIA_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76581801385946936)
,p_event_id=>wwv_flow_api.id(76581069422946928)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'definirItemNoRequerido("P78_DIA_TPO");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18680441825427129)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fecth gi_d_dclrcnes_fcha_prsntcn'
,p_attribute_02=>'GI_D_DCLRCNES_FCHA_PRSNTCN'
,p_attribute_03=>'P78_ID_DCLRCION_FCHA_PRSNTCION'
,p_attribute_04=>'ID_DCLRCION_FCHA_PRSNTCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P78_ID_DCLRCION_FCHA_PRSNTCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18680581469427130)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Gestionar gi_d_dclrcnes_fcha_prsntcn'
,p_attribute_02=>'GI_D_DCLRCNES_FCHA_PRSNTCN'
,p_attribute_03=>'P78_ID_DCLRCION_FCHA_PRSNTCION'
,p_attribute_04=>'ID_DCLRCION_FCHA_PRSNTCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18681195981427136)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Items de Pagina'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'78'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(18679969971427124)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18681257656427137)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Cuadro de Dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
