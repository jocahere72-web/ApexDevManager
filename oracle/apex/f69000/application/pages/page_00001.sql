prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Inicio'
,p_alias=>'HOME'
,p_step_title=>unistr('Gesti\00F3n de Novedades')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190226145049'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88621709727834779)
,p_plug_name=>unistr('Gesti\00F3n de Novedades')
,p_icon_css_classes=>'fa-database-edit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88531838298834665)
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
