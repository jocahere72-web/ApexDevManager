prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>'Inicio'
,p_step_title=>'Inicio'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20201026213755'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(281028811539253316)
,p_plug_name=>unistr('<b>Gesti\00F3n de Veh\00EDculos</b>')
,p_icon_css_classes=>'fas fa-car'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237239460555524198)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
