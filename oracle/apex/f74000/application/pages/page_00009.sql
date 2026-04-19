prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Creaci\00F3n de Lote')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Creaci\00F3n de Lote')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P9_OBSRVCION{',
'  resize:none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_width=>'80%'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240622170651'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39994420580137804)
,p_plug_name=>'Lote'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40046006227529412)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(39994420580137804)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40045913570529411)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(39994420580137804)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(40046773296529419)
,p_branch_name=>'Ir a Pagina 8'
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_d_subprogramas ',
'where id_sbprgrma = :P9_ID_SBPRGRMA',
'and cdgo_sbprgrma != ''ODE''',
'and actvo = ''S'';'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(147625109509761501)
,p_branch_name=>'Ir a Pagina 62'
,p_branch_action=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_d_subprogramas ',
'where id_sbprgrma = :P9_ID_SBPRGRMA',
'and cdgo_sbprgrma = ''ODE''',
'and actvo = ''S'';'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14547657025847501)
,p_name=>'P9_TIPO_PROGRAMA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29739626130370505)
,p_name=>'P9_INDCDOR_FSCLZCION_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_source=>'INDCDOR_FSCLZCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39994561884137805)
,p_name=>'P9_ID_PRGRMA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Programa'
,p_source=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PROGRAMAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39994621245137806)
,p_name=>'P9_ID_SBPRGRMA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_prompt=>'SubPrograma'
,p_source=>'ID_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_sbprgrma as d,',
'       id_sbprgrma    as r',
'from fi_d_subprogramas ',
'where id_prgrma = :P9_ID_PRGRMA',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P9_ID_PRGRMA'
,p_ajax_items_to_submit=>'P9_ID_SBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39994723663137807)
,p_name=>'P9_OBSRVCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>1000
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40046439206529416)
,p_name=>'P9_CDGO_CLNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40046548095529417)
,p_name=>'P9_ID_USRIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_ID_FNCNRIO.'
,p_source=>'ID_FNCNRIO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47465534033509606)
,p_name=>'P9_INDCDOR_PRCSDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_source=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67844695836950501)
,p_name=>'P9_TRBTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147201702271229401)
,p_name=>'P9_ID_FUENTE_ORIGEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(39994420580137804)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fuente Origen'
,p_source=>'ID_FUENTE_TIPO_BASE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_fuente as d,',
'       id_fuente_tipo_base    as r',
'from fi_d_fuente_tpo_bse_sancion ',
'where id_prgrma = 3',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P9_ID_PRGRMA'
,p_ajax_items_to_submit=>'P9_ID_SBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(147832018566565101)
,p_name=>'habilitar fuente origen'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_PRGRMA'
,p_condition_element=>'P9_ID_PRGRMA'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'from fi_d_programas ',
'where id_prgrma = :P9_ID_PRGRMA',
'AND cdgo_prgrma = ''O'';'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(147832103160565102)
,p_event_id=>wwv_flow_api.id(147832018566565101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ID_FUENTE_ORIGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(147832395181565104)
,p_event_id=>wwv_flow_api.id(147832018566565101)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ID_FUENTE_ORIGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14553677579968102)
,p_name=>'Ocultar si es omisos desconocido'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_FUENTE_ORIGEN'
,p_condition_element=>'P9_TIPO_PROGRAMA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'62'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14553744945968103)
,p_event_id=>wwv_flow_api.id(14553677579968102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ID_FUENTE_ORIGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29740239739370511)
,p_name=>unistr('Tipo de fiscalizaci\00F3n')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_PRGRMA'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctselect'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29740355963370512)
,p_event_id=>wwv_flow_api.id(29740239739370511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P9_ID_SBPRGRMA,P9_TIPO_SUBPROGRAMA'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29740418928370513)
,p_event_id=>wwv_flow_api.id(29740239739370511)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_INDCDOR_FSCLZCION_TPO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case a.cdgo_prgrma',
'         when ''OLQ'' then',
'          ''LQ''',
'         else',
'          ''DC''',
'       end tpo_fiscalizacion',
'  from fi_d_programas a',
' where a.id_prgrma = :P9_ID_PRGRMA;'))
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29740507023370514)
,p_name=>'Al cambiar P9_INDCDOR_FSCLZCION_TPO'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_INDCDOR_FSCLZCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29740655908370515)
,p_event_id=>wwv_flow_api.id(29740507023370514)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P9_INDCDOR_FSCLZCION_TPO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40046329372529415)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Automatic Row Processing'
,p_attribute_02=>'FI_G_FISCALIZACION_LOTE'
,p_attribute_03=>'FI_G_FSCLZCION_LOTE'
,p_attribute_04=>'ID_FSCLZCION_LTE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('\00A1Proceso realizado exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40046646002529418)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(40046006227529412)
);
end;
/
