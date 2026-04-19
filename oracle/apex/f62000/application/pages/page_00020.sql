prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'WF Plugin Proof'
,p_step_title=>'WF Plugin Proof'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#jquery-3.0.0.slim.min.js',
'#APP_IMAGES#svg.min.js',
'#IMAGE_PREFIX#genesys/js/workflowChart.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Parseamos la Cadena que contiene los Datos JSON',
'var Datos = JSON.parse( $v(''P20_DATOS_JSON'') );',
'',
'$(''.workflow'').workflowChart({',
'  data: Datos',
'})',
'',
'',
' '))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.workflow'').workflowChart({',
'  height: 160,',
'  textSize: 20,',
'  circleSize: 20,',
'  chartColor: ''#45B6AF'',',
'  textColor: ''#FFFFFF''',
'})',
''))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20240606164605'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(157019732766883807)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="workflow">',
'</div>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(169164683142574105)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'1'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(157019877761883808)
,p_name=>'P20_DATOS_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(157019732766883807)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json varchar2(4000);',
'begin',
'   ',
'    return ''[{"id":201,"title":"Impto, SubImpto","parent":48,"optional":101010,"link":null,"orden":10}',
'{"id":202,"title":"Cinta IGAC","parent":201,"optional":101010,"link":null,"orden":20}',
'{"id":203,"title":"Esquema Tarifario a Preliquida","parent":202,"optional":101010,"link":null,"orden":30}',
'{"id":204,"title":"Esquema Tarifario a Critica","parent":202,"optional":101010,"link":null,"orden":40}',
unistr('{"id":205,"title":"Preliquidaci\00F3n a Cr\00EDtica","parent":203,"optional":101010,"link":null,"orden":50}'),
'{"id":205,"title":"Critica a Critica Liqui","parent":204,"optional":101010,"link":null,"orden":60}]'';',
'',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
