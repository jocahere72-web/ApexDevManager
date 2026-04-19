prompt --application/shared_components/user_interface/lovs/lv_conceptos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(171749332828400171)
,p_lov_name=>'LV_CONCEPTOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'         id_cncpto r ',
'    from df_i_conceptos',
' order by 2;'))
);
end;
/
