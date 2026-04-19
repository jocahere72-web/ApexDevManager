prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(237347003896669576)
,p_computation_sequence=>10
,p_computation_item=>'F_NMBRE_CLNTE'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte',
'from v_df_s_clientes',
'where cdgo_clnte = :F_CDGO_CLNTE'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(94715391231733168)
,p_computation_sequence=>10
,p_computation_item=>'F_DRCCION_SRVDOR_PRVDO'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'http://99.0.4.235:8031/ords/api/'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(94715534271734331)
,p_computation_sequence=>10
,p_computation_item=>'F_DRCCION_SRVDOR_PBLCO'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'https://monteria-test.taxationsmart.co/ords/api/'
);
end;
/
