prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Inicio'
,p_alias=>'HOME'
,p_step_title=>unistr('Gesti\00F3n de Reportes')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-content {',
'    min-height: 80vh !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'ACARDENAS'
,p_last_upd_yyyymmddhh24miss=>'20181224090226'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35827750450290494)
,p_plug_name=>'Inicio'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35737714887290408)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
