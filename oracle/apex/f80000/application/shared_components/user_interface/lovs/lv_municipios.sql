prompt --application/shared_components/user_interface/lovs/lv_municipios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30513604353463318)
,p_lov_name=>'LV_MUNICIPIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio as d,',
'       id_mncpio as r',
'  from df_s_municipios',
' order by 1'))
);
end;
/
