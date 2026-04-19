prompt --application/pages/page_00097
begin
wwv_flow_api.create_page(
 p_id=>97
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Informe Adjunto'
,p_step_title=>unistr('Proyecci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JALCOCER'
,p_last_upd_yyyymmddhh24miss=>'20190108105007'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(49137232414124342)
,p_branch_name=>'Go To Page 98'
,p_branch_action=>'f?p=&APP_ID.:98:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(49136511905124342)
,p_branch_name=>'Go To Page 96'
,p_branch_action=>'f?p=&APP_ID.:96:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
end;
/
