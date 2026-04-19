prompt --application/shared_components/user_interface/lovs/lv_estado_lote
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(40900896852382334)
,p_lov_name=>'LV_ESTADO_LOTE'
,p_lov_query=>'.'||wwv_flow_api.id(40900896852382334)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(40901156739382334)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'GENERADO'
,p_lov_return_value=>'GEN'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(40901501724382341)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'EN PROCESO'
,p_lov_return_value=>'EPR'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(40901923872382341)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'PROCESADO'
,p_lov_return_value=>'PRO'
);
end;
/
