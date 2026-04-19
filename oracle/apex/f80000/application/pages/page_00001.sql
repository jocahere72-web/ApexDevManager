prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Inicio'
,p_step_title=>unistr('Gesti\00F3n de Cobro')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-content {',
'    min-height: 80vh !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20210113152431'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17442128108919457)
,p_plug_name=>unistr('Rutas de Navegaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17366370585919378)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(17310371681919339)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17409871798919399)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
