prompt --application/pages/page_00156
begin
wwv_flow_api.create_page(
 p_id=>156
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Plantilla Plusval\00EDa')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Plantilla Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'50%'
,p_dialog_chained=>'N'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(251518934428429413)
,p_plug_name=>unistr('Plantilla de Plusval\00EDa')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90870928434555133)
,p_name=>'P156_PLANTILLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(251518934428429413)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.width = ''120%'';',
'    opt.height = 400;',
'    opt.resize_enabled = false; ',
'    opt.readOnly = true;',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}',
''))
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90871277703555168)
,p_name=>'P156_BRANCH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(251518934428429413)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(90872095233555191)
,p_name=>'Al Cambiar Plantilla'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_ID_PLNTLLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90872529975555194)
,p_event_id=>wwv_flow_api.id(90872095233555191)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90871680150555187)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar P\00E1rrafo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_prrfos in (select prrfo',
'                      from gn_d_plantillas_parrafo',
'                    where id_plntlla = :P155_ID_PLNTLLA ) loop',
'                    ',
'        :P156_PLANTILLA := :P156_PLANTILLA || c_prrfos.prrfo;',
'        ',
'    end loop;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
