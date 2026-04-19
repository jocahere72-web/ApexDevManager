prompt --application/shared_components/user_interface/lovs/lv_tipo_operadores
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(72043202761839189)
,p_lov_name=>'LV_TIPO_OPERADORES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
' DSCRPCION D,',
' ID_OPRDOR_TPO R FROM ',
'DF_S_OPERADORES_TIPO',
'ORDER BY 2'))
);
end;
/
