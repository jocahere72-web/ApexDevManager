prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('P\00E1gina Global - Escritorio')
,p_step_title=>unistr('P\00E1gina Global - Escritorio')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191108091024'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75385113231648258)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-bottom-none:t-Form--noPadding:t-Form--stretchInputs:t-Form--leftLabels:t-Form--labelsAbove:margin-left-none:margin-right-none:margin-top-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36481781906968642)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'htp.print(:P0_BREADCRUMB);',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>'pkg_sg_autenticacion.fnc_gti_generar_breadcrumbs(:F_CDGO_CLNTE, :APP_ID, :APP_PAGE_ID,:APP_SESSION) is not null'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36618182274007776)
,p_name=>'P0_BREADCRUMB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75385113231648258)
,p_use_cache_before_default=>'NO'
,p_source=>'pkg_sg_autenticacion.fnc_gti_generar_breadcrumbs(:F_CDGO_CLNTE, :APP_ID, :APP_PAGE_ID,:APP_SESSION)'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
