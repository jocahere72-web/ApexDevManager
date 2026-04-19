prompt --application/pages/page_00278
begin
wwv_flow_api.create_page(
 p_id=>278
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Reversar Prescripci\00F3n')
,p_step_title=>unistr('Reversar Prescripci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20230629182518'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(132431348620215506)
,p_plug_name=>unistr('Reversi\00F3n de Prescripciones')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(132431989300215512)
,p_plug_name=>unistr('Informaci\00F3n de la Reversi\00F3n Realizada')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(132431500485215508)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(132431348620215506)
,p_button_name=>'P278_BTN_PRCSR_RVRSION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Solicitud'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-terminal'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(132431439738215507)
,p_name=>'P278_NMRO_RDCO_SLCTUD'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(132431348620215506)
,p_prompt=>unistr('N\00FAmero de Radicado de la PQR')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(132431882708215511)
,p_name=>'P278_RSPSTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(132431989300215512)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(132431618860215509)
,p_name=>unistr('Al procesar el n\00FAmero de la solicitud')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(132431500485215508)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(132431789135215510)
,p_event_id=>wwv_flow_api.id(132431618860215509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  -- Call the procedure',
'  reversar_prescripcion(v_message           => :P278_RSPSTA,',
'                        v_nmro_rdcdo_dsplay => :P278_NMRO_RDCO_SLCTUD);',
'end;'))
,p_attribute_02=>'P278_NMRO_RDCO_SLCTUD'
,p_attribute_03=>'P278_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
