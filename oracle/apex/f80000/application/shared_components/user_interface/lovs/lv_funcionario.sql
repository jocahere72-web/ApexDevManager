prompt --application/shared_components/user_interface/lovs/lv_funcionario
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30509559845463316)
,p_lov_name=>'LV_FUNCIONARIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro,',
'       id_fncnrio',
'  from v_df_c_funcionarios ',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'  order by nmbre_trcro;'))
);
end;
/
