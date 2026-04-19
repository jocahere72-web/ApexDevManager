prompt --application/shared_components/user_interface/lovs/lv_operador_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5529897015495675)
,p_lov_name=>'LV_OPERADOR_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_oprdor_tpo r',
'from df_s_operadores_tipo',
'order by 1'))
);
end;
/
