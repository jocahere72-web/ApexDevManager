prompt --application/pages/page_00905
begin
wwv_flow_api.create_page(
 p_id=>905
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Consulta'
,p_page_mode=>'MODAL'
,p_step_title=>'Consulta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/js/jquery.jqGrid.min.js',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/grid.jqueryui.js',
'#IMAGE_PREFIX#javascript/infortributos/Constructor/resultado.js?v=1.10.13'))
,p_javascript_code_onload=>'cargar()'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap4.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap-ui.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P903_TPO_CNDCION {',
'    width: 150px;',
'}'))
,p_step_template=>wwv_flow_api.id(29518229835068493)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191106112359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(258364771191117041)
,p_plug_name=>'Consulta'
,p_region_name=>'region_sql'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49284345174468901)
,p_plug_name=>'Total'
,p_parent_plug_id=>wwv_flow_api.id(258364771191117041)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'     , ''fa-globe'' as card_icon ',
'     , null as card_icon_color  ',
'     , ''background: linear-gradient(60deg, hsl(182, 27%, 25%), hsl(182, 32%, 55%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' as card_header_style',
'     , ''Total Registros'' as card_title',
'     , to_char( :P905_TOTAL ,''999G999G999G999G999G999G990'' ) as card_value',
'     , '''' as card_footer',
'     , '''' as card_link',
'     , null as card_chart_data',
'     , null as card_chart_config',
'  from dual;'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 4,',
'  "refresh": 20',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(273258085857973730)
,p_plug_name=>'Datos de la Consulta'
,p_region_name=>'jqGrid_container'
,p_parent_plug_id=>wwv_flow_api.id(258364771191117041)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display: flex;justify-content: center;">',
'    <table id="datosConsulta"></table>',
'    <div id="jqGridPager"></div>',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49272992649398902)
,p_name=>'P905_CNSLTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(258364771191117041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49292900899487701)
,p_name=>'P905_TOTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(258364771191117041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(49293083192487702)
,p_computation_sequence=>10
,p_computation_item=>'P905_TOTAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_sql              clob;',
'    v_guid varchar2(33) := sys_guid();',
'    v_return number;',
'    ',
'begin',
'--pkg_cs_constructorsql',
'    v_sql := ''select count(1) from ('' || pkg_cs_constructorsql.fnc_co_sql_dinamica(:P905_CNSLTA, ''S'', :F_CDGO_CLNTE) || '') where ''  || chr(39) ||  v_guid || chr(39) ||  '' = '' || chr(39) || v_guid || chr(39); ',
'    execute immediate v_sql into v_return;',
'    return v_return;',
'exception',
'    when others then',
'        return 0;',
'end ;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49214650504206123)
,p_name=>'al_cambiar_entidades'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P905_ENTIDADES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49215103818206124)
,p_event_id=>wwv_flow_api.id(49214650504206123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var entidades = $(''#P905_ENTIDADES'',''#region_sql'').val();',
'var parametro = $(''#P905_PARAMETRO_ENTIDADES'',''#region_sql''); ',
'if (entidades) {',
'    parametro.val((entidades.toString()));    ',
'} else {',
'    parametro.val('''');    ',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49215623477206125)
,p_event_id=>wwv_flow_api.id(49214650504206123)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.SET_SESSION_STATE(''P905_PARAMETRO_ENTIDADES'',  :P905_PARAMETRO_ENTIDADES );',
''))
,p_attribute_02=>'P905_PARAMETRO_ENTIDADES'
,p_attribute_03=>'P905_PARAMETRO_ENTIDADES'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49218789406206126)
,p_name=>'al_cambiar_la_consulta'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P905_ID_CONSULTA'
,p_condition_element=>'P905_ID_CONSULTA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49219265901206126)
,p_event_id=>wwv_flow_api.id(49218789406206126)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (:P905_ACCION = ''EDIT'' ) then',
'    :P905_ACCION := '''';',
'end if;'))
,p_attribute_02=>'P905_ACCION'
,p_attribute_03=>'P905_ACCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49219771524206126)
,p_event_id=>wwv_flow_api.id(49218789406206126)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P905_ACCION := ''EDIT'';'
,p_attribute_02=>'P905_ACCION'
,p_attribute_03=>'P905_ACCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49220256649206126)
,p_event_id=>wwv_flow_api.id(49218789406206126)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P905_ID_CONSULTA'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49220724103206127)
,p_event_id=>wwv_flow_api.id(49218789406206126)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P905_ID_CONSULTA'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(49241176230224601)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargarDatosConsulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'declare',
'',
'    type c_cursor_type is ref cursor;',
'    c_cursor            c_cursor_type;',
'     v_sql              clob;',
'     v_guid             varchar2(33) := sys_guid();',
'    ',
'begin',
'',
'    v_sql := ''select * from ('' || pkg_cs_constructorsql.fnc_co_sql_dinamica(:P905_CNSLTA, ''S'', :F_CDGO_CLNTE) || '') where rownum <=20 and ''  || chr(39) ||  v_guid || chr(39) ||  '' = '' || chr(39) || v_guid || chr(39); ',
'    open c_cursor for v_sql;',
'    apex_json.open_object;',
'    apex_json.write(''datos'', c_cursor);',
'    apex_json.write(''type'' , ''OK'');',
'    apex_json.close_all;',
'exception',
'    when others then',
'        apex_json.free_output;',
'        apex_json.open_object;',
'        apex_json.write(''msg'', regexp_replace(sqlerrm, ''ORA-[0-9]*:'', ''''));',
'        apex_json.write(''type'' , ''ERROR'');',
'        apex_json.close_all;',
'end ;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
