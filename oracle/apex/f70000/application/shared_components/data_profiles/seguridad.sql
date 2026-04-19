prompt --application/shared_components/data_profiles/seguridad
begin
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(49710432287307997)
,p_name=>'seguridad'
,p_format=>'JSON'
,p_row_selector=>'items'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(49710648990308002)
,p_data_profile_id=>wwv_flow_api.id(49710432287307997)
,p_name=>'SYSDATE_'
,p_sequence=>1
,p_data_type=>'TIMESTAMP WITH TIME ZONE'
,p_format_mask=>'YYYY"-"MM"-"DD"T"HH24":"MI:SSTZR'
,p_has_time_zone=>true
,p_selector=>'sysdate'
);
end;
/
