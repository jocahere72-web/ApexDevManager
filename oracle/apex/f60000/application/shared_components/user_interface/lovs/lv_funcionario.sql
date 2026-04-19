prompt --application/shared_components/user_interface/lovs/lv_funcionario
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103266351049132832)
,p_lov_name=>'LV_FUNCIONARIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_fncnrio as d,',
'       id_fncnrio  as r',
'from df_c_funcionarios order by nmbre_fncnrio'))
);
end;
/
