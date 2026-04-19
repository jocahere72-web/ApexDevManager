prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Global Page - Escritorio'
,p_step_title=>'Global Page - Escritorio'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191108091011'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38767249034640483)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-bottom-none:t-Form--noPadding:t-Form--stretchInputs:t-Form--leftLabels:t-Form--labelsAbove:margin-left-none:margin-right-none:margin-top-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36481781906968642)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'htp.print(:P3_BREADCRUMB);',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>'pkg_sg_autenticacion.fnc_gti_generar_breadcrumbs(:F_CDGO_CLNTE, :APP_ID, :APP_PAGE_ID,:APP_SESSION) is not null'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36615949648006390)
,p_name=>'P3_BREADCRUMB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38767249034640483)
,p_use_cache_before_default=>'NO'
,p_source=>'pkg_sg_autenticacion.fnc_gti_generar_breadcrumbs(:F_CDGO_CLNTE, :APP_ID, :APP_PAGE_ID,:APP_SESSION)'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36616263085006396)
,p_name=>'P3_BREADCRUMB_1'
,p_item_sequence=>10
,p_use_cache_before_default=>'NO'
,p_source=>'pkg_sg_autenticacion.fnc_gti_generar_breadcrumbs(:F_CDGO_CLNTE, :APP_ID, :APP_PAGE_ID,:APP_SESSION)'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36616622679006397)
,p_name=>'Al cargar pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36617168632006397)
,p_event_id=>wwv_flow_api.id(36616622679006397)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.INFORTRIBUTOS.NOTIFICATIONMENU'
,p_attribute_01=>'notification-menu'
,p_attribute_02=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_alrta                                  as NOTE_ID,',
'       icno                                      as NOTE_ICON,',
'       icno_clor                                 as NOTE_ICON_COLOR,',
'       clor_alrta                                as NOTE_COLOR,',
'       ttlo                                      as NOTE_HEADER,',
'       dscrpcion                                 as NOTE_TEXT,',
'       replace(url, ''APP_SESSION'',:APP_SESSION)  as NOTE_LINK',
'from v_ma_g_alertas',
'where id_usrio = :F_ID_USRIO and cdgo_estdo = ''ENV'''))
,p_attribute_04=>'fa-bell'
,p_attribute_05=>'white'
,p_attribute_06=>'#0073FF'
,p_attribute_08=>'rgb(232, 55, 55 )'
,p_attribute_09=>'white'
,p_attribute_10=>'N'
,p_attribute_11=>'Y'
,p_attribute_12=>'N'
,p_attribute_13=>'Y'
,p_attribute_14=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_ma_alertas.prc_ac_alerta_estado(:NOTE_ID);',
'end;'))
,p_attribute_15=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
