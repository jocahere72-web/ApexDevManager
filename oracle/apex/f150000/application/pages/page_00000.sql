prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('P\00E1gina Global - Escritorio')
,p_step_title=>unistr('P\00E1gina Global - Escritorio')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250313083828'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57480904948899916)
,p_plug_name=>'Cabecera Portal'
,p_region_name=>'cabecera_portal'
,p_region_css_classes=>'banner-portal'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>'<img src="#APP_IMAGES#ESL-MONTERIA.png" class="attachment-0x0 size-0x0" alt="" loading="lazy" style="width:100%;margin-left:auto;margin-right:auto;display:block; border-radius: 10px;">'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':app_page_id not in (101,',
'                     7, 9,',
'                     11, 16, 17, 18,',
'                     108,',
'                     119, 120,',
'                     207, 208,',
'                     22, 25, 26, 303,304)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57481376220899920)
,p_name=>'al cargar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57481446114899921)
,p_event_id=>wwv_flow_api.id(57481376220899920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#t_Header'').remove();',
'async function initialize() {',
'    var v_app_id = $v(''pFlowId''),',
'        v_session = $v(''pInstance'');',
'    var config = await apex.server.process(''configuracionPortal'');',
'    var url = `f?p=${v_app_id}:19:${v_session}:::::`;',
'    if (config[''tercero'']) {',
'        var parent = $(''#cabecera_portal .t-Region-buttons-right'').first();',
'        parent.children().remove();',
unistr('        config.tercero = config.tercero.toLowerCase().replace(/(?:^|\005Cs)[a-z\00E1\00E9\00ED\00FA\00F3]/g, function (m) {'),
'            return m.toUpperCase();',
'        });',
'',
'        $(`<nav id="menu">',
'        <ul> ',
'          <li>',
'                <a href="#">Bienvenido Sr(a) ${config.tercero}',
'                <span class="fa fa-navicon" aria-hidden="true"></span>',
'                </a>',
'            <ul>',
'                <li>  ',
unistr('                    <a href="${url}"> Cambiar Contrase\00F1a</a> '),
'                </li> ',
'                <li>  ',
unistr('                    <a class="fa fa-sign-out" href="javascript:apex.close_session()"> Cerrar Sesi\00F3n</a> '),
'                </li> ',
'            </ul>         ',
'        </ul>',
'        </nav>`).appendTo(parent);',
'    }',
'}',
'',
'apex.close_session = async function () {',
'    var data = await apex.server.process(''cerrarSesion'');',
'    console.log(data);',
'    window.sessionStorage.removeItem(''token'');',
'    if (data.type === ''OK'') {',
'        window.location.href = data.url;',
'    }',
'}',
'',
'initialize();'))
,p_stop_execution_on_error=>'Y'
);
end;
/
