prompt --application/pages/page_00138
begin
wwv_flow_api.create_page(
 p_id=>138
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Selecci\00F3n de medio de notificaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Selecci\00F3n de medio de notificaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUIRRE'
,p_last_upd_yyyymmddhh24miss=>'20211011161835'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(144344579011223240)
,p_plug_name=>unistr('<b>Selecci\00F3n de medios de notificaci\00F3n</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
