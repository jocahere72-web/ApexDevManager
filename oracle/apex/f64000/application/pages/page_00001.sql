prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(304917555609291792)
,p_name=>'Inicio'
,p_step_title=>'Inicio'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(304870552804291503)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JALCOCER'
,p_last_upd_yyyymmddhh24miss=>'20171205165551'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(305704135347073817)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(304873968662291549)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<body style="overflow:hidden">'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
