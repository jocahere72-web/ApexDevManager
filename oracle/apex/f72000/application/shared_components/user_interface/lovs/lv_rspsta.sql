prompt --application/shared_components/user_interface/lovs/lv_rspsta
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(97094580904887680)
,p_lov_name=>'LV_RSPSTA'
,p_lov_query=>'.'||wwv_flow_api.id(97094580904887680)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(97094833944887685)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Favorable Totalmente'
,p_lov_return_value=>'FTT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(97095255379887692)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Favorable Parcialmente'
,p_lov_return_value=>'FPR'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(97095681954887692)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Desfavorable'
,p_lov_return_value=>'DFV'
);
end;
/
