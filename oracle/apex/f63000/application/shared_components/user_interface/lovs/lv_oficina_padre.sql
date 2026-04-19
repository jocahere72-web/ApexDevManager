prompt --application/shared_components/user_interface/lovs/lv_oficina_padre
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(199552229652025390)
,p_lov_name=>'LV_OFICINA_PADRE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_ofcna as d,',
'       id_ofcna as r',
'  from df_c_oficinas',
'where cdgo_clnte = :F_CDGO_CLIENTE ',
' order by 1'))
);
end;
/
