prompt --application/pages/page_00057
begin
wwv_flow_api.create_page(
 p_id=>57
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Prueba Antonio'
,p_step_title=>'Prueba Antonio'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20200827143014'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80583255128405849)
,p_plug_name=>'Container'
,p_region_name=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
