prompt --application/shared_components/user_interface/lovs/lv_pais
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103267812986132836)
,p_lov_name=>'LV_PAIS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
);
end;
/
