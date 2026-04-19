prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(3684997344717412)
,p_name=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'JADIES'
,p_last_upd_yyyymmddhh24miss=>'20240923150057'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11389780259825603)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(11970695994248776)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'htp.print(:P0_BREADCRUMB);',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'pkg_sg_autenticacion.fnc_gti_generar_breadcrumbs(:F_CDGO_CLNTE, :APP_ID, :APP_PAGE_ID,:APP_SESSION) is not null'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11389836206825604)
,p_name=>'P0_BREADCRUMB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(11389780259825603)
,p_use_cache_before_default=>'NO'
,p_source=>'pkg_sg_autenticacion.fnc_gti_generar_breadcrumbs(:F_CDGO_CLNTE, :APP_ID, :APP_PAGE_ID,:APP_SESSION)'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
