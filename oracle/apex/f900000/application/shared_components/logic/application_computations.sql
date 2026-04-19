prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(113834191029614672)
,p_computation_sequence=>10
,p_computation_item=>'F_NMBRE_CLNTE'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'SQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte',
'from v_df_s_clientes',
'where cdgo_clnte = :F_CDGO_CLNTE'))
);
end;
/
