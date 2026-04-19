prompt --application/shared_components/user_interface/lovs/lv_entidades_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(76530314500124564)
,p_lov_name=>'LV_ENTIDADES_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_entdad_tpo as r',
'  from df_s_entidades_tipo',
' order by 1'))
);
end;
/
